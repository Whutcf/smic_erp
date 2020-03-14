package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @Description 系统参数表
 * @ClassName SystemConfig
 * @Author 蔡明涛
 * @Date 2020/3/7 12:07
 **/
@Data
public class SystemConfig {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 公司名称
     */
    private String companyName;
    /**
     * 公司联系人
     */
    private String companyContacts;
    /**
     * 公司地址
     */
    private String companyAddress;
    /**
     * 公司电话
     */
    private String companyTel;
    /**
     * 公司传真
     */
    private String companyFax;
    /**
     * 公司邮编
     */
    private String companyPostCode;
    /**
     * 仓库启用标记，0未启用，1启用
     */
    private String depotFlag;
    /**
     * 客户启用标记，0未启用，1启用
     */
    private String customerFlag;
    /**
     * 租户id
     */
    private Long tenantId;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
}
