package com.rainy.system.service.impl;

import com.rainy.system.entity.Dict;
import com.rainy.system.entity.DictItem;
import com.rainy.system.mapper.DictMapper;
import com.rainy.system.service.DictItemService;
import com.rainy.system.service.DictService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/5 19:36
 */
@Service
@RequiredArgsConstructor
public class DictServiceImpl extends BaseServiceImpl<DictMapper, Dict> implements DictService {

    private final DictItemService dictItemService;

    @Override
    public Map<String, Map<String, Object>> getDictTree() {
        Map<String, Map<String, Object>> result = new HashMap<>();

        List<Dict> dicts = this.list();
        dicts.forEach(d -> {
            Map<String, Object> dict = new LinkedHashMap<>();
            dict.put("name", d.getName());
            dict.put("dataType", d.getDataType());
            dict.put("items", new LinkedHashMap<>());
            result.put(d.getCode(), dict);
        });

        List<DictItem> list = dictItemService.list();
        list.stream()
                .collect(Collectors.groupingBy(DictItem::getDictCode))
                .forEach((key, value) -> {
                    Map<String, Object> items = new LinkedHashMap<>();
                    value.forEach(item -> items.put(item.getCode(), item.getValue()));
                    Map<String, Object> data = result.get(key);
                    if (data != null) {
                        data.put("items", items);
                    }
                });
        return result;
    }

    /**
     * 删除字典以及字典项
     *
     * @param ids ids
     * @return boolean
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean removeBatchByIds(List<Long> ids) {
        List<Dict> list = this.lambdaQuery()
                .select(Dict::getCode)
                .in(Dict::getId, ids)
                .list();
        List<String> dictCodes = list.stream()
                .map(Dict::getCode)
                .toList();
        dictItemService.lambdaUpdate()
                .in(DictItem::getDictCode, dictCodes)
                .remove();
        return super.removeBatchByIds(ids);
    }

}
