package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.log.LogAnnotation;
import com.kaneki.mapper.StoreHouseMapper;
import com.kaneki.pojo.Page;
import com.kaneki.pojo.StoreHouse;
import com.kaneki.service.StoreHouseService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class StoreHouseServiceImpl implements StoreHouseService {
	@Autowired
	private StoreHouseMapper storeHouseMapper;

	// 添加仓库信息
	@LogAnnotation(operateType = "添加了一个仓库")
	public int addStoreHouse(StoreHouse storeHouse) {
		return this.storeHouseMapper.addStoreHouse(storeHouse);
	}

	// 修改仓库信息
	@LogAnnotation(operateType = "修改了一个仓库信息")
	public int updateStoreHouse(StoreHouse storeHouse) {
		return this.storeHouseMapper.updateStoreHouse(storeHouse);
	}

	// 删除仓库信息
	@LogAnnotation(operateType = "删除了一个仓库")
	public int deleteStoreHouse(Integer storeHouseId) {
		return this.storeHouseMapper.deleteStoreHouse(storeHouseId);
	}

	// 分页查询仓库信息
	public Page<StoreHouse> findAllStoreHouse(Integer page, Integer pageRows, StoreHouse storeHouse) {
		int total = storeHouseMapper.findCountStoreHouse();
		Page<StoreHouse> pageStoreHouse = new Page<StoreHouse>();
		pageStoreHouse.setPage(page);
		pageStoreHouse.setPageRows(pageRows);
		pageStoreHouse.setTotal(total);
		storeHouse.setPage(page);
		storeHouse.setSize(pageRows);
		List<StoreHouse> storeHouseList = storeHouseMapper.findAllStoreHouse(storeHouse);
		pageStoreHouse.setList(storeHouseList);
		return pageStoreHouse;
	}

	// 根据编号获取仓库信息
	public StoreHouse getStoreHouseBystoreHouseId(Integer storeHouseId) {
		return this.storeHouseMapper.getStoreHouseBystoreHouseId(storeHouseId);
	}

	// 根据仓库名称判断仓库是否存在
	public int isExistStoreHouse(StoreHouse storeHouse) {
		if (storeHouseMapper.isExistStoreHouse(storeHouse) != null) {
			return 1;
		} else {
			return 0;
		}

	}

	// 根据仓库名称和编号判断仓库是否存在
	public int isExistStoreHouseByIdAndName(StoreHouse storeHouse) {
		if (storeHouseMapper.isExistStoreHouseByIdAndName(storeHouse) == null
				&& storeHouseMapper.isExistStoreHouse(storeHouse) != null) {
			return 1;
		} else {
			return 0;
		}

	}

	// 获取所有仓库
	public List<StoreHouse> getStoreHouse() {
		return this.storeHouseMapper.getStoreHouse();
	}
}
