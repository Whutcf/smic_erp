package com.jshlearn.smicerp.exception;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 蔡明涛
 */
@Slf4j
@Getter
public class BusinessRunTimeException extends RuntimeException {

    private static final long serialVersionUID = 1L;
    private int code;
    private String reason;

    public BusinessRunTimeException(int code, String reason) {
        super(reason);
        this.code = code;
        this.reason = reason;
    }

    public BusinessRunTimeException(int code, String reason, Throwable throwable) {
        super(reason, throwable);
        this.code = code;
        this.reason = reason;
    }
}
