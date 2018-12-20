package com.kaneki.service;

import java.util.List;

import com.kaneki.pojo.Page;
import com.kaneki.pojo.User;

/**
 * 
 * @author LiJiezhou
 *
 */
public interface UserService {
	// 创建用户信息
	public int addUser(User user);

	// 修改用户信息
	public int updateUser(User user);

	// 删除用户信息
	public int deleteUser(Integer userId);

	// 分页查询用户信息
	public Page<User> findAllUser(Integer page, Integer pageRows, User user);

	// 根据用户编号查询用户信息
	public User findUserById(Integer userId);

	// 根据用户电话和密码查询用户信息
	public User findUser(String userPhone, String userPassword);

	// 根据用户电话查询用户信息
	public User findUserByPhone(String userPhone);

	// 判断电话号码是否存在
	public int updateUserByPhoneID(User user);

	// 根据用户编号和密码查询用户信息
	public User findUserByUserIdAndPw(User user);

	// 获取所有用户信息
	public List<User> getUser();
}
