package com.rainy.base.common.validation.unique;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.toolkit.SqlRunner;
import com.rainy.base.common.constant.CommonConstants;
import com.rainy.base.common.utils.WebUtils;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * 重复校验器
 *
 * @author Created by renguangli at 2022/9/19 21:40
 */
public class NotUniqueConstraintValidator implements ConstraintValidator<NotUnique, String> {

    private static final String UNIQUE_SQL = "select count(*) from {} where {} = {0}";
    private static final String UNIQUE_SQL_EXCLUDE_SELF = "select count(*) from {} where {} = {0} and id != {1}";

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
        Object id = WebUtils.getRequest().getAttribute(CommonConstants.ID);
        if (id != null) {
            String sql = StrUtil.format(UNIQUE_SQL_EXCLUDE_SELF, tableName, field);
            return SqlRunner.db().selectCount(sql, value, id) <= 0;
        }
        String sql = StrUtil.format(UNIQUE_SQL, tableName, field);
        long count = SqlRunner.db().selectCount(sql, value);
        return count <= 0;
    }

}
