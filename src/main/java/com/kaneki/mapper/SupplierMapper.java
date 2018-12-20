package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.Supplier;

public interface SupplierMapper {
	// 添加供应商
	public int addSupplier(Supplier supplier);

	// 修改供应商
	public int updateSupplier(Supplier supplier);

	// 删除供应商
	public int deleteSupplier(Integer supplierId);

	// 根据id查询供应商
	public Supplier findSupplierByID(Integer supplierId);

	// 分页查询供应商
	public List<Supplier> findAllSupplier(Supplier supplier);

	// 查询供应商总数
	public int findCountSup(Supplier supplier);

	// 查询所有供应商
	public List<Supplier> getSup();
}
