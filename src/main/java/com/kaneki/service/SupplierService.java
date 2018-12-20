package com.kaneki.service;

import java.util.List;

import com.kaneki.pojo.Page;
import com.kaneki.pojo.Supplier;
/**
 * 
 * @author LiJiezhou
 *
 */
public interface SupplierService {
	// 添加供应商信息
	public int addSupplier(Supplier supplier);

	// 修改供应商信息
	public int updateSupplier(Supplier supplier);

	// 删除供应商信息
	public int deleteSupplier(Integer supplierId);

	// 根据编号获取供应商信息
	public Supplier findSupplierByID(Integer supplierId);

	// 分页查询供应商信息
	public Page<Supplier> findAllSupplier(Integer page, Integer pageRows, Supplier supplier);

	// 获取所有供应商
	public List<Supplier> getSup();
}
