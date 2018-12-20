package com.kaneki.service;

import com.kaneki.pojo.OrderDetails;
import com.kaneki.pojo.Page;

/**
 * 
 * @author LiJiezhou
 *
 */
public interface OrderDetailsService {
	// 分页查询订单明细
	public Page<OrderDetails> findOrderDetails(Integer page, Integer pageRows, OrderDetails orderDetails);

	// 根据编号订单明细
	public OrderDetails getOrderDetailsById(Integer orderDetailsId);

	// 添加订单明细
	public int addOrderDetails(OrderDetails orderDetails);

	// 删除订单明细
	public int deleteOrderDetails(Integer orderDetailsId);

	// 修改订单明细
	public int updateOrderDetails(OrderDetails orderDetails);
}
