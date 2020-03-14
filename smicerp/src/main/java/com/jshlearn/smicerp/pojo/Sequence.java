package com.jshlearn.smicerp.pojo;

import lombok.Data;

/**
 * @Description sequence表
 * @ClassName Sequence
 * @Author 蔡明涛
 * @Date 2020/3/7 14:34
 **/
@Data
public class Sequence {
    /**
     * 序列名称
     */
    private String seqName;
    /**
     * 最小值
     */
    private Long minValue;
    /**
     * 最大值
     */
    private Long maxValue;
    /**
     * 当前值
     */
    private Long currentVal;
    /**
     * 增长步数
     */
    private Integer incrementVal;
    /**
     * 备注
     */
    private Long remark;


}
