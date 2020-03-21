package com.jshlearn.smicerp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jshlearn.smicerp.mapper.InOutItemMapper;
import com.jshlearn.smicerp.pojo.InOutItem;
import com.jshlearn.smicerp.service.InOutItemService;
import com.jshlearn.smicerp.utils.EasyUiPageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Description TODO
 * @ClassName InOutItemServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/19 22:25
 **/
@Slf4j
@Service
public class InOutItemServiceImpl implements InOutItemService {
    @Resource
    private InOutItemMapper mapper;

    @Override
    public Map<String,Object> selectPage(InOutItem inOutItem, Integer currentPage, Integer pageSize) {

        LambdaQueryWrapper<InOutItem> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.like(StringUtils.isNotBlank(inOutItem.getName()),InOutItem::getName,inOutItem.getName());
        queryWrapper.eq(StringUtils.isNotBlank(inOutItem.getType()),InOutItem::getType,inOutItem.getType());
        queryWrapper.like(StringUtils.isNotBlank(inOutItem.getRemark()),InOutItem::getRemark,inOutItem.getRemark());
        queryWrapper.eq(InOutItem::getDeleteFlag,"0");
        Page<InOutItem> page = new Page<>(currentPage,pageSize);
        IPage<InOutItem> iPage = mapper.selectPage(page,queryWrapper);
        return EasyUiPageUtil.pageResult(iPage.getTotal(),iPage.getRecords());
    }

    /**
     * 根据名字查找对象
     * @param name 收支项目名称
     * @return com.jshlearn.smicerp.pojo.InOutItem
     * @author 蔡明涛
     * @date 2020/3/19 22:52
     */
    @Override
    @Transactional(readOnly = true)
    public InOutItem getItemByName(String name) {
        return new LambdaQueryChainWrapper<InOutItem>(mapper).eq(InOutItem::getName,name).one();
    }

    /**
     * 新增收支项目
     *
     * @param inOutItem 收支项目对象
     * @return int
     * @author 蔡明涛
     * @date 2020/3/19 23:07
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int add(InOutItem inOutItem) {
        // 设置默认参数
        inOutItem.setDeleteFlag("0");
        return mapper.insert(inOutItem);
    }
}
