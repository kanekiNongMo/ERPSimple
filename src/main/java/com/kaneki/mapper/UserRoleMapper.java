package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.User;
import com.kaneki.pojo.UserRole;

public interface UserRoleMapper {
	// 根据角色编号查询角色用户
	public List<UserRole> getUserByRoleId(UserRole userRole);

	// 根据角色编号获取角色用户总数
	public int getCountUserByRoleId(Integer roleId);

	// 删除用户角色
	public int deleteUserRole(Integer userRoleId);

	// 添加用户角色
	public int addUserRole(UserRole userRole);

	// 获取不属于该角色的用户
	public List<User> getAllUser(int roleId);
}
