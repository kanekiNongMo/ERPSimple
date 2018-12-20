package com.kaneki.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kaneki.pojo.Res;
import com.kaneki.pojo.User;

public class LoginInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception arg3) throws Exception {
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView arg3)
			throws Exception {
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 获取请求的URL
		String url = request.getRequestURI();
		// URL:除了登录请求外，其他的URL都进行拦截控制
		if (url.indexOf("/login.action") >= 0 || url.indexOf("/logout.action") >= 0) {
			return true;
		}
		// 获取Session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_SESSION");
		String strCon = url.substring(url.lastIndexOf('/') + 1);
		// 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
		if (user != null) {
			//判断用户是否拥有该权限
			for (Res r : user.getRess()) {

				if (r.getUrl().equals(strCon)) {
					return true;
				}

			}
			request.setAttribute("con", "您没有权限访问，请联系管理员！");
			request.getRequestDispatcher("/WEB-INF/jsp/hint.jsp").forward(request, response);
			return false;
		}
		// 不符合条件的给出提示信息，并转发到登录页面
		request.setAttribute("msg", "您还没有登录，请先登录！");
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		return false;
	}

}
