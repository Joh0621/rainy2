package com.rainy.framework.utils;

import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import org.springframework.http.HttpHeaders;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/5 17:22
 */
public class ExcelUtils {

    private static final String EXCEL_CONTENT_TYPE = "application/vnd.ms-excel;charset=utf-8";
    private static final String CONTENT_DISPOSITION_VALUE = "attachment;filename={}";

    public static <T> void export(HttpServletResponse response, List<T> records, String fileName) throws IOException {
        response.setContentType(EXCEL_CONTENT_TYPE);
        // utf-8 编码
        String fn = URLEncoder.encode(fileName, StandardCharsets.UTF_8);
        response.setHeader(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, StrUtil.format(CONTENT_DISPOSITION_VALUE, fn));
        try (ExcelWriter writer = ExcelUtil.getWriter(); ServletOutputStream out = response.getOutputStream()) {
            writer.write(records, true);
            writer.flush(out, true);
        }
    }

}
