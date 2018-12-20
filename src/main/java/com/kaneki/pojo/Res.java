package com.kaneki.pojo;

/**
 * 
 * @author LiJiezhou
 *
 */
public class Res {
	private Integer resId;// 权限编号
	private String resName;// 权限描述
	private String url;// 权限url

	public Integer getResId() {
		return resId;
	}

	public void setResId(Integer resId) {
		this.resId = resId;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "Res [resId=" + resId + ", resName=" + resName + ", url=" + url + "]";
	}

}
