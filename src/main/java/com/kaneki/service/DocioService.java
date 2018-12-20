package com.kaneki.service;

import com.kaneki.pojo.Docio;
import com.kaneki.pojo.Page;

/**
 * 
 * @author LiJiezhou
 *
 */
public interface DocioService {
	// 分页查询商品库存操作明细
	public Page<Docio> findDocio(Integer page, Integer pageRows, Docio docio);

	// 创建商品入库出库
	public int createDoico(Docio docio);

}
