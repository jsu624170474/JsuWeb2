package com.jsu.controller.backStage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsu.commons.constants.Constants;
import com.jsu.commons.mybatisextend.PageContext;
import com.jsu.commons.utils.StringUtil;
import com.jsu.dao.CfgGoodsTypeDao;
import com.jsu.entity.CfgGoodsTypeDO;
import com.jsu.service.goods.CfgGoodsTypeService;

@Controller
@RequestMapping("backStage/goods/type")
public class GoodsTypeCtrl {

	@Autowired
	CfgGoodsTypeDao cfgGoodsTypeDao;
	@Autowired
	CfgGoodsTypeService cfgGoodsTypeService;
	
	@RequestMapping("list")
	public String list(Model model, HttpServletRequest request){
		
		String name = StringUtil.reqParamTrade(request.getParameter("name"));
		PageContext page = PageContext.getContext(request);
		CfgGoodsTypeDO cfgGoodsTypeDO = new CfgGoodsTypeDO();
		if(!StringUtil.isBlank(name)){
			cfgGoodsTypeDO.setName(name);
		}
		List<CfgGoodsTypeDO> list = cfgGoodsTypeDao.selectList(cfgGoodsTypeDO);
		request.setAttribute("paginator", page);
		model.addAttribute("name", name);
		model.addAttribute("list", list);
		
		return "backStage/goods/typeList";
	}
	
	@RequestMapping("save")
	@ResponseBody
	public String save(HttpServletRequest request, CfgGoodsTypeDO cfgGoodsTypeDO){
		
		cfgGoodsTypeService.save(cfgGoodsTypeDO);
		
		return Constants.STATUS_SUCC;
	}
}
