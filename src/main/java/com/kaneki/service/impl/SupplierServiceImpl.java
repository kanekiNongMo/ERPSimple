package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.log.LogAnnotation;
import com.kaneki.mapper.SupplierMapper;
import com.kaneki.pojo.Page;
import com.kaneki.pojo.Supplier;
import com.kaneki.service.SupplierService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class SupplierServiceImpl implements SupplierService {
	@Autowired
	private SupplierMapper supplierMapper;

	// 添加供应商信息
	@LogAnnotation(operateType = "注册了一个供应商")
	public int addSupplier(Supplier supplier) {
		return this.supplierMapper.addSupplier(supplier);
	}

	// 修改供应商信息
	@LogAnnotation(operateType = "修改了一个供应商")
	public int updateSupplier(Supplier supplier) {
		return this.supplierMapper.updateSupplier(supplier);
	}

	// 删除供应商信息
	@LogAnnotation(operateType = "删除了一个供应商")
	public int deleteSupplier(Integer supplierId) {
		return this.supplierMapper.deleteSupplier(supplierId);
	}

	// 根据编号获取供应商信息
	public Supplier findSupplierByID(Integer supplierId) {
		return this.supplierMapper.findSupplierByID(supplierId);
	}

	// 分页查询供应商信息
	public Page<Supplier> findAllSupplier(Integer page, Integer pageRows, Supplier supplier) {
		int total = supplierMapper.findCountSup(supplier);
		Page<Supplier> pageSup = new Page<Supplier>();
		pageSup.setTotal(total);
		pageSup.setPage(page);
		pageSup.setPageRows(pageRows);
		supplier.setPage(page);
		supplier.setSize(pageRows);
		List<Supplier> list = supplierMapper.findAllSupplier(supplier);
		pageSup.setList(list);
		return pageSup;
	}

	// 获取所有供应商
	public List<Supplier> getSup() {
		return this.supplierMapper.getSup();
	}

}
