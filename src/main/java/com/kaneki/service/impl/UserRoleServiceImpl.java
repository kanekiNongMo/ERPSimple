package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.log.LogAnnotation;
import com.kaneki.mapper.UserRoleMapper;
import com.kaneki.pojo.Page;
import com.kaneki.pojo.Role;
import com.kaneki.pojo.User;
import com.kaneki.pojo.UserRole;
import com.kaneki.service.UserRoleService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class UserRoleServiceImpl implements UserRoleService {
	@Autowired
	private UserRoleMapper userRoleMapper;

	// 根据角色编号分页查询该角色所有用户信息
	public Page<UserRole> getUserByRoleId(Integer page, Integer pageRows, int roleId) {
		int total = userRoleMapper.getCountUserByRoleId(roleId);
		Page<UserRole> pageUserRole = new Page<UserRole>();
		Role role = new Role();
		role.setRoleId(roleId);
		UserRole userRole = new UserRole();
		pageUserRole.setTotal(total);
		pageUserRole.setPage(page);
		pageUserRole.setPageRows(pageRows);
		userRole.setRole(role);
		userRole.setPage(page);
		userRole.setSize(pageRows);
		List<UserRole> userRoleList = userRoleMapper.getUserByRoleId(userRole);
		pageUserRole.setList(userRoleList);
		return pageUserRole;
	}

	// 删除该角色用户
	@LogAnnotation(operateType = "删除了一个用户角色")
	public int deleteUserRole(Integer userRoleId) {
		return this.userRoleMapper.deleteUserRole(userRoleId);
	}

	// 添加角色用户
	@LogAnnotation(operateType = "添加了一个用户角色")
	public int addUserRole(UserRole userRole) {
		return this.userRoleMapper.addUserRole(userRole);
	}

	// 获取不属于该角色用户
	public List<User> getAllUser(int roleId) {
		return this.userRoleMapper.getAllUser(roleId);
	}

}
