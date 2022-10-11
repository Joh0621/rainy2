package com.rainy.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.framework.common.IdNamesParam;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.utils.WebUtils;
import com.rainy.framework.validation.Group;
import com.rainy.framework.annotation.Log;
import com.rainy.system.entity.Dict;
import com.rainy.system.service.DictService;
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
 * @author Created by renguangli at 2022/9/5 19:36
 */
@RestController
@RequiredArgsConstructor
public class DictController {

    private final DictService dictService;

    @GetMapping("/dicts")
    @SaCheckPermission("dict:query")
    @Log(module = "字典管理", type = OpType.QUERY, detail = "'查询了字典列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    public Page<Dict> list(Page<Dict> page, Dict param) {
        return dictService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(param.getName()), Dict::getName, param.getName())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Dict::getCode, param.getCode())
                .eq(StrUtil.isNotBlank(param.getCategoryCode()), Dict::getCategoryCode, param.getCategoryCode())
                .page(page);
    }

    @GetMapping("/dicts/export")
    @SaCheckPermission("dict:export")
    @Log(module = "字典管理", type = OpType.EXPORT, detail = "导出了字典列表")
    public void export(HttpServletResponse response) throws IOException {
        List<Dict> configs = dictService.list();
        WebUtils.exportExcel(response, configs, "dicts.xls");
    }

    @PostMapping("/dict")
    @SaCheckPermission("dict:add")
    @Log(module = "字典管理", type = OpType.ADD, detail = "'新增了字典[' + #param.name + '].'")
    public boolean save(@RequestBody @Validated(Group.Add.class) Dict param) {
        return dictService.save(param);
    }

    @PostMapping("/dicts")
    @SaCheckPermission("dict:del")
    @Log(module = "字典管理", type = OpType.DEL, detail = "'删除了字典[' + #param.names + '].'")
    public boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return dictService.removeBatchByIds(param.getIds());
    }

    @PostMapping("/dict/update")
    @SaCheckPermission("dict:update")
    @Log(module = "字典管理", type = OpType.UPDATE, detail = "'更新了字典[' + #param.name + '].'")
    public boolean update(@RequestBody @Validated(Group.Edit.class) Dict param) {
        return dictService.updateById(param);
    }

}
