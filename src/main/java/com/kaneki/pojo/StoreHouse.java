package com.kaneki.pojo;

/**
 * 
 * @author LiJiezhou
 *
 */
public class StoreHouse {
	private Integer storeHouseId;// 仓库信息编号
	private User user;// 管理员编号
	private String storeHouseName;// 仓库名称
	private String storeHouseAddress;// 仓库地址
	private Integer page;
	private Integer size;

	public Integer getStoreHouseId() {
		return storeHouseId;
	}

	public void setStoreHouseId(Integer storeHouseId) {
		this.storeHouseId = storeHouseId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getStoreHouseName() {
		return storeHouseName;
	}

	public void setStoreHouseName(String storeHouseName) {
		this.storeHouseName = storeHouseName;
	}

	public String getStoreHouseAddress() {
		return storeHouseAddress;
	}

	public void setStoreHouseAddress(String storeHouseAddress) {
		this.storeHouseAddress = storeHouseAddress;
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

}
