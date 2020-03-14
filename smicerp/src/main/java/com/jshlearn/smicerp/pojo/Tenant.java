package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @Description 租户
 * @ClassName Tenant
 * @Author 蔡明涛
 * @Date 2020/3/7 15:04
 **/
@Data
public class Tenant {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 用户id
     */
    private Long tenantId;
    /**
     * 登录名
     */
    private String loginName;
    /**
     * 用户数量限制
     */
    private Integer userNumLimit;
    /**
     * 单据数量限制
     */
    private Integer billsNumLimit;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
}
