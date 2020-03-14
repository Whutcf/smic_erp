package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @Description 机构用户关系表
 * @ClassName Organization
 * @Author 蔡明涛
 * @Date 2020/3/7 12:07
 **/
@Data
public class Organization {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 机构编号
     */
    private String orgNo;
    /**
     * 机构全称
     */
    private String orgFullName;
    /**
     * 机构简称
     */
    private String orgAbr;
    /**
     * 机构类型
     */
    private String orgTpcd;
    /**
     * 机构状态,1未营业、2正常营业、3暂停营业、4终止营业、5已除名
     */
    private String orgStcd;
    /**
     * 机构父节点编号
     */
    private String orgParentNo;
    /**
     * 机构显示顺序
     */
    private String sort;
    /**
     * 备注
     */
    private String remark;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**
     * 创建人
     */
    private String creator;
    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    /**
     * 更新人
     */
    private String updater;
    /**
     * 机构创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date orgCreateTime;
    /**
     * 机构停运时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date orgUpdateTime;
    /**
     * 租户id
     */
    private Long tenantId;
}
