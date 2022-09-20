package com.renguangli.rainy.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.renguangli.rainy.aop.Log;
import com.renguangli.rainy.common.constant.OperationType;
import com.renguangli.rainy.common.param.IdNamesParam;
import com.renguangli.rainy.common.utils.ExcelUtils;
import com.renguangli.rainy.common.validation.Group;
import com.renguangli.rainy.entity.Dict;
import com.renguangli.rainy.service.DictService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
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

    @Log(module = "字典管理", type = OperationType.QUERY, detail = "'查询了字典列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    @GetMapping("/dicts")
    public Page<Dict> list(Page<Dict> page, Dict param) {
        return dictService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(param.getName()), Dict::getName, param.getName())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Dict::getCode, param.getCode())
                .eq(StrUtil.isNotBlank(param.getCategoryCode()), Dict::getCategoryCode, param.getCategoryCode())
                .page(page);
    }

    @Log(module = "字典管理", type = OperationType.EXPORT, detail = "导出了字典列表")
    @GetMapping("/dicts/export")
    public void export(HttpServletResponse response) throws IOException {
        List<Dict> configs = dictService.list();
        ExcelUtils.export(response, configs, "dicts.xls");
    }

    @Log(module = "字典管理", type = OperationType.ADD, detail = "'新增了字典[' + #param.name + '].'")
    @PostMapping("/dict")
    public boolean save(@RequestBody @Validated(Group.Add.class) Dict param) {
        return dictService.save(param);
    }

    @Log(module = "字典管理", type = OperationType.DEL, detail = "'删除了字典[' + #param.names + '].'")
    @PostMapping("/dicts")
    public boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return dictService.removeBatchByIds(param.getIds());
    }

    @Log(module = "字典管理", type = OperationType.UPDATE, detail = "'更新了字典[' + #param.name + '].'")
    @PostMapping("/dict/update")
    public boolean update(@RequestBody @Validated(Group.Edit.class) Dict param) {
        return dictService.updateById(param);
    }

}
