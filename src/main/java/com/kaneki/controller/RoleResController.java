package com.kaneki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaneki.pojo.Page;
import com.kaneki.pojo.Res;
import com.kaneki.pojo.RoleRes;
import com.kaneki.service.ResService;
import com.kaneki.service.RoleResService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class RoleResController {
	@Autowired
	private RoleResService roleResService;

	@Autowired
	private ResService resService;

	// 根绝角色编号分页显示该角色所有权限
	@RequestMapping(value = "/getResByRoleId.action")
	public String getResByRoleId(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "11") Integer pageRows, int roleId, String roleName, Model model) {
		Page<RoleRes> roleResList = roleResService.getResByRoleId(page, pageRows, roleId);
		List<Res> res = resService.getAllRes(roleId);
		model.addAttribute("ROLENAME", roleName);
		model.addAttribute("ROLEID", roleId);
		model.addAttribute("RES", res);
		model.addAttribute("page", roleResList);
		return "roleResList";
	}

	// 根绝角色权限编号删除该角色权限
	@RequestMapping(value = "/deleteRoleRes.action")
	@ResponseBody
	public String deleteRoleRes(int roleResId) {
		int i = roleResService.deleteRoleRes(roleResId);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 添加角色权限
	@RequestMapping(value = "/addRoleRes.action")
	@ResponseBody
	public String addRoleRes(RoleRes roleRes) {
		int i = roleResService.addRoleRes(roleRes);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
