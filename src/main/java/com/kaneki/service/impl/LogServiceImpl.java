package com.kaneki.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaneki.mapper.LogMapper;
import com.kaneki.pojo.Log;
import com.kaneki.pojo.Page;
import com.kaneki.service.LogService;

/**
 * 
 * @author LiJiezhou
 *
 */
@Service
@Transactional
public class LogServiceImpl implements LogService {
	@Autowired
	private LogMapper logMapper;

	// 添加日志
	public int addLog(Log log) {
		return this.logMapper.addLog(log);
	}
	
	// 查询所有日志信息
	public Page<Log> findUserAndDeptAndLog(Integer page, Integer pageRows, Log log) {
		int total=logMapper.getTotal(log);
		Page<Log> pageLogs=new Page<Log>();
		pageLogs.setTotal(total);
		pageLogs.setPage(page);
		pageLogs.setPageRows(pageRows);
		log.setPage(page);
		log.setSize(pageRows);
		List<Log> listlogs=logMapper.findUserAndDeptAndLog(log);
		pageLogs.setList(listlogs);
		return pageLogs;
	}

}
