package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.mapper.DocioMapper;
import com.kaneki.pojo.Docio;
import com.kaneki.pojo.Page;
import com.kaneki.service.DocioService;
/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class DocioServiceImpl implements DocioService {
	@Autowired
	private DocioMapper docioMapper;

	// 分页查询商品库存操作明细
	public Page<Docio> findDocio(Integer page, Integer pageRows, Docio docio) {
		int total = docioMapper.findCountDocio(docio);
		Page<Docio> pageDocio = new Page<Docio>();
		pageDocio.setPage(page);
		pageDocio.setPageRows(pageRows);
		pageDocio.setTotal(total);
		docio.setPage(page);
		docio.setSize(pageRows);
		List<Docio> docios = docioMapper.findDocio(docio);
		pageDocio.setList(docios);
		return pageDocio;
	}

	// 创建商品入库出库
	public int createDoico(Docio docio) {
		return this.docioMapper.addDoico(docio);
	}
}
