package com.rainy.base;

import cn.dev33.satoken.exception.NotLoginException;
import cn.dev33.satoken.exception.NotPermissionException;
import cn.dev33.satoken.exception.SaTokenException;
import cn.hutool.core.text.CharPool;
import cn.hutool.core.util.StrUtil;
import com.rainy.base.common.Result;
import com.rainy.base.common.ResultCode;
import com.rainy.base.service.MenuService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.lang.NonNull;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

/**
 * 全局异常处理/统一结果返回
 *
 * @author created by renguangli at 2022/9/2 10:55
 */
@Slf4j
@RestControllerAdvice
@RequiredArgsConstructor
public class RestfulControllerAdvise implements ResponseBodyAdvice<Object> {

    private final MenuService menuService;

    /**
     * 拦截系统异常
     */
    @ExceptionHandler(value = Exception.class)
    public Result<Object> exception(Exception e) {
        log.error(e.getMessage(), e);
        return Result.of(ResultCode.INTERNAL_SERVER_ERROR, e.getMessage());
    }

    /**
     * 权限异常
     */
    @ExceptionHandler(value = SaTokenException.class)
    public Result<Object> saTokenException(SaTokenException exception) {
        if (exception instanceof NotLoginException e) {
            return Result.of(ResultCode.UNAUTHORIZED, e.getMessage());
        }
        if (exception instanceof NotPermissionException e) {
            String message = e.getMessage()
                    .replace(e.getPermission(), menuService.getName(e.getPermission()));
            return Result.of(ResultCode.FORBIDDEN, message);
        }
        return Result.of(ResultCode.UNAUTHORIZED, exception.getMessage());
    }

    @ExceptionHandler(value = HttpMessageNotReadableException.class)
    public Result<Object> httpMessageNotReadableException(HttpMessageNotReadableException e) {
        return Result.of(ResultCode.BAD_REQUEST,
                StrUtil.subBefore(e.getMessage(), CharPool.COLON, false));
    }

    @ExceptionHandler(value = IllegalArgumentException.class)
    public Result<Object> illegalArgumentException(IllegalArgumentException e) {
        return Result.of(ResultCode.BAD_REQUEST, e.getMessage());
    }

    @ExceptionHandler(value = MaxUploadSizeExceededException.class)
    public Result<Object> illegalArgumentException(MaxUploadSizeExceededException e) {
        long maxUploadSize = e.getMaxUploadSize();
        long mb = maxUploadSize / 1024 / 1024;
        return Result.of(ResultCode.BAD_REQUEST, StrUtil.format("文件最大{}mb!", mb));
    }

    /**
     * 请求方法不支持
     *
     * @param e HttpRequestMethodNotSupportedException
     * @return Result
     */
    @ExceptionHandler(value = HttpRequestMethodNotSupportedException.class)
    public Result<Object> httpRequestMethodNotSupportedException(HttpRequestMethodNotSupportedException e) {
        return Result.of(ResultCode.METHOD_NOT_ALLOW, e.getMessage());
    }

    /**
     * 拦截参数校验异常
     */
    @ExceptionHandler(BindException.class)
    public Result<Object> bindException(BindException e) {
        return getResult(e.getBindingResult());
    }

    /**
     * 拦截参数校验异常
     */
    @ExceptionHandler(value = {MethodArgumentNotValidException.class})
    public Result<Object> methodArgumentNotValidException(MethodArgumentNotValidException e) {
        return getResult(e.getBindingResult());
    }

    private Result<Object> getResult(BindingResult result) {
        String message = null;
        if (result.hasErrors()) {
            FieldError fieldError = result.getFieldError();
            if (fieldError != null) {
                message = fieldError.getField() + fieldError.getDefaultMessage();
            }
        }
        return Result.of(ResultCode.BAD_REQUEST, message);
    }

    @Override
    public boolean supports(@NonNull MethodParameter returnType, @NonNull Class<? extends HttpMessageConverter<?>> converterType) {
        return true;
    }

    /**
     * 封装响应体
     */
    @Override
    public Object beforeBodyWrite(Object body, @NonNull MethodParameter returnType, @NonNull MediaType selectedContentType, @NonNull Class<? extends HttpMessageConverter<?>> selectedConverterType, @NonNull ServerHttpRequest request, @NonNull ServerHttpResponse response) {
        if (body instanceof Result) {
            return body;
        }
        return Result.of(body);
    }
}
