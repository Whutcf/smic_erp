package com.jshlearn.smicerp;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author 蔡明涛
 * 添加@ServletComponentScan, 无论过滤器类是否添加了@Component 都可以， 单独使用@Component 会默认过滤/*
 */
@ServletComponentScan
@SpringBootApplication
public class SmicerpApplication {

    public static void main(String[] args) {
        SpringApplication.run(SmicerpApplication.class, args);
    }

}
