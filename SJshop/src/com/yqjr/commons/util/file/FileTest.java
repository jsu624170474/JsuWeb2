package com.yqjr.commons.util.file;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

import org.springframework.web.multipart.MultipartFile;

public class FileTest implements MultipartFile {
	File file = null;

	public FileTest(File file) {
		// TODO Auto-generated constructor stub
		this.file = file;
	}

	@Override
	public byte[] getBytes() throws IOException {
		// TODO Auto-generated method stub
		FileInputStream in = new FileInputStream(file);
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		byte[] b = new byte[1024];
		int n;
		while ((n = in.read(b)) != -1) {
			out.write(b, 0, n);
		}
		in.close();
		return out.toByteArray();
	}

	@Override
	public String getContentType() {
		// TODO Auto-generated method stub
		try {
			ImageInputStream imagein = ImageIO.createImageInputStream(file);

			if (imagein == null) {
				return "application/octet-stream";
			}
			Iterator<ImageReader> it = ImageIO.getImageReaders(imagein);
			if (!it.hasNext()) {
				imagein.close();
				return "application/octet-stream";
			}
			imagein.close();
			return "image/" + it.next().getFormatName().toLowerCase();// 将FormatName返回的值转换成小写，默认为大写
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public InputStream getInputStream() throws IOException {
		// TODO Auto-generated method stub
		InputStream inputStream = new FileInputStream(file);
		return inputStream;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return file.getName();
	}

	@Override
	public String getOriginalFilename() {
		// TODO Auto-generated method stub
		return file.getName();
	}

	@Override
	public long getSize() {
		// TODO Auto-generated method stub
		byte[] file_buff = new byte[0];
		try {
			InputStream fis = new FileInputStream(file);
			if (fis != null) {
				int len = fis.available(); // 字节长度
				file_buff = new byte[len];
				fis.read(file_buff);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return file_buff.length;
	}

	@Override
	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void transferTo(File arg0) throws IOException, IllegalStateException {
		// TODO Auto-generated method stub

	}

}
