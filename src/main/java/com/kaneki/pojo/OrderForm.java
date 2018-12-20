package com.kaneki.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
 * @author LiJiezhou
 *
 */
public class OrderForm {
	private Integer orderId;// 订单编号
	private Supplier supplier;// 供应商编号
	private String creater;// 创建人
	@DateTimeFormat(pattern = "yyyy-mm-dd HH:mm:ss")
	private Date createTime;// 创建时间
	private String cTime;
	private String auditor;// 审核人
	@DateTimeFormat(pattern = "yyyy-mm-dd HH:mm:ss")
	private Date auditTime;// 审核时间
	private String aTime;
	private String documentary;// 跟单人
	@DateTimeFormat(pattern = "yyyy-mm-dd HH:mm:ss")
	private Date endTime;// 结束时间
	private String eTime;
	private Integer orderType;// 订单类型
	private Integer orderStatus;// 订单状态
	private Integer totalQuantity;// 总数量
	private Double aggregateAmount;// 总金额
	private Integer page;
	private Integer size;

	public String getcTime() {
		return cTime;
	}

	public void setcTime(String cTime) {
		this.cTime = cTime;
	}

	public String getaTime() {
		return aTime;
	}

	public void setaTime(String aTime) {
		this.aTime = aTime;
	}

	public String geteTime() {
		return eTime;
	}

	public void seteTime(String eTime) {
		this.eTime = eTime;
	}

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

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getAuditor() {
		return auditor;
	}

	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}

	public Date getAuditTime() {
		return auditTime;
	}

	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
	}

	public String getDocumentary() {
		return documentary;
	}

	public void setDocumentary(String documentary) {
		this.documentary = documentary;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getOrderType() {
		return orderType;
	}

	public void setOrderType(Integer orderType) {
		this.orderType = orderType;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Integer getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(Integer totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public Double getAggregateAmount() {
		return aggregateAmount;
	}

	public void setAggregateAmount(Double aggregateAmount) {
		this.aggregateAmount = aggregateAmount;
	}

}
