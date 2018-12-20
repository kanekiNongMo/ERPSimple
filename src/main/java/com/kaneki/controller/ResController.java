package com.kaneki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaneki.pojo.Page;
import com.kaneki.pojo.Res;
import com.kaneki.service.ResService;

/**
 * 开发时来查询权限信息
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class ResController {
	@Autowired
	private ResService resService;

	@RequestMapping(value = "/createRes.action")
	@ResponseBody
	public String addRes(Res res) {
		int i = resService.addRes(res);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	@RequestMapping(value = "/updateRes.action")
	@ResponseBody
	public String updateRes(Res res) {
		int i = resService.updateRes(res);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	@RequestMapping(value = "/deleteRes.action")
	@ResponseBody
	public String deleteRes(Integer resId) {
		int i = resService.deleteRes(resId);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	@RequestMapping(value = "/getResById.action")
	@ResponseBody
	public Res getResById(Integer resId) {
		Res res = resService.getResById(resId);
		return res;
	}

	@RequestMapping(value = "/isCreateResExist.action")
	@ResponseBody
	public int isCreateResExist(Res res) {
		return resService.findResByResUrl(res);
	}

	@RequestMapping(value = "/isUpdateResExist.action")
	@ResponseBody
	public int isUpdateResExist(Res res) {
		return resService.isUpdateResExist(res);
	}

	@RequestMapping(value = "/resList.action")
	public String getPageRes(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "10") Integer pageRows, Model model) {
		Page<Res> res = resService.getPageRes(page, pageRows);
		model.addAttribute("page", res);
		return "resList";
	}
}
