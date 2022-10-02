package com.rainy.base.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.base.aop.Log;
import com.rainy.base.common.constant.OpType;
import com.rainy.base.common.param.IdNamesParam;
import com.rainy.base.common.utils.ExcelUtils;
import com.rainy.base.common.validation.Group;
import com.rainy.base.entity.Org;
import com.rainy.base.service.OrgService;
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
        // 当查询某个节点下的所有节点时分页大小为total
        if (param.getId() != null) {
            List<Org> list = orgService.list(param);
            page.setRecords(list);
            page.setTotal(list.size());
            page.setSize(list.size());
            return page;
        }
        return orgService.lambdaQuery()
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
        ExcelUtils.export(response, orgs, "orgs.xls");
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
