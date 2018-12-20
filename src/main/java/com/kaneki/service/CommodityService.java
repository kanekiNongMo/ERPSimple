package com.kaneki.service;

import java.util.List;

import com.kaneki.pojo.Commodity;
import com.kaneki.pojo.Page;
/**
 * 
 * @author LiJiezhou
 *
 */
public interface CommodityService {
	// 添加商品信息
	public int addCommodity(Commodity commodity);

	// 修改商品信息
	public int updateCommodity(Commodity commodity);

	// 删除商品信息
	public int deleteCommodity(Integer commodityId);

	// 分页获取所有商品信息
	public Page<Commodity> findAllCommodity(Integer page, Integer pageRows, Commodity commodity);

	// 根据商品名称判断商品信息是否存在
	public int isExistCommodity(Commodity commodity);

	// 修改时判断商品是否存在
	public int isExistCommodityByIdAndName(Commodity commodity);

	// 根据商品编号获取商品信息
	public Commodity getCommodityById(Integer commodityId);

	// 获取所有商品信息
	public List<Commodity> getCommodity();

}
