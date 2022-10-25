package com.rainy.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.framework.annotation.Log;
import com.rainy.framework.common.IdNamesParam;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.utils.WebUtils;
import com.rainy.framework.validation.Group;
import com.rainy.system.entity.Org;
import com.rainy.system.entity.Position;
import com.rainy.system.service.PositionService;
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
 * @author Created by renguangli at 2022/9/5 17:07
 */
@RestController
@RequiredArgsConstructor
public class PositionController {

    private final PositionService positionService;

    @GetMapping("/positions")
    @SaCheckPermission("position:query")
    @Log(module = "职位管理", type = OpType.QUERY, detail = "'查询了职位列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    public Page<Position> list(Page<Position> page, Org param) {
        return positionService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(param.getName()), Position::getName, param.getName())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Position::getCode, param.getCode())
                .page(page);
    }

    @GetMapping("/positions/export")
    @SaCheckPermission("position:export")
    @Log(module = "职位管理", type = OpType.EXPORT, detail = "导出了职位列表")
    public void export(HttpServletResponse response) throws IOException {
        List<Position> positions = positionService.list();
        WebUtils.exportExcel(response, positions, "positions.xls");
    }

    @PostMapping("/position")
    @SaCheckPermission("position:add")
    @Log(module = "职位管理", type = OpType.ADD, detail = "'新增了职位[' + #param.name + '].'")
    public Boolean save(@RequestBody @Validated(Group.Add.class) Position param) {
        return positionService.save(param);
    }

    @PostMapping("/positions")
    @SaCheckPermission("position:del")
    @Log(module = "职位管理", type = OpType.DEL, detail = "'删除了职位[' + #param.names + '].'")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return positionService.removeBatchByIds(param.getIds());
    }

    @PostMapping("/position/update")
    @SaCheckPermission("position:update")
    @Log(module = "职位管理", type = OpType.UPDATE, detail = "'更新了职位[' + #param.name + '].'")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) Position param) {
        return positionService.updateById(param);
    }

}
