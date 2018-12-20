package com.kaneki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kaneki.pojo.Log;
import com.kaneki.pojo.Page;
import com.kaneki.pojo.User;
import com.kaneki.service.LogService;
import com.kaneki.service.UserService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class LogController {
	@Autowired
	private LogService logService;
	@Autowired
	private UserService userService;

	// 分页查询所有日志信息
	@RequestMapping(value = "/logList.action")
	public String logList(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "10") Integer pageRows, Log log, Model model) {
		Page<Log> pagelogs = logService.findUserAndDeptAndLog(page, pageRows, log);
		List<User> userlist=userService.getUser();
		if (log.getUser()!= null) {
			model.addAttribute("UID", log.getUser().getUserId());
		}
		model.addAttribute("USERS", userlist);
		model.addAttribute("page", pagelogs);
		return "logList";
	}
}
