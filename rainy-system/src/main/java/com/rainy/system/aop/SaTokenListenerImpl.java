package com.rainy.system.aop;

import cn.dev33.satoken.listener.SaTokenListenerForSimple;
import com.rainy.framework.common.Userinfo;
import com.rainy.framework.enums.LoginType;
import com.rainy.framework.utils.SecurityUtils;
import com.rainy.framework.utils.WebUtils;
import com.rainy.system.entity.LoginLog;
import com.rainy.system.service.LoginLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * sa-token 监听器，记录相关日志
 *
 * @author Created by renguangli at 2022/9/29 10:16
 */
@Primary
@Component
@RequiredArgsConstructor
public class SaTokenListenerImpl  extends SaTokenListenerForSimple {

    private final LoginLogService loginLogService;

    public void doLogout(String loginType, Object loginId, String tokenValue) {
        this.saveLog(loginId, LoginType.LOGOUT);
    }

    public void doKickout(String loginType, Object loginId, String tokenValue) {
        this.saveLog(loginId, LoginType.KICK_OUT);
    }

    public void doReplaced(String loginType, Object loginId, String tokenValue) {
        this.saveLog(loginId, LoginType.REPLACED);
    }

    public void doDisable(String loginType, Object loginId, String service, int level, long disableTime) {
        this.saveLog(loginId, LoginType.DISABLE);
    }

    public void doUntieDisable(String loginType, Object loginId, String service) {
        this.saveLog(loginId, LoginType.UNTIE_DISABLE);
    }

    private void saveLog(Object loginId, LoginType loginType) {
        Userinfo user = SecurityUtils.getUserinfo(loginId);
        LoginLog loginLog = new LoginLog();
        loginLog.setDatetime(LocalDateTime.now());
        loginLog.setType(loginType.getCode());
        loginLog.setUsername(user.getUsername());
        loginLog.setIp(WebUtils.getRemoteIp());
        loginLog.setBrowser(WebUtils.getBrowser());
        loginLog.setOs(WebUtils.getOs());
        loginLog.setSuccess(true);
        loginLogService.asyncSave(loginLog);
    }

}
