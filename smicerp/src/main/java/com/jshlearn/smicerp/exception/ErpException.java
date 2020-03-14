package com.jshlearn.smicerp.exception;

import com.jshlearn.smicerp.constants.ExceptionConstants;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;

/**
 * @Description 封装日志打印，收集日志
 * @ClassName LogException
 * @Author 蔡明涛
 * @Date 2020/3/12 22:18
 **/
@Slf4j
public class ErpException {

    public static void readFail(Exception e) {
        log.error("异常码[{}],异常提示[{}],异常[{}]",
                ExceptionConstants.DATA_READ_FAIL_CODE, ExceptionConstants.DATA_READ_FAIL_MSG, e);
        throw new BusinessRunTimeException(ExceptionConstants.DATA_READ_FAIL_CODE,
                ExceptionConstants.DATA_READ_FAIL_MSG);
    }

    public static void writeFail(Exception e) {
        log.error("异常码[{}],异常提示[{}],异常[{}]",
                ExceptionConstants.DATA_WRITE_FAIL_CODE, ExceptionConstants.DATA_WRITE_FAIL_MSG, e);
        throw new BusinessRunTimeException(ExceptionConstants.DATA_WRITE_FAIL_CODE,
                ExceptionConstants.DATA_WRITE_FAIL_MSG);
    }


}
