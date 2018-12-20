package com.kaneki.pojo;

/**
 * 
 * @author LiJiezhou
 *
 */
public class Menu {
	private Integer menuId;// 菜单编号
	private String menuName;// 菜单名称
	private String url;// 菜单路径
	private Integer menuPid;// 父级菜单编号

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getMenuPid() {
		return menuPid;
	}

	public void setMenuPid(Integer menuPid) {
		this.menuPid = menuPid;
	}

	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", menuName=" + menuName + ", url=" + url + ", menuPid=" + menuPid + "]";
	}

}
