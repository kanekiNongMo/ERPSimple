package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.Commodity;

public interface CommodityMapper {
	// 添加商品信息
	public int addCommodity(Commodity commodity);

	// 修改商品信息
	public int updateCommodity(Commodity commodity);

	// 删除商品信息
	public int deleteCommodity(Integer commodityId);

	// 分页查询商品信息
	public List<Commodity> findAllCommodity(Commodity commodity);

	// 根据商品名称查询商品信息
	public Commodity isExistCommodity(Commodity commodity);

	// 根据商品名称和编号查询商品信息
	public Commodity isExistCommodityByIdAndName(Commodity commodity);

	// 获取商品编号获取商品信息
	public Commodity getCommodityById(Integer commodityId);

	// 获取商品总数
	public int findCountCommodity(Commodity commodity);

	// 获取所有商品
	public List<Commodity> getCommodity();

}
