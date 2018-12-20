package com.kaneki.service;

import java.util.List;

import com.kaneki.pojo.OrderForm;
import com.kaneki.pojo.Page;

/**
 * 
 * @author LiJiezhou
 *
 */
public interface OrderFormService {
	// 分页查询订单
	public Page<OrderForm> findOrderForm(Integer page, Integer pageRows, OrderForm orderForm);

	// 删除订单信息
	public int deleteOrderForm(int orderId);

	// 修改订单信息
	public int updateOrderForm(OrderForm orderForm);

	// 创建订单
	public int addOrder(OrderForm orderForm);

	// 根据编号获取订单信息
	public OrderForm getOrderById(int orderId);

	// 获取所有订单编号
	public List<OrderForm> getOrder();
	
	// 查询订单
	public List<OrderForm> findOrderForm(OrderForm orderForm);
	
}
