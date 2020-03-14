package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @Description 单据子表
 * @ClassName DepotItem
 * @Author 蔡明涛
 * @Date 2020/3/7 11:03
 **/
@Data
public class DepotItem {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 表头Id
     */
    private long headId;
    /**
     * 材料Id
     */
    private long materialId;
    /**
     * 商品计量单位
     */
    private String mUnit;
    /**
     * 数量
     */
    private BigDecimal operNumber;
    /**
     * 基础数量，如kg、瓶
     */
    private BigDecimal basicNumber;
    /**
     * 单价
     */
    private BigDecimal unitPrice;
    /**
     * 含税单价
     */
    private BigDecimal taxUnitPrice;
    /**
     * 总价
     */
    private BigDecimal allPrice;
    /**
     * 备注
     */
    private String remark;
    /**
     * 图片
     */
    private String img;
    /**
     * 杂费
     */
    private BigDecimal incidentals;
    /**
     * 仓库ID（库存是统计出来的）
     */
    private long depotId;
    /**
     * 调拨时，对方仓库Id
     */
    private long anotherDepotId;
    /**
     * 税额
     */
    private BigDecimal taxMoney;
    /**
     * 税率
     */
    private BigDecimal taxRate;
    /**
     * 价税合计
     */
    private BigDecimal taxLastMoney;
    /**
     * 自定义字段1-品名
     */
    private String otherField1;
    /**
     * 自定义字段2-型号
     */
    private String otherField2;
    /**
     * 自定义字段3-制造商
     */
    private String otherField3;
    /**
     * 自定义字段4
     */
    private String otherField4;
    /**
     * 自定义字段5
     */
    private String otherField5;
    /**
     * 商品类型
     */
    private String mType;
    /**
     * 租户id
     */
    private Long tenantId;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
}
