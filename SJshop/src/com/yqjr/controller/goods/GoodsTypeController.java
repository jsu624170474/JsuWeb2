package com.yqjr.controller.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yqjr.commons.constants.Constants;
import com.yqjr.commons.mybatisextend.PageContext;
import com.yqjr.commons.util.StringUtil;
import com.yqjr.dao.CfgGoodsTypeDao;
import com.yqjr.entity.CfgGoodsTypeDO;
import com.yqjr.service.goods.CfgGoodsTypeService;

@Controller
@RequestMapping("/goods/type")
public class GoodsTypeController {

	@Autowired
	CfgGoodsTypeDao cfgGoodsTypeDao;
	@Autowired
	CfgGoodsTypeService cfgGoodsTypeService;
	
	@RequestMapping("list")
	public String list(Model model, HttpServletRequest request){
		
		String name = StringUtil.nullToString(request.getParameter("name"));
		PageContext page = PageContext.getContext(request);
		CfgGoodsTypeDO cfgGoodsTypeDO = new CfgGoodsTypeDO();
		if(!StringUtil.isBlank(name)){
			cfgGoodsTypeDO.setName(name);
		}
		List<CfgGoodsTypeDO> list = cfgGoodsTypeDao.selectList(cfgGoodsTypeDO);
		request.setAttribute("paginator", page);
		model.addAttribute("name", name);
		model.addAttribute("list", list);
		
		return "goods/typeList";
	}
	
	@RequestMapping("save")
	@ResponseBody
	public String save(HttpServletRequest request, CfgGoodsTypeDO cfgGoodsTypeDO){
		
		cfgGoodsTypeService.save(cfgGoodsTypeDO);
		
		return Constants.STATUS_SUCC;
	}
}
