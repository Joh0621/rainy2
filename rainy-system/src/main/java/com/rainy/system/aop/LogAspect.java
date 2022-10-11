package com.rainy.system.aop;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.rainy.framework.annotation.Log;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.utils.SecurityUtils;
import com.rainy.framework.utils.ThrowableUtils;
import com.rainy.framework.utils.WebUtils;
import com.rainy.system.entity.OperationLog;
import com.rainy.system.service.OperationLogService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.DefaultParameterNameDiscoverer;
import org.springframework.core.ParameterNameDiscoverer;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.util.Arrays;

/**
 * 系统操作日志切面
 *
 * @author created by renguangli at 2022/9/13 21:03
 */
@Slf4j
@Aspect
@Component
@RequiredArgsConstructor
public class LogAspect {

    private final OperationLogService operationLogService;

    // 操作日志切入点
    @Around("@annotation(com.rainy.framework.annotation.Log)")
    public Object printMethodExecuteTime(ProceedingJoinPoint joinPoint) throws Throwable {
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        Object result = null;
        OperationLog log = new OperationLog();
        try {
            result = joinPoint.proceed(joinPoint.getArgs());
        } catch (Throwable e) {
            log.setErrorMessage(ThrowableUtils.toString(e));
            log.setErrorMessage(e.getMessage());
            throw e;
        } finally {
            stopWatch.stop();
            log.setSuccess(true);
            log.setProcessTime(stopWatch.getTotalTimeMillis());
            this.saveLog(joinPoint, result, log);
        }
        return result;
    }

    private void saveLog(ProceedingJoinPoint joinPoint, Object result, OperationLog opLog) throws JsonProcessingException {
        Method method = ((MethodSignature) joinPoint.getSignature()).getMethod();
        Log sysLog = method.getAnnotation(Log.class);
        // 是否保存查询操作日志
        if (OpType.QUERY.equals(sysLog.type())) {
            return;
        }

        opLog.setUsername(SecurityUtils.getUsername());
        opLog.setDatetime(LocalDateTime.now());
        opLog.setModule(sysLog.module());
        opLog.setType(sysLog.type());
        String detail = this.resolveSpEL(sysLog.detail(), method, joinPoint.getArgs());
        opLog.setDetail(detail);

        opLog.setPath(WebUtils.getRequestURI());
        opLog.setMethod(WebUtils.getRequestMethod());
        opLog.setRemoteIp(WebUtils.getRemoteIp());
        opLog.setBrowser(WebUtils.getBrowser());
        opLog.setOs(WebUtils.getOs());

        // 获取请求参数
        String className = joinPoint.getTarget().getClass().getName();
        opLog.setClassName(className);
        opLog.setMethodName(method.getName());
        opLog.setParams(Arrays.toString(joinPoint.getArgs()));

        // 异步保存
        operationLogService.asyncSave(opLog);
    }


    public String resolveSpEL(String spELStr, Method method, Object[] args) {
        ExpressionParser expressionParser = new SpelExpressionParser();
        ParameterNameDiscoverer parameterNameDiscoverer = new DefaultParameterNameDiscoverer();
        EvaluationContext context = new StandardEvaluationContext();
        String[] parameterNames = parameterNameDiscoverer.getParameterNames(method);
        if (parameterNames == null) {
            return spELStr;
        }

        for (int j = 0; j < parameterNames.length; j++) {
            context.setVariable(parameterNames[j], args[j]);
        }
        if (spELStr.contains("#")) {
            return expressionParser.parseExpression(spELStr)
                    .getValue(context, String.class);
        }
        return spELStr;
    }
}
