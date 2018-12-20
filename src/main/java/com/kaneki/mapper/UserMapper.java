package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.User;

public interface UserMapper {
	// 添加用户
	public int addUser(User user);

	// 修改用户
	public int updateUser(User user);

	// 删除用户
	public int deleteUser(Integer userId);

	// 分页查询用户
	public List<User> findAllUser(User user);

	// 根据手机号和密码查询用户
	public User findUser(User user);

	// 根据id查询用户
	public User findUserById(Integer userId);

	// 获取用户总数
	public int findCountUser(User user);

	// 根据用户名称模糊查询
	public List<User> findUserByName(User user);

	// 根据手机号查询
	public User findUserByPhone(String userPhone);

	// 根据手机号和id查询
	public User findUserByPhoneID(User user);

	// 根据用户id和密码查询
	public User findUserByUserIdAndPw(User user);

	// 查询所有用户
	public List<User> getUser();
}
