package com.rainy.base.config.secuity;

import cn.dev33.satoken.SaManager;
import cn.dev33.satoken.listener.SaTokenListener;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.util.SaFoxUtil;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/29 10:16
 */
@Component
public class SaTokenListenerImpl  implements SaTokenListener {

    public void doLogin(String loginType, Object loginId, String tokenValue, SaLoginModel loginModel) {
        this.println("账号[" + loginId + "]登录成功");
    }

    public void doLogout(String loginType, Object loginId, String tokenValue) {
        this.println("账号[" + loginId + "]注销成功 (Token=" + tokenValue + ")");
    }

    public void doKickout(String loginType, Object loginId, String tokenValue) {
        this.println("账号[" + loginId + "]被踢下线 (Token=" + tokenValue + ")");
    }

    public void doReplaced(String loginType, Object loginId, String tokenValue) {
        this.println("账号[" + loginId + "]被顶下线 (Token=" + tokenValue + ")");
    }

    public void doDisable(String loginType, Object loginId, String service, int level, long disableTime) {
        Date date = new Date(System.currentTimeMillis() + disableTime * 1000L);
        this.println("账号[" + loginId + "] " + service + " 服务被封禁，封禁等级=" + level + " (解封时间: " + SaFoxUtil.formatDate(date) + ")");
    }

    public void doUntieDisable(String loginType, Object loginId, String service) {
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
}
