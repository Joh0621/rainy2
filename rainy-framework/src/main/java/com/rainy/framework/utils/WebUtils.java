package com.rainy.framework.utils;

import cn.hutool.core.util.StrUtil;
import cn.hutool.http.ContentType;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.rainy.framework.constant.CharConstants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/19 21:17
 */
@Slf4j
public final class WebUtils {

    private static final String UNKNOWN = "unknown";
    private static final String UNKNOWN_ZH = "未知";
    private static final String IPV4_LOCAL_IP = "127.0.0.1";
    private static final String IPV6_LOCAL_IP = "0:0:0:0:0:0:0:1";
    private static final List<String> ipHeaders = Arrays.asList("X-Forwarded-For", "Proxy-Client-IP", "WL-Proxy-Client-IP", "HTTP_CLIENT_IP", "HTTP_X_FORWARDED_FOR", "X-Real-IP");

    private static final String EXCEL_CONTENT_TYPE = "application/vnd.ms-excel;charset=utf-8";
    private static final String CONTENT_DISPOSITION_VALUE = "attachment;filename={}";

    /**
     * Get browser
     *
     * @return the browser
     */
    public static String getBrowser() {
        UserAgent userAgent = getUserAgent();
        if (userAgent == null) {
            return UNKNOWN_ZH;
        }
        String name = userAgent.getBrowser().getName();
        if (UNKNOWN.equalsIgnoreCase(name)) {
            return UNKNOWN_ZH;
        }
        return name;
    }

    /**
     * Get browser
     *
     * @return the browser
     */
    public static String getOs() {
        UserAgent userAgent = getUserAgent();
        if (userAgent == null) {
            return UNKNOWN_ZH;
        }
        String name = userAgent.getOs().getName();
        if (UNKNOWN.equalsIgnoreCase(name)) {
            return UNKNOWN_ZH;
        }
        return name;
    }

    public static UserAgent getUserAgent() {
        String userAgentStr = getRequest().getHeader(HttpHeaders.USER_AGENT);
        return UserAgentUtil.parse(userAgentStr);
    }

    public static String getRemoteIp() {
        HttpServletRequest request = getRequest();
        for (String header : ipHeaders) {
            String ip = request.getHeader(header);
            if (isValid(ip)) {
                return ip.split(CharConstants.COMMA)[0];
            }
        }
        String ip = request.getRemoteAddr();
        return IPV6_LOCAL_IP.equals(ip) ? IPV4_LOCAL_IP : ip;
    }

    private static boolean isValid(String ip) {
        return StrUtil.isNotBlank(ip) && !UNKNOWN.equalsIgnoreCase(ip);
    }

    /**
     * 从上下文中获取 HttpServletRequest
     *
     * @return HttpServletRequest
     */
    public static HttpServletRequest getRequest() {
        return getAttributes().getRequest();
    }

    /**
     * 从上下文中获取 HttpServletRequest
     *
     * @return HttpServletRequest
     */
    public static HttpServletResponse getResponse() {
        return getAttributes().getResponse();
    }

    /**
     * 从上下文中获取 servletRequestAttributes
     *
     * @return servletRequestAttributes
     */
    public static ServletRequestAttributes getAttributes() {
        // 获取 servletRequestAttributes
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (servletRequestAttributes == null) {
            throw new RuntimeException("非 web 上下文，无法获取 Request.");
        }
        return servletRequestAttributes;
    }

    public static <T> void exportExcel(HttpServletResponse response, List<T> records, String fileName) throws IOException {
        response.setContentType(EXCEL_CONTENT_TYPE);
        String name = URLEncoder.encode(fileName, StandardCharsets.UTF_8);        // utf-8 编码
        response.setHeader(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, StrUtil.format(CONTENT_DISPOSITION_VALUE, name));
        try (ExcelWriter writer = ExcelUtil.getWriter(); ServletOutputStream out = response.getOutputStream()) {
            writer.write(records, true);
            writer.flush(out, true);
        }
    }

    public static void download(HttpServletResponse response, String fileName, byte[] content) throws IOException {
        String name = URLEncoder.encode(fileName, StandardCharsets.UTF_8);
        response.setContentType(ContentType.OCTET_STREAM.getValue());
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, StrUtil.format(CONTENT_DISPOSITION_VALUE, name));
        try (ServletOutputStream out = response.getOutputStream()) {
            out.write(content);
        }
    }

    public static String getRequestURI() {
        return getRequest().getRequestURI();
    }

    public static String getRequestMethod() {
        return getRequest().getMethod();
    }
}
