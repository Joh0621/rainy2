package com.rainy.framework.constant;

/**
 * 字典编码常量类
 *
 * @author created by renguangli at 2022/9/1 17:44
 */
public interface DictConstants {

    // 业务相关字典编码 //
    /**
     * 数据专业字典编码
     */
    String BIZ_MAJOR_CODE = "biz_major";
    /**
     * 数据更新频率字典编码
     */
    String BIZ_DATA_UPDATE_FREQUENCY_CODE = "biz_data_update_frequency";


    // 系统相关字典编码 //

    /**
     * 系统配置分类
     */
    String CONFIG_CATEGORY_SYSTEM_CODE = "system";

    /**
     * 目录
     */
    int MENU_TYPE_DIRECTORY_CODE = 0;

    /**
     * 菜单
     */
    int MENU_TYPE_MENU_CODE = 1;

    /**
     * 按钮
     */
    int MENU_TYPE_BUTTON_CODE = 2;

    /**
     * 审批中
     */
    int APPROVE_STATUS_0 = 0;
    /**
     * 审批通过
     */
    int APPROVE_STATUS_1 = 1;
    /**
     * 未通过
     */
    int APPROVE_STATUS_2 = 2;

}
