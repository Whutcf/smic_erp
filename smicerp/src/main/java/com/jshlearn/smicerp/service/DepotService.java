package com.jshlearn.smicerp.service;

import com.jshlearn.smicerp.pojo.Depot;

import java.util.List;
import java.util.Map;

/**
 * @Description
 * @ClassName DepotService
 * @Author 蔡明涛
 * @Date 2020/3/18 22:36
 **/
public interface DepotService {
    /**
     * 根据条件分页查询
     * @param depot 仓库实体，由json字符串转换，里边包含的信息是 type 默认0 ，name,remark不一定有值
     * @param currentPage 当前页
     * @param pageSize 页面数据条数
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @author 蔡明涛
     * @date 2020/3/21 10:14
     */
    Map<String,Object> showDepotDetails(Depot depot, Integer currentPage, Integer pageSize);

    /**
     * 设置仓库为默认仓库
     * @param id 仓库id
     * @return int
     * @author 蔡明涛
     * @date 2020/3/19 19:48
     */
    int setDepotIsDefault(Long id);

    /**
     * 获取所有仓库信息
     *
     * @return java.util.List<com.jshlearn.smicerp.pojo.Depot>
     * @author 蔡明涛
     * @date 2020/3/22 21:21
     */
    List<Depot> getAllList();
}
