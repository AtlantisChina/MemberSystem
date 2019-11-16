
package com.atlantis.dao;

import java.util.List;

import com.atlantis.entity.Log;
import com.atlantis.entity.PageInfo;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月16日 下午4:25:09
 * @explain:
 */

public interface LogMapper {
	/**
	 * 查询全部系统日志信息，并分页
	 */
	List<Log> selAllLogByPage(PageInfo pageInfo);

	/**
	 * 计算全部系统日志信息总数
	 */
	long selCountLogByAll();

	/**
	 * 添加一条系统日志
	 */
	int addLog(Log log);

	/**
	 * 根据记录id删除一条系统日志
	 */
	int delLog(int id);
	
	/**
	 * 计算会员注册数量
	 */
	Integer countMember(String selText);
	
	/**
	 * 计算消费金额
	 */
	Float countRecord1Money(String selText);
	
	/**
	 * 计算消费次数
	 */
	Integer countRecord1(String selText);
	
	/**
	 * 计算充值金额
	 */
	Float countRecord0Money(String selText);
	
	/**
	 * 计算消费次数
	 */
	Integer countRecord0(String selText);	
}
