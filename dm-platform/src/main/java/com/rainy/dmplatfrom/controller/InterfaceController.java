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
import java.util.HashMap;
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
    public Page<ApiRecordStatistics> list(Page<ApiRecordStatistics> page, ApiRecordStatistics param) {
        List<Interface> list = interfaceService.list();
        Map<String, String> map = new HashMap<>();
        for (Interface anInterface : list) {
            map.put(anInterface.getCode(), anInterface.getName());
        }
        List<ApiRecordStatistics> statistics = apiRecordService.statistics();
        for (ApiRecordStatistics statistic : statistics) {
            statistic.setApiName(map.get(statistic.getApiCode()));
        }
        page.setRecords(statistics);
        return page;
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
