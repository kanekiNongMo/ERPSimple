package com.kaneki.pojo;

import java.util.Date;

/**
 * 
 * @author LiJiezhou
 *
 */
public class Log {
	private int logId;// 日志编号
	private User user;// 操作人
	private String logRecord;// 操作内容
	private Date logTimel;// 操作时间
	private String operateresult;//操作结果
	private String strtime;
	private Dept dept;// 所属部门
	private Integer size;
	private Integer page;
	

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public int getLogId() {
		return logId;
	}

	public void setLogId(int logId) {
		this.logId = logId;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public String getOperateresult() {
		return operateresult;
	}

	public void setOperateresult(String operateresult) {
		this.operateresult = operateresult;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getLogRecord() {
		return logRecord;
	}

	public void setLogRecord(String logRecord) {
		this.logRecord = logRecord;
	}

	public Date getLogTimel() {
		return logTimel;
	}

	public void setLogTimel(Date logTimel) {
		this.logTimel = logTimel;
	}

	public String getStrtime() {
		return strtime;
	}

	public void setStrtime(String strtime) {
		this.strtime = strtime;
	}

	@Override
	public String toString() {
		return "Log [logId=" + logId + ", user=" + user + ", logRecord=" + logRecord + ", logTimel=" + logTimel
				+ ", strtime=" + strtime + ", dept=" + dept + "]";
	}

}
