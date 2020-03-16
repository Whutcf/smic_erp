package com.jshlearn.smicerp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jshlearn.smicerp.mapper.SupplierMapper;
import com.jshlearn.smicerp.pojo.Supplier;
import com.jshlearn.smicerp.service.SupplierService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description TODO
 * @ClassName SupplierServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/15 20:13
 **/
@Slf4j
@Service
public class SupplierServiceImpl implements SupplierService {

    @Resource
    private SupplierMapper supplierMapper;

    @Override
    public List<Supplier> selectPage(Supplier supplier, Integer currentPage, Integer pageSize) {
        LambdaQueryWrapper<Supplier> lambdaQuery = Wrappers.lambdaQuery();
        // 判断供应商的名字是否为null，不为null则作为查询的条件，以此为例判断其他查询条件
        lambdaQuery.like(StringUtils.isNotBlank(supplier.getSupplier()),Supplier::getSupplier,supplier.getSupplier());
        lambdaQuery.eq(StringUtils.isNotBlank(supplier.getType()),Supplier::getType,supplier.getType());
        lambdaQuery.eq(StringUtils.isNotBlank(supplier.getPhoneNum()),Supplier::getPhoneNum,supplier.getPhoneNum());
        lambdaQuery.eq(StringUtils.isNotBlank(supplier.getTelephone()),Supplier::getTelephone,supplier.getTelephone());
        lambdaQuery.like(StringUtils.isNotBlank(supplier.getDescription()),Supplier::getDescription,supplier.getDescription());
        Page<Supplier> page = new Page<>(currentPage,pageSize);
        IPage<Supplier> iPage = supplierMapper.selectPage(page,lambdaQuery);
        return iPage.getRecords();
    }

    @Override
    public int save(Supplier supplier) {
        return supplierMapper.insert(supplier);
    }

    @Override
    public Boolean checkIsNameExist(String supplierName) {
        LambdaQueryWrapper<Supplier> queryWrapper = Wrappers.lambdaQuery();
        Integer count = supplierMapper.selectCount(queryWrapper.eq(Supplier::getSupplier, supplierName));
        return count > 1;
    }
}
