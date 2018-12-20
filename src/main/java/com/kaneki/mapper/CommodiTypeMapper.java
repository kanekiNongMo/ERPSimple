package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.CommodiType;

public interface CommodiTypeMapper {
	// 添加商品类型信息
	public int addComType(CommodiType comType);

	// 修改商品类型信息
	public int updateComType(CommodiType comType);

	// 删除商品类型信息
	public int deleteComType(Integer comTypeId);

	// 根据商品类型编号查询商品类型信息
	public CommodiType findComTypeById(Integer comTypeId);

	// 分页查询商品类型信息
	public List<CommodiType> findAllComType(CommodiType comType);

	// 根据商品类型名称查询商品类型信息
	public List<CommodiType> findComTypeByName(CommodiType comType);

	// 获取商品类型总数
	public int findCountComType(CommodiType commodiType);

	// 获取所有商品类型
	public List<CommodiType> getComType();

}
