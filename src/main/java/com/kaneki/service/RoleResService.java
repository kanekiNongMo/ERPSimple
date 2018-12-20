package com.kaneki.service;

import com.kaneki.pojo.Page;
import com.kaneki.pojo.RoleRes;

/**
 * 
 * @author LiJiezhou
 *
 */
public interface RoleResService {
	// 根据角色编号分页查询所有权限
	public Page<RoleRes> getResByRoleId(Integer page, Integer pageRows, int roleId);

	// 删除角色权限
	public int deleteRoleRes(Integer roleResId);

	// 添加角色权限
	public int addRoleRes(RoleRes roleRes);
}
