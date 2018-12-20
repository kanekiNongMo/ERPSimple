package com.kaneki.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.kaneki.pojo.Log;
import com.kaneki.pojo.Page;

/**
 * 
 * @author LiJiezhou
 *
 */
public interface LogService {
	// 查询日志
	public Page<Log> findUserAndDeptAndLog(Integer page, Integer pageRows, Log log);

	// 添加日志
	public int addLog(Log log);
}
