package com.kaneki.service;

import java.util.List;

import com.kaneki.pojo.Menu;

/**
 * 
 * @author LiJiezhou
 *
 */
public interface MenuService {
	// 根据用户编号获取用户菜单
	public List<Menu> selectMenuByUserId(Integer userId);

}
