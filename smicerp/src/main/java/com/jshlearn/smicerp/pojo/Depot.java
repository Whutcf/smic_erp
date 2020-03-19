package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @Description 仓库表
 * @ClassName Depot
 * @Author 蔡明涛
 * @Date 2020/3/7 10:53
 **/
@Data
public class Depot implements Serializable {
    private static final long serialVersionUID = -2227529701064388578L;
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    private String name;
    private String address;
    /**
     * 仓储费用
     */
    private BigDecimal warehousing;
    /**
     * 搬运费
     */
    private BigDecimal truckage;
    /**
     * 类型
     */
    private int type;
    /**
     * 排序
     */
    private String sort;
    /**
     * 备注
     */
    private String remark;
    /**
     * 负责人
     */
    private Long principal;
    /**
     * 租户id
     */
    private Long tenantId;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
    /**
     * 是否默认
     */
    @JsonProperty("isDefault")
    private boolean isDefault;
}
