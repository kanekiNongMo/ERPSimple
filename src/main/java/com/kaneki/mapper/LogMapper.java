package com.kaneki.mapper;

import java.util.List;

import com.kaneki.pojo.Log;

public interface LogMapper {
	// 添加日志
	public int addLog(Log log);

	// 修改日志
	public int updateLog(Log log);

	// 删除日志
	public int deleteLog(Integer logId);

	// 根据id获取日志
	public Log findLogById(Integer logId);

	// 查询所有日志
	public List<Log> findUserAndDeptAndLog(Log log);

	//根据条件查询总数
	public int getTotal(Log log);
}
