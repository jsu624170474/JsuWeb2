package com.yqjr.commons.util.itext;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.codec.Base64;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.io.*;

/**
 * Created by Jin on 16/10/30.
 */
public class ParseHtml {
    /**
     * Creates a PDF with the words "Hello World"
     * @throws IOException
     * @throws DocumentException
     */
    public static void createPdfFromHTML(String pdfPath,String htmlPath) throws IOException, DocumentException {
//        BaseFont bfCN = BaseFont.createFont("STSongStd-Light", "UniGB-UCS2-H",false);
//        // 中文字体定义
//        Font chFont = new Font(bfCN, 12, Font.NORMAL, BaseColor.BLUE);
//        Font secFont = new Font(bfCN, 12, Font.NORMAL, new BaseColor(0, 204,255));
        // step 1
        Document document = new Document();
        // step 2
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(pdfPath));
        // step 3
        document.open();
        // step 4
        XMLWorkerHelper.getInstance().parseXHtml(writer, document, new FileInputStream(htmlPath));
        // step 5
        document.close();
    }

    public static void main(String[] args){
        String HTML = "D:\\test.html";
        String DEST = "D:\\report.pdf";
        try{
            ParseHtml.createPdfcc();
           // ParseHtml.createPdfFromHTML(DEST,HTML);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public static void createPdfcc() throws Exception {
        // step 1
        String inputFile = "D:\\report.html";
        String url = new File(inputFile).toURI().toURL().toString();
        String outputFile =  "D:\\report.pdf";
        System.out.println(url);
        // step 2
        OutputStream os = new FileOutputStream(outputFile);
        org.xhtmlrenderer.pdf.ITextRenderer renderer = new ITextRenderer();
        renderer.setDocument(url);

        // step 3 解决中文支持
        org.xhtmlrenderer.pdf.ITextFontResolver fontResolver = renderer.getFontResolver();
        fontResolver.addFont("D:\\simsun.ttc", BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);

        renderer.layout();
        renderer.createPDF(os);
        os.close();

        System.out.println("create pdf done!!");
    }
}