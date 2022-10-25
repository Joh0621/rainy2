package com.rainy.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.framework.annotation.Log;
import com.rainy.framework.common.IdNamesParam;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.utils.WebUtils;
import com.rainy.framework.validation.Group;
import com.rainy.system.entity.DictItem;
import com.rainy.system.service.DictItemService;
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
 * rainy
 *
 * @author Created by renguangli at 2022/9/5 19:36
 */
@RestController
@RequiredArgsConstructor
public class DictItemController {

    private final DictItemService dictItemService;

    @GetMapping("/dictItems")
    @SaCheckPermission("dictItem:query")
    @Log(module = "字典项管理", type = OpType.QUERY, detail = "'查询了字典项列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    public Page<DictItem> list(Page<DictItem> page, DictItem param) {
        return dictItemService.lambdaQuery()
                .eq(StrUtil.isNotBlank(param.getDictCode()), DictItem::getDictCode, param.getDictCode())
                .likeRight(StrUtil.isNotBlank(param.getCode()), DictItem::getCode, param.getCode())
                .likeRight(StrUtil.isNotBlank(param.getValue()), DictItem::getValue, param.getValue())
                .page(page);
    }

    @GetMapping("/dictItems/export")
    @SaCheckPermission("dictItem:export")
    @Log(module = "字典项管理", type = OpType.EXPORT, detail = "导出了字典项列表")
    public void export(HttpServletResponse response) throws IOException {
        List<DictItem> configs = dictItemService.list();
        WebUtils.exportExcel(response, configs, "dictItems.xls");
    }

    @PostMapping("/dictItem")
    @SaCheckPermission("dictItem:add")
    @Log(module = "字典项管理", type = OpType.ADD, detail = "'新增了字典项[' + #param.value + '].'")
    public boolean save(@RequestBody @Validated(Group.Add.class) DictItem param) {
        return dictItemService.save(param);
    }

    @PostMapping("/dictItems")
    @SaCheckPermission("dictItem:del")
    @Log(module = "字典项管理", type = OpType.DEL, detail = "'删除了字典项[' + #param.names + '].'")
    public boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return dictItemService.removeBatchByIds(param.getIds());
    }

    @PostMapping("/dictItem/update")
    @SaCheckPermission("dictItem:update")
    @Log(module = "字典项管理", type = OpType.UPDATE, detail = "'更新了字典项[' + #param.value + '].'")
    public boolean update(@RequestBody @Validated(Group.Edit.class) DictItem param) {
        return dictItemService.updateById(param);
    }

}
