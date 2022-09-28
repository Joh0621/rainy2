package com.rainy.workflow;

import cn.hutool.core.util.StrUtil;
import com.rainy.base.common.constant.CharConstants;
import com.rainy.base.entity.Org;
import com.rainy.base.entity.User;
import com.rainy.base.service.OrgService;
import com.rainy.base.service.UserService;
import lombok.RequiredArgsConstructor;
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

        // 将所有用户分配给 APPROVAL_ALL_GROUP 用户组
//        identityService.deleteGroup(APPROVAL_ALL_GROUP);
//        Group group = identityService.newGroup(APPROVAL_ALL_GROUP);
//        group.setName(APPROVAL_ALL_GROUP);
//        group.setType(appName);
//        identityService.saveGroup(group);
//        List<User> users = userService.list();
//        users.forEach(user -> {
//            identityService.createMembership(user.getUsername(), APPROVAL_ALL_GROUP);
//        });
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
