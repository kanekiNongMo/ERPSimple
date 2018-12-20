package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.Page;
import com.kaneki.pojo.Res;

public interface ResMapper {
	// 添加权限
	public Integer addRes(Res res);

	// 修改权限
	public Integer updateRes(Res res);

	// 删除权限
	public Integer deleteRes(Integer resId);

	// 根据id获取权限
	public Res getResById(Integer resId);

	// 分页获取权限
	public List<Res> getPageRes(Page page);

	// 获取权限总数
	public Integer getResTotal();

	// 根据角色编号获取不属于该角色的权限
	public List<Res> getAllRes(int roleId);

	// 根据路径获取权限
	public Res findResByResUrl(Res res);

}
