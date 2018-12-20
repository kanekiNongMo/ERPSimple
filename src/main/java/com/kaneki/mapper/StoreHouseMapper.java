package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.StoreHouse;

public interface StoreHouseMapper {
	// 添加仓库
	public int addStoreHouse(StoreHouse storeHouse);

	// 修改仓库
	public int updateStoreHouse(StoreHouse storeHouse);

	// 删除仓库
	public int deleteStoreHouse(Integer storeHouseId);

	// 分页查询仓库
	public List<StoreHouse> findAllStoreHouse(StoreHouse storeHouse);

	// 获取仓库总数
	public int findCountStoreHouse();

	// 根据仓库id获取仓库信息和用户信息
	public StoreHouse getStoreHouseBystoreHouseId(Integer storeHouseId);

	// 根据仓库名称获取仓库信息
	public StoreHouse isExistStoreHouse(StoreHouse storeHouse);

	// 根据仓库id和名称获取仓库信息
	public StoreHouse isExistStoreHouseByIdAndName(StoreHouse storeHouse);

	// 获取所有仓库
	public List<StoreHouse> getStoreHouse();

}
