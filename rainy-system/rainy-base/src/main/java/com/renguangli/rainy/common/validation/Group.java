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
    public interface Add {}

    /**
     * 分组校验编辑/更新
     */
    public interface Edit {}

    /**
     * 分组校验删除
     */
    public interface Del {}
}
