package com.jshlearn.smicerp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jshlearn.smicerp.pojo.Log;
import org.apache.ibatis.annotations.Mapper;

/**
 * 系统操作日志
 * @param
 * @return
 * @author 蔡明涛
 * @date 2020/3/12 22:03
 */
@Mapper
public interface LogMapper extends BaseMapper<Log> {
}
