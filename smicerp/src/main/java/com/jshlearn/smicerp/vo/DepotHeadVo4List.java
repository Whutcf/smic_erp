package com.jshlearn.smicerp.vo;

import com.jshlearn.smicerp.pojo.DepotHead;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * @Description 用于零售管理页面的单据主表及加附加信息
 * @ClassName DeportHeadVo4List
 * @Author 蔡明涛
 * @Date 2020/3/23 22:34
 **/
@EqualsAndHashCode(callSuper = true)
@Data
public class DepotHeadVo4List extends DepotHead implements Serializable {
    private static final long serialVersionUID = -2107132128814115591L;

    /**
     * 仓库名称 projectId对应的是仓库的id
     */
    private String projectName;
    /**
     * 供应商名称 orgId对应的是供应商的Id
     */
    private String orgName;
    /**
     * 经手人姓名 handsPersonId对应的是经手人的Id
     */
    private String handsPersonName;
    /**
     * 账户姓名 accountId对应的是账户的Id
     */
    private String accountName;
    /**
     * 调拨仓库名 allocationProjectId(调拨仓库的id)对应是仓库的id
     */
    private String allocationProjectName;
    /**
     * 材料的集合
     */
    private String materialsList;


}
