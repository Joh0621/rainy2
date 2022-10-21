package com.rainy.framework.config.mybatis;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.handler.DataPermissionHandler;
import com.baomidou.mybatisplus.extension.plugins.inner.DataPermissionInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import com.rainy.framework.config.mybatis.plus.DataPermissionHandlerImpl;
import com.rainy.framework.utils.SecurityUtils;
import org.apache.ibatis.reflection.MetaObject;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDateTime;

/**
 * mybatis 配置类
 *
 * @author Created by renguangli at 2022/9/20 22:46
 */
@Configuration
@MapperScan(value = {"com.rainy.**.mapper"})
public class MybatisConfig {

    private static final String CREATE_BY_FIELD = "createBy";
    private static final String CREATE_TIME_FIELD = "createTime";
    private static final String UPDATE_BY_FIELD = "updateBy";
    private static final String UPDATE_TIME_FIELD = "updateTime";

    /**
     * 分页插件
     */
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        // 多租户插件
        // 数据权限插件
        interceptor.addInnerInterceptor(new DataPermissionInterceptor(dataPermissionHandler()));
        //  分页插件
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        return interceptor;
    }

    @Bean
    public DataPermissionHandler dataPermissionHandler(){
        return new DataPermissionHandlerImpl();
    }

    /**
     * 自动填充时间：创建时间和更新时间,创建人更新人，删除标志
     */
    @Bean
    public MetaObjectHandler metaObjectHandler() {
        return new MetaObjectHandler() {
            @Override
            public void insertFill(MetaObject metaObject) {
                this.setFieldValByName(CREATE_TIME_FIELD, LocalDateTime.now(), metaObject);
                this.setFieldValByName(CREATE_BY_FIELD, SecurityUtils.getUsername(), metaObject);
                this.updateFill(metaObject);
            }

            @Override
            public void updateFill(MetaObject metaObject) {
                this.setFieldValByName(UPDATE_TIME_FIELD, LocalDateTime.now(), metaObject);
                this.setFieldValByName(UPDATE_BY_FIELD, SecurityUtils.getUsername(), metaObject);
            }
        };
    }
}
