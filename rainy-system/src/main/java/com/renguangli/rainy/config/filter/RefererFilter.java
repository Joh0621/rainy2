package com.renguangli.rainy.config.filter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.renguangli.rainy.common.Result;
import com.renguangli.rainy.common.ResultCode;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/13 0013 21:12
 */
@Component
@WebFilter(urlPatterns = "/**")
@RequiredArgsConstructor
public class RefererFilter implements Filter {

    private final ObjectMapper objectMapper;

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String referer = request.getHeader(HttpHeaders.REFERER);
        if (referer.equals("")) {
            Result<Object> result = Result.of(ResultCode.ILLEGAL_REQUEST, referer);
            String res = objectMapper.writeValueAsString(result);
            servletResponse.getWriter().write(res);
            return;
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

}
