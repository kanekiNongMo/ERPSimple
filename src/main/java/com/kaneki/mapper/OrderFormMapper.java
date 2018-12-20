package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.OrderForm;

public interface OrderFormMapper {
	// 分页查询订单
	public List<OrderForm> findOrderForm(OrderForm orderForm);

	// 获取订单总数
	public int getCountOrderForm(OrderForm orderForm);

	// 删除订单
	public int deleteOrderForm(int orderId);

	// 修改订单
	public int updateOrderForm(OrderForm orderForm);

	// 创建订单
	public int addOrder(OrderForm orderForm);

	// 根据id获取订单
	public OrderForm getOrderById(int orderId);

	// 获取所有订单
	public List<OrderForm> getOrder();
}
