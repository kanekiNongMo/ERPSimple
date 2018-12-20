package com.kaneki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaneki.pojo.Commodity;
import com.kaneki.pojo.OrderDetails;
import com.kaneki.pojo.OrderForm;
import com.kaneki.pojo.Page;
import com.kaneki.service.CommodityService;
import com.kaneki.service.OrderDetailsService;
import com.kaneki.service.OrderFormService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class OrderDetailsController {
	@Autowired
	private OrderDetailsService orderDetailsService;
	@Autowired
	private OrderFormService orderFormService;
	@Autowired
	private CommodityService commodityService;

	// 分页查询所有订单明细，还可根据商品名称分页查询
	@RequestMapping(value = "/orderDetailsList.action")
	public String findOrderDetails(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer pageRows, OrderDetails orderDetails, Model model) {
		Page<OrderDetails> pageOrderDetails = orderDetailsService.findOrderDetails(page, pageRows, orderDetails);
		if (orderDetails.getCommodity() != null) {
			model.addAttribute("CNAME", orderDetails.getCommodity().getCommodityName());
		}
		List<Commodity> commodities = commodityService.getCommodity();
		List<OrderForm> orderForms = orderFormService.getOrder();
		model.addAttribute("COM", commodities);
		model.addAttribute("OF", orderForms);
		model.addAttribute("page", pageOrderDetails);
		return "orderDetailsList";
	}

	// 更新订单明细
	@RequestMapping(value = "/updateOrderDetails.action")
	@ResponseBody
	public String updateOrderDetails(OrderDetails orderDetails) {
		int i = orderDetailsService.updateOrderDetails(orderDetails);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIl";
		}
	}

	// 删除订单明细
	@RequestMapping(value = "/deleteOrderDetails.action")
	@ResponseBody
	public String deleteOrderDetails(Integer orderDetailsId) {
		int i = orderDetailsService.deleteOrderDetails(orderDetailsId);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIl";
		}
	}

	// 添加订单明细
	@RequestMapping(value = "/addOrderDetails.action")
	@ResponseBody
	public String addOrderDetails(OrderDetails orderDetails) {
		int i = orderDetailsService.addOrderDetails(orderDetails);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 根据订单明细编号查询
	@RequestMapping(value = "/getOrderDetailsById.action")
	@ResponseBody
	public OrderDetails getOrderDetailsById(Integer orderDetailsId) {
		return orderDetailsService.getOrderDetailsById(orderDetailsId);
	}
}
