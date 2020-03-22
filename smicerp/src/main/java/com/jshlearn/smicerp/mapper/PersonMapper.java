package com.jshlearn.smicerp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jshlearn.smicerp.pojo.Person;
import org.apache.ibatis.annotations.Mapper;

/**
 * @Description
 * @ClassName PersonMapper
 * @Author 蔡明涛
 * @Date 2020/3/21 20:31
 **/
@Mapper
public interface PersonMapper extends BaseMapper<Person> {
}
