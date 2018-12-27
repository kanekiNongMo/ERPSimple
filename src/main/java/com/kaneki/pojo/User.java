package com.kaneki.pojo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
 * @author LiJiezhou
 *
 */
public class User {
	private Integer userId; // 用户编号
	private Dept dept; // 部门编号
	private String userName; // 用户名称
	private String userPassword; // 用户密码
	private String userSex; // 用户性别
	private String age; // 用户年龄
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date userBirthday; // 用户出生年月
	private String userAddress;// 用户住址
	private String userPhone;// 用户电话，账号
	private List<Res> ress;// 用户权限
	private String userImage;// 用户头像路径+名称
	private String QQ;
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

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public List<Res> getRess() {
		return ress;
	}

	public void setRess(List<Res> ress) {
		this.ress = ress;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public Date getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getQQ() {
		return QQ;
	}

	public void setQQ(String qQ) {
		QQ = qQ;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", dept=" + dept + ", userName=" + userName + ", userPassword=" + userPassword
				+ ", userSex=" + userSex + ", userBirthday=" + userBirthday + ", userAddress=" + userAddress
				+ ", userPhone=" + userPhone + ", ress=" + ress + "]";
	}

}
