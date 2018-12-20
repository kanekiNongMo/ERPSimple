package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.log.LogAnnotation;
import com.kaneki.mapper.OrderDetailsMapper;
import com.kaneki.pojo.OrderDetails;
import com.kaneki.pojo.Page;
import com.kaneki.service.OrderDetailsService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class OrderDetailsServiceImpl implements OrderDetailsService {
	@Autowired
	private OrderDetailsMapper orderDetailsMapper;

	// 分页查询订单明细
	public Page<OrderDetails> findOrderDetails(Integer page, Integer pageRows, OrderDetails orderDetails) {
		int total = orderDetailsMapper.getCountOrderDeatils(orderDetails);
		Page<OrderDetails> pageOrederDetails = new Page<OrderDetails>();
		pageOrederDetails.setPage(page);
		pageOrederDetails.setPageRows(pageRows);
		pageOrederDetails.setTotal(total);
		orderDetails.setPage(page);
		orderDetails.setSize(pageRows);
		List<OrderDetails> details = orderDetailsMapper.findOrderDetails(orderDetails);
		pageOrederDetails.setList(details);
		return pageOrederDetails;
	}

	// 根据编号订单明细
	public OrderDetails getOrderDetailsById(Integer orderDetailsId) {
		return this.orderDetailsMapper.getOrderDetailsById(orderDetailsId);
	}

	// 添加订单明细
	@LogAnnotation(operateType = "添加了一个订单明细")
	public int addOrderDetails(OrderDetails orderDetails) {
		return this.orderDetailsMapper.addOrderDetails(orderDetails);
	}

	// 删除订单明细
	@LogAnnotation(operateType = "删除了一个订单明细")
	public int deleteOrderDetails(Integer orderDetailsId) {
		return this.orderDetailsMapper.deleteOrderDetails(orderDetailsId);
	}

	// 修改订单明细
	@LogAnnotation(operateType = "修改了一个订单明细")
	public int updateOrderDetails(OrderDetails orderDetails) {
		return this.orderDetailsMapper.updateOrderDetails(orderDetails);
	}
}
