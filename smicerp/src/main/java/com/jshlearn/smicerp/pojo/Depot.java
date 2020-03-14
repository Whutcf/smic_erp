package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @Description 仓库表
 * @ClassName Depot
 * @Author 蔡明涛
 * @Date 2020/3/7 10:53
 **/
@Data
public class Depot {
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
    private Long principle;
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
    private boolean isDefault;
}
