package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.Store;

public interface StoreMapper {
	
	//分页查询
	public List<Store> findStore(Store store);
	
	//条件查询总数
	public int getCountStore(Store store);

}
