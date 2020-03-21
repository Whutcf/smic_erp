package com.jshlearn.smicerp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jshlearn.smicerp.pojo.Account;
import org.apache.ibatis.annotations.Mapper;

/**
 * @Description
 * @ClassName Account
 * @Author 蔡明涛
 * @Date 2020/3/20 19:59
 **/
@Mapper
public interface AccountMapper extends BaseMapper<Account> {
}
