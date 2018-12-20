package com.kaneki.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kaneki.log.LogAnnotation;
import com.kaneki.pojo.Dept;
import com.kaneki.pojo.Menu;
import com.kaneki.pojo.Page;
import com.kaneki.pojo.User;
import com.kaneki.service.DeptService;
import com.kaneki.service.MenuService;
import com.kaneki.service.UserService;
import com.kaneki.utils.SendEmail;

/**
 * 
 * @author LiJiezhou
 *
 */
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private DeptService deptService;

	// 用户登录，并把登录成功用户保存在session中
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String userPhone, String userPassword, Model model, HttpSession session) {
		User user = userService.findUser(userPhone, userPassword);

		if (user != null) {
			List<Menu> list = menuService.selectMenuByUserId(user.getUserId());
			model.addAttribute("MENUS", list);
			session.setAttribute("USER_SESSION", user);
			return "index";
		}
		model.addAttribute("msg", "账号或密码错误！");
		return "login";
	}

	// 根绝用户编号删除用户信息
	@RequestMapping(value = "/deleteUser.action")
	@ResponseBody
	public String deleteUser(Integer userId) {
		int i = userService.deleteUser(userId);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 修改用户信息
	@RequestMapping(value = "/updateUser.action")
	@ResponseBody
	public String updateUserUser(User user) {
		int i = userService.updateUser(user);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 根据用户编号获取用户信息
	@RequestMapping(value = "/getUserById.action")
	@ResponseBody
	public User getUserById(Integer userId) {
		User user = userService.findUserById(userId);
		return user;
	}

	// 退出，清除session
	@LogAnnotation(operateType = "退出登录")
	@RequestMapping(value = "/logout")
	public String logOut(HttpSession session) {
		session.removeAttribute("USER_SESSION");
		session.invalidate();
		return "login";
	}

	// 跳转到登录页面
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
		return "login";
	}

	// 分页查询所有用户信息
	@RequestMapping(value = "/userList.action")
	public String userList(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer pageRows, User user, Model model) {
		Page<User> list = userService.findAllUser(page, pageRows, user);

		List<Dept> depts = deptService.getDept();

		model.addAttribute("DEPTS", depts);
		model.addAttribute("userName", user.getUserName());
		model.addAttribute("page", list);
		return "userList";
	}

	// 添加用户信息
	@RequestMapping(value = "/createUser.action")
	@ResponseBody
	public String createUser(User user) {
		int i = userService.addUser(user);
		if (i > 0) {
			return "OK";
		} else {
			return "FAIL";
		}

	}

	// 判断用户手机号是否已经注册
	@RequestMapping(value = "/existsPhone.action")
	@ResponseBody
	public int existsPhone(String userPhone) {
		User user = userService.findUserByPhone(userPhone);
		if (user == null) {
			return 0;
		} else {
			return 1;
		}

	}

	// 修改用户信息时排除本身，判断手机号是否存在
	@RequestMapping(value = "/exceptOneselfPhone.action")
	@ResponseBody
	public int exceptOneselfPhone(User user) {
		return userService.updateUserByPhoneID(user);
	}

	// 开发中
	// 发送验证码到用户邮箱
	@RequestMapping(value = "/getCode.action")
	public void getCode(String toQQMail) {
		String code = SendEmail.mainBoxCode(toQQMail);
		System.out.println(code);
	}

	// 获取登录用户个人信息
	@RequestMapping(value = "/userinfo")
	public String userinfo(int userId, Model model) {
		User user = userService.findUserById(userId);
		model.addAttribute("USER", user);
		return "userinfo";
	}

	// 修改用户密码
	@RequestMapping(value = "/updatePassword.action")
	public String updatePassword(int userId, Model model) {
		model.addAttribute("USERID", userId);
		return "updatePassword";
	}

	// 判断原密码是否正确
	@RequestMapping(value = "/isOldPassword.action")
	@ResponseBody
	public int isOldPassword(User user) {
		User users = userService.findUserByUserIdAndPw(user);
		if (users == null) {
			return 0;
		} else {
			return 1;
		}
	}

	@RequestMapping(value = "/uploadImage.action", method = RequestMethod.POST)
	public String uploadImage(Integer userId, @RequestParam("userImage") MultipartFile userImage,
			HttpServletRequest request) {

		if (userImage.getSize() > 0) {
			String originalFilename = userImage.getOriginalFilename();
			String dirPath = request.getSession().getServletContext().getRealPath("/upload/");
			System.out.println(dirPath);
			File filePath = new File(dirPath);
			if (!filePath.exists()) {
				filePath.mkdirs();
			}
			String newFilename = userId + "_" + UUID.randomUUID() + "_" + originalFilename;
			try {
				userImage.transferTo(new File(dirPath + newFilename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			User user = new User();
			if (userId != null) {
				user.setUserId(userId);
			}
			user.setUserImage(dirPath + newFilename);
			userService.updateUser(user);
		}
		return "redirect:userinfo.action?userId="+userId;
	}

}
