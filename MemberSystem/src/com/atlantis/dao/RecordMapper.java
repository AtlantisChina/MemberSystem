
package com.atlantis.dao;

import java.util.List;

import com.atlantis.entity.Member;
import com.atlantis.entity.PageInfo;
import com.atlantis.entity.Record;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月16日 下午4:25:09
 * @explain:
 */

public interface RecordMapper {
	/**
	 * 搜索指定条件的记录,并分页.若不满足条件则查询全部记录
	 */
	List<Record> selRecordByPage(PageInfo pageInfo);

	/**
	 * 计算符合搜索条件的记录总数
	 */
	long selCountRecordByAll(PageInfo pageInfo);

	/**
	 * 根据会员id查询该会员所属的所有记录
	 */
	List<Record> selAllRecordForMember(PageInfo pageInfo);
	
	/**
	 * 计算该会员所属的记录总数
	 */
	long selCountAllRecordForMember(PageInfo pageInfo);
	
	/**
	 * 添加一条记录
	 */
	int addRecord(Record record);
	
	/**
	 * 根据记录id删除一条记录
	 */
	int delRecord(int id);
	
	/**
	 * 根据添加或删除的记录更新会员余额
	 */
	int updMemberMoneyForRecord(Member member);
	
	/**
	 * 根据记录id查询一条记录信息
	 */
	Record selByid(int id);
	
	/**
	 * 更新一条记录
	 */
	int updRecord(Record record);

}
