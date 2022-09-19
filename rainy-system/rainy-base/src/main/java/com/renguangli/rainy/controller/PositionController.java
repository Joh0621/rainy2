package com.renguangli.rainy.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.renguangli.rainy.common.annotation.Log;
import com.renguangli.rainy.common.constant.OperationType;
import com.renguangli.rainy.common.param.IdNamesParam;
import com.renguangli.rainy.common.utils.ExcelUtils;
import com.renguangli.rainy.entity.Config;
import com.renguangli.rainy.entity.Org;
import com.renguangli.rainy.entity.Position;
import com.renguangli.rainy.service.PositionService;
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
 * @author Created by renguangli at 2022/9/5 17:07
 */
@RestController
@RequiredArgsConstructor
public class PositionController {

    private final PositionService positionService;

    @Log(module = "职位管理", type = OperationType.QUERY, detail = "'查询了职位列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    @GetMapping("/positions")
    public Page<Position> list(Page<Position> page, Org param) {
        return positionService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(param.getName()), Position::getName, param.getName())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Position::getCode, param.getCode())
                .page(page);
    }

    @Log(module = "职位管理", type = OperationType.EXPORT, detail = "导出了职位列表")
    @GetMapping("/positions/export")
    public void export(HttpServletResponse response) throws IOException {
        List<Position> configs = positionService.list();
        ExcelUtils.export(response, configs, "positions.xls");
    }

    @Log(module = "职位管理", type = OperationType.ADD, detail = "'新增了职位[' + #param.name + '].'")
    @PostMapping("/position")
    public Boolean save(@Valid @RequestBody Position param) {
        return positionService.save(param);
    }

    @Log(module = "职位管理", type = OperationType.DEL, detail = "'删除了职位[' + #param.names + '].'")
    @PostMapping("/positions")
    public Boolean remove(@RequestBody @Valid IdNamesParam param) {
        return positionService.lambdaUpdate()
                .in(Position::getId, param.getIds())
                .set(Position::getDelFlag, true)
                .update();
    }

    @Log(module = "职位管理", type = OperationType.UPDATE, detail = "'更新了职位[' + #param.name + '].'")
    @PostMapping("/position/update")
    public Boolean update(@Valid @RequestBody Position param) {
        return positionService.updateById(param);
    }

}
