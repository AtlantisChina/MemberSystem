package com.atlantis.dao;

import java.util.List;

import com.atlantis.entity.Member;
import com.atlantis.entity.PageInfo;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月15日 下午5:50:49
 * @explain: MemberMapper接口，Mybatis映射使用
 */

public interface MemberMapper {
	/**
	 * 搜索指定条件的会员,并分页.若不满足条件则查询全部会员
	 */
	List<Member> selMemberByPage(PageInfo pageInfo);

	/**
	 * 计算符合搜索条件的会员总数
	 */
	long selCountMemberByAll(PageInfo pageInfo);

	/**
	 * 根据id查询会员信息
	 */
	Member selById(int id);

	/**
	 * 更新会员信息
	 */
	int updMember(Member member);

	/**
	 * 查询已存在的最大会员卡编号
	 */
	Integer selMaxMemberId();

	/**
	 * 添加会员
	 */
	int addMember(Member member);

	/**
	 * 根据id删除一条会员信息及此会员绑定的所有记录
	 */
	int delMember(int id);

}
