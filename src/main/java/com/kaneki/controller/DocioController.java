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
import com.kaneki.pojo.Docio;
import com.kaneki.pojo.Page;
import com.kaneki.pojo.StoreHouse;
import com.kaneki.pojo.User;
import com.kaneki.service.CommodiTypeService;
import com.kaneki.service.CommodityService;
import com.kaneki.service.DocioService;
import com.kaneki.service.StoreHouseService;
import com.kaneki.service.UserService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class DocioController {
	@Autowired
	private DocioService docioService;
	@Autowired
	private CommodityService commodityService;
	@Autowired
	private UserService userService;
	@Autowired
	private StoreHouseService storeHouseService;

	// 分页查询商品库存操作明细信息
	@RequestMapping(value = "/docioList.action")
	public String docioList(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer pageRows, Docio docio, Model model) {
		Page<Docio> docios = docioService.findDocio(page, pageRows, docio);
		List<StoreHouse> storeHouse = storeHouseService.getStoreHouse();
		List<Commodity> commodities = commodityService.getCommodity();
		List<User> userList = userService.getUser();
		if (docio.getUsers() != null) {
			model.addAttribute("UID", docio.getUsers().getUserId());
		}
		if (docio.getCommodity() != null) {
			model.addAttribute("CID", docio.getCommodity().getCommodityId());
		}
		if (docio.getStoreHouse() != null) {
			model.addAttribute("SHID", docio.getStoreHouse().getStoreHouseId());
		}
		model.addAttribute("TYPE", docio.getOperateType());
		model.addAttribute("COM", commodities);
		model.addAttribute("SH", storeHouse);
		model.addAttribute("USER", userList);
		model.addAttribute("page", docios);
		return "docioList";
	}

	// 创建商品库存操作明细
	@RequestMapping(value = "/createDoico.action")
	@ResponseBody
	public String createDoico(Docio docio) {
		int i = docioService.createDoico(docio);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIl";
		}
	}

}
