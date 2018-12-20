package com.kaneki.service;

import java.util.List;

import com.kaneki.pojo.Page;
import com.kaneki.pojo.User;
import com.kaneki.pojo.UserRole;

/**
 * 
 * @author LiJiezhou
 *
 */
public interface UserRoleService {
	// 根据角色编号分页查询该角色所有用户信息
	public Page<UserRole> getUserByRoleId(Integer page, Integer pageRows, int roleId);

	// 删除该角色用户
	public int deleteUserRole(Integer userRoleId);

	// 添加角色用户
	public int addUserRole(UserRole userRole);

	// 获取不属于该角色用户
	public List<User> getAllUser(int roleId);
}
