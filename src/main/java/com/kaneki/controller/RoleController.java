package com.kaneki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaneki.pojo.Role;
import com.kaneki.service.RoleService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class RoleController {
	@Autowired
	private RoleService roleService;

	// 添加角色
	@RequestMapping(value = "/createRole.action")
	@ResponseBody
	public String addRole(Role role) {
		int i = roleService.addRole(role);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 修改角色信息
	@RequestMapping(value = "/updateRole.action")
	@ResponseBody
	public String updateRole(Role role) {
		int i = roleService.updateRole(role);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 删除角色
	@RequestMapping(value = "/deleteRole.action")
	@ResponseBody
	public String deleteRole(Integer roleId) {
		int i = roleService.deleteRole(roleId);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 根绝角色编号获取角色信息
	@RequestMapping(value = "/getRoleById.action")
	@ResponseBody
	public Role getResById(Integer roleId) {
		Role role = roleService.getRoleById(roleId);
		return role;
	}

	// 查询所有角色信息
	@RequestMapping(value = "/roleList.action")
	public String getAllRole(Model model) {

		List<Role> role = roleService.getAllRole();

		model.addAttribute("ROLE", role);
		return "roleList";
	}

	// 根绝角色名称判断角色是否存在
	@RequestMapping(value = "/isExistByRoleName.action")
	@ResponseBody
	public int isExistByRoleName(Role role) {
		return roleService.isExistByRoleName(role);
	}

	// 修改时根绝角色名称和编号判断角色是否存在
	@RequestMapping(value = "/isExistRole.action")
	@ResponseBody
	public int isExistRole(Role role) {
		return roleService.findRoleByName(role);

	}

}
