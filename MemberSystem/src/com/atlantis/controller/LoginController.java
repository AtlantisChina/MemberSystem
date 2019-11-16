package com.atlantis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atlantis.entity.Admin;
import com.atlantis.entity.Log;
import com.atlantis.service.LogService;
import com.atlantis.service.LoginService;
import com.atlantis.util.StringUtil;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月16日 下午1:05:27
 * @explain:
 */

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;

	@Autowired
	private LogService logService;

	// 登录请求
	@RequestMapping("login")
	public void loginAdmin(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 从前端获得账号、密码、是否记住密码
		String name = request.getParameter("name").trim();
		String password = request.getParameter("password").trim();
		String remember = request.getParameter("remember");
		// 判断是否remember是否为null
		if (StringUtil.isEmpty(remember)) {
			// 解决java.lang.NullPointerException异常
			remember = "";
		}
		// 调用服务层，根据账号和密码在数据库中查询是否有匹配项，返回结果存放在currentAdmin
		Admin currentAdmin = loginService.loginAdmin(new Admin(name, password));
		// 若currentAdmin为null则表示账号或密码不正确
		if (currentAdmin != null) {
			// 判断是否记住密码
			if ("remember-me".equals(remember)) {
				// 添加cookie
				rememberMe(currentAdmin.getName(), currentAdmin.getPassword(), response);
			} else {
				// 删除cookie
				deleteCookie(currentAdmin.getName(), request, response);
			}
			// 账号密码验证成功
			session.setAttribute("currentAdmin", currentAdmin.getName());
			// 添加系统日志
			Log log = new Log("信息", "登录成功", currentAdmin.getName(), request.getRemoteAddr());
			logService.addLog(log);
			response.sendRedirect("index");
		} else {
			// 账号密码验证失败
			request.setAttribute("error", "账号或密码错误，请重新输入");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	// 退出登录请求
	@RequestMapping("exit")
	public void exit(Admin admin, HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("currentAdmin");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	// 修改密码请求
	@RequestMapping("editPwd")
	public void editPwd(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name").trim();
		String password = request.getParameter("password").trim();
		String newPassword = request.getParameter("newPassword").trim();
		Admin currentAdmin = loginService.loginAdmin(new Admin(name,password));
		if (currentAdmin != null) {
			currentAdmin.setPassword(newPassword);
			// 账号密码验证成功
			if (loginService.updPassword(currentAdmin) > 0) {
				// System.out.println("修改密码成功");
				session.removeAttribute("currentAdmin");
				// 添加系统日志
				Log log = new Log("危险", "修改管理员密码成功", currentAdmin.getName(), request.getRemoteAddr());
				logService.addLog(log);
				request.setAttribute("error", "修改密码成功，请重新登录");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {
				System.out.println("修改密码失败");
			}
		} else {
			// 账号密码验证失败
			request.setAttribute("error", "旧密码错误，请重新输入");
			request.getRequestDispatcher("change-password.jsp").forward(request, response);
		}
	}

	private void rememberMe(String name, String password, HttpServletResponse response) {
		Cookie admin = new Cookie("member", name + "-" + password + "-" + "yes");
		admin.setMaxAge(1 * 60 * 60 * 24 * 7);
		response.addCookie(admin);
	}

	private void deleteCookie(String name, HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		for (int i = 0; cookies != null && i < cookies.length; i++) {
			if (cookies[i].getName().equals("member")) {
				if (name.equals(name = cookies[i].getValue().split("-")[0])) {
					Cookie cookie = new Cookie(cookies[i].getName(), null);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
					break;
				}
			}
		}
	}

}
