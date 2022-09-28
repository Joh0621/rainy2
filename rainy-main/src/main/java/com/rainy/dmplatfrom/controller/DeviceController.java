package com.rainy.dmplatfrom.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.base.aop.Log;
import com.rainy.base.common.constant.OpType;
import com.rainy.base.common.param.IdNamesParam;
import com.rainy.base.common.utils.ExcelUtils;
import com.rainy.base.common.validation.Group;
import com.rainy.dmplatfrom.entity.Device;
import com.rainy.dmplatfrom.service.DeviceService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/20 11:23
 */
@RestController
@RequiredArgsConstructor
public class DeviceController {

    private final DeviceService deviceService;

    @GetMapping("/devices")
    public Page<Device> list(Page<Device> page, Device param) {
        return deviceService.lambdaQuery()
                .eq(!Objects.isNull(param.getDataDirectoryId()), Device::getDataDirectoryId, param.getDataDirectoryId())
                .likeRight(StrUtil.isNotBlank(param.getName()), Device::getName, param.getName())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Device::getCode, param.getCode())
                .page(page);
    }

    @GetMapping("/devices/{id:\\d+}")
    public Device detail(@PathVariable Long id) {
        return deviceService.getById(id);
    }

    @Log(module = "设备管理", type = OpType.EXPORT, detail = "导出了设备列表")
    @GetMapping("/devices/export")
    public void export(HttpServletResponse response) throws IOException {
        List<Device> devices = deviceService.list();
        ExcelUtils.export(response, devices, "devices.xls");
    }

    @Log(module = "设备管理", type = OpType.ADD, detail = "'新增了设备[' + #param.name + '].'")
    @PostMapping("/device")
    public Boolean save(@RequestBody @Validated(Group.Add.class) Device param) {
        return deviceService.save(param);
    }

    @Log(module = "设备管理", type = OpType.DEL, detail = "'删除了设备[' + #param.names + '].'")
    @PostMapping("/devices")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return deviceService.removeBatchByIds(param.getIds());
    }

    @Log(module = "设备管理", type = OpType.UPDATE, detail = "'更新了设备[' + #param.name + '].'")
    @PostMapping("/device/update")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) Device param) {
        return deviceService.updateById(param);
    }

}
