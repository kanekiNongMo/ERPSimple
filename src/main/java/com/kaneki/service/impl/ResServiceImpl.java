package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.mapper.ResMapper;
import com.kaneki.pojo.Page;
import com.kaneki.pojo.Res;
import com.kaneki.service.ResService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class ResServiceImpl implements ResService {
	@Autowired
	private ResMapper resMapper;

	// 添加权限
	public Integer addRes(Res res) {
		return this.resMapper.addRes(res);
	}

	// 修改权限
	public Integer updateRes(Res res) {
		return this.resMapper.updateRes(res);
	}

	// 删除权限
	public Integer deleteRes(Integer resId) {
		return this.resMapper.deleteRes(resId);
	}

	// 根据编号获取权限
	public Res getResById(Integer resId) {
		return this.resMapper.getResById(resId);
	}

	// 根据角色编号获取权限
	public List<Res> getAllRes(int roleId) {
		return this.resMapper.getAllRes(roleId);
	}

	// 分页获取所有权限
	public Page<Res> getPageRes(Integer index, Integer pageRows) {
		int totalNumber = resMapper.getResTotal();
		Page<Res> pageRes = new Page<Res>();
		pageRes.setPage(index);
		pageRes.setPageRows(pageRows);
		pageRes.setTotal(totalNumber);
		List<Res> list = resMapper.getPageRes(pageRes);
		pageRes.setList(list);
		return pageRes;
	}

	// 添加时判断权限是否存在
	public int findResByResUrl(Res res) {
		Res ress = resMapper.findResByResUrl(res);
		if (ress != null) {
			return 1;
		} else {
			return 0;
		}

	}

	// 修改时判断权限是否存在
	public int isUpdateResExist(Res res) {
		Res res2 = new Res();
		res2.setUrl(res.getUrl());
		if (resMapper.findResByResUrl(res) == null && resMapper.findResByResUrl(res2) != null) {
			return 1;
		} else {
			return 0;
		}
	}

}
