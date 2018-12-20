package com.kaneki.pojo;

/**
 * 
 * @author LiJiezhou
 *
 */
public class Store {
	private Integer storeId;// 库存编号
	private Commodity commodity;// 商品信息编号
	private StoreHouse storeHouse;// 仓库编号
	private Integer InventoryQuantity;// 库存数量
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

	public Integer getStoreId() {
		return storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
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

	public Integer getInventoryQuantity() {
		return InventoryQuantity;
	}

	public void setInventoryQuantity(Integer inventoryQuantity) {
		InventoryQuantity = inventoryQuantity;
	}

}
