package com.jsu.commons.utils.file;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import net.coobird.thumbnailator.Thumbnails;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jsu.commons.constants.Constants;
import com.jsu.commons.utils.ConfigUtil;
import com.jsu.commons.utils.DateUtil;
import com.jsu.commons.utils.StringUtil;

@Service("FileUpload")
public class FileUpload {

	/**
	 * 上传文件
	 * 
	 * @return
	 * @throws Exception
	 */
	public String upload(MultipartFile mulFile){
		
		String PATH_ABS = this.getUploadPath()+ConfigUtil.get(Constants.FILE_UPLOAD_PATH);
		
		// 文件名
		String filePath = "";
		try {
			InputStream fis = mulFile.getInputStream(); 
			String uploadFileName = mulFile.getOriginalFilename();
			// 扩展名
			String fileExtName = uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1);
			String fileName = DateUtil.getDate("yyMMddHHmmssSS")+"."+fileExtName;
			// 完整路径
			String tmpFolder = DateUtil.getDate(DateUtil.YYYYMMDD);
			File folder = new File(PATH_ABS+tmpFolder);
			if(!folder.exists()){
				folder.mkdir();
			}
			
			filePath = tmpFolder+"/"+fileName;
			if (fis != null) {
				byte[] file_buff = null;
				int len = fis.available();  //  字节长度
				file_buff = new byte[len];
				fis.read(file_buff);
				
				File file = new File(PATH_ABS+filePath);
				OutputStream os = new FileOutputStream(file);
				os.write(file_buff);
				os.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return filePath;
	}


	/**
	 * 获取上传文件路径
	 * @param cls
	 * @return
	 */
	public String getUploadPath(){
		File file = new File(this.getClass().getClassLoader().getResource("/").getPath());
		return file.getParentFile().getParentFile().getParent();
	}
	
	/**
	 * 获取上传文件URL的访问地址
	 * @param request
	 * @return
	 */
	public String getRrlUpload(HttpServletRequest request){
		String path = request.getScheme() + "://" + request.getServerName() + ":" + 
	    		request.getServerPort()+ConfigUtil.get(Constants.FILE_UPLOAD_PATH);
		
		return path;
	}
	
	/**
	 * 上传并生成缩略图
	 * @param mulFile
	 * @return
	 */
	public String getNarrowPic(MultipartFile mulFile){
		String path = "";
		
		/** 上传原文件 */
		String tmpPath = this.upload(mulFile);
		if(!StringUtil.isBlank(tmpPath)){
			/** 生成缩略图 */
			String PATH_ABS = this.getUploadPath()+ConfigUtil.get(Constants.FILE_UPLOAD_PATH);
			path = this.proNarrowPic(PATH_ABS+tmpPath);
		}
		
		return path;
	}
	
	/**
	 * 生成缩略图
	 * @param oriPicPath
	 * @return
	 */
	public String proNarrowPic(String oriPicPath){
		String narrowPath = "";
		
		try {
			String oriPath = oriPicPath.substring(0,oriPicPath.lastIndexOf("/")+1);
			String oriFileName = oriPicPath.substring(oriPicPath.lastIndexOf("/")+1,oriPicPath.length());
			String tmpPath = oriPath+"nar_"+oriFileName;
			
			Thumbnails.of(oriPicPath)    
			.size(200, 300)
			.toFile(tmpPath);
			
			String configPath = ConfigUtil.get(Constants.FILE_UPLOAD_PATH);
			narrowPath = tmpPath.substring(tmpPath.lastIndexOf(configPath)+configPath.length(), tmpPath.length());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return narrowPath;
	}
}
