package com.kaneki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kaneki.pojo.Commodity;
import com.kaneki.pojo.Page;
import com.kaneki.pojo.Store;
import com.kaneki.pojo.StoreHouse;
import com.kaneki.service.CommodityService;
import com.kaneki.service.StoreHouseService;
import com.kaneki.service.StoreService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class StoreController {
	@Autowired
	private StoreService storeService;
	@Autowired
	private CommodityService commodityService;
	@Autowired
	private StoreHouseService storeHouseService;

	// 分页查询
	@RequestMapping(value = "/storeList.action")
	public String findStore(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer pageRows, Store store, Model model) {
		Page<Store> pageStores = storeService.findStore(page, pageRows, store);
		List<Commodity> commodities = commodityService.getCommodity();
		List<StoreHouse> houses = storeHouseService.getStoreHouse();
		if (store.getCommodity() != null) {
			model.addAttribute("CID", store.getCommodity().getCommodityId());
		}
		if (store.getStoreHouse() != null) {
			model.addAttribute("SHNID", store.getStoreHouse().getStoreHouseId());
		}
		model.addAttribute("HOUSES", houses);
		model.addAttribute("COMDI", commodities);
		model.addAttribute("page", pageStores);
		return "storeList";
	}

}
