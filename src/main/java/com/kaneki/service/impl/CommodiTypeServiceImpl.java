package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.log.LogAnnotation;
import com.kaneki.mapper.CommodiTypeMapper;
import com.kaneki.pojo.CommodiType;
import com.kaneki.pojo.Page;
import com.kaneki.service.CommodiTypeService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class CommodiTypeServiceImpl implements CommodiTypeService {
	@Autowired
	private CommodiTypeMapper commodiTypeMapper;

	// 添加商品类型信息
	@LogAnnotation(operateType = "添加了一个商品类型")
	public int addComType(CommodiType comType) {
		return this.commodiTypeMapper.addComType(comType);
	}

	// 修改商品类型信息
	@LogAnnotation(operateType = "修改了一个商品类型")
	public int updateComType(CommodiType comType) {
		return this.commodiTypeMapper.updateComType(comType);
	}

	// 删除商品类型信息
	@LogAnnotation(operateType = "删除了一个商品类型")
	public int deleteComType(Integer comTypeId) {
		return this.commodiTypeMapper.deleteComType(comTypeId);
	}

	// 分页查询商品类型信息
	public Page<CommodiType> findAllComType(Integer page, Integer pageRows, CommodiType comType) {
		int total = commodiTypeMapper.findCountComType(comType);
		Page<CommodiType> pageComType = new Page<CommodiType>();
		pageComType.setPage(page);
		pageComType.setPageRows(pageRows);
		pageComType.setTotal(total);
		comType.setPage(page);
		comType.setSize(pageRows);
		List<CommodiType> comTypes = commodiTypeMapper.findAllComType(comType);
		pageComType.setList(comTypes);
		return pageComType;
	}

	// 根据商品类型名称模糊查询商品类型信息
	public List<CommodiType> findComTypeByName(CommodiType comType) {
		return this.commodiTypeMapper.findComTypeByName(comType);
	}

	// 判断商品类型信息是否存在,排除本身
	public int isUpdateExistComTypeByName(CommodiType comType) {
		CommodiType comType2 = new CommodiType();
		comType2.setComTypeName(comType.getComTypeName());
		if (commodiTypeMapper.findComTypeByName(comType).size() == 0
				&& commodiTypeMapper.findComTypeByName(comType2).size() != 0) {
			return 1;
		} else {
			return 0;
		}
	}

	// 获取所有商品类型
	public List<CommodiType> getComType() {
		return this.commodiTypeMapper.getComType();
	}
}
