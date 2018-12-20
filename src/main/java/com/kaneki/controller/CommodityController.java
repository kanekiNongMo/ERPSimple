package com.kaneki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaneki.pojo.CommodiType;
import com.kaneki.pojo.Commodity;
import com.kaneki.pojo.Page;
import com.kaneki.service.CommodiTypeService;
import com.kaneki.service.CommodityService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class CommodityController {
	@Autowired
	private CommodityService commodityService;
	@Autowired
	private CommodiTypeService commodiTypeService;

	/**
	 *
	 * 分页查询所有的商品，还可以根据商品名称和商品类型来分页查询
	 * 
	 * @param page      当前页码
	 * @param pageRows  每页显示行数
	 * @param commodity 商品信息
	 * @param model     一个接口，实现类为ExtendedModelMap,继承了ModelMap类
	 * @return 跳转commodityList地址
	 */
	@RequestMapping(value = "/commodityList.action")
	public String findAllCommodity(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "6") Integer pageRows, Commodity commodity, Model model) {
		Page<Commodity> commodities = commodityService.findAllCommodity(page, pageRows, commodity);
		List<CommodiType> commodiesType = commodiTypeService.getComType();

		if (commodity.getComType() != null) {
			model.addAttribute("CTID", commodity.getComType().getComTypeId());
		}

		model.addAttribute("commodityName", commodity.getCommodityName());
		model.addAttribute("page", commodities);
		model.addAttribute("COMTYPE", commodiesType);
		return "commodityList";
	}

	// 更新商品信息
	@RequestMapping(value = "/updateCommodity.action")
	@ResponseBody
	public String updateCommodity(Commodity commodity) {
		int i = commodityService.updateCommodity(commodity);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIl";
		}
	}

	// 根据商品编号删除商品信息
	@RequestMapping(value = "/deleteCommodity.action")
	@ResponseBody
	public String deleteCommodity(Integer commodityId) {
		int i = commodityService.deleteCommodity(commodityId);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIl";
		}
	}

	// 添加商品信息
	@RequestMapping(value = "/createCommodity.action")
	@ResponseBody
	public String createCommodity(Commodity commodity) {
		int i = commodityService.addCommodity(commodity);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 根据商品名称判断商品是否存在
	@RequestMapping(value = "/isExistCommodityByName.action")
	@ResponseBody
	public int isExistCommodityByName(Commodity commodity) {
		return commodityService.isExistCommodity(commodity);
	}

	// 根据商品名称和商品编号判断商品是否存在
	@RequestMapping(value = "/isExistCommodityByIdAndName.action")
	@ResponseBody
	public int isExistCommodityByIdAndName(Commodity commodity) {
		return commodityService.isExistCommodityByIdAndName(commodity);
	}

	// 根据商品编号获取商品信息
	@RequestMapping(value = "/getCommodityById.action")
	@ResponseBody
	public Commodity getCommodityById(Integer commodityId) {
		return commodityService.getCommodityById(commodityId);
	}

}
