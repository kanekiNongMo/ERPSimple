package com.kaneki.service;


import com.kaneki.pojo.Page;
import com.kaneki.pojo.Store;

/**
 * 
 * @author LiJiezhou
 *
 */
public interface StoreService {
	
	//分页查询
	public Page<Store> findStore(Integer page,Integer pageRows,Store store);

}
