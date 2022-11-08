package com.rainy.system.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.stp.StpUtil;
import com.rainy.framework.common.Result;
import com.rainy.framework.utils.SecurityUtils;
import lombok.SneakyThrows;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitter;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/11/8 16:30
 */
@RestController
public class SSEController {

    @SneakyThrows
    @GetMapping("/notices")
    public SseEmitter listNotices(){
        String username = SecurityUtils.getUsername();
        SseEmitter sseEmitter = new SseEmitter(2000L);
        Set<ResponseBodyEmitter.DataWithMediaType> data = SseEmitter.event()
                .id(username)
                .data("hello sse")
                .reconnectTime(2000)
                .build();
        sseEmitter.send(data);
        return sseEmitter;
    }

}
