package com.rainy.base.aop;

import com.rainy.base.common.enums.LoginType;
import com.rainy.base.common.utils.WebUtils;
import com.rainy.base.entity.LoginLog;
import com.rainy.base.param.LoginParam;
import com.rainy.base.service.LoginLogService;
import lombok.RequiredArgsConstructor;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/4 19:48
 */
@Aspect
@Component
@RequiredArgsConstructor
public class LoginLogAspect {

    private final LoginLogService loginLogService;

    /**
     * 打印方法执行时常
     *
     * @param joinPoint ProceedingJoinPoint
     * @return Object
     * @throws Throwable Throwable
     */
    @Around("execution(public * com.rainy.base.controller.LoginController.login(..))")
    public Object printMethodExecuteTime(ProceedingJoinPoint joinPoint) throws Throwable {
        Object[] args = joinPoint.getArgs();
        LoginLog loginLog = new LoginLog();
        String username = ((LoginParam) args[0]).getUsername();
        loginLog.setUsername(username);
        loginLog.setType(LoginType.LOGIN.getCode());
        loginLog.setDatetime(LocalDateTime.now());
        loginLog.setIp(WebUtils.getRemoteIp());
        loginLog.setBrowser(WebUtils.getBrowser());
        loginLog.setOs(WebUtils.getOs());
        loginLog.setSuccess(true);
        try {
            return joinPoint.proceed(args);
        } catch (Throwable e) {
            loginLog.setSuccess(false);
            loginLog.setErrorMessage(e.getMessage());
            throw e;
        } finally {
            loginLogService.asyncSave(loginLog);
        }
    }


}
