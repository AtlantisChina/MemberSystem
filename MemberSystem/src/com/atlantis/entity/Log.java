
package com.atlantis.entity;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月28日 下午7:09:16
 * @explain: 系统日志实体类
 */

public class Log {
	private int id; // 日志ID
	private String type; // 日志类型
	private String content; // 内容
	private String operator; // 操作者
	private String ip; // 操作者的ip
	private String date; // 时间

	public Log() {
		super();

	}

	public Log(String type, String content, String operator, String ip) {
		super();
		this.type = type;
		this.content = content;
		this.operator = operator;
		this.ip = ip;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
