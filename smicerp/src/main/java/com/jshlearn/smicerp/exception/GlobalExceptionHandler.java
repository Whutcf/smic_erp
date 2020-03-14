package com.jshlearn.smicerp.exception;

import com.alibaba.fastjson.JSONObject;
import com.jshlearn.smicerp.constants.ExceptionConstants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;

/**
 * @Description 全局异常处理
 * @ClassName GlobalExceptionHandler
 * @Author 蔡明涛
 * @Date 2020/3/7 22:01
 **/
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Object handleException(Exception e, HttpServletRequest request){
        JSONObject status = new JSONObject();

//        // 针对业务参数异常的处理
//        if (e instanceof BusinessParamCheckingException) {
//            status.put(ExceptionConstants.GLOBAL_RETURNS_CODE, ((BusinessParamCheckingException) e).getCode());
//            status.put(ExceptionConstants.GLOBAL_RETURNS_MESSAGE, ((BusinessParamCheckingException) e).getReason());
//            return status;
//        }

        //针对业务运行时异常的处理
        if (e instanceof BusinessRunTimeException) {
            status.put(ExceptionConstants.GLOBAL_RETURN_CODE, ((BusinessRunTimeException) e).getCode());
            status.put(ExceptionConstants.GLOBAL_RETURN_MESSAGE, ((BusinessRunTimeException) e).getReason());
            return status;
        }

        status.put(ExceptionConstants.GLOBAL_RETURN_CODE,ExceptionConstants.SERVICE_SYSTEM_ERROR_CODE);
        status.put(ExceptionConstants.GLOBAL_RETURN_MESSAGE,ExceptionConstants.SERVICE_SYSTEM_ERROR_CODE);
        log.error("Global exception occured => url : {}, msg : {}",request.getRequestURL(),e.getMessage());
        /*
         * 这里输出完整的堆栈信息，否则有些异常完全不知道哪里出错了!
         * @author 蔡明涛
         * @date 2020/3/7 22:08
         */
        log.error("Global exception occured ! => url : {}",request.getRequestURL(),e);
        e.printStackTrace();
        return status;
    }
}
