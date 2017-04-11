package com.jsu.controller.backStage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jsu.commons.constants.ConsGoods;
import com.jsu.commons.constants.Constants;
import com.jsu.commons.mybatisextend.PageContext;
import com.jsu.commons.utils.DateUtil;
import com.jsu.commons.utils.StringUtil;
import com.jsu.commons.utils.file.FileUpload;
import com.jsu.dao.CfgGoodsDao;
import com.jsu.dao.CfgGoodsPicDao;
import com.jsu.dao.CfgGoodsTypeDao;
import com.jsu.entity.CfgGoodsDO;
import com.jsu.entity.CfgGoodsPicDO;
import com.jsu.entity.CfgGoodsTypeDO;
import com.jsu.service.goods.CfgGoodsPicService;
import com.jsu.service.goods.CfgGoodsService;

@Controller
@RequestMapping("backStage/goods")
public class GoodsCtrl {

	@Autowired
	CfgGoodsService cfgGoodsService;
	@Autowired
	CfgGoodsDao cfgGoodsDao;
	@Autowired
	CfgGoodsTypeDao cfgGoodsTypeDao;
	@Autowired
	CfgGoodsPicDao cfgGoodsPicDao;
	@Autowired
	CfgGoodsPicService cfgGoodsPicService;
	@Autowired
	FileUpload fileUpload;
	
	@RequestMapping("list")
	public String list(Model model, HttpServletRequest request){
		
		String goodsName = StringUtil.nullToString(request.getParameter("goodsName"));
		String goodsTypeName = StringUtil.nullToString(request.getParameter("goodsTypeName"));
		PageContext page = PageContext.getContext(request);
		Map<String, String> paraMap = new HashMap<String, String>();
		if(!StringUtil.isBlank(goodsName)){
			paraMap.put("goodsName", goodsName);
		}
		if(!StringUtil.isBlank(goodsTypeName)){
			paraMap.put("goodsTypeName", goodsTypeName);
		}
		paraMap.put("flag", ConsGoods.FLAG_UP+"','"+ConsGoods.FLAG_DOWN);
		List<Map<String, String>> list = cfgGoodsDao.selectList(paraMap);
		request.setAttribute("paginator", page);
		model.addAttribute("goodsName", goodsName);
		model.addAttribute("goodsTypeName", goodsTypeName);
		model.addAttribute("list", list);
		return "backStage/goods/goodList";
	}
	
	@RequestMapping("detail")
	public String detail(Model model, HttpServletRequest request){
		
		/** 获取商品类型列表 */
		CfgGoodsTypeDO goodsTypeDo = new CfgGoodsTypeDO();
		List<CfgGoodsTypeDO> cfgGoodsTypeList = cfgGoodsTypeDao.selectList(goodsTypeDo);
		
		/** 获取商品信息 */
		String id = StringUtil.nullToString(request.getParameter("id"));
		CfgGoodsDO cfgGoodsDo = new CfgGoodsDO();
		if(!StringUtil.isBlank(id)){
			cfgGoodsDo = cfgGoodsDao.selectByPrimaryKey(Integer.parseInt(id));
			
			// 设置图片路径为全路径
			if(!StringUtil.isBlank(cfgGoodsDo.getPicUrl())){
				cfgGoodsDo.setPicUrl(fileUpload.getRrlUpload(request)+cfgGoodsDo.getPicUrl());
			}
			
			/** 获取Banner图片路径 */
			CfgGoodsPicDO cfgGoodsPicDo = new CfgGoodsPicDO();
			cfgGoodsPicDo.setGoodsId(Integer.parseInt(id));
			List<CfgGoodsPicDO> picList = cfgGoodsPicDao.selectList(cfgGoodsPicDo);
			for(int i=1;picList!=null && i<=picList.size();i++){
				model.addAttribute("pic_banner_"+i, fileUpload.getRrlUpload(request)+picList.get(i-1).getPicUrl());
			}
		}
		
		model.addAttribute("cfgGoods", cfgGoodsDo);
		model.addAttribute("cfgGoodsTypeList", cfgGoodsTypeList);
		return "goods/detail";
	}
	
	@RequestMapping("detailFrame")
	public String detailFrame(Model model, HttpServletRequest request){
		
		model.addAttribute("id", request.getParameter("id"));
		return "goods/detailFrame";
	}
	
