package com.atlantis.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.atlantis.entity.Count;
import com.atlantis.entity.PageInfo;
import com.atlantis.service.LogService;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月16日 下午1:05:27
 * @explain:
 */

@Controller
public class SystemController {

	@Autowired
	private LogService logService;

	// 跳转到系统日志页面的请求
	@RequestMapping("showSystemLog")
	public ModelAndView showSystemLog(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		String pageSize = request.getParameter("pageSize");
		String pageNumber = request.getParameter("pageNumber");
		PageInfo pageInfo = logService.selAllLogByPage(pageSize, pageNumber);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.setViewName("system-log");
		return modelAndView;
	}

	// 删除一条系统日志
	@RequestMapping("delLog")
	public ModelAndView delLog(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		String pageSize = request.getParameter("pageSize");
		String pageNumber = request.getParameter("pageNumber");
		String logId = request.getParameter("logId").trim();
		if (logService.delLog(Integer.parseInt(logId)) > 0) {
			// System.out.println("删除系统日志成功");

		} else {
			System.out.println("删除系统日志失败");
		}
		PageInfo pageInfo = logService.selAllLogByPage(pageSize, pageNumber);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.setViewName("system-log");
		return modelAndView;
	}

	// 批量删除系统日志
	@RequestMapping("delSomeLog")
	public ModelAndView delSomeLog(Integer[] ids, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ModelAndView modelAndView = new ModelAndView();
		String pageSize = request.getParameter("pageSize");
		String pageNumber = request.getParameter("pageNumber");
		// 批量删除系统日志
		if (ids != null) {
			logService.batchRemoveByIds(ids);
		}
		PageInfo pageInfo = logService.selAllLogByPage(pageSize, pageNumber);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.setViewName("redirect:showSystemLog");
		return modelAndView;
	}

	@RequestMapping("index")
	public ModelAndView indexInfo(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		List<Count> list = new ArrayList<>();
		// 获取信息
		Count today = new Count(logService.countMember("today"), logService.countRecord1Money("today"), logService.countRecord1("today"),
				logService.countRecord0Money("today"), logService.countRecord0("today"));
		list.add(today);
		Count yesday = new Count(logService.countMember("yesday"), logService.countRecord1Money("yesday"),
				logService.countRecord1("yesday"), logService.countRecord0Money("yesday"), logService.countRecord0("yesday"));
		list.add(yesday);
		Count week = new Count(logService.countMember("week"), logService.countRecord1Money("week"), logService.countRecord1("week"),
				logService.countRecord0Money("week"), logService.countRecord0("all"));
		list.add(week);
		Count month = new Count(logService.countMember("month"), logService.countRecord1Money("month"), logService.countRecord1("month"),
				logService.countRecord0Money("month"), logService.countRecord0("month"));
		list.add(month);
		Count lastmonth = new Count(logService.countMember("lastmonth"), logService.countRecord1Money("lastmonth"),
				logService.countRecord1("lastmonth"), logService.countRecord0Money("lastmonth"), logService.countRecord0("lastmonth"));
		list.add(lastmonth);
		Count all = new Count(logService.countMember("all"), logService.countRecord1Money("all"), logService.countRecord1("all"),
				logService.countRecord0Money("all"), logService.countRecord0("all"));
		list.add(all);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("index");
		return modelAndView;
	}

}
