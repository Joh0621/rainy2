package com.rainy.system.aop;

import com.rainy.framework.enums.LoginType;
import com.rainy.framework.utils.WebUtils;
import com.rainy.system.entity.LoginLog;
import com.rainy.system.entity.User;
import com.rainy.system.param.LoginParam;
import com.rainy.system.service.LoginLogService;
import com.rainy.system.service.UserService;
import lombok.RequiredArgsConstructor;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/10/4 19:48
 */
@Aspect
@Component
@RequiredArgsConstructor
public class LoginLogAspect {

    private final LoginLogService loginLogService;
    private final UserService userService;

    /**
     * 打印方法执行时常
     *
     * @param joinPoint ProceedingJoinPoint
     * @return Object
     * @throws Throwable Throwable
     */
    @Around("execution(public * com.rainy.system.controller.LoginController.login(..))")
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
            Object result = joinPoint.proceed(args);
            this.updateUser(username);
            return result;
        } catch (Throwable e) {
            loginLog.setSuccess(false);
            loginLog.setErrorMessage(e.getMessage());
            throw e;
        } finally {
            loginLogService.asyncSave(loginLog);
        }
    }

    public void updateUser(String username){
        User user = userService.lambdaQuery()
                .eq(User::getUsername, username)
                .one();
        user.setLoginCount(user.getLoginCount() == null ? 1 : user.getLoginCount() + 1);
        user.setLastLoginTime(LocalDateTime.now());
        user.setLastLoginIp(WebUtils.getRemoteIp());
        user.setBrowser(WebUtils.getBrowser());
        user.setOs(WebUtils.getOs());
        userService.updateById(user);
    }
}
