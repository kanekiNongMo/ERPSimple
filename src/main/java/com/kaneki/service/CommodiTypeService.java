package com.kaneki.service;

import java.util.List;

import com.kaneki.pojo.CommodiType;
import com.kaneki.pojo.Page;

/**
 * 
 * @author LiJiezhou
 *
 */
public interface CommodiTypeService {
	// 添加商品类型信息
	public int addComType(CommodiType comType);

	// 修改商品类型信息
	public int updateComType(CommodiType comType);

	// 删除商品类型信息
	public int deleteComType(Integer comTypeId);

	// 分页查询商品类型信息
	public Page<CommodiType> findAllComType(Integer page, Integer pageRows, CommodiType comType);

	// 根据商品类型名称查询商品类型信息
	public List<CommodiType> findComTypeByName(CommodiType comType);

	// 判断商品类型信息是否存在
	public int isUpdateExistComTypeByName(CommodiType comType);

	// 获取所有商品类型
	public List<CommodiType> getComType();

}
