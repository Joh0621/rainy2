package com.rainy.workflow.entity;

import lombok.Data;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/18 12:14
 */
@Data
public class Var {

    private String name;
    private Object value;

    public Var(String name, Object value) {
        this.name = name;
        this.value = value;
    }
}
