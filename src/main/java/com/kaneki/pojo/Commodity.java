package com.kaneki.pojo;
/**
 * 
 * @author LiJiezhou
 *
 */
public class Commodity {
	private Integer commodityId;// 商品信息编号
	private CommodiType comType;// 商品类型编号
	private String commodityName;// 商品名称
	private String placeProduction;// 产地
	private String manufacturer;// 生产厂家
	private Double purchasePrice;// 进货价
	private Double sellingPrice;// 售价
	private Integer volume;// 体积
	private Integer minQuantity;// 最小库存数量
	private Integer maxQuantity;// 最大库存数量
	private Integer page;
	private Integer size;

	public Integer getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(Integer commodityId) {
		this.commodityId = commodityId;
	}

	public CommodiType getComType() {
		return comType;
	}

	public void setComType(CommodiType comType) {
		this.comType = comType;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public String getPlaceProduction() {
		return placeProduction;
	}

	public void setPlaceProduction(String placeProduction) {
		this.placeProduction = placeProduction;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public Double getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(Double purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public Double getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(Double sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public Integer getVolume() {
		return volume;
	}

	public void setVolume(Integer volume) {
		this.volume = volume;
	}

	public Integer getMinQuantity() {
		return minQuantity;
	}

	public void setMinQuantity(Integer minQuantity) {
		this.minQuantity = minQuantity;
	}

	public Integer getMaxQuantity() {
		return maxQuantity;
	}

	public void setMaxQuantity(Integer maxQuantity) {
		this.maxQuantity = maxQuantity;
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
