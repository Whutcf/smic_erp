package com.jshlearn.smicerp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jshlearn.smicerp.pojo.Supplier;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    /**
     * 根据条件获取所有数据
     * @param supplier    厂商名
     * @param type        页面固定传参 供应商
     * @param phoneNum    手机号码
     * @param telephone    电话号码
     * @param description 厂商描述
     * @return java.util.List<com.jshlearn.smicerp.pojo.Supplier>
     * @author 蔡明涛
     * @date 2020/3/17 22:40
     */
    List<Supplier> getExcelDataByParams(@Param("supplier") String supplier,
                                        @Param("type") String type,
                                        @Param("phoneNum") String phoneNum,
                                        @Param("telephone") String telephone,
                                        @Param("description") String description);
}
