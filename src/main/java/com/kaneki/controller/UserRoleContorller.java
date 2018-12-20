package com.kaneki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaneki.pojo.Page;
import com.kaneki.pojo.User;
import com.kaneki.pojo.UserRole;
import com.kaneki.service.UserRoleService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class UserRoleContorller {
	@Autowired
	private UserRoleService userRoleService;

	// 根据角色编号获取该角色的用户信息
	@RequestMapping(value = "/getUserByRoleId.action")
	public String getUserByRoleId(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "11") Integer pageRows, int roleId, String roleName, Model model) {
		Page<UserRole> userRoleList = userRoleService.getUserByRoleId(page, pageRows, roleId);
		List<User> user = userRoleService.getAllUser(roleId);
		model.addAttribute("ROLENAME", roleName);
		model.addAttribute("ROLEID", roleId);
		model.addAttribute("USER", user);
		model.addAttribute("page", userRoleList);
		return "userRoleList";
	}

	// 删除该角色用户
	@RequestMapping(value = "/deleteUserRole.action")
	@ResponseBody
	public String deleteUserRole(int userRoleId) {
		int i = userRoleService.deleteUserRole(userRoleId);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 给该角色添加用户
	@RequestMapping(value = "/addUserRole.action")
	@ResponseBody
	public String addUserRole(UserRole userRole) {
		int i = userRoleService.addUserRole(userRole);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

}
