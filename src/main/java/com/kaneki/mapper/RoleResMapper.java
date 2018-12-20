package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.RoleRes;

public interface RoleResMapper {
	// 根据角色id获取用户角色
	public List<RoleRes> getResByRoleId(RoleRes roleRes);

	// 根据角色id获取用户角色总数
	public int getCountResByRoleId(Integer roleId);

	// 删除用户角色
	public int deleteRoleRes(Integer roleResId);

	// 添加用户角色
	public int addRoleRes(RoleRes roleRes);

}
