package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.log.LogAnnotation;
import com.kaneki.mapper.UserMapper;
import com.kaneki.pojo.Page;
import com.kaneki.pojo.User;
import com.kaneki.service.UserService;
import com.kaneki.utils.MD532;

/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	// 创建用户信息,使用MD5加密密码
	@LogAnnotation(operateType = "添加了一个用户")
	public int addUser(User user) {
		user.setUserPassword(new MD532().getMD5(user.getUserPassword()));
		return this.userMapper.addUser(user);
	}

	// 修改用户信息
	@LogAnnotation(operateType = "修改了一个用户信息")
	public int updateUser(User user) {
		if (user.getUserPassword() != null) {
			user.setUserPassword(new MD532().getMD5(user.getUserPassword()));
		}
		return this.userMapper.updateUser(user);
	}

	// 删除用户信息
	@LogAnnotation(operateType = "删除了一个用户信息")
	public int deleteUser(Integer userId) {
		return this.userMapper.deleteUser(userId);
	}

	// 根据用户编号查询用户信息
	public User findUserById(Integer userId) {
		return this.userMapper.findUserById(userId);
	}

	// 根据用户电话和密码查询用户信息
	public User findUser(String userPhone, String userPassword) {
		User user = new User();
		user.setUserPhone(userPhone);
		user.setUserPassword(new MD532().getMD5(userPassword));
		return this.userMapper.findUser(user);
	}

	// 分页查询用户信息
	public Page<User> findAllUser(Integer page, Integer pageRows, User user) {
		int total = userMapper.findCountUser(user);
		Page<User> pageUser = new Page<User>();
		pageUser.setPage(page);
		pageUser.setPageRows(pageRows);
		pageUser.setTotal(total);
		user.setPage(page);
		user.setSize(pageRows);
		List<User> list = userMapper.findAllUser(user);
		pageUser.setList(list);
		return pageUser;
	}

	// 添加用户时判断电话号码是否存在
	public User findUserByPhone(String userPhone) {
		return this.userMapper.findUserByPhone(userPhone);
	}

	// 修改时判断电话号码是否存在
	public int updateUserByPhoneID(User user) {
		if (userMapper.findUserByPhone(user.getUserPhone()) != null && userMapper.findUserByPhoneID(user) == null) {
			return 0;
		} else {
			return 1;
		}

	}

	// 根据用户编号和密码查询用户信息
	public User findUserByUserIdAndPw(User user) {
		user.setUserPassword(new MD532().getMD5(user.getUserPassword()));
		return this.userMapper.findUserByUserIdAndPw(user);
	}

	// 获取所有用户信息
	public List<User> getUser() {
		return this.userMapper.getUser();
	}

}
