package com.rainy.dmplatfrom.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.cell.CellHandler;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.dmplatfrom.entity.AllData;
import com.rainy.dmplatfrom.entity.DataDirectory;
import com.rainy.dmplatfrom.service.DataDirectoryService;
import com.rainy.dmplatfrom.service.ExcelService;
import com.rainy.framework.annotation.Log;
import com.rainy.framework.common.Result;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.common.IdNamesParam;
import com.rainy.framework.utils.WebUtils;
import com.rainy.framework.validation.Group;
import com.rainy.dmplatfrom.entity.Device;
import com.rainy.dmplatfrom.service.DeviceService;
import com.rainy.system.entity.Org;
import com.rainy.system.service.OrgService;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.Console;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/20 11:23
 */
@RestController
@RequiredArgsConstructor
public class DeviceController {

    private final OrgService orgService;
    private final DataDirectoryService dataDirectoryService;
    private final DeviceService deviceService;
    private final ExcelService excelService;

    @GetMapping("/devices")
    public Page<Device> list(Page<Device> page, Device param) {
        return deviceService.lambdaQuery()
                .eq(!Objects.isNull(param.getDataDirectoryId()), Device::getDataDirectoryId, param.getDataDirectoryId())
                .likeRight(StrUtil.isNotBlank(param.getName()), Device::getName, param.getName())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Device::getCode, param.getCode())
                .page(page);
    }

    @GetMapping("/devices/{deviceCode}")
    public Device detail(@PathVariable String deviceCode) {
        return deviceService.lambdaQuery()
                .eq(Device::getCode, deviceCode)
                .one();
    }

    @Log(module = "设备管理", type = OpType.EXPORT, detail = "导出了设备列表")
    @GetMapping("/devices/export")
    public void export(HttpServletResponse response) throws IOException {
        List<Device> devices = deviceService.list();
        WebUtils.exportExcel(response, devices, "devices.xls");
    }

    @Log(module = "设备管理", type = OpType.EXPORT, detail = "导入了设备列表")
    @PostMapping("/devices/import")
    public Object importExcel(@RequestParam("file") MultipartFile file) throws IOException {
        ExcelReader reader = ExcelUtil.getReader(file.getInputStream());
        List<String> sheetNames = reader.getSheetNames();
        // 读取所有sheet
        List<Map<String, List<AllData>>> allData = new ArrayList<>();
        for (String sheetName : sheetNames) {
            reader.setSheet(sheetName);
            Map<String, List<AllData>> data = new LinkedHashMap<>();
            data.put(sheetName, reader.readAll(AllData.class));
            allData.add(data);
        }
        excelService.saveAll(allData);
        return Result.ok();
    }

    @Log(module = "设备管理", type = OpType.ADD, detail = "'新增了设备[' + #param.name + '].'")
    @PostMapping("/device")
    public Boolean save(@RequestBody @Validated(Group.Add.class) Device param) {
        DataDirectory dataDirectory = dataDirectoryService.getById(param.getDataDirectoryId());
        param.setDataDirectoryName(dataDirectory.getName());
        Org org = orgService.getById(param.getOrgId());
        param.setOrgName(org.getName());
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
        DataDirectory dataDirectory = dataDirectoryService.getById(param.getDataDirectoryId());
        param.setDataDirectoryName(dataDirectory.getName());
        Org org = orgService.getById(param.getOrgId());
        param.setOrgName(org.getName());
        return deviceService.updateById(param);
    }

}
