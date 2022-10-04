package com.rainy.base.config.secuity;

import cn.dev33.satoken.SaManager;
import cn.dev33.satoken.listener.SaTokenListener;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.util.SaFoxUtil;
import com.rainy.base.common.enums.LoginType;
import com.rainy.base.common.utils.SaTokenUtils;
import com.rainy.base.common.utils.WebUtils;
import com.rainy.base.entity.LoginLog;
import com.rainy.base.entity.User;
import com.rainy.base.service.LoginLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/29 10:16
 */
@Component
@RequiredArgsConstructor
public class SaTokenListenerImpl  implements SaTokenListener {

    private final LoginLogService loginLogService;

    public void doLogin(String loginType, Object loginId, String tokenValue, SaLoginModel loginModel) {
        this.println("账号[" + loginId + "]登录成功");
    }

    public void doLogout(String loginType, Object loginId, String tokenValue) {
        this.saveLog(loginId, LoginType.LOGOUT);
        this.println("账号[" + loginId + "]注销成功 (Token=" + tokenValue + ")");
    }

    public void doKickout(String loginType, Object loginId, String tokenValue) {
        this.saveLog(loginId, LoginType.KICK_OUT);
        this.println("账号[" + loginId + "]被踢下线 (Token=" + tokenValue + ")");
    }

    public void doReplaced(String loginType, Object loginId, String tokenValue) {
        this.saveLog(loginId, LoginType.REPLACED);
        this.println("账号[" + loginId + "]被顶下线 (Token=" + tokenValue + ")");
    }

    public void doDisable(String loginType, Object loginId, String service, int level, long disableTime) {
        this.saveLog(loginId, LoginType.DISABLE);
        Date date = new Date(System.currentTimeMillis() + disableTime * 1000L);
        this.println("账号[" + loginId + "] " + service + " 服务被封禁，封禁等级=" + level + " (解封时间: " + SaFoxUtil.formatDate(date) + ")");
    }

    public void doUntieDisable(String loginType, Object loginId, String service) {
        this.saveLog(loginId, LoginType.UNTIE_DISABLE);
        this.println("账号[" + loginId + "] " + service + " 服务被解除封禁");
    }

    public void doCreateSession(String id) {
        this.println("Session[" + id + "]创建成功");
    }

    public void doLogoutSession(String id) {
        this.println("Session[" + id + "]注销成功");
    }

    public void doRenewTimeout(String tokenValue, Object loginId, long timeout) {
        this.println("帐号[" + loginId + "]，Token=" + tokenValue + " 续期timeout成功!");
    }

    public void println(String str) {
        if (SaManager.getConfig().getIsLog()) {
            System.out.println("SaLog -->: " + str);
        }

    }

    private void saveLog(Object loginId, LoginType loginType) {
        User user = SaTokenUtils.getUserinfo(loginId);
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
