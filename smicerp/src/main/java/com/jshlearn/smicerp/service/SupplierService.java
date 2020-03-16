package com.jshlearn.smicerp.service;

import com.jshlearn.smicerp.pojo.Supplier;

import java.util.List;

/**
 * @Description TODO
 * @ClassName SupplierService
 * @Author 蔡明涛
 * @Date 2020/3/15 20:12
 **/
public interface SupplierService {
    /**
     *  根据条件分页查询
     * @param supplier 集成的查询条件的对象 ,
     * @param currentPage 查询起始页 ,
     * @param pageSize 单页显示的记录数
     * @return java.util.List<com.jshlearn.smicerp.pojo.Supplier>
     * @author 蔡明涛
     * @date 2020/3/15 21:04
     */
    List<Supplier> selectPage(Supplier supplier, Integer currentPage, Integer pageSize);

    /**
     * 新增工商信息
     * @param supplier 供应商
     * @return int
     * @author 蔡明涛
     * @date 2020/3/15 22:32
     */
    int save(Supplier supplier);

    /**
     * 根据名称判断是否存在
     * @param supplierName 供应商名称
     * @return java.lang.Boolean
     * @author 蔡明涛
     * @date 2020/3/16 20:30
     */
    Boolean checkIsNameExist(String supplierName);
}
