package com.kaneki.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
/**
 * 全局异常处理，待完善
 * @author LiJiezhou
 *
 */
public class AllExceptionResolver implements HandlerExceptionResolver {
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object object,
			Exception exception) {
		String exce = exception.getMessage();
        ModelAndView modelAndView = new ModelAndView();
        System.out.println(exce);
        return modelAndView;
	}

}
