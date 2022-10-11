package com.rainy.workflow;

import cn.hutool.core.util.StrUtil;
import com.rainy.framework.constant.CharConstants;
import com.rainy.system.entity.Org;
import com.rainy.system.entity.User;
import com.rainy.system.service.OrgService;
import com.rainy.system.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.camunda.bpm.engine.IdentityService;
import org.camunda.bpm.engine.identity.Group;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Objects;

/**
 * 同步用户
 *
 * @author Created by renguangli at 2022/9/18 15:30
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class UserSyncTask {

    private static final String CAMUNDA_ADMIN_GROUP = "camunda-admin";
    private static final String APPROVAL_ALL_GROUP = "allGroup";

    private final OrgService orgService;
    private final IdentityService identityService;
    private final UserService userService;

    @Value("${camunda.bpm.admin-user.id}")
    private String adminUserId;
    @Value("${spring.application.name:other}")
    private String appName;


    @PostConstruct
    public void execute() {
        log.info("同步用户至 camunda ...");
        List<Org> orgList = orgService.list();
        for (Org org : orgList) {
            // 1.同步用户组
            identityService.deleteGroup(org.getCode());
            Group group = identityService.newGroup(org.getCode());
            group.setName(org.getName());
            group.setType(appName);
            identityService.saveGroup(group);
            // 2.同步用户以及用户组
            this.syncUserAndShip(org);
        }
        log.info("同步用户至 camunda 完成 ...");
    }

    private void syncUserAndShip(Org org) {
        List<User> userList = userService.lambdaQuery()
                .eq(User::getOrgId, org.getId())
                .list();
        for (User user : userList) {
            identityService.deleteUser(user.getUsername());
            org.camunda.bpm.engine.identity.User camundaUser = identityService.newUser(user.getUsername());
            String name = StrUtil.format("{}({})", user.getUsername(), user.getNickName());
            camundaUser.setFirstName(name);
            camundaUser.setLastName(CharConstants.EMPTY);
            camundaUser.setPassword(user.getPassword());
            camundaUser.setEmail(user.getEmail());
            identityService.saveUser(camundaUser);
            // 超级管理员分配给超级用户组
            if (Objects.equals(adminUserId, user.getUsername())) {
                identityService.createMembership(adminUserId, CAMUNDA_ADMIN_GROUP);
            } else {
                identityService.createMembership(user.getUsername(), org.getCode());
            }
        }
    }
}
