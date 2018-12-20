package com.kaneki.pojo;

import java.util.List;

/**
 * 
 * @author LiJiezhou
 *
 */
public class Dept {
	private Integer deptId; // 部门编号
	private String deptName;// 部门名称
	private List<User> userList;// 部门所在用户
	private Integer page;
	private Integer size;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	@Override
	public String toString() {
		return "Dept [deptId=" + deptId + ", deptName=" + deptName + ", userList=" + userList + "]";
	}

}
