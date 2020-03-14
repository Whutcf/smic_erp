package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @Description 产品初始库存
 * @ClassName MaterialStock
 * @Author 蔡明涛
 * @Date 2020/3/7 12:07
 **/
@Data
public class MaterialStock {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 材料Id
     */
    private long materialId;
    /**
     * 仓库ID（库存是统计出来的）
     */
    private long depotId;
    /**
     * 初始库存数量
     */
    private BigDecimal number;
    /**
     * 租户id
     */
    private Long tenantId;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
}
