package com.kaneki.service;

import java.util.List;

import com.kaneki.pojo.Page;
import com.kaneki.pojo.StoreHouse;

/**
 * 
 * @author LiJiezhou
 *
 */
public interface StoreHouseService {
	// 添加仓库信息
	public int addStoreHouse(StoreHouse storeHouse);

	// 修改仓库信息
	public int updateStoreHouse(StoreHouse storeHouse);

	// 删除仓库信息
	public int deleteStoreHouse(Integer storeHouseId);

	// 分页查询仓库信息
	public Page<StoreHouse> findAllStoreHouse(Integer page, Integer pageRows, StoreHouse storeHouse);

	// 根据编号获取仓库信息
	public StoreHouse getStoreHouseBystoreHouseId(Integer storeHouseId);

	// 根据仓库名称判断仓库是否存在
	public int isExistStoreHouse(StoreHouse storeHouse);

	// 根据仓库名称和编号判断仓库是否存在
	public int isExistStoreHouseByIdAndName(StoreHouse storeHouse);

	// 获取所有仓库
	public List<StoreHouse> getStoreHouse();

}
