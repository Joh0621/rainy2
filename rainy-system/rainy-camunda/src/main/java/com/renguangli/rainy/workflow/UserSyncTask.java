package com.renguangli.rainy.workflow;

import cn.hutool.core.util.StrUtil;
import com.renguangli.rainy.common.constant.CharConstants;
import com.renguangli.rainy.entity.Org;
import com.renguangli.rainy.entity.User;
import com.renguangli.rainy.service.OrgService;
import com.renguangli.rainy.service.UserService;
import lombok.RequiredArgsConstructor;
import org.camunda.bpm.engine.IdentityService;
import org.camunda.bpm.engine.identity.Group;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/18 15:30
 */
@Component
@RequiredArgsConstructor
public class UserSyncTask {

    private final OrgService orgService;
    private final IdentityService identityService;
    private final UserService userService;

    @PostConstruct
    public void run() {
        List<Org> orgList = orgService.list();
        for (Org org : orgList) {
            // 1.同步用户组
            identityService.deleteGroup(org.getStringId());
            Group group = identityService.newGroup(org.getStringId());
            group.setName(org.getName());
            identityService.saveGroup(group);
            // 2.同步用户
            List<User> userList = userService.list();
            for (User user : userList) {
                identityService.deleteUser(user.getUsername());
                org.camunda.bpm.engine.identity.User camundaUser = identityService.newUser(user.getUsername());
                String name = StrUtil.format("{}({})", user.getUsername(), user.getNickName());
                camundaUser.setFirstName(name);
                camundaUser.setLastName(CharConstants.EMPTY);
                camundaUser.setPassword(user.getPassword());
                camundaUser.setEmail(user.getEmail());
                identityService.saveUser(camundaUser);
            }
            // 3.同步用户和用户组之间的关系
//            identityService.deleteMembership();
//            identityService.createMembership();

        }
        System.out.println(identityService.createGroupQuery().list());
    }
}
