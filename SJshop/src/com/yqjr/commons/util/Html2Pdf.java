package com.yqjr.commons.util;

import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.BaseFont;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.w3c.dom.Document;
import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Jin on 16/10/31.
 */
public class Html2Pdf {
    /**
     * 调用方式 htmlToPDF(response.getOutputStream(), htmlstr, "imfang.ttf", "FangSong_GB2312",
     * "GB2312", "http://xxxx/dtd/xhtml1-transitional.dtd");
     *
     * 相关图片必须使用绝对路径才能显示 如果要下载生成的文件，在此方法上方加上：
     * response.setHeader("Content-disposition",
     * "attachment;filename=英文文件名.pdf");
     *
     * @param out 输出流
     * @param htmlcode html代码
     * @param fontpath 字体路径
     * @param fontName 字体名称 如：FangSong_GB2312
     * @param encoding 编码
     * @param htmlDTDURL 如：http://xxxx/xhtml1-transitional.dtd
     * @throws Exception
     */
    public void htmlToPDF(OutputStream out, String htmlcode, String fontpath,
                          String
                                  fontName, String encoding, String htmlDTDURL) throws Exception {
        DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        Transformer transformer = TransformerFactory.newInstance()
                .newTransformer();
        ITextRenderer renderer = new ITextRenderer();
        ITextFontResolver resolver = renderer.getFontResolver();
        InputStream inputStream = null;
        Document doc = null;
        Document doc2 = null;
        try {
            htmlcode = this.filterHeader(htmlcode, encoding, fontName, htmlDTDURL);

            inputStream = new ByteArrayInputStream(htmlcode.getBytes(encoding));
            doc = builder.parse(inputStream);
            transformer.setOutputProperty("encoding", encoding);
            new DOMSource(doc);
            transformer.transform(new DOMSource(doc), new StreamResult(bos));
            inputStream = new ByteArrayInputStream(bos.toString().getBytes());
            doc2 = builder.parse(inputStream);

            resolver.addFont(fontpath, BaseFont.IDENTITY_H,
                    BaseFont.NOT_EMBEDDED);

            renderer.setDocument(doc2, null);
            renderer.layout();

            renderer.createPDF(out, true);

            out.flush();
            out.close();
        } catch (Exception ex) {

            throw new Exception(ex.getMessage());
        }
    }
    /**
     *文件头
     */
    private String filterHeader(String htmlcode, String encoding,String fontName,String htmlDTDURL) {
        htmlcode="<table style=\"font-family:FangSong_GB2312\" width=\"100%\" height=\"100%\" border=\"0\"><tr><td>"+htmlcode+"</td></tr></table>";
        htmlcode="<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"  \""+htmlDTDURL+"\" >\n"+htmlcode;
        htmlcode = "<?xml version=\"1.0\" encoding=\"" + encoding + "\" ?>\n"
                + htmlcode;
        return htmlcode;
    }

    public static void html2Pdf(String htmlPathName, String fontPathName, String outputFilePathName){
        try {
            String url = new File(htmlPathName).toURI().toURL().toString();
            System.out.println("url: "+url);
            OutputStream os = new FileOutputStream(outputFilePathName);
            ITextRenderer renderer = new ITextRenderer();
            renderer.setDocument(url);
            // 解决中文问题
            ITextFontResolver fontResolver = renderer.getFontResolver();
            fontResolver.addFont(fontPathName, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
            renderer.layout();
            renderer.createPDF(os);
            System.out.println("转换成功！");
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }

    public static void template2Html(Map map, String templatePath, String tamplateName, String filename){
        try{
            /* 创建模版配置 */
            Configuration cfg = new Configuration();
            /* 指定模板的加载路径 */
            cfg.setDirectoryForTemplateLoading(new File(templatePath));
            cfg.setDefaultEncoding("UTF-8");
            Template template = cfg.getTemplate(tamplateName);
            /* 创建html文件 */
            File file = new File(filename);
            if (!file.exists()) {
                file.createNewFile();
            }
            Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"));
            template.process(map, out);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}
