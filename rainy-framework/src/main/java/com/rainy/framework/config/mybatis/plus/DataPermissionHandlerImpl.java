package com.rainy.framework.config.mybatis.plus;

import cn.dev33.satoken.spring.SpringMVCUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.handler.DataPermissionHandler;
import com.rainy.framework.annotation.DataPermission;
import com.rainy.framework.constant.CharConstants;
import com.rainy.framework.holder.UrlMethodMappingHolder;
import com.rainy.framework.utils.SecurityUtils;
import com.rainy.framework.utils.WebUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.LongValue;
import net.sf.jsqlparser.expression.StringValue;
import net.sf.jsqlparser.expression.operators.conditional.AndExpression;
import net.sf.jsqlparser.expression.operators.relational.ExpressionList;
import net.sf.jsqlparser.expression.operators.relational.InExpression;
import net.sf.jsqlparser.expression.operators.relational.ItemsList;
import net.sf.jsqlparser.schema.Column;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.List;
import java.util.function.Function;

/**
 * 数据权限拦截器
 *
 * @author Created by renguangli at 2022/10/21 09:24
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class DataPermissionHandlerImpl implements DataPermissionHandler {

    @Override
    public Expression getSqlSegment(Expression where, String mappedStatementId) {
        // 非web环境
        if (!SpringMVCUtil.isWeb()) {
            return where;
        }
        Method method = UrlMethodMappingHolder.getCurrentControllerMethod();
        DataPermission dataPermission = method.getAnnotation(DataPermission.class);
        if (dataPermission == null) {
            return where;
        }
        Column leftExpression = new Column(dataPermission.value());
        if (StrUtil.isNotBlank(dataPermission.field())) {
            leftExpression = new Column(dataPermission.field());
        }
        ItemsList itemsList = new ExpressionList(getExpressions());
        InExpression inExpression = new InExpression(leftExpression, itemsList);
        return new AndExpression(where, inExpression);
    }

    private List<Expression> getExpressions() {
        List<Long> orgIds = SecurityUtils.getUserinfo().getOrgIds();
        return orgIds.stream()
                .map((Function<Long, Expression>) LongValue::new)
                .toList();
    }

}
