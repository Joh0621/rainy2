package com.rainy.dmplatfrom.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.dmplatfrom.entity.Point;
import com.rainy.dmplatfrom.service.PointService;
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

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/20 17:06
 */
@RestController
@RequiredArgsConstructor
public class PointController {

    private final PointService pointService;

    @GetMapping("/points")
    public Page<Point> list(Page<Point> page, Point param) {
        return pointService.lambdaQuery()
                .eq(Point::getDeviceCode, param.getDeviceCode())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Point::getCode, param.getCode())
                .likeRight(StrUtil.isNotBlank(param.getName()), Point::getName, param.getName())
                .page(page);
    }

    @Log(module = "点码管理", type = OpType.EXPORT, detail = "导出了点码列表")
    @GetMapping("/points/export")
    public void export(HttpServletResponse response) throws IOException {
        List<Point> points = pointService.list();
        WebUtils.exportExcel(response, points, "points.xls");
    }

    @Log(module = "点码管理", type = OpType.ADD, detail = "'新增了点码[' + #param.name + '].'")
    @PostMapping("/point")
    public Boolean save(@RequestBody @Validated(Group.Add.class) Point param) {
        return pointService.save(param);
    }

    @Log(module = "点码管理", type = OpType.DEL, detail = "'删除了点码[' + #param.names + '].'")
    @PostMapping("/points")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return pointService.removeBatchByIds(param.getIds());
    }

    @Log(module = "点码管理", type = OpType.UPDATE, detail = "'更新了点码[' + #param.name + '].'")
    @PostMapping("/point/update")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) Point param) {
        return pointService.updateById(param);
    }

}
