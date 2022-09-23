package com.rainy.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rainy.entity.Menu;
import com.rainy.mapper.MenuMapper;
import com.rainy.service.MenuService;
import org.springframework.stereotype.Service;

/**
 * rainy
 *
 * @author renguangli
 * @date 2022/9/1 17:41
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

}
