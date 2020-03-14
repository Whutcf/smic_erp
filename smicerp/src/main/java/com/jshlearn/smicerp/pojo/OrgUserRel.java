package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @Description 机构用户关系表
 * @ClassName OrgaUserRel
 * @Author 蔡明涛
 * @Date 2020/3/7 12:07
 **/
@Data
public class OrgUserRel {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 机构id
     */
    private Long orgId;
    /**
     * 用户id
     */
    private Long userId;
    /**
     * 用户在所属机构中显示顺序
     */
    private String userBlngOrgaDsplSeq;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
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
     * 租户id
     */
    private Long tenantId;
}
