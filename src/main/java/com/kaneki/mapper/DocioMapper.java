package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.Docio;

public interface DocioMapper {
	// 分页获取商品库存操作信息
	public List<Docio> findDocio(Docio docio);

	// 获取商品库存操作总数
	public int findCountDocio(Docio docio);

	// 添加商品操作明细
	public int addDoico(Docio docio);
}
