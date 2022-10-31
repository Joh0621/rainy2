package com.rainy.dmplatfrom.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.dmplatfrom.entity.ApiRecord;
import com.rainy.dmplatfrom.entity.ApiRecordStatistics;
import com.rainy.dmplatfrom.entity.Interface;
import com.rainy.dmplatfrom.service.ApiRecordService;
import com.rainy.dmplatfrom.service.InterfaceService;
import com.rainy.framework.annotation.Log;
import com.rainy.framework.common.IdNamesParam;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.utils.WebUtils;
import com.rainy.framework.validation.Group;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/25 18:10
 */
@RestController
@RequiredArgsConstructor
public class InterfaceController {

    private final InterfaceService interfaceService;
    private final ApiRecordService apiRecordService;

    @GetMapping("/interfaces")
    public Page<Interface> list(Page<Interface> page, Interface param) {
        Page<Interface> pageData = interfaceService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(param.getName()), Interface::getName, param.getName())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Interface::getCode, param.getCode())
                .page(page);
        Map<String, ApiRecordStatistics> res = apiRecordService.statistics();
        for (Interface record : pageData.getRecords()) {
            ApiRecordStatistics r = res.get(record.getCode());
            if (r == null) {
                continue;
            }
            record.setTotalCount(r.getTotalCount());
            record.setAvgResponseTime(r.getAvgResponseTime());
            record.setTotalDataSize(r.getTotalDataSize());
        }
        return pageData;
    }

    @Log(module = "接口管理", type = OpType.EXPORT, detail = "导出了接口列表")
    @GetMapping("/interfaces/export")
    public void export(HttpServletResponse response) throws IOException {
        List<Interface> interfaces = interfaceService.list();
        WebUtils.exportExcel(response, interfaces, "interfaces.xls");
    }

    @Log(module = "接口管理", type = OpType.ADD, detail = "'新增了接口[' + #param.name + '].'")
    @PostMapping("/interface")
    public Boolean save(@RequestBody @Validated(Group.Add.class) Interface param) {
        return interfaceService.save(param);
    }

    @Log(module = "接口管理", type = OpType.DEL, detail = "'删除了接口[' + #param.names + '].'")
    @PostMapping("/interfaces")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return interfaceService.removeBatchByIds(param.getIds());
    }

    @Log(module = "接口管理", type = OpType.UPDATE, detail = "'更新了接口[' + #param.name + '].'")
    @PostMapping("/interface/update")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) Interface param) {
        return interfaceService.updateById(param);
    }

}
