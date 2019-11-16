package com.atlantis.entity;

import java.util.List;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月16日 下午2:44:31
 * @explain: 分页信息实体类
 */

public class PageInfo {
	private int pageSize; // 每页显示多少行数据
	private int pageNumber; // 第几页
	private long total; // 最多有多少页
	private int pageStart; // 起始行,从多少行开始
	private long count; // 符合条件的数据数量
	private List<?> list; // 该页显示的数据集合
	private String searchText;// 查询条件
	private int memberid;// 会员id
	private String dateMin;// 查询的起始日期
	private String dateMax;// 查询的结束日期

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public int getMemberid() {
		return memberid;
	}

	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}

	public String getDateMin() {
		return dateMin;
	}

	public void setDateMin(String dateMin) {
		this.dateMin = dateMin;
	}

	public String getDateMax() {
		return dateMax;
	}

	public void setDateMax(String dateMax) {
		this.dateMax = dateMax;
	}

	@Override
	public String toString() {
		return "PageInfo [pageSize=" + pageSize + ", pageNumber=" + pageNumber + ", total=" + total + ", pageStart=" + pageStart
				+ ", count=" + count + ", list=" + list + ", searchText=" + searchText + ", memberid=" + memberid + ", dateMin=" + dateMin
				+ ", dateMax=" + dateMax + "]";
	}

}
