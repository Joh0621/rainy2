package com.rainy.dmplatfrom.controller;

import com.rainy.dmplatfrom.entity.DataDirectory;
import com.rainy.dmplatfrom.service.DataDirectoryService;
import com.rainy.framework.annotation.Log;
import com.rainy.framework.common.IdNamesParam;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.validation.Group;
import com.rainy.system.entity.Org;
import com.rainy.system.service.OrgService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/15 10:59
 */
@RestController
@RequiredArgsConstructor
public class DataDirectoryController {

    private final DataDirectoryService dataDirectoryService;
    private final OrgService orgService;

    @GetMapping("/dataDirectories/tree")
    public List<DataDirectory> tree() {
        return dataDirectoryService.tree();
    }

    @Log(module = "数据目录", type = OpType.ADD, detail = "'新增了数据目录[' + #param.name + '].'")
    @PostMapping("/dataDirectory")
    public Boolean save(@RequestBody @Validated(Group.Add.class) DataDirectory param) {
        Org org = orgService.getById(param.getOrgId());
        param.setOrgName(org.getName());
        return dataDirectoryService.save(param);
    }

    @Log(module = "数据目录", type = OpType.DEL, detail = "'删除了数据目录[' + #param.names + '].'")
    @PostMapping("/dataDirectories")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return dataDirectoryService.removeBatchByIds(param.getIds());
    }

    @Log(module = "数据目录", type = OpType.UPDATE, detail = "'更新了数据目录[' + #param.name + '].'")
    @PostMapping("/dataDirectory/update")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) DataDirectory param) {
        Org org = orgService.getById(param.getOrgId());
        param.setOrgName(org.getName());
        return dataDirectoryService.updateById(param);
    }

}
