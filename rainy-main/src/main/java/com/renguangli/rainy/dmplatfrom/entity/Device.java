package com.renguangli.rainy.dmplatfrom.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/15 10:01
 */
@Data
@TableName("t_device")
public class Device {

    private Long id;
    private String name;
    private String code;
    private String station;
    private String major;

}
