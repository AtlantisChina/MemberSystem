package com.atlantis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atlantis.dao.MemberMapper;
import com.atlantis.dao.RecordMapper;
import com.atlantis.entity.Member;
import com.atlantis.entity.PageInfo;
import com.atlantis.entity.Record;
import com.atlantis.service.RecordService;
import com.atlantis.util.PropertiesUtil;
import com.atlantis.util.StringUtil;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月15日 下午5:57:03
 * @explain:
 */

@Service
public class RecordServiceImpl implements RecordService {

	@Autowired
	private RecordMapper recordMapper;

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public PageInfo selRecordByPage(String searchText, String dateMin, String dateMax, String pageSizeStr, String pageNumberStr) {
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
		pageInfo.setSearchText(searchText);
		pageInfo.setDateMin(dateMin);
		pageInfo.setDateMax(dateMax);
		// System.out.println(pageInfo.getDateMin()+pageInfo.getDateMax());

		// 查询到的记录
		List<Record> list = recordMapper.selRecordByPage(pageInfo);
		for (Record record : list) {
			Member m = memberMapper.selById(record.getMemberid());
			record.setMember(m);
		}
		pageInfo.setList(list);

		long count = recordMapper.selCountRecordByAll(pageInfo);
		pageInfo.setCount(count);
		// 计算一共有多少页
		pageInfo.setTotal(count % pageSize == 0 ? count / pageSize : count / pageSize + 1);
		return pageInfo;
	}

	@Override
	public PageInfo selAllRecordForMember(int memberid, String pageSizeStr, String pageNumberStr) {
		// 初始化pageSize大小
		int pageSize = Integer.parseInt(PropertiesUtil.getValue("pageMinSize"));
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
		pageInfo.setMemberid(memberid);

		// 查询到的记录总数
		long count = recordMapper.selCountAllRecordForMember(pageInfo);
		pageInfo.setCount(count);
		// 查询到的记录
		List<Record> list = recordMapper.selAllRecordForMember(pageInfo);
		pageInfo.setList(list);

		// 计算一共有多少页
		pageInfo.setTotal(count % pageSize == 0 ? count / pageSize : count / pageSize + 1);
		return pageInfo;
	}

	@Override
	public int addRecord(Record record) {
		return recordMapper.addRecord(record);
	}

	@Override
	public int delRecord(int id) {
		return recordMapper.delRecord(id);
	}

	@Override
	public int updMemberMoneyForRecord(Record record) {
		// 获得会员余额
		float money = record.getMember().getMoney();
		if (record.getRecordtype().equals("充值")) {
			money = money + record.getChangemoney();
		} else if (record.getRecordtype().equals("消费")) {
			money = money - record.getChangemoney();
		} else {

		}
		record.getMember().setMoney(money);
		//System.out.println(record.getMember().toString());
		return recordMapper.updMemberMoneyForRecord(record.getMember());
	}

	@Override
	public int retMemberMoneyForRecord(Record record) {
		// 获得会员余额
		float money = record.getMember().getMoney();
		if (record.getRecordtype().equals("充值")) {
			money = money - record.getChangemoney();
		} else if (record.getRecordtype().equals("消费")) {
			money = money + record.getChangemoney();
		} else {

		}
		record.getMember().setMoney(money);
		//System.out.println(record.getMember().toString());
		return recordMapper.updMemberMoneyForRecord(record.getMember());
	}

	@Override
	public Record selById(int id) {
		return recordMapper.selByid(id);
	}

	@Override
	public int updRecord(Record record) {		
		return recordMapper.updRecord(record);
	}
}
