package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.mapper.StoreMapper;
import com.kaneki.pojo.Page;
import com.kaneki.pojo.Store;
import com.kaneki.service.StoreService;
/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreMapper storeMapper;
	
	//分页查询
	public Page<Store> findStore(Integer page, Integer pageRows, Store store) {
		int total=storeMapper.getCountStore(store);
		Page<Store> pageStore=new Page<Store>();
		pageStore.setTotal(total);
		pageStore.setPage(page);
		pageStore.setPageRows(pageRows);
		store.setPage(page);
		store.setSize(pageRows);
		List<Store> stores=storeMapper.findStore(store);
		pageStore.setList(stores);
		return pageStore;
	}
}
