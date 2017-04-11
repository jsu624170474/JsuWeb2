package com.yqjr.commons.util.file;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.yqjr.commons.base.GenericService;
import com.yqjr.commons.util.GlobalConfig;
import com.yqjr.commons.util.StringUtil;

@Component("fileUtil")
public class FileUtil extends GenericService {
	private static final String busiId = "9999"; // 业务系统ID

	/**
	 * 获取文件路径
	 * 
	 * @param inputStream
	 * @return
	 */
	public String getUrl(String fileId) {
		// TODO 根据文件Id获取文件路径
		String geturl = GlobalConfig.get("file.service.geturl");
		String returnurl = null;
		try {
			HttpPostUtil postUtil = new HttpPostUtil(geturl);
			postUtil.addTextParameter("fileId", fileId);
			postUtil.addTextParameter("busiId", busiId);
			byte[] res = postUtil.send();
			returnurl = new String(res);
			System.out.println(returnurl);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnurl;
	};

	public byte[] downLoadbyfileId(String fileId) {
		// TODO 根据文件Id 下载文件
		String geturl = GlobalConfig.get("file.service.geturl");
		byte[] buffer = null;
		try {
			HttpPostUtil postUtil = new HttpPostUtil(geturl);
			postUtil.addTextParameter("fileId", fileId);
			postUtil.addTextParameter("busiId", busiId);
			byte[] res = postUtil.send();
			String returnurl = new String(res);
			System.out.println(returnurl);
			/**
			 * 获取文件byte 数组
			 */
			buffer = download(returnurl);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return buffer;
	}

	/**
	 * 上传文件
	 * 
	 * @param file
	 *            MultipartFile 文件
	 * @param fileclassify
	 *            上传文件类型
	 * @param 信贷
	 *            CS1 信贷合同docx CS2 信贷合同html CS3 收货凭证 CS4 认证信息
	 * @param 电商
	 *            EC1 商品图片 EC2 商户图片
	 * @param 车贷
	 *            CAR1 订单导入
	 * @return
	 */
	public String uploadFile(MultipartFile file, String fileclassify) {
		// TODO 上传文件
		String fileId = null;
		String uploadurl = GlobalConfig.get("file.service.upload");
		String verify = GlobalConfig.get("file.service.verify");
		// 将文件流转成字节数组
		byte[] file_buff = null;
		try {
			InputStream inputStream = file.getInputStream();
			if (inputStream != null) {
				int len;
				len = inputStream.available();
				// 字节长度
				file_buff = new byte[len];
				inputStream.read(file_buff);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String md5Code = DigestUtils.md5Hex(file_buff); // 获取当前文件流的MD5编码s

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("busiId", busiId);
		map.put("md5", md5Code);
		String content = StringUtil.formatParamMapToStr(map);
		// TODO 检查文件是否存在
		String verifyres = httpSenReq(verify, content);
		JSONObject verifyJson = JSONObject.parseObject(verifyres);
		if ("S".equals(verifyJson.get("res"))) {
			System.out.println(verifyJson);
			fileId = verifyJson.getString("fileId");
			logger.info("文件已存在！fileId：" + fileId);
		} else {
			try {
				// TODO 上传文件
				HttpPostUtil postUtil = new HttpPostUtil(uploadurl);
				postUtil.addTextParameter("fileName",
						file.getOriginalFilename());
				postUtil.addTextParameter("secretKey",
						verifyJson.getString("secretKey"));
				postUtil.addTextParameter("bussId", busiId);
				postUtil.addTextParameter("fileclassify", fileclassify);
				postUtil.addFileParameter("filestram", file);
				byte[] b = postUtil.send();

				fileId = new String(b);
				logger.info("新曾上传成功！fileId:" + fileId);
				System.out.println(fileId);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("上传文件了！");
		}
		return fileId;
	};

	/**
	 * 发送http 请求
	 * 
	 * @param url
	 * @param content
	 */
	private String httpSenReq(String url, String content) {
		String result = "";
		try {
			URL postUrl = new URL(url);
			HttpURLConnection connection = (HttpURLConnection) postUrl
					.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestMethod("POST");
			connection.setUseCaches(false);
			connection.setInstanceFollowRedirects(true);
			connection.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			connection.connect();
			DataOutputStream out = new DataOutputStream(
					connection.getOutputStream());
			out.writeBytes(content);
			out.flush();
			out.close();
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					connection.getInputStream(), "utf-8"));
			String line;
			logger.info("Contents of post request");
			while ((line = reader.readLine()) != null) {
				result += line;
			}
			logger.info("Contents of post request ends");
			reader.close();
			connection.disconnect();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 下载文件
	 * 
	 * @param url
	 * @return
	 */
	private byte[] download(String url) {
		// TODO 下载文件 私有
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		try {
			URLConnection connection = new URL(url).openConnection();
			InputStream in = connection.getInputStream();
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = in.read(buffer)) != -1) {
				outStream.write(buffer, 0, len);
			}
			in.close();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println(outStream.toByteArray().length);
		return outStream.toByteArray();
	}

	public static void main(String[] args) {
		// TODO 测试方法
		FileUtil fileUtil = new FileUtil();
		File file = new File("D:\\b.docx");

		System.out.println(fileUtil.uploadFile(new FileTest(file), "CS1"));
//		 System.out.println(fileUtil.getUrl("27"));
//		 System.out.println(DigestUtils.md5Hex("123456"));	
	}

}
