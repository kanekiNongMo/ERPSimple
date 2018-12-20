package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.log.LogAnnotation;
import com.kaneki.mapper.CommodityMapper;
import com.kaneki.pojo.Commodity;
import com.kaneki.pojo.Page;
import com.kaneki.service.CommodityService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class CommodityServiceImpl implements CommodityService {
	@Autowired
	private CommodityMapper commodityMapper;

	// 添加商品信息
	@LogAnnotation(operateType = "添加了一个商品信息")
	public int addCommodity(Commodity commodity) {
		return this.commodityMapper.addCommodity(commodity);
	}

	// 修改商品信息
	@LogAnnotation(operateType = "修改了一个商品信息")
	public int updateCommodity(Commodity commodity) {
		return this.commodityMapper.updateCommodity(commodity);
	}

	// 删除商品信息
	@LogAnnotation(operateType = " 删除了一个商品信息")
	public int deleteCommodity(Integer commodityId) {
		return this.commodityMapper.deleteCommodity(commodityId);
	}

	// 分页获取所有商品信息
	public Page<Commodity> findAllCommodity(Integer page, Integer pageRows, Commodity commodity) {
		int total = commodityMapper.findCountCommodity(commodity);
		Page<Commodity> comPage = new Page<Commodity>();
		comPage.setPage(page);
		comPage.setPageRows(pageRows);
		comPage.setTotal(total);
		commodity.setPage(page);
		commodity.setSize(pageRows);
		List<Commodity> commodities = commodityMapper.findAllCommodity(commodity);
		comPage.setList(commodities);
		return comPage;
	}

	// 根据商品名称判断商品信息是否存在
	public int isExistCommodity(Commodity commodity) {
		if (commodityMapper.isExistCommodity(commodity) != null) {
			return 1;
		} else {
			return 0;
		}

	}

	// 修改时判断商品是否存在
	public int isExistCommodityByIdAndName(Commodity commodity) {
		if (commodityMapper.isExistCommodity(commodity) != null
				&& commodityMapper.isExistCommodityByIdAndName(commodity) == null) {
			return 1;
		} else {
			return 0;
		}

	}

	// 根据商品编号获取商品信息
	public Commodity getCommodityById(Integer commodityId) {
		return this.commodityMapper.getCommodityById(commodityId);
	}

	// 获取所有商品信息
	public List<Commodity> getCommodity() {
		return this.commodityMapper.getCommodity();
	}

}
