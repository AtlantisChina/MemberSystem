package com.atlantis.entity;

import java.util.Date;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月16日 下午3:42:28
 * @explain: 记录实体类
 */

public class Record {
	private int id;
	private int memberid;
	private Date recorddate;
	private String recordtype;
	private float changemoney;
	private String remarks;
	private Member member; // 该记录属于哪个会员

	public Record() {
		super();

	}

	public Record(int id, int memberid, Date recorddate, String recordtype, float changemoney, String remarks) {
		super();
		this.id = id;
		this.memberid = memberid;
		this.recorddate = recorddate;
		this.recordtype = recordtype;
		this.changemoney = changemoney;
		this.remarks = remarks;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMemberid() {
		return memberid;
	}

	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}

	public Date getRecorddate() {
		return recorddate;
	}

	public void setRecorddate(Date recorddate) {
		this.recorddate = recorddate;
	}

	public String getRecordtype() {
		return recordtype;
	}

	public void setRecordtype(String recordtype) {
		this.recordtype = recordtype;
	}

	public float getChangemoney() {
		return changemoney;
	}

	public void setChangemoney(float changemoney) {
		this.changemoney = changemoney;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

}
