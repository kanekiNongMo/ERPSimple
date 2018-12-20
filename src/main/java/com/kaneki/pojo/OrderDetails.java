package com.kaneki.pojo;

/**
 * 
 * @author LiJiezhou
 *
 */
public class OrderDetails {
	private Integer orderDetailsId;// 订单明细编号
	private Commodity commodity;// 商品信息编号
	private OrderForm order;// 订单编号
	private Double unitPrice;// 单价
	private Integer orderQuantity;// 订单数量
	private Integer surplus;// 剩余
	private Integer page;
	private Integer size;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getOrderDetailsId() {
		return orderDetailsId;
	}

	public void setOrderDetailsId(Integer orderDetailsId) {
		this.orderDetailsId = orderDetailsId;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public OrderForm getOrder() {
		return order;
	}

	public void setOrder(OrderForm order) {
		this.order = order;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(Integer orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public Integer getSurplus() {
		return surplus;
	}

	public void setSurplus(Integer surplus) {
		this.surplus = surplus;
	}

}
