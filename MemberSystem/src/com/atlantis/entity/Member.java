package com.atlantis.entity;

import java.util.Date;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月15日 下午5:44:17
 * @explain: 会员实体类
 */

public class Member {
	private int id;
	private String name;
	private String tel;
	private String sex;
	private float money;
	private Date date;

	public Member() {
		super();

	}

	public Member(int id, String name, String tel, String sex, float money, Date date) {
		super();
		this.id = id;
		this.name = name;
		this.tel = tel;
		this.sex = sex;
		this.money = money;
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", tel=" + tel + ", sex=" + sex + ", money=" + money + ", date=" + date + "]";
	}
}
