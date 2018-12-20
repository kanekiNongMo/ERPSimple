package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.Dept;

public interface DeptMapper {
	// 添加部门
	public int addDept(Dept dept);

	// 修改部门
	public int updateDept(Dept dept);

	// 删除部门
	public int deleteDept(Integer deptId);

	// 根据id获取部门信息
	public Dept findDeptById(Integer deptId);

	// 分页获取所有部门信息
	public List<Dept> findAllDept(Dept dept);

	// 根据部门名称获取部门信息
	public List<Dept> findDeptByName(Dept dept);

	// 根据多个id获取部门信息
	public List<Dept> findDeptByInId(List<Integer> list);

	// 根据部门获取用户
	public Dept findDeptWithUser(Integer deptId);

	// 获取部门总数
	public int findCountDept(Dept dept);

	// 获取所有部门
	public List<Dept> getDept();
}
