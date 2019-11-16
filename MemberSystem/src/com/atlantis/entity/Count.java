
package com.atlantis.entity;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月29日 下午12:11:33
 * @explain: 统计数量实体类
 */

public class Count {
	private Integer countMember;// 会员注册数量
	private Float countRecord1Money;// 消费金额
	private Integer countRecord1;// 消费记录次数
	private Float countRecord0Money;// 充值金额
	private Integer countRecord0;// 充值记录次数

	public Count() {
		super();

	}

	public Count(Integer countMember, Float countRecord1Money, Integer countRecord1, Float countRecord0Money, Integer countRecord0) {
		super();
		this.countMember = countMember;
		this.countRecord1Money = countRecord1Money;
		this.countRecord1 = countRecord1;
		this.countRecord0Money = countRecord0Money;
		this.countRecord0 = countRecord0;
	}

	public Integer getCountMember() {
		return countMember;
	}

	public void setCountMember(Integer countMember) {
		this.countMember = countMember;
	}

	public Float getCountRecord1Money() {
		return countRecord1Money;
	}

	public void setCountRecord1Money(Float countRecord1Money) {
		this.countRecord1Money = countRecord1Money;
	}

	public Integer getCountRecord1() {
		return countRecord1;
	}

	public void setCountRecord1(Integer countRecord1) {
		this.countRecord1 = countRecord1;
	}

	public Float getCountRecord0Money() {
		return countRecord0Money;
	}

	public void setCountRecord0Money(Float countRecord0Money) {
		this.countRecord0Money = countRecord0Money;
	}

	public Integer getCountRecord0() {
		return countRecord0;
	}

	public void setCountRecord0(Integer countRecord0) {
		this.countRecord0 = countRecord0;
	}

}
