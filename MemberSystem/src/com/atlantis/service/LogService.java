package com.atlantis.service;

import com.atlantis.entity.Log;
import com.atlantis.entity.PageInfo;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月15日 下午5:56:02
 * @explain:
 */

public interface LogService {

	PageInfo selAllLogByPage(String pageSize, String pageNumber);

	int addLog(Log log);

	int delLog(int id);

	void batchRemoveByIds(Integer[] ids);

	Integer countMember(String selText);

	Float countRecord1Money(String selText);

	Integer countRecord1(String selText);

	Float countRecord0Money(String selText);

	Integer countRecord0(String selText);
}
