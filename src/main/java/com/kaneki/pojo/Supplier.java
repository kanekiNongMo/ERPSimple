package com.kaneki.pojo;

/**
 * 
 * @author LiJiezhou
 *
 */
public class Supplier {
	private Integer supplierId;// 供应商编号
	private String supplierName;// 供应商名称
	private String supplierContact;// 供应商联系人
	private String supplierPhone;// 联系电话
	private String supplierAddress;// 联系地址
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

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSupplierContact() {
		return supplierContact;
	}

	public void setSupplierContact(String supplierContact) {
		this.supplierContact = supplierContact;
	}

	public String getSupplierPhone() {
		return supplierPhone;
	}

	public void setSupplierPhone(String supplierPhone) {
		this.supplierPhone = supplierPhone;
	}

	public String getSupplierAddress() {
		return supplierAddress;
	}

	public void setSupplierAddress(String supplierAddress) {
		this.supplierAddress = supplierAddress;
	}

	@Override
	public String toString() {
		return "Supplier [supplierId=" + supplierId + ", supplierName=" + supplierName + ", supplierContact="
				+ supplierContact + ", supplierPhone=" + supplierPhone + ", supplierAddress=" + supplierAddress + "]";
	}

}
