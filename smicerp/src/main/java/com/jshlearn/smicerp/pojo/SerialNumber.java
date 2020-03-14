package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @Description 序列号表
 * @ClassName SerialNumber
 * @Author 蔡明涛
 * @Date 2020/3/7 12:07
 **/
@Data
public class SerialNumber {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 产品表id
     */
    private long materialId;
    /**
     * 是否卖出，0未卖出，1卖出
     */
    private String isSell;
    /**
     * 备注
     */
    private String remark;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**
     * 创建人
     */
    private Long creator;
    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    /**
     * 更新人
     */
    private Long updater;
    /**
     * 单据主表id，用于跟踪序列号流向
     */
    private Long depotHeadId;
    /**
     * 租户id
     */
    private Long tenantId;
}
