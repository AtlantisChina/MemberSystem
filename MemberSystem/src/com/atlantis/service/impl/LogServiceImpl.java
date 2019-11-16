
package com.atlantis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atlantis.dao.LogMapper;
import com.atlantis.entity.Log;
import com.atlantis.entity.PageInfo;
import com.atlantis.service.LogService;
import com.atlantis.util.PropertiesUtil;
import com.atlantis.util.StringUtil;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月28日 下午8:00:18
 * @explain:
 */

@Service
public class LogServiceImpl implements LogService {

	@Autowired
	private LogMapper logMapper;

	@Override
	public PageInfo selAllLogByPage(String pageSizeStr, String pageNumberStr) {
		// 初始化pageSize大小
		int pageSize = Integer.parseInt(PropertiesUtil.getValue("pageMaxSize"));
		if (StringUtil.isNotEmpty(pageSizeStr)) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		// 初始化当前显示第1页
		int pageNumber = 1;
		if (StringUtil.isNotEmpty(pageNumberStr)) {
			pageNumber = Integer.parseInt(pageNumberStr);
		}
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageSize(pageSize);
		pageInfo.setPageNumber(pageNumber);
		pageInfo.setPageStart((pageNumber - 1) * pageSize);

		// 查询到的系统日志
		List<Log> logList = logMapper.selAllLogByPage(pageInfo);
		pageInfo.setList(logList);
		long count = logMapper.selCountLogByAll();
		pageInfo.setCount(count);

		// 计算一共有多少页
		pageInfo.setTotal(count % pageSize == 0 ? count / pageSize : count / pageSize + 1);
		return pageInfo;
	}

	@Override
	public int addLog(Log log) {
		return logMapper.addLog(log);
	}

	@Override
	public int delLog(int id) {
		return logMapper.delLog(id);
	}

	@Override
	public void batchRemoveByIds(Integer[] ids) {
		for (int i = 0; i < ids.length; i++) {
			logMapper.delLog(ids[i]);
		}
	}

	@Override
	public Integer countMember(String selText) {
		return logMapper.countMember(selText);
	}

	@Override
	public Float countRecord1Money(String selText) {		
		return logMapper.countRecord1Money(selText);
	}

	@Override
	public Integer countRecord1(String selText) {
		return logMapper.countRecord1(selText);
	}

	@Override
	public Float countRecord0Money(String selText) {
		return logMapper.countRecord0Money(selText);
	}

	@Override
	public Integer countRecord0(String selText) {
		return logMapper.countRecord0(selText);
	}

}
