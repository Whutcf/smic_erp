package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @Description 产品类型表
 * @ClassName MaterialCategory
 * @Author 蔡明涛
 * @Date 2020/3/7 12:07
 **/
@Data
public class MaterialCategory {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 名称
     */
    private String name;
    /**
     * 等级
     */
    private short categoryLevel;
    /**
     * 上级ID
     */
    private Long parentId;
    /**
     * 排序
     */
    private String sort;
    /**
     * 操作状态 0==成功，1==失败
     */
    private byte status;
    /**
     * 编号
     */
    private String serialNo;
    /**
     * 备注
     */
    private String remark;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**
     * 创建人
     */
    private String creator;
    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    /**
     * 更新人
     */
    private String updater;
    /**
     * 租户id
     */
    private Long tenantId;
}
