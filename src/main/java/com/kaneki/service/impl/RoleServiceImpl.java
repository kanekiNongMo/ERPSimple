package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.log.LogAnnotation;
import com.kaneki.mapper.RoleMapper;
import com.kaneki.pojo.Role;
import com.kaneki.service.RoleService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper roleMapper;

	// 添加角色信息
	@LogAnnotation(operateType = "添加了一个角色")
	public Integer addRole(Role role) {
		return this.roleMapper.addRole(role);
	}

	// 修改角色信息
	@LogAnnotation(operateType = "修改了一个角色")
	public Integer updateRole(Role role) {
		return this.roleMapper.updateRole(role);
	}

	// 删除角色信息
	@LogAnnotation(operateType = "删除了一个角色")
	public Integer deleteRole(Integer roleId) {
		return this.roleMapper.deleteRole(roleId);
	}

	// 根据角色编号角色信息
	public Role getRoleById(Integer roleId) {
		return this.roleMapper.getRoleById(roleId);
	}

	// 获取所有角色信息
	public List<Role> getAllRole() {
		return this.roleMapper.getAllRole();
	}

	// 根据角色名称和编号判断角色是否存在
	public int findRoleByName(Role role) {
		List<Role> listRole1 = roleMapper.findRoleByName(role);
		Role role2 = new Role();
		role2.setRoleName(role.getRoleName());
		List<Role> listRole2 = roleMapper.findRoleByName(role2);
		if ((listRole1 == null || listRole1.size() == 0) && listRole2.size() != 0) {
			return 1;
		} else {
			return 0;
		}

	}

	// 根据角色名称判断角色是否存在
	public int isExistByRoleName(Role role) {
		List<Role> listRole1 = roleMapper.findRoleByName(role);
		if (listRole1.size() != 0) {
			return 1;
		} else {
			return 0;
		}
	}

}
