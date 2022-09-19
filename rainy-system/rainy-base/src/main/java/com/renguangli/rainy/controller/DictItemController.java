package com.renguangli.rainy.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.renguangli.rainy.aop.Log;
import com.renguangli.rainy.common.constant.OperationType;
import com.renguangli.rainy.common.param.IdNamesParam;
import com.renguangli.rainy.common.utils.ExcelUtils;
import com.renguangli.rainy.entity.DictItem;
import com.renguangli.rainy.service.DictItemService;
import lombok.RequiredArgsConstructor;
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
public class DictItemController {

    private final DictItemService dictItemService;

    @Log(module = "字典项管理", type = OperationType.QUERY, detail = "'查询了字典项列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    @GetMapping("/dictItems")
    public Page<DictItem> list(Page<DictItem> page, DictItem param) {
        return dictItemService.lambdaQuery()
                .eq(StrUtil.isNotBlank(param.getDictCode()), DictItem::getDictCode, param.getDictCode())
                .likeRight(StrUtil.isNotBlank(param.getCode()), DictItem::getCode, param.getCode())
                .page(page);
    }

    @Log(module = "字典项管理", type = OperationType.EXPORT, detail = "导出了字典项列表")
    @GetMapping("/dictItems/export")
    public void export(HttpServletResponse response) throws IOException {
        List<DictItem> configs = dictItemService.list();
        ExcelUtils.export(response, configs, "dictItems.xls");
    }

    @Log(module = "字典项管理", type = OperationType.ADD, detail = "'新增了字典项[' + #param.name + '].'")
    @PostMapping("/dictItem")
    public boolean save(@Valid @RequestBody DictItem param) {
        return dictItemService.save(param);
    }

    @Log(module = "字典项管理", type = OperationType.DEL, detail = "'删除了字典项[' + #param.names + '].'")
    @PostMapping("/dictItems")
    public boolean remove(@RequestBody @Valid IdNamesParam param) {
        return dictItemService.removeBatchByIds(param.getIds());
    }

    @Log(module = "字典项管理", type = OperationType.UPDATE, detail = "'更新了字典项[' + #param.name + '].'")
    @PostMapping("/dictItem/update")
    public boolean update(@Valid @RequestBody DictItem param) {
        return dictItemService.updateById(param);
    }

}
