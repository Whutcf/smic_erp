package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @Description 信息账户表
 * @ClassName Account
 * @Author 蔡明涛
 * @Date 2020/3/7 10:05
 **/
@Data
public class Account {
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    private String name;
    /**
     * 编号
     */
    private String serialNo;
    /**
     * 期初金额
     */
    private BigDecimal initialAmount;
    /**
     * 当前余额
     */
    private BigDecimal currentAmount;
    /**
     * 备注
     */
    private String remark;
    /**
     * 是否默认
     */
    @JsonProperty("isDefault")
    private int isDefault;
    /**
     * 租户id
     */
    private Long tenantId;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(value = "create_time",fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;
}
