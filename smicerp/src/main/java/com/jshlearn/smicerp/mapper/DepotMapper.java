package com.jshlearn.smicerp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jshlearn.smicerp.pojo.Depot;
import org.apache.ibatis.annotations.Mapper;

/**
 * @Description
 * @ClassName DepotMapper
 * @Author 蔡明涛
 * @Date 2020/3/18 22:36
 **/
@Mapper
public interface DepotMapper extends BaseMapper<Depot> {
    /**
     * 设置默认仓库
     * @param id
     * @return int
     * @author 蔡明涛
     * @date 2020/3/19 19:57
     */
    int setDefaultDepotById(Long id);

    /**
     * 将除入参id以外的isDefault的值都设置为false
     * @param id
     * @return void
     * @author 蔡明涛
     * @date 2020/3/19 20:08
     */
    void setNonDefaultDepotById(Long id);
}
