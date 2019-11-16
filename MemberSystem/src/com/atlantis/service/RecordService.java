package com.atlantis.service;

import com.atlantis.entity.PageInfo;
import com.atlantis.entity.Record;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月15日 下午5:56:02
 * @explain:
 */

public interface RecordService {

	PageInfo selRecordByPage(String searchText, String dateMin, String dateMax, String pageSize, String pageNumber);

	PageInfo selAllRecordForMember(int memberid, String pageSize, String pageNumber);

	int addRecord(Record record);

	int delRecord(int id);

	int updMemberMoneyForRecord(Record record);

	int retMemberMoneyForRecord(Record record);

	Record selById(int id);
	
	int updRecord(Record record);
}
