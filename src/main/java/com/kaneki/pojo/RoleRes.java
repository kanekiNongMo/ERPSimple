package com.kaneki.pojo;

/**
 * 
 * @author LiJiezhou
 *
 */
public class RoleRes {
	private Integer roleResId;// 角色权限编号
	private Role role;// 角色编号
	private Res res;// 权限编号
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

	public Integer getRoleResId() {
		return roleResId;
	}

	public void setRoleResId(Integer roleResId) {
		this.roleResId = roleResId;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Res getRes() {
		return res;
	}

	public void setRes(Res res) {
		this.res = res;
	}

}
