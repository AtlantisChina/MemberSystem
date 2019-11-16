package com.atlantis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atlantis.dao.MemberMapper;
import com.atlantis.entity.Member;
import com.atlantis.entity.PageInfo;
import com.atlantis.service.MemberService;
import com.atlantis.util.PropertiesUtil;
import com.atlantis.util.StringUtil;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月15日 下午5:57:03
 * @explain:
 */

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public PageInfo selMemberByPage(String searchText, String pageSizeStr, String pageNumberStr) {
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
		// 查询到的会员
		List<Member> list = memberMapper.selMemberByPage(pageInfo);
		pageInfo.setList(list);
		long count = memberMapper.selCountMemberByAll(pageInfo);
		pageInfo.setCount(count);
		// 计算一共有多少页
		pageInfo.setTotal(count % pageSize == 0 ? count / pageSize : count / pageSize + 1);
		return pageInfo;
	}

	@Override
	public Member selById(int id) {
		return memberMapper.selById(id);
	}

	@Override
	public int updMember(Member member) {
		return memberMapper.updMember(member);
	}

	@Override
	public Integer selMaxMemberId() {
		Integer flag = memberMapper.selMaxMemberId();
		if (flag == null) {
			return 0;
		}		
		return flag;
	}

	@Override
	public int addMember(Member member) {		
		return memberMapper.addMember(member);
	}

	@Override
	public int delMember(int id) {		
		return memberMapper.delMember(id);
	}

}
