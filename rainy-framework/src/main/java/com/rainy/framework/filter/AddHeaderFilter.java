package com.rainy.framework.filter;

import lombok.RequiredArgsConstructor;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/13 18:09
 */
@Component
@Order(Integer.MIN_VALUE)
@WebFilter(urlPatterns = "/**")
@RequiredArgsConstructor
public class AddHeaderFilter implements Filter {

//    private final DictItemService dictItemService;

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) servletResponse;
//        // 1.从字典中查询响应头列表
//        List<DictItem> dictItems = dictItemService.listByDictCode(DictConstants.CODE_RESPONSE_HEADER);
//        // 2.设置响应头，可以设置跨域和其他安全响应头
//        for (DictItem dictItem : dictItems) {
//            response.setHeader(dictItem.getCode(), dictItem.getValue());
//        }
        filterChain.doFilter(servletRequest, response);
    }
}
