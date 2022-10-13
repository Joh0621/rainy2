package com.rainy.dmplatfrom.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/13 17:00
 */
@Data
public class AllData {

    private String deviceName;
    private String deviceDesc;
    private String updateFrequency;
    private String major;
    private String responsible;
    private String pointCode;
    private String pointDesc;

}
