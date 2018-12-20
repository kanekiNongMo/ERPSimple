package com.kaneki.log;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.PARAMETER,ElementType.METHOD})// 方法注解
@Retention(RetentionPolicy.RUNTIME)// 运行时可见

public @interface LogAnnotation {
	String operateType();
 
}
