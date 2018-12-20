package com.kaneki.service;

import java.util.List;

import com.kaneki.pojo.Dept;
import com.kaneki.pojo.Page;
/**
 * 
 * @author LiJiezhou
 *
 */
public interface DeptService {
	// 添加部门
	public int addDept(Dept dept);

	// 修改部门
	public int updateDept(Dept dept);

	// 删除部门
	public int deleteDept(Integer deptId);

	// 分页查询部门信息
	public Page<Dept> findAllDept(Integer page, Integer pageRows, Dept dept);

	// 获取所有部门
	public List<Dept> getDept();

	// 根据部门名称获取部门信息
	public List<Dept> findDeptByName(Dept dept);

	// 判断部门是否存在
	public int isUpdateExistDeptByName(Dept dept);

}
