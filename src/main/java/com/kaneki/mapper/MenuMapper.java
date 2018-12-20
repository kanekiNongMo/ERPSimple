package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.Menu;

public interface MenuMapper {
	// 根据用户id获取菜单
	public List<Menu> selectMenuByUserId(Integer userId);

}
