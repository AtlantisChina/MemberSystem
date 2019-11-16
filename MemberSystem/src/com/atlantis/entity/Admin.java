package com.atlantis.entity;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月16日 下午12:55:03
 * @explain: 管理员实体类
 */

public class Admin {
	private int id;
	private String name;
	private String password;

	public Admin() {
		super();

	}

	public Admin(String name, String password) {
		super();
		this.name = name;
		this.password = password;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
