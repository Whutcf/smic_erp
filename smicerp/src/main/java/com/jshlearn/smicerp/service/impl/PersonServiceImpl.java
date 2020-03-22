package com.jshlearn.smicerp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.conditions.update.LambdaUpdateChainWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jshlearn.smicerp.mapper.PersonMapper;
import com.jshlearn.smicerp.pojo.Person;
import com.jshlearn.smicerp.service.PersonService;
import com.jshlearn.smicerp.utils.EasyUiPageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Description
 * @ClassName PersonServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/21 20:32
 **/
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class PersonServiceImpl implements PersonService {
    @Resource
    private PersonMapper personMapper;

    /**
     * 分页获取经手人管理
     *
     * @param person      经手人对象
     * @param currentPage 当前页
     * @param pageSize    当前页记录数
     * @return java.util.Map<java.lang.String, java.lang.Object>
     * @author 蔡明涛
     * @date 2020/3/21 20:44
     */
    @Override
    public Map<String, Object> selectPage(Person person, Integer currentPage, Integer pageSize) {
        LambdaQueryWrapper<Person> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(person.getName()), Person::getName, person.getName());
        queryWrapper.eq(StringUtils.isNotBlank(person.getType()), Person::getType, person.getType());
        queryWrapper.eq(Person::getDeleteFlag,"0");
        Page<Person> page = new Page<>(currentPage,pageSize);
        IPage<Person> personPage = personMapper.selectPage(page,queryWrapper);
        return EasyUiPageUtil.pageResult(personPage.getTotal(),personPage.getRecords());
    }

    /**
     * 保存经手人
     *
     * @param person 经手人对象
     * @return int
     * @author 蔡明涛
     * @date 2020/3/22 0:18
     */
    @Override
    public int savePerson(Person person) {
        // 判断用户信息是否存在
        int i = new LambdaQueryChainWrapper<>(personMapper).eq(Person::getName, person.getName()).eq(Person::getType, person.getType()).count();
        if (i > 0){
            return -1;
        }
        return personMapper.insert(person);
    }

    /**
     * 根据id修改type
     *
     * @param id   Long id
     * @Param type String 经手人的角色
     * @return boolean
     * @author 蔡明涛
     * @date 2020/3/22 11:11
     */
    @Override
    public boolean updatePerson(Long id, String type) {
        return new LambdaUpdateChainWrapper<>(personMapper).eq(Person::getId,id).set(Person::getType,type).update();
    }
}
