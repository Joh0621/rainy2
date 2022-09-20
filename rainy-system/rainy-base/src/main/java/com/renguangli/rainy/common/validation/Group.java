package com.renguangli.rainy.common.validation;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/19 21:55
 */
public interface Group {

    /**
     * 分组校验添加
     */
    interface Add {}

    /**
     * 分组校验编辑/更新
     */
    interface Edit {}

    /**
     * 分组校验删除
     */
    interface Del {}

    /**
     * 分组校验: 分配菜单或者分配角色
     */
    interface ASSIGN {}
}
