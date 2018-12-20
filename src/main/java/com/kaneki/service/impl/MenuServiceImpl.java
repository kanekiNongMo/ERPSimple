package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.mapper.MenuMapper;
import com.kaneki.pojo.Menu;
import com.kaneki.service.MenuService;
/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuMapper menuMapper;

	// 根据用户编号获取用户菜单
	public List<Menu> selectMenuByUserId(Integer userId) {
		return this.menuMapper.selectMenuByUserId(userId);
	}

}
