package com.atlantis.service;

import com.atlantis.entity.Member;
import com.atlantis.entity.PageInfo;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月15日 下午5:56:02
 * @explain:
 */

public interface MemberService {

	PageInfo selMemberByPage(String searchText, String pageSize, String pageNumber);
	
	Member selById(int id);
	
	int updMember(Member member);
	
	Integer selMaxMemberId();
	
	int addMember(Member member);
	
	int delMember(int id);
}
