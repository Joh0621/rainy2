package com.renguangli.rainy.dmplatfrom.controller;

import com.renguangli.rainy.aop.Log;
import com.renguangli.rainy.common.constant.OperationType;
import com.renguangli.rainy.common.param.IdNamesParam;
import com.renguangli.rainy.common.validation.Group;
import com.renguangli.rainy.dmplatfrom.entity.DataDirectory;
import com.renguangli.rainy.dmplatfrom.entity.Device;
import com.renguangli.rainy.dmplatfrom.service.DataDirectoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/15 10:59
 */
@RestController
@RequiredArgsConstructor
public class DataDirectoryController {

    private final DataDirectoryService dataDirectoryService;

    @GetMapping("/dataDirectories/tree")
    public List<DataDirectory> tree(){
        return dataDirectoryService.tree();
    }

    @Log(module = "数据目录", type = OperationType.ADD, detail = "'新增了数据目录[' + #param.name + '].'")
    @PostMapping("/dataDirectory")
    public Boolean save(@RequestBody @Validated(Group.Add.class) DataDirectory param) {
        return dataDirectoryService.save(param);
    }

    @Log(module = "数据目录", type = OperationType.DEL, detail = "'删除了数据目录[' + #param.names + '].'")
    @PostMapping("/dataDirectories")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return dataDirectoryService.removeBatchByIds(param.getIds());
    }

    @Log(module = "数据目录", type = OperationType.UPDATE, detail = "'更新了数据目录[' + #param.name + '].'")
    @PostMapping("/dataDirectory/update")
    public Boolean update(@Valid @RequestBody DataDirectory param) {
        return dataDirectoryService.updateById(param);
    }

}
