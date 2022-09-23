package com.rainy.dataway;

import lombok.RequiredArgsConstructor;
import net.hasor.core.ApiBinder;
import net.hasor.core.DimModule;
import net.hasor.db.JdbcModule;
import net.hasor.db.Level;
import net.hasor.spring.SpringModule;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/20 0020 22:33
 */
@DimModule
@Component
@RequiredArgsConstructor
public class DatawayModule implements SpringModule {

    private final DataSource dataSource;

    @Override
    public void loadModule(ApiBinder apiBinder) throws Throwable {
        // .DataSource form Spring boot into Hasor
        apiBinder.installModule(new JdbcModule(Level.Full, this.dataSource));
        // .custom DataQL
        //apiBinder.tryCast(QueryApiBinder.class).loadUdfSource(apiBinder.findClass(DimUdfSource.class));
        //apiBinder.tryCast(QueryApiBinder.class).bindFragment("sql", SqlFragment.class);
    }

}

