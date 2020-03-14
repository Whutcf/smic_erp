package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * @Description 功能模块表
 * @ClassName Functions
 * @Author 蔡明涛
 * @Date 2020/3/7 11:40
 **/
@Data
public class Functions {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 编号
     */
    private String number;
    /**
     * 名称
     */
    private String name;
    /**
     * 上级编号
     */
    private String pNumber;
    /**
     * 链接
     */
    private String url;
    /**
     * 收缩
     */
    private boolean state;
    /**
     * 排序
     */
    private String sort;
    /**
     * 启用 0-禁用  1-启用
     */
    private boolean enabled;
    /**
     * 类型
     */
    private String type;
    /**
     * 功能按钮
     */
    private String pushBtn;
    /**
     * 图标
     */
    private String icon;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
}
