package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @Description 财务子表
 * @ClassName AccountItem
 * @Author 蔡明涛
 * @Date 2020/3/7 10:48
 **/
@Data
public class AccountItem {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 表头Id
     */
    private long headerId;
    /**
     * 账户Id(收款/付款)
     */
    private long accountId;
    /**
     * 收支项目Id
     */
    private long inOutItemId;
    /**
     * 单项金额
     */
    private BigDecimal eachAmount;
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
