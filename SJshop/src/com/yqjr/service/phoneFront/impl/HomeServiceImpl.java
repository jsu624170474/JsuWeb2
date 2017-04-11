package com.yqjr.service.phoneFront.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yqjr.commons.cache.CachePool;
import com.yqjr.commons.util.StringUtil;
import com.yqjr.commons.util.file.FileUpload;
import com.yqjr.dao.PhoneHomeDao;
import com.yqjr.service.phoneFront.HomeService;

@Service("HomeService")
public class HomeServiceImpl implements HomeService {

	@Autowired
	PhoneHomeDao phoneHomeDao;
	@Autowired
	FileUpload fileUpload;
	
	@Override
	public boolean initContent(HttpServletRequest request) {
		
		/** 促销 */
        List<Map<String, Object>> salesList = phoneHomeDao.selectSales();
        for(Map<String, Object> tmp : salesList){
        	tmp.put("pic_url", fileUpload.getRrlUpload(request)+StringUtil.nullToString(tmp.get("pic_url")));
        }
        // 放入缓存
        CachePool.setHomePhone(CachePool.HOME_PHONE_SALES, salesList);
        
        /** 老板推荐 */
        List<Map<String, Object>> recommendList = phoneHomeDao.selectRecommend();
        for(Map<String, Object> tmp : recommendList){
        	tmp.put("pic_url", fileUpload.getRrlUpload(request)+StringUtil.nullToString(tmp.get("pic_url")));
        }
        // 放入缓存
        CachePool.setHomePhone(CachePool.HOME_PHONE_RECOMMEND, recommendList);
        
        /** 热销 */
        List<Map<String, Object>> hotList = phoneHomeDao.selectSales();
        for(Map<String, Object> tmp : hotList){
        	tmp.put("pic_url", fileUpload.getRrlUpload(request)+StringUtil.nullToString(tmp.get("pic_url")));
        }
        // 放入缓存
        CachePool.setHomePhone(CachePool.HOME_PHONE_HOT, hotList);
		
		return true;
	}

	@Override
	public Object getContent(HttpServletRequest request, String key) {
		
		// 是否需要初始化内容
		Object res = CachePool.getHomePhone(key); 
		if(res==null){
			this.initContent(request);
		}
		
		return res;
	}

}
