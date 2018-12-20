package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.mapper.RoleResMapper;
import com.kaneki.pojo.Page;
import com.kaneki.pojo.Role;
import com.kaneki.pojo.RoleRes;
import com.kaneki.service.RoleResService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class RoleResServiceImpl implements RoleResService {
	@Autowired
	private RoleResMapper roleResMapper;

	// 根据角色编号分页查询所有权限
	public Page<RoleRes> getResByRoleId(Integer page, Integer pageRows, int roleId) {
		int total = roleResMapper.getCountResByRoleId(roleId);
		Page<RoleRes> pageRoleRes = new Page<RoleRes>();
		Role role = new Role();
		role.setRoleId(roleId);
		RoleRes roleRes = new RoleRes();
		pageRoleRes.setTotal(total);
		pageRoleRes.setPage(page);
		pageRoleRes.setPageRows(pageRows);
		roleRes.setRole(role);
		roleRes.setPage(page);
		roleRes.setSize(pageRows);
		List<RoleRes> roleResList = roleResMapper.getResByRoleId(roleRes);
		pageRoleRes.setList(roleResList);
		return pageRoleRes;
	}

	// 删除角色权限
	public int deleteRoleRes(Integer roleResId) {
		return this.roleResMapper.deleteRoleRes(roleResId);
	}

	// 添加角色权限
	public int addRoleRes(RoleRes roleRes) {
		return this.roleResMapper.addRoleRes(roleRes);
	}

}
