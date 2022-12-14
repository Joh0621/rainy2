package com.rainy.framework.common;

import com.rainy.framework.validation.Group;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * id,name 进行一些操作(删除，赋权...)时方便记录日志，
 * 不然只能记录id或从数据库中查询
 *
 * @author Created by renguangli at 2022/9/5 17:07
 */
@Data
public class IdNamesParam {

    @NotNull(groups = Group.ASSIGN.class)
    private Long id;
    private String name;

    @NotEmpty(groups = {Group.Del.class, Group.ASSIGN.class})
    private List<Long> ids;
    private List<String> names;
    /**
     * 半选id列表, 分配菜单时使用,其他地方不用传
     */
    private List<Long> halfIds;

}
