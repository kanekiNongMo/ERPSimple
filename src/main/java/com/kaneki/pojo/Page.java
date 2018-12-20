package com.kaneki.pojo;

import java.util.List;

/**
 * 
 * @author LiJiezhou
 *
 */
public class Page<T> {
	private Integer page; // 当前页码
	private Integer pageRows;// 每页显示行数
	private Integer total;// 数据总数
	private List<T> list;// 数据集合

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageRows() {
		return pageRows;
	}

	public void setPageRows(Integer pageRows) {
		this.pageRows = pageRows;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

}
