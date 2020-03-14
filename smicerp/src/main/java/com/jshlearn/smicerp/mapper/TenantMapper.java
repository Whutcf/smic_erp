package com.jshlearn.smicerp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jshlearn.smicerp.pojo.Tenant;
import org.apache.ibatis.annotations.Mapper;

/**
 * @Description TODO
 * @ClassName TenantMapper
 * @Author 蔡明涛
 * @Date 2020/3/12 21:47
 **/
@Mapper
public interface TenantMapper extends BaseMapper<Tenant> {
}
