package com.kaneki.controller;

/**
 * 
 * @author LiJiezhou
 *
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaneki.pojo.CommodiType;
import com.kaneki.pojo.Page;
import com.kaneki.service.CommodiTypeService;

@Controller
public class CommodiTypeController {
	@Autowired
	private CommodiTypeService commodiTypeService;

	// 获取所有商品类型信息并分页显示，可根据商品类型名称来查询
	@RequestMapping(value = "/comtypeList")
	public String findAllComType(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer pageRows, CommodiType comType, Model model) {
		Page<CommodiType> list = commodiTypeService.findAllComType(page, pageRows, comType);
		model.addAttribute("comTypeName", comType.getComTypeName());
		model.addAttribute("page", list);
		return "commodiTypeList";
	}

	// 更新商品类型信息
	@RequestMapping(value = "/updateComType")
	@ResponseBody
	public String updateComType(CommodiType comType) {
		int i = commodiTypeService.updateComType(comType);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 添加商品类型信息
	@RequestMapping(value = "/createComType")
	@ResponseBody
	public String addComType(CommodiType comType) {
		int i = commodiTypeService.addComType(comType);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 根据商品类型编号删除商品类型信息
	@RequestMapping(value = "/deleteComType")
	@ResponseBody
	public String deleteComType(Integer comTypeId) {
		int i = commodiTypeService.deleteComType(comTypeId);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 添加商品类型时根据商品类型名称判断商品类型是否存在
	@RequestMapping(value = "/findByComTypeName.action")
	@ResponseBody
	public int findByComTypeName(CommodiType comType) {
		List<CommodiType> list = commodiTypeService.findComTypeByName(comType);
		if (list.size() == 0 || list == null) {
			return 0;
		} else {
			return 1;
		}

	}

	// 排除本身，修改商品时根据商品类型名称和编号判断商品是否存在
	@RequestMapping(value = "/isUpdateExistComTypeByName.action")
	@ResponseBody
	public int isUpdateExistComTypeByName(CommodiType comType) {
		return commodiTypeService.isUpdateExistComTypeByName(comType);
	}
}
