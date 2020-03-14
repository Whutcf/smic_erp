package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @Description 单据主表
 * @ClassName DepotHead
 * @Author 蔡明涛
 * @Date 2020/3/7 11:03
 **/
@Data
public class DepotHead {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 类型(支出/收入/收款/付款/转账
     */
    private String type;
    /**
     * 出入库分类
     */
    private String subType;
    /**
     * 项目Id
     */
    private long projectId;
    /**
     * 初始票据号
     */
    private String defaultNumber;
    /**
     * 票据号
     */
    private String number;
    /**
     * 操作员名字
     */
    private String operPersonName;

    /**
     * 单位Id/供应商Id(收款/付款单位)
     */
    private long orgId;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**
     * 出入库时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date operTime;
    /**
     * 采购/领料-经手人Id
     */
    private long handsPersonId;
    /**
     * 账户Id(收款/付款)
     */
    private long accountId;
    /**
     * 变动金额(优惠/收款/付款/实付)
     */
    private BigDecimal changeAmount;
    /**
     * 调拨时，对方项目Id
     */
    private long allocationProjectId;
    /**
     * 合计金额
     */
    private BigDecimal totalPrice;
    /**
     * 付款类型(现金、记账等)
     */
    private String payType;
    /**
     * 备注
     */
    private String remark;
    /**
     * 业务员（可以多个）
     */
    private String salesMan;
    /**
     * 多账户ID列表
     */
    private String accountIdList;
    /**
     * 多账户金额列表
     */
    private String accountMoneyList;
    /**
     * 优惠率
     */
    private BigDecimal discount;
    /**
     * 优惠金额
     */
    private BigDecimal discountMoney;
    /**
     * 优惠后金额
     */
    private BigDecimal discountLastMoney;
    /**
     * 销售或采购费用合计
     */
    private BigDecimal otherMoney;
    /**
     * 销售或采购费用涉及项目Id数组（包括快递、招待等）
     */
    private String otherMoneyList;
    /**
     * 销售或采购费用涉及项目（包括快递、招待等）
     */
    private String otherMoneyItem;
    /**
     * 结算天数
     */
    private Integer accountDay;
    /**
     * 状态，0未审核、1已审核、2已转采购|销售
     */
    private String status;
    /**
     * 关联订单号
     */
    private String linkNumber;
    /**
     * 租户id
     */
    private Long tenantId;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
}
