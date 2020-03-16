package com.jshlearn.smicerp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jshlearn.smicerp.pojo.Supplier;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @Description
 * @ClassName SupplierMapper
 * @Author 蔡明涛
 * @Date 2020/3/15 20:12
 **/
@Mapper
public interface SupplierMapper extends BaseMapper<Supplier> {
    /**
     * 批量启用/禁用
     * @param enabled 启用
     * @param supplierIds 前端传入的拼接ID串
     * @return int
     * @author 蔡明涛
     * @date 2020/3/16 21:39
     */
    int batchSetEnable(Boolean enabled,String supplierIds);
}
