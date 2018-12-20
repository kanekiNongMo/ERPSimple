package com.kaneki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaneki.pojo.Page;
import com.kaneki.pojo.StoreHouse;
import com.kaneki.pojo.User;
import com.kaneki.service.StoreHouseService;
import com.kaneki.service.UserService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class StoreHouseController {
	@Autowired
	private StoreHouseService storeHouseService;
	@Autowired
	private UserService userService;

	// 分页查询仓库信息，根据仓库名称查询
	@RequestMapping(value = "/storeHouseList.action")
	public String getAllStoreHouse(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer pageRows, StoreHouse storeHouse, Model model) {
		Page<StoreHouse> list = storeHouseService.findAllStoreHouse(page, pageRows, storeHouse);
		List<User> userList = userService.getUser();
		model.addAttribute("USER", userList);
		model.addAttribute("StoreHouseName", storeHouse.getStoreHouseName());
		model.addAttribute("page", list);
		return "storeHouseList";
	}

	// 注册仓库
	@RequestMapping(value = "/createStoreHouse.action")
	@ResponseBody
	public String addStoreHouse(StoreHouse storeHouse) {
		int i = storeHouseService.addStoreHouse(storeHouse);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 修改仓库信息
	@RequestMapping(value = "/updateStoreHouse.action")
	@ResponseBody
	public String updateStoreHouse(StoreHouse storeHouse) {
		int i = storeHouseService.updateStoreHouse(storeHouse);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 删除仓库信息
	@RequestMapping(value = "/deleteStoreHouse.action")
	@ResponseBody
	public String deleteStoreHouse(Integer storeHouseId) {
		int i = storeHouseService.deleteStoreHouse(storeHouseId);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 根据仓库编号获取仓库信息
	@RequestMapping(value = "/getStoreHouseById.action")
	@ResponseBody
	public StoreHouse getStoreHouseById(Integer storeHouseId) {
		StoreHouse storeHouse = storeHouseService.getStoreHouseBystoreHouseId(storeHouseId);
		return storeHouse;
	}

	// 根据仓库名称判断仓库是否存在
	@RequestMapping(value = "/isExistStoreHouse.action")
	@ResponseBody
	public int isExistStoreHouse(StoreHouse storeHouse) {
		return storeHouseService.isExistStoreHouse(storeHouse);

	}

	// 根据仓库名称和编号判断仓库是否存在
	@RequestMapping(value = "/isExistStoreHouseByIdAndName.action")
	@ResponseBody
	public int isExistStoreHouseByIdAndName(StoreHouse storeHouse) {
		return storeHouseService.isExistStoreHouseByIdAndName(storeHouse);

	}
}
