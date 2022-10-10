package com.rainy.base.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.hutool.core.io.FileUtil;
import com.rainy.base.common.constant.ConfigConstants;
import com.rainy.base.common.utils.WebUtils;
import com.rainy.base.service.ConfigService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/10 15:07
 */
@RestController
@RequiredArgsConstructor
public class FileController {

    private final ConfigService configService;

    @SaIgnore
    @GetMapping("/file/download")
    public void download(HttpServletResponse response, String fileName) throws IOException {
        String basePath = configService.get(ConfigConstants.SYS_FILE_STORAGE_PATH);
        byte[] bytes = FileUtil.readBytes(basePath + fileName);
        WebUtils.download(response, fileName, bytes);

    }

}
