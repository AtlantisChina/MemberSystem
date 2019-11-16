package com.atlantis.controller;

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

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月15日 下午5:59:46
 * @explain:
 */

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private RecordService recordService;

	@Autowired
	private LogService logService;

	// 跳转到会员列表页面请求(查询全部会员信息)
	@RequestMapping("member")
	public ModelAndView selMemberByPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String searchText = request.getParameter("searchText");
		if(searchText ==null) {
			searchText = "";
		}
		// 解决get请求中文乱码
		byte[] bytes = searchText.getBytes("iso-8859-1");
		searchText =new String(bytes,"utf-8");

		String pageSize = request.getParameter("pageSize");
		String pageNumber = request.getParameter("pageNumber");
		PageInfo pageInfo = memberService.selMemberByPage(searchText, pageSize, pageNumber);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.setViewName("member-list");
		return modelAndView;
	}

	// 跳转到会员修改页面请求
	@RequestMapping("preMemberUpdate")
	public ModelAndView preMemberUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		String mid = request.getParameter("memberid").trim();
		Member member = memberService.selById(Integer.parseInt(mid));
		modelAndView.addObject("member", member);
		modelAndView.setViewName("member-update");
		return modelAndView;
	}

	// 会员信息修改请求
	@RequestMapping("memberUpdate")
	public ModelAndView memberUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.parseInt(request.getParameter("memberId").trim());
		String name = request.getParameter("memberName").trim();
		String sex = request.getParameter("memberSex").trim();
		String tel = request.getParameter("memberTel").trim();
		float money = Float.parseFloat(request.getParameter("memberMoney").trim());
		String datestr = request.getParameter("memberDate").trim();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = sdf.parse(datestr);
			Member member = new Member(id, name, tel, sex, money, date);
			if (memberService.updMember(member) != 0) {
				// System.out.println("会员信息更新成功！");
			} else {
				// System.out.println("会员信息更新失败....");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		modelAndView.setViewName("redirect:memberView?memberid=" + id);
		return modelAndView;
	}

	// 跳转到会员信息页面的请求
	@RequestMapping("memberView")
	public ModelAndView memberView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		// 页码信息
		String pageSize = request.getParameter("pageSize");
		String pageNumber = request.getParameter("pageNumber");
		// 该会员具体的信息
		String mid = request.getParameter("memberid").trim();
		Member member = memberService.selById(Integer.parseInt(mid));
		modelAndView.addObject("member", member);
		// 该会员所属记录信息
		PageInfo pageInfo = recordService.selAllRecordForMember(Integer.parseInt(mid), pageSize, pageNumber);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.setViewName("member-view");
		return modelAndView;
	}

	// 跳转到添加会员页码的请求
	@RequestMapping("preAddMember")
	public ModelAndView preAddMember(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		// 查询现有最大的会员卡编号
		Integer maxMemberId = memberService.selMaxMemberId();
		modelAndView.addObject("memberId", maxMemberId + 1);
		modelAndView.setViewName("member-add");
		return modelAndView;
	}

	// 添加会员的请求
	@RequestMapping("addMember")
	public ModelAndView addMember(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		// 页码信息
		String pageSize = request.getParameter("pageSize");
		String pageNumber = request.getParameter("pageNumber");
		int memberId = Integer.parseInt(request.getParameter("memberId").trim());
		String memberName = request.getParameter("memberName").trim();
		String memberSex = request.getParameter("memberSex").trim();
		String memberTel = request.getParameter("memberTel").trim();
		float memberMoney = Float.parseFloat(request.getParameter("memberMoney").trim());
		// 注册日期
		Date memberDate = new Date();
		Member member = new Member(memberId, memberName, memberTel, memberSex, memberMoney, memberDate);
		// System.out.println(member);
		// 添加会员
		if (memberService.addMember(member) > 0) {
			// System.out.println("添加会员成功");
			modelAndView.addObject("member", member);
			// 若初始余额不为0，则添加一条充值记录
			if ((memberMoney * 1) != 0) {
				// 添加记录
				Record record = new Record();
				record.setMemberid(memberId);
				record.setRecorddate(memberDate);
				record.setRecordtype("充值");
				record.setChangemoney(memberMoney);
				record.setRemarks("注册时充值的初始余额");
				if (recordService.addRecord(record) > 0) {
					// System.out.println("添加记录成功");
				} else {
					System.out.println("添加记录失败");
				}				
			}
			// 查询该会员所属记录
			PageInfo pageInfo = recordService.selAllRecordForMember(memberId, pageSize, pageNumber);
			modelAndView.addObject("pageInfo", pageInfo);
		} else {
			System.out.println("添加会员失败");
		}
		modelAndView.setViewName("redirect:memberView?memberid=" + memberId);
		return modelAndView;
	}

	// 删除会员的请求
	@RequestMapping("delMember")
	public ModelAndView delMember(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		String memberid = request.getParameter("memberid").trim();
		if (memberService.delMember(Integer.parseInt(memberid)) > 0) {
			// System.out.println("删除会员成功");
			// 添加系统日志
			Log log = new Log("警告", "删除会员[会员卡号：" + memberid + "]", (String) session.getAttribute("currentAdmin"), request.getRemoteAddr());
			logService.addLog(log);
		} else {
			System.out.println("删除会员成功");
		}
		modelAndView.setViewName("redirect:/member");
		return modelAndView;
	}

}