	@RequestMapping(value="detail/update", method = RequestMethod.POST)
	public String update(Model model, HttpServletRequest request, CfgGoodsDO cfgGoods){
		
		/** 图片处理 - 商品ICON */
		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
		String iconPath = this.tradePic(mRequest, "pic_picUrl");
		if(StringUtil.isBlank(iconPath)){ // 上传并生成图片缩略图异常
		}else{
			cfgGoods.setPicUrl(iconPath); // 设置Icon路径
		}

		/** 开始保存*/
		String goodsId = cfgGoodsService.save(cfgGoods);
		
		/** 保存Banner图片 */
		String banner_1 = this.tradePic(mRequest, "pic_banner_1");
		String banner_2 = this.tradePic(mRequest, "pic_banner_2");
		String banner_3 = this.tradePic(mRequest, "pic_banner_3");
		String banner_4 = this.tradePic(mRequest, "pic_banner_4");
		// 删除原来所有图片重新新增
		// cfgGoodsPicDao.deleteByGoodsid(Integer.parseInt(goodsId));
		// 保存图片
		this.savePic(goodsId, banner_1, "01");
		this.savePic(goodsId, banner_2, "02");
		this.savePic(goodsId, banner_3, "03");
		this.savePic(goodsId, banner_4, "04");
		
		return this.list(model, request);
	}
	
	
	/**
	 * 保存图片
	 * @param goodsId
	 * @param picUrl
	 * @param order
	 * @return
	 */
	private String savePic(String goodsId,String picUrl,String order){
		CfgGoodsPicDO cfgGoodsPicDO = new CfgGoodsPicDO();
		cfgGoodsPicDO.setGoodsId(Integer.parseInt(goodsId));
		cfgGoodsPicDO.setOrderSeq(order);
		cfgGoodsPicDO.setPicUrl(picUrl);
		cfgGoodsPicDO.setUpdatetime(DateUtil.getDate(DateUtil.YYYY_MM_DD_HHMMSS));
//		int id = cfgGoodsPicDao.insert(cfgGoodsPicDO);
		String id = cfgGoodsPicService.save(cfgGoodsPicDO);
		return String.valueOf(id);
	}
	
	/**
	 * 上传文件并生成缩略图
	 * @param mRequest
	 * @return
	 */
	private String tradePic(MultipartHttpServletRequest mRequest, String picName){
		String path = "";
		MultipartFile file = mRequest.getFile(picName);
		if (file != null && file.getSize() > 0) {
			path = fileUpload.getNarrowPic(file);
		}
		return path;
	}
	
	@RequestMapping("recycle/list")
	public String recycleList(Model model, HttpServletRequest request){
		
		String goodsName = StringUtil.nullToString(request.getParameter("goodsName"));
		String goodsTypeName = StringUtil.nullToString(request.getParameter("goodsTypeName"));
		PageContext page = PageContext.getContext(request);
		Map<String, String> paraMap = new HashMap<String, String>();
		if(!StringUtil.isBlank(goodsName)){
			paraMap.put("goodsName", goodsName);
		}
		if(!StringUtil.isBlank(goodsTypeName)){
			paraMap.put("goodsTypeName", goodsTypeName);
		}
		paraMap.put("flag", ConsGoods.FLAG_DELE);
		List<Map<String, String>> list = cfgGoodsDao.selectList(paraMap);
		request.setAttribute("paginator", page);
		model.addAttribute("goodsName", goodsName);
		model.addAttribute("goodsTypeName", goodsTypeName);
		model.addAttribute("list", list);
		return "backStage/goods/recycleList";
	}
	
	
	/**
	 * 更新商品状态
	 * @param id
	 * @param flag
	 * @return
	 */
	@RequestMapping("updateFlag")
	@ResponseBody
	public String updateFlag(String id, String flag){
		
		cfgGoodsService.updateFlag(id, flag);
		
		return Constants.STATUS_SUCC;
	}
	
	
	/**
	 * 修改是否老板推荐标志
	 * @param id			主键
	 * @param isRecommend	推荐标志
	 * @return
	 */
	@RequestMapping("updateRecommend")
	@ResponseBody
	public String updateRecommend(String id, String isRecommend){
		
		CfgGoodsDO cfgGoodsDo = new CfgGoodsDO();
		cfgGoodsDo.setId(Integer.parseInt(id));
		cfgGoodsDo.setIsRecommend(isRecommend);
		cfgGoodsDao.updateByPrimaryKeySelective(cfgGoodsDo);
		
		return Constants.STATUS_SUCC;
	}
}
