package com.renguangli.rainy.common.validation;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.toolkit.SqlRunner;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * 重复校验器
 *
 * @author Created by renguangli at 2022/9/19 21:40
 */
public class NotUniqueConstraintValidator implements ConstraintValidator<NotUnique,String> {

    private static final String EDIT_URL_PREFIX = "update";
    private static final String UNIQUE_SQL = "select count(*) from {} where {} = {0}";

    private String tableName;
    private String field;

    @Override
    public void initialize(NotUnique notUnique) {
        Class<?> entity = notUnique.entity();
        TableName tableName = entity.getAnnotation(TableName.class);
        this.tableName = tableName.value();
        this.field = notUnique.field();
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        String sql = StrUtil.format(UNIQUE_SQL, tableName, field);
        long count = SqlRunner.db().selectCount(sql, value);
        // todo 判断是新增还是更新(如何判断是更新还是新增以及获取更新的id）
//        String requestURI = WebUtils.getRequestURI();
//        if (requestURI.contains(EDIT_URL_PREFIX)) {
//            return count > 0;
//        }
        return count <= 0;
    }

}
