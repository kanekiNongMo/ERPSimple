package com.kaneki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaneki.pojo.Dept;
import com.kaneki.pojo.Page;
import com.kaneki.service.DeptService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class DeptController {
	@Autowired
	private DeptService deptService;

	// 查询所有部门并分页显示，还可根绝部门名称查询
	@RequestMapping(value = "/deptList")
	public String findAllDept(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer pageRows, Dept dept, Model model) {
		Page<Dept> list = deptService.findAllDept(page, pageRows, dept);
		model.addAttribute("deptName", dept.getDeptName());
		model.addAttribute("page", list);
		return "deptList";
	}

	// 更新部门信息
	@RequestMapping(value = "/updateDept")
	@ResponseBody
	public String updateDept(Dept dept) {
		int i = deptService.updateDept(dept);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 创建部门
	@RequestMapping(value = "/createDept")
	@ResponseBody
	public String addDept(Dept dept) {
		int i = deptService.addDept(dept);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
	//删除部门
	@RequestMapping(value = "/deleteDept")
	@ResponseBody
	public String deleteDept(Integer deptId) {
		int i = deptService.deleteDept(deptId);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
	//根据部门名称判断部门是否存在
	@RequestMapping(value = "/findByDeptName.action")
	@ResponseBody
	public int findByDeptName(Dept dept) {
		List<Dept> list = deptService.findDeptByName(dept);
		if (list.size() == 0 || list == null) {
			return 0;
		} else {
			return 1;
		}

	}

	//根据部门名称和部门编号判断部门是否存在
	@RequestMapping(value = "/isUpdateExistDeptByName.action")
	@ResponseBody
	public int isUpdateExistDeptByName(Dept dept) {
		return deptService.isUpdateExistDeptByName(dept);
	}

}
