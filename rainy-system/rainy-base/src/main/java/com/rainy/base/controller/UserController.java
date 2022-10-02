package com.rainy.base.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.base.aop.Log;
import com.rainy.base.common.Result;
import com.rainy.base.common.constant.CharConstants;
import com.rainy.base.common.constant.OpType;
import com.rainy.base.common.param.IdNamesParam;
import com.rainy.base.common.utils.ExcelUtils;
import com.rainy.base.common.validation.Group;
import com.rainy.base.entity.User;
import com.rainy.base.service.UserRoleRelService;
import com.rainy.base.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/14 0014 6:37
 */
@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final UserRoleRelService userRoleRelService;

    @GetMapping("/users")
    @SaCheckPermission("user:query")
    @Log(module = "用户管理", type = OpType.QUERY, detail = "'查询了用户列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    public Page<User> list(Page<User> page, User param) {
        return userService.lambdaQuery()
                .eq(!Objects.isNull(param.getOrgId()), User::getOrgId, param.getOrgId())
                .likeRight(StrUtil.isNotBlank(param.getUsername()), User::getUsername, param.getUsername())
                .page(page);
    }

    @GetMapping("/users/export")
    @SaCheckPermission("user:export")
    @Log(module = "用户管理", type = OpType.EXPORT, detail = "导出了用户列表")
    public void export(HttpServletResponse response) throws IOException {
        List<User> users = userService.list();
        ExcelUtils.export(response, users, "users.xls");
    }

    @PostMapping("/user")
    @SaCheckPermission("user:add")
    @Log(module = "用户管理", type = OpType.ADD, detail = "'新增了用户[' + #param.username + '].'")
    public Boolean save(@RequestBody @Validated(Group.Add.class) User param) {
        return userService.save(param);
    }

    @PostMapping("/users")
    @SaCheckPermission("user:del")
    @Log(module = "用户管理", type = OpType.DEL, detail = "'删除了用户[' + #param.names + '].'")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return userService.removeBatchByIds(param.getIds());
    }

    @PostMapping("/user/update")
    @SaCheckPermission("user:update")
    @Log(module = "用户管理", type = OpType.UPDATE, detail = "'更新了用户[' + #param.username + '].'")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) User param) {
        return userService.updateById(param);
    }

    @GetMapping("/user/roleIds")
    @Log(module = "用户管理", type = OpType.QUERY, detail = "'查询了用户[' + #param.name + ']拥有的角色列表'")
    public List<Long> listRoleIdsByUserId(IdNamesParam param) {
        return userRoleRelService.listRoleIdsByUserId(param.getId());
    }

    @PostMapping("/user/roles/assign")
    @SaCheckPermission("user:assignRole")
    @Log(module = "用户管理", type = OpType.ADD, detail = "'给用户[' + #param.name + ']分配了角色[' + #param.names + '].'")
    public Boolean assignRoles(@RequestBody @Validated(Group.ASSIGN.class) IdNamesParam param) {
        return userRoleRelService.assignRoles(param.getId(), param.getIds());
    }

    @GetMapping("/users/online")
    @SaCheckPermission("onlineUser:query")
    @Log(module = "在线用户", type = OpType.QUERY, detail = "'查询了在线用户第' + #page.current + '页.每页' + #page.size + '条数据'")
    public Page<User> onlineUsers(Page<User> page, String username, String nickName){
        List<String> sessionIds = StpUtil.searchSessionId(CharConstants.EMPTY, -1, 0, true);
        if (sessionIds.isEmpty()) {
            return page;
        }
        List<String> userIds = sessionIds.stream()
                .map(v -> StrUtil.subAfter(v, CharConstants.COLON, true)).toList();
        return userService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(username), User::getUsername, username)
                .likeRight(StrUtil.isNotBlank(nickName), User::getNickName, username)
                .in(User::getId, userIds)
                .page(page);
    }

    @PostMapping("/user/kickOut")
    @SaCheckPermission("onlineUser:kickOut")
    @Log(module = "在线用户", type = OpType.DEL, detail = "'下线了用户[' + #param.names + '].'")
    public Result<Boolean> kickOut(@RequestBody @Valid IdNamesParam param){
        param.getIds().forEach(StpUtil::kickout);
        return Result.ok();
    }

}
