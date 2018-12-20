package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.OrderDetails;

public interface OrderDetailsMapper {
	// 分页查询订单明细
	public List<OrderDetails> findOrderDetails(OrderDetails orderDetails);

	// 获取订单明细总数
	public int getCountOrderDeatils(OrderDetails orderDetails);

	// 根据id获取订单明细
	public OrderDetails getOrderDetailsById(Integer orderDetailsId);

	// 创建订单明细
	public int addOrderDetails(OrderDetails orderDetails);

	// 删除订单明细
	public int deleteOrderDetails(Integer orderDetailsId);

	// 修改订单明细
	public int updateOrderDetails(OrderDetails orderDetails);

}
