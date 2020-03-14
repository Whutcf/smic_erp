package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @Description 供应商/客户信息表
 * @ClassName Supplier
 * @Author 蔡明涛
 * @Date 2020/3/7 12:07
 **/
@Data
public class Supplier {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 供应商名称
     */
    private String supplier;
    /**
     * 联系人
     */
    private String contacts;
    /**
     * 联系电话
     */
    private String phoneNum;
    /**
     * 电子邮箱
     */
    private String email;
    /**
     * 备注
     */
    private String description;
    /**
     * 是否系统自带 0==系统 1==非系统
     */
    private Byte isSystem;
    /**
     * 类型
     */
    private String type;
    /**
     * 启用
     */
    private boolean enabled;
    /**
     * 预收款
     */
    private BigDecimal advanceIn;
    /**
     * 期初应收
     */
    private BigDecimal beginNeedGet;
    /**
     * 期初应付
     */
    private BigDecimal beginNeedPay;
    /**
     * 累计应收
     */
    private BigDecimal allNeedGet;
    /**
     * 累计应付
     */
    private BigDecimal allNeedPay;
    /**
     * 传真
     */
    private String fax;
    /**
     * 手机
     */
    private String telephone;
    /**
     * 地址
     */
    private String address;
    /**
     * 纳税人识别号
     */
    private String taxNum;
    /**
     * 开户行
     */
    private String bankName;
    /**
     * 账号
     */
    private String accountNumber;
    /**
     * 税率
     */
    private BigDecimal taxRate;
    /**
     * 租户id
     */
    private Long tenantId;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
}
