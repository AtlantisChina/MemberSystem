package com.atlantis.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月16日 下午1:41:55
 * @explain: 自定义登录拦截器，需要在springMVC中配置拦截器需要拦截哪些控制器.
 *           使用springmvc拦截器实现登陆验证,把页面放入到web-inf中. 1.放入到web-inf中后必须通过控制器转发到页面.
 *           2.springmvc拦截器拦截的是控制器,不能拦截jsp. 3.通过拦截器拦截全部控制器,需要在拦截器内部放行login控制器
 */

public class LoginInterceptor implements HandlerInterceptor {
	/**
	 * 在进入控制器之前执行,如果返回值为false,则阻止进入控制器
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		/*String uri = request.getRequestURI();
		// 放行login控制器
		if (uri.equals("/MemberSystem/login")) {
			return true;
		} else {
			// 拦截除了login之外所有的控制器，判断是否登录，未登录则返回登录界面
			Object obj = request.getSession().getAttribute("currentAdmin");
			if (obj != null) {
				return true;
			} else {
				response.sendRedirect("/MemberSystem/login.jsp");
				return false;
			}
		}*/
		return true;
	}

	/**
	 * 控制器执行完成,进入到jsp(html)页面之前执行。
	 */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {
	}

	/**
	 * jsp(html)页面加载完成后执行,多用于记录执行过程中出现的异常到日志中
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
	}
}
