package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @Description 操作日志
 * @ClassName Log
 * @Author 蔡明涛
 * @Date 2020/3/7 11:55
 **/
@Data
public class Log {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 操作用户ID
     */
    private long userId;
    /**
     * 操作模块名称
     */
    private String operation;
    /**
     * 客户端IP
     */
    private String clientIp;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**
     * 操作状态 0==成功，1==失败
     */
    private Integer status;
    /**
     * 操作详情
     */
    private String contentDetails;
    /**
     * 备注
     */
    private String remark;
    /**
     * 租户id
     */
    private Long tenantId;
}
