package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @Description 产品表
 * @ClassName Material
 * @Author 蔡明涛
 * @Date 2020/3/7 12:07
 **/
@Data
public class Material {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 产品类型
     */
    private long categoryId;
    /**
     * 名称
     */
    private String name;
    /**
     * 制造商
     */
    private String mfrs;
    /**
     * 包装（KG/包）
     */
    private BigDecimal packing;
    /**
     * 安全存量（KG）
     */
    private BigDecimal safetyStock;
    /**
     * 型号
     */
    private String model;
    /**
     * 规格
     */
    private String standard;
    /**
     * 颜色
     */
    private String color;
    /**
     * 单位-单个
     */
    private String unit;
    /**
     * 备注
     */
    private String remark;
    /**
     * 零售价
     */
    private BigDecimal retailPrice;
    /**
     * 最低售价
     */
    private BigDecimal lowPrice;
    /**
     * 预设售价一
     */
    private BigDecimal presetPriceOne;
    /**
     * 预设售价二
     */
    private BigDecimal presetPriceTwo;
    /**
     * 计量单位Id
     */
    private Long unitId;
    /**
     * 首选出库单位
     */
    private String firstOutUnit;
    /**
     * 首选入库单位
     */
    private String firstInUnit;
    /**
     * 价格策略
     */
    private String priceStrategy;
    /**
     * 启用 0-禁用  1-启用
     */
    private boolean enabled;
    /**
     * 自定义字段1
     */
    private String otherField1;
    /**
     * 自定义字段2
     */
    private String otherField2;
    /**
     * 自定义字段3
     */
    private String otherField3;
    /**
     * 是否开启序列号，0否，1是
     */
    private String enableSerialNumber;
    /**
     * 租户id
     */
    private Long tenantId;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
}
