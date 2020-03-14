package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @Description 用户表
 * @ClassName User
 * @Author 蔡明涛
 * @Date 2020/3/7 12:07
 **/
@Data
public class User implements Serializable {

    private static final long serialVersionUID = 1682144847650738658L;
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 用户姓名
     */
    private String userName;
    /**
     * 登录用户名
     */
    private String loginName;
    /**
     * 登陆密码
     */
    private String password;
    /**
     * 职位
     */
    private String position;
    /**
     * 所属部门
     */
    private String department;
    /**
     * 手机
     */
    private String phoneNum;
    /**
     * 电子邮箱
     */
    private String email;

    /**
     * 是否系统自带 0==系统 1==非系统
     */
    private Byte isSystem;
    /**
     * 是否为管理者 0==管理者 1==员工
     */
    private Byte isManager;
    /**
     * 0：正常，1：删除，2: 封禁
     */
    private Byte status;
    /**
     * 备注
     */
    private String description;
    /**
     * 备注
     */
    private String remark;
    /**
     * 租户id
     */
    private Long tenantId;
}
