package com.jshlearn.smicerp.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * @Description
 * @ClassName ErpMetaObjectHandler
 * @Author 蔡明涛
 * @Date 2020/3/21 11:50
 **/
@Slf4j
@Component
public class ErpMetaObjectHandler implements MetaObjectHandler {

    // TODO 自动填充功能出现异常，无法填充

    /**
     * 插入元对象字段填充（用于插入时对公共字段的填充）
     *
     * @param metaObject 元对象
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("======== 自动 INSERT Fill ========");
        this.strictInsertFill(metaObject, "crateTime", LocalDateTime.class, LocalDateTime.now());
        this.strictInsertFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now());
    }

    /**
     * 更新元对象字段填充（用于更新时对公共字段的填充）
     *
     * @param metaObject 元对象
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("======== 自动 UPDATE Fill ========");
        this.strictInsertFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now());
    }
}
