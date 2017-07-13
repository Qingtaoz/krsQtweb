package com.qt.webframe.system.annotation;

import org.springframework.core.annotation.AliasFor;

import java.lang.annotation.*;

/**
 * 权限验证 注解
 * Created by Slash on 2017/5/15.
 */
@Documented
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Authentication {

    @AliasFor("authName")
    String value() default "";

    @AliasFor("value")
    String authName() default "";

    boolean validate() default true;
}
