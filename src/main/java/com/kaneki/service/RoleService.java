package com.kaneki.service;

import java.util.List;

import com.kaneki.pojo.Role;

/**
 * 
 * @author LiJiezhou
 *
 */
public interface RoleService {
	// 添加角色信息
	public Integer addRole(Role role);

	// 修改角色信息
	public Integer updateRole(Role role);

	// 删除角色信息
	public Integer deleteRole(Integer roleId);

	// 根据角色编号角色信息
	public Role getRoleById(Integer roleId);

	// 获取所有角色信息
	public List<Role> getAllRole();

	// 根据角色名称和编号判断角色是否存在
	public int findRoleByName(Role role);

	// 根据角色名称判断角色是否存在
	public int isExistByRoleName(Role role);

}
