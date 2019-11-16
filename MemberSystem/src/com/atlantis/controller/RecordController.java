package com.atlantis.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.atlantis.entity.Log;
import com.atlantis.entity.Member;
import com.atlantis.entity.PageInfo;
import com.atlantis.entity.Record;
import com.atlantis.service.LogService;
import com.atlantis.service.MemberService;
import com.atlantis.service.RecordService;
import com.atlantis.util.StringUtil;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月15日 下午5:59:46
 * @explain:
 */

@Controller
public class RecordController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private RecordService recordService;
	
	@Autowired
	private LogService logService;

	// 跳转到记录列表页面请求(查询全部记录信息)
	@RequestMapping("record")
	public ModelAndView selRecordByPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		String searchText = request.getParameter("searchText");
		if (StringUtil.isEmpty(searchText)) {
			searchText = "";
		} else if (searchText.equals("1")) {
			searchText = "充值";
		} else if (searchText.equals("0")) {
			searchText = "消费";
		}
		String pageSize = request.getParameter("pageSize");
		String pageNumber = request.getParameter("pageNumber");
		String dateMin = request.getParameter("dateMin");
		String dateMax = request.getParameter("dateMax");
		// System.out.println(dateMin + dateMax);

		PageInfo pageInfo = recordService.selRecordByPage(searchText, dateMin, dateMax, pageSize, pageNumber);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.setViewName("record-list");
		return modelAndView;
	}

	// 跳转到添加记录页面的请求
	@RequestMapping("preAddRecord")
	public ModelAndView preAddRecord(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		String recordType = request.getParameter("type").trim();
		String memberid = request.getParameter("memberid").trim();
		Member member = memberService.selById(Integer.parseInt(memberid));
		modelAndView.addObject("member", member);
		modelAndView.addObject("recordType", recordType);
		modelAndView.setViewName("record-add");
		return modelAndView;
	}

	// 跳转到修改记录页面的请求
	@RequestMapping("preRecordUpdate")
	public ModelAndView preUpdRecord(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		String recordid = request.getParameter("recordid").trim();
		Record record = recordService.selById(Integer.parseInt(recordid));
		modelAndView.addObject("record", record);
		modelAndView.setViewName("record-update");
		return modelAndView;
	}

	// 修改记录的请求
	@RequestMapping("recordUpdate")
	public ModelAndView updRecord(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		ModelAndView modelAndView = new ModelAndView();
		String recordId = request.getParameter("recordId").trim();
		String recordType = request.getParameter("recordType").trim();
		String memberId = request.getParameter("memberId").trim();
		String changeMoney = request.getParameter("changeMoney").trim();
		String recordDateStr = request.getParameter("recordDate").trim();
		String remarks = request.getParameter("remarks").trim();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date recordDate = sdf.parse(recordDateStr);
		// 修改后的记录
		Record newRecord = new Record(Integer.parseInt(recordId), Integer.parseInt(memberId), recordDate, recordType,
				Float.parseFloat(changeMoney), remarks);
		if (recordService.updRecord(newRecord) > 0) {
			// System.out.println("更新记录成功");
		} else {
			System.out.println("更新记录失败");
		}
		Member member = memberService.selById(Integer.parseInt(memberId));
		modelAndView.addObject("member", member);
		// 查询该会员所属记录
		PageInfo pageInfo = recordService.selAllRecordForMember(Integer.parseInt(memberId), "", "");
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.setViewName("redirect:memberView?memberid=" + memberId);
		return modelAndView;
	}

	// 添加记录的请求
	@RequestMapping("addRecord")
	public ModelAndView addRecord(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		// 页码信息
		String pageSize = request.getParameter("pageSize");
		String pageNumber = request.getParameter("pageNumber");

		String recordtype = request.getParameter("recordType").trim();
		String memberid = request.getParameter("memberid").trim();
		String changemoney = request.getParameter("changeMoney").trim();
		String remarks = request.getParameter("remarks").trim();
		// 添加记录的日期
		Date recorddate = new Date();
		Record record = new Record();
		record.setMemberid(Integer.parseInt(memberid));
		record.setRecorddate(recorddate);
		record.setRecordtype(recordtype);
		record.setChangemoney(Float.parseFloat(changemoney));
		record.setRemarks(remarks);

		if (recordService.addRecord(record) > 0) {
			// System.out.println("添加记录成功");
			// 查询此会员信息
			Member member = memberService.selById(Integer.parseInt(memberid));
			modelAndView.addObject("member", member);
			// 更新会员余额
			record.setMember(member);
			// System.out.println(member.toString());
			if (recordService.updMemberMoneyForRecord(record) > 0) {
				// System.out.println("更新余额成功");
			} else {
				System.out.println("更新余额失败");
			}
		} else {
			System.out.println("添加记录失败");
		}
		// 查询该会员所属记录
		PageInfo pageInfo = recordService.selAllRecordForMember(Integer.parseInt(memberid), pageSize, pageNumber);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.setViewName("redirect:memberView?memberid=" + memberid);
		return modelAndView;
	}

	// 删除记录页面的请求
	@RequestMapping("delRecord")
	public ModelAndView delRecord(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		// 页码信息
		String pageSize = request.getParameter("pageSize");
		String pageNumber = request.getParameter("pageNumber");

		String memberId = request.getParameter("memberId").trim();
		String recordId = request.getParameter("recordId").trim();
		// 查询此会员与记录
		Member member = memberService.selById(Integer.parseInt(memberId));
		Record record = recordService.selById(Integer.parseInt(recordId));
		record.setMember(member);

		if (recordService.delRecord(Integer.parseInt(recordId)) > 0) {
			// System.out.println("删除记录成功");
			// 添加系统日志
			Log log = new Log("警告", "删除记录[记录编号：" + recordId + "]", (String) session.getAttribute("currentAdmin"), request.getRemoteAddr());
			logService.addLog(log);
			if (recordService.retMemberMoneyForRecord(record) > 0) {
				// System.out.println("更新余额成功");
			} else {
				System.out.println("更新余额失败");
			}
		} else {
			System.out.println("删除记录失败");
		}
		modelAndView.addObject("member", memberService.selById(Integer.parseInt(memberId)));
		// 查询该会员所属记录
		PageInfo pageInfo = recordService.selAllRecordForMember(Integer.parseInt(memberId), pageSize, pageNumber);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.setViewName("redirect:memberView?memberid=" + memberId);
		return modelAndView;
	}

}
