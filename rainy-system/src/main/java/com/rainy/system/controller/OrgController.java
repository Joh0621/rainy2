package com.rainy.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.framework.common.IdNamesParam;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.utils.ValidateUtils;
import com.rainy.framework.utils.WebUtils;
import com.rainy.framework.validation.Group;
import com.rainy.framework.annotation.Log;
import com.rainy.system.entity.Org;
import com.rainy.system.service.OrgService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/5 17:07
 */
@RestController
@RequiredArgsConstructor
public class OrgController {

    private final OrgService orgService;

    @GetMapping("/orgs")
    @SaCheckPermission("org:query")
    @Log(module = "组织管理", type = OpType.QUERY, detail = "'查询了组织列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    public Page<Org> list(Page<Org> page, Org param) {
        List<Long> orgIds = orgService.getChildrenIds(param.getId());
        return orgService.lambdaQuery()
                .in(!orgIds.isEmpty(), Org::getId, orgIds)
                .likeRight(StrUtil.isNotBlank(param.getName()), Org::getName, param.getName())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Org::getCode, param.getCode())
                .page(page);
    }

    @GetMapping("/orgs/tree")
    @Log(module = "组织管理", type = OpType.QUERY, detail = "'查询了组织列表树", resSaved = false)
    public List<Org> tree() {
        return orgService.tree();
    }

    @GetMapping("/orgs/export")
    @SaCheckPermission("org:export")
    @Log(module = "组织管理", type = OpType.EXPORT, detail = "导出了组织列表")
    public void export(HttpServletResponse response) throws IOException {
        List<Org> orgs = orgService.list();
        WebUtils.exportExcel(response, orgs, "orgs.xls");
    }

    @PostMapping("/org")
    @SaCheckPermission("org:add")
    @Log(module = "组织管理", type = OpType.ADD, detail = "'新增了组织[' + #param.name + '].'")
    public Boolean save(@RequestBody @Validated(Group.Add.class) Org param) {
        return orgService.save(param);
    }

    @PostMapping("/orgs")
    @SaCheckPermission("org:del")
    @Log(module = "组织管理", type = OpType.DEL, detail = "'删除了组织[' + #param.names + '].'")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        boolean exists = orgService.lambdaQuery()
                .in(Org::getParentId, param.getIds())
                .exists();
        ValidateUtils.isTrue(exists, "该组织下有子组织,请先删除子组织");
        return orgService.lambdaUpdate()
                .in(Org::getId, param.getIds())
                .set(Org::getDelFlag, true)
                .update();
    }

    @PostMapping("/org/update")
    @SaCheckPermission("org:update")
    @Log(module = "组织管理", type = OpType.UPDATE, detail = "'更新了组织[' + #param.name + '].'")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) Org param) {
        return orgService.updateById(param);
    }

}
