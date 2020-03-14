package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @Description 财务主表
 * @ClassName AccountHead
 * @Author 蔡明涛
 * @Date 2020/3/7 10:37
 **/
@Data
public class AccountHead {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 类型(支出/收入/收款/付款/转账
     */
    private String type;
    /**
     * 单位Id(收款/付款单位)
     */
    private long orgId;
    /**
     * 经手人Id
     */
    private long handsPersonId;
    /**
     * 变动金额(优惠/收款/付款/实付)
     */
    private BigDecimal changeAmount;
    /**
     * 合计金额
     */
    private BigDecimal totalPrice;
    /**
     * 账户Id(收款/付款)
     */
    private long accountId;
    /**
     * 单据编号
     */
    private String billNo;
    /**
     * 单据日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date billTime;
    /**
     * 备注
     */
    private String remark;
    /**
     * 租户id
     */
    private Long tenantId;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
}
