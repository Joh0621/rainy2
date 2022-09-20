package com.renguangli.rainy.common.param;

import com.renguangli.rainy.common.validation.Group;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.util.List;

/**
 * id,name 进行一些操作(删除，赋权...)时方便记录日志，
 * 不然只能记录id或从数据库中查询
 *
 * @author Created by renguangli at 2022/9/5 17:07
 */
@Data
public class IdNamesParam {

    private Long id;
    private String name;
    @NotEmpty(groups = {Group.Del.class})
    private List<Long> ids;
    private List<String> names;

}
