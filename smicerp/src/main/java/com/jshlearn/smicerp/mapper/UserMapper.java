package com.jshlearn.smicerp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jshlearn.smicerp.pojo.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * @Description 用户数据处理
 * @ClassName UserMapper
 * @Author 蔡明涛
 * @Date 2020/3/12 20:36
 **/
@Mapper
public interface UserMapper extends BaseMapper<User> {
    /**
     * 根据用户名查找用户ID，（练习mybatis的常规用法）
     * @param userName 用户名
     * @return java.lang.Long
     * @author 蔡明涛
     * @date 2020/3/13 20:31
     */
    Long getUserIdByUserName(String userName);
}
