package com.kaneki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaneki.pojo.Page;
import com.kaneki.pojo.Supplier;
import com.kaneki.service.SupplierService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class SupplierController {
	@Autowired
	private SupplierService supplierService;

	// 分页查询所有供应商信息，可根据供应商名称查询
	@RequestMapping(value = "/supplierList.action")
	public String findAllSupplier(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer pageRows, Supplier supplier, Model model) {
		Page<Supplier> list = supplierService.findAllSupplier(page, pageRows, supplier);
		model.addAttribute("supplierName", supplier.getSupplierName());
		model.addAttribute("supplierContact", supplier.getSupplierContact());
		model.addAttribute("page", list);
		return "supplierList";
	}

	// 添加供应商
	@RequestMapping(value = "/createSupplier.action")
	@ResponseBody
	public String addSupplier(Supplier supplier) {
		int i = supplierService.addSupplier(supplier);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 根据供应商编号获取供应商信息
	@RequestMapping(value = "/getSupplierById.action")
	@ResponseBody
	public Supplier getBySupplierId(Integer supplierId) {
		Supplier supplier = supplierService.findSupplierByID(supplierId);
		return supplier;
	}

	// 修改供应商信息
	@RequestMapping(value = "/updateSupplier.action")
	@ResponseBody
	public String updateSupplier(Supplier supplier) {
		int i = supplierService.updateSupplier(supplier);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 删除供应商信息
	@RequestMapping(value = "/deleteSupplier.action")
	@ResponseBody
	public String deleteSupplier(Integer supplierId) {
		int i = supplierService.deleteSupplier(supplierId);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
