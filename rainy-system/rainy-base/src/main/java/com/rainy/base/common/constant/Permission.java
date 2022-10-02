package com.rainy.base.common.constant;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/29 12:25
 */
public enum Permission {

    CONFIG_QUERY(Permission.CONFIG_QUERY_CODE, "查询配置列表"),
    CONFIG_ADD(Permission.CONFIG_ADD_CODE, "新增配置"),
    CONFIG_DEL(Permission.CONFIG_DEL_CODE, "删除配置"),
    CONFIG_UPDATE(Permission.CONFIG_UPDATE_CODE, "更新配置"),
    CONFIG_EXPORT(Permission.CONFIG_EXPORT_CODE, "导出配置列表"),

    DICT_QUERY(Permission.DICT_QUERY_CODE, "查询配置列表"),
    DICT_ADD(Permission.DICT_ADD_CODE, "新增配置"),
    DICT_DEL(Permission.DICT_DEL_CODE, "删除配置"),
    DICT_UPDATE(Permission.DICT_UPDATE_CODE, "更新配置"),
    DICT_EXPORT(Permission.DICT_EXPORT_CODE, "导出配置列表");




    public static final String CONFIG_QUERY_CODE = "config:query";
    public static final String CONFIG_ADD_CODE = "config:add";
    public static final String CONFIG_DEL_CODE = "config:del";
    public static final String CONFIG_UPDATE_CODE = "config:update";
    public static final String CONFIG_EXPORT_CODE = "config:export";

    public static final String DICT_QUERY_CODE = "config:query";
    public static final String DICT_ADD_CODE = "config:add";
    public static final String DICT_DEL_CODE = "config:del";
    public static final String DICT_UPDATE_CODE = "config:update";
    public static final String DICT_EXPORT_CODE = "config:export";

    private final String code;
    private final String description;

    Permission(String code, String description) {
        this.code = code;
        this.description = description;
    }

    public String code() {
        return code;
    }

    public String description() {
        return description;
    }

    public static String description(String code) {
        for (Permission permission : values()) {
            if (permission.code.equals(code) ) {
                return permission.description;
            }
        }
        return code;
    }

}
