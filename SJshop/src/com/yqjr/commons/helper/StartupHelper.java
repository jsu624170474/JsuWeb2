package com.yqjr.commons.helper;

import com.yqjr.entity.GlobalConfigsDO;
import com.yqjr.service.GlobalConfigsService;
import com.yqjr.service.MenuInfoService;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Description:启动后的一些操作,如加载缓存可在这里操作
 * @author  Robin
 * @version V1.0 
 * @createDateTime：2014-12-22
 * @Company: beeer.com
 * @Copyright: Copyright (c) 2014
 **/
@Component("StartupHelper")
public final class StartupHelper implements
		ApplicationListener<ContextRefreshedEvent> {
	private Logger logger = LoggerFactory.getLogger(StartupHelper.class);
	private static boolean	listenedFlag	= false;
	@Autowired
	MenuInfoService menuInfoService;
	
	@Autowired
	private GlobalConfigsService globleConfigsService;
	
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		if (listenedFlag)
			return;
		
		logger.info("Spring启动后执行的操作...");
		execute();
		logger.info("Spring启动后执行的操作,结束...");
		
		listenedFlag = true;
	}
	
	private void execute() {
		load_param();
		init_event();
	}
	
	/**
	 * 初始化事件
	 */
	private void init_event() {
		logger.info("--------------初始化系统事件--------------");
		org.apache.ibatis.logging.LogFactory.useSlf4jLogging();
	}
	
	/**
	 * 加载系统参数
	 */
	private void load_param() {
		logger.info("//------------初始化加载系统参数---开始------------");
		Cache cache =  CacheManager.getInstance().getCache("globalConfigs");
		List<GlobalConfigsDO> gcList = globleConfigsService.getAllGlobleConfigs();
		for(GlobalConfigsDO gc : gcList){
			Element element = new Element(gc.getGcKey(), gc.getGcValue());
			cache.put(element);
		}
		logger.info("------------初始化加载系统参数---完成------------\\");
	}
	
}
