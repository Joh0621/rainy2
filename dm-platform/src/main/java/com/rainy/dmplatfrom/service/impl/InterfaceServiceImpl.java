package com.rainy.dmplatfrom.service.impl;

import com.rainy.dmplatfrom.entity.Interface;
import com.rainy.dmplatfrom.mapper.InterfaceMapper;
import com.rainy.dmplatfrom.service.InterfaceService;
import com.rainy.system.service.impl.BaseServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/25 18:09
 */
@Service
@RequiredArgsConstructor
public class InterfaceServiceImpl extends BaseServiceImpl<InterfaceMapper, Interface> implements InterfaceService {

}
