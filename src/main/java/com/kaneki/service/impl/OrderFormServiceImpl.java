package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.log.LogAnnotation;
import com.kaneki.mapper.OrderFormMapper;
import com.kaneki.pojo.OrderForm;
import com.kaneki.pojo.Page;
import com.kaneki.service.OrderFormService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class OrderFormServiceImpl implements OrderFormService {
	@Autowired
	private OrderFormMapper orderFormMapper;

	// 分页查询订单
	public Page<OrderForm> findOrderForm(Integer page, Integer pageRows, OrderForm orderForm) {
		int total = orderFormMapper.getCountOrderForm(orderForm);
		Page<OrderForm> pageOrder = new Page<OrderForm>();
		pageOrder.setPage(page);
		pageOrder.setPageRows(pageRows);
		pageOrder.setTotal(total);
		orderForm.setPage(page);
		orderForm.setSize(pageRows);
		List<OrderForm> orders = orderFormMapper.findOrderForm(orderForm);
		pageOrder.setList(orders);
		return pageOrder;
	}

	// 删除订单信息
	@LogAnnotation(operateType = "删除了一个订单信息")
	public int deleteOrderForm(int orderId) {
		return this.orderFormMapper.deleteOrderForm(orderId);
	}

	// 修改订单信息
	@LogAnnotation(operateType = "修改了一个订单信息")
	public int updateOrderForm(OrderForm orderForm) {
		return this.orderFormMapper.updateOrderForm(orderForm);
	}

	// 创建订单
	@LogAnnotation(operateType = "创建了一个订单信息")
	public int addOrder(OrderForm orderForm) {
		return this.orderFormMapper.addOrder(orderForm);
	}

	// 根据编号获取订单信息
	public OrderForm getOrderById(int orderId) {
		return this.orderFormMapper.getOrderById(orderId);
	}

	// 获取所有订单编号
	public List<OrderForm> getOrder() {
		return this.orderFormMapper.getOrder();
	}

	public List<OrderForm> findOrderForm(OrderForm orderForm) {
		return this.orderFormMapper.findOrderForm(orderForm);
	}



}
