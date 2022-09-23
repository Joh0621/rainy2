package com.rainy.service.impl;

import com.rainy.entity.Dict;
import com.rainy.entity.DictItem;
import com.rainy.mapper.DictMapper;
import com.rainy.service.DictItemService;
import com.rainy.service.DictService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * data-middle-platform
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

}
