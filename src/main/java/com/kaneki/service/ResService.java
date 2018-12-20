package com.kaneki.service;

import java.util.List;

import com.kaneki.pojo.Page;
import com.kaneki.pojo.Res;

/**
 * 
 * @author LiJiezhou
 *
 */
public interface ResService {
	// 添加权限
	public Integer addRes(Res res);

	// 修改权限
	public Integer updateRes(Res res);

	// 删除权限
	public Integer deleteRes(Integer resId);

	// 根据编号获取权限
	public Res getResById(Integer resId);

	// 分页获取所有权限
	public Page<Res> getPageRes(Integer page, Integer pageRows);

	// 根据角色编号获取权限
	public List<Res> getAllRes(int roleId);

	// 添加时判断权限是否存在
	public int findResByResUrl(Res res);

	// 修改时判断权限是否存在
	public int isUpdateResExist(Res res);
}
