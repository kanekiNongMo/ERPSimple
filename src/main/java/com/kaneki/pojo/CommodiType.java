package com.kaneki.pojo;
/**
 * 
 * @author LiJiezhou
 *
 */
public class CommodiType {
	private Integer comTypeId;// 商品类型编号
	private String comTypeName;// 商品类型名称

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

	public Integer getComTypeId() {
		return comTypeId;
	}

	public void setComTypeId(Integer comTypeId) {
		this.comTypeId = comTypeId;
	}

	public String getComTypeName() {
		return comTypeName;
	}

	public void setComTypeName(String comTypeName) {
		this.comTypeName = comTypeName;
	}

	@Override
	public String toString() {
		return "CommodiType [comTypeId=" + comTypeId + ", comTypeName=" + comTypeName + "]";
	}

}
