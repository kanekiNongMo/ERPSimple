package com.kaneki.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
 * @author LiJiezhou
 *
 */
public class Docio {
	private Integer cioId;// 商品库存操作明细编号
	private User users;// 用户编号
	private Commodity commodity;// 商品信息编号
	private StoreHouse storeHouse;// 仓库编号
	@DateTimeFormat(pattern = "yyyy-mm-dd HH:mm:ss")
	private Date operateTime;// 操作时间
	private String time;
	private Integer operateType;// 操作类型0出库1入库
	private Integer num;// 数量
	private Integer page;
	private Integer size;

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
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

	public Integer getCioId() {
		return cioId;
	}

	public void setCioId(Integer cioId) {
		this.cioId = cioId;
	}

	public User getUsers() {
		return users;
	}

	public void setUsers(User users) {
		this.users = users;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public StoreHouse getStoreHouse() {
		return storeHouse;
	}

	public void setStoreHouse(StoreHouse storeHouse) {
		this.storeHouse = storeHouse;
	}

	public Date getOperateTime() {
		return operateTime;
	}

	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}

	public Integer getOperateType() {
		return operateType;
	}

	public void setOperateType(Integer operateType) {
		this.operateType = operateType;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

}
