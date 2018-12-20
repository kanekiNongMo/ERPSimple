package com.kaneki.log;

import java.lang.reflect.Method;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.kaneki.pojo.Log;
import com.kaneki.pojo.User;
import com.kaneki.service.LogService;

@Component
@Aspect
public class LogAopAspect {
	@Autowired
	private  LogService logService;
	
	@Around("@annotation(com.kaneki.log.LogAnnotation)")
	public Object aroundAdvice(ProceedingJoinPoint pjp) throws Throwable {
        // 1.方法执行前的处理，相当于前置通知
        // 获取方法签名
        MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
        // 获取方法
        Method method = methodSignature.getMethod();
        // 获取方法上面的注解
        LogAnnotation logAnno = method.getAnnotation(LogAnnotation.class);
        // 获取操作描述的属性值
        String operateType = logAnno.operateType();
        // 创建一个日志对象(准备记录日志)
        Log log = new Log();
        log.setLogRecord(operateType);// 操作说明
        //获取request
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //获取session
        User user = (User)request.getSession().getAttribute("USER_SESSION");//获取session中的user对象进而获取操作人名字
        System.out.println(user);
        if(user!=null) {
        	log.setUser(user);// 设置操作人
        }
        Object result = null;
        try {
            //让代理方法执行
            result = pjp.proceed();
            // 2.相当于后置通知(方法成功执行之后走这里)
            log.setOperateresult("正常");// 设置操作结果
        } catch (Exception e) {
            // 3.相当于异常通知部分
        	log.setOperateresult("失败");// 设置操作结果
        } finally {
            // 4.相当于最终通知
        	log.setLogTimel(new Date());// 设置操作日期
        	logService.addLog(log);// 添加日志记录
        }
        return result;
    }
}