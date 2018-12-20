package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.Role;

public interface RoleMapper {
	// 添加角色
	public Integer addRole(Role role);

	// 修改角色
	public Integer updateRole(Role role);

	// 删除角色
	public Integer deleteRole(Integer roleId);

	// 根绝角色id获取角色
	public Role getRoleById(Integer roleId);

	// 获取所有角色
	public List<Role> getAllRole();

	// 根据角色名称获取角色
	public List<Role> findRoleByName(Role role);

}
