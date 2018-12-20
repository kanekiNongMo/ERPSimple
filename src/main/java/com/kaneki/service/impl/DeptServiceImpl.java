package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.log.LogAnnotation;
import com.kaneki.mapper.DeptMapper;
import com.kaneki.pojo.Dept;
import com.kaneki.pojo.Page;
import com.kaneki.service.DeptService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class DeptServiceImpl implements DeptService {
	@Autowired
	private DeptMapper deptMapper;

	// 添加部门
	@LogAnnotation(operateType = "添加了一个部门")
	public int addDept(Dept dept) {
		return this.deptMapper.addDept(dept);
	}

	// 修改部门
	@LogAnnotation(operateType = "修改了一个部门")
	public int updateDept(Dept dept) {
		return this.deptMapper.updateDept(dept);
	}

	// 删除部门
	@LogAnnotation(operateType = "删除了一个部门")
	public int deleteDept(Integer deptId) {
		return this.deptMapper.deleteDept(deptId);
	}

	// 根据部门名称获取部门信息
	public List<Dept> findDeptByName(Dept dept) {
		return this.deptMapper.findDeptByName(dept);
	}

	// 分页查询部门信息
	public Page<Dept> findAllDept(Integer page, Integer pageRows, Dept dept) {
		int total = deptMapper.findCountDept(dept);
		Page<Dept> pageDept = new Page<Dept>();
		pageDept.setPage(page);
		pageDept.setPageRows(pageRows);
		pageDept.setTotal(total);
		dept.setPage(page);
		dept.setSize(pageRows);
		List<Dept> depts = deptMapper.findAllDept(dept);
		pageDept.setList(depts);
		return pageDept;
	}

	// 判断部门是否存在
	public int isUpdateExistDeptByName(Dept dept) {
		Dept dept2 = new Dept();
		dept2.setDeptName(dept.getDeptName());
		if (deptMapper.findDeptByName(dept).size() == 0 && deptMapper.findDeptByName(dept2).size() != 0) {
			return 1;
		} else {
			return 0;
		}
	}

	// 获取所有部门
	public List<Dept> getDept() {
		return this.deptMapper.getDept();
	}

}
