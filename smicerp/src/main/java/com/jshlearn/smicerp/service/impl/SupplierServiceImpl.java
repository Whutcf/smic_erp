package com.jshlearn.smicerp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jshlearn.smicerp.mapper.SupplierMapper;
import com.jshlearn.smicerp.pojo.Supplier;
import com.jshlearn.smicerp.service.SupplierService;
import com.jshlearn.smicerp.utils.EasyUiPageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Description
 * @ClassName SupplierServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/15 20:13
 **/
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class SupplierServiceImpl implements SupplierService {

    @Resource
    private SupplierMapper supplierMapper;

    @Override
    @Transactional(readOnly = true)
    public Map<String,Object> selectPage(Supplier supplier, Integer currentPage, Integer pageSize) {
        LambdaQueryWrapper<Supplier> lambdaQuery = Wrappers.lambdaQuery();
        // 判断供应商的名字是否为null，不为null则作为查询的条件，以此为例判断其他查询条件
        lambdaQuery.like(StringUtils.isNotBlank(supplier.getSupplier()),Supplier::getSupplier,supplier.getSupplier());
        lambdaQuery.eq(StringUtils.isNotBlank(supplier.getType()),Supplier::getType,supplier.getType());
        lambdaQuery.eq(StringUtils.isNotBlank(supplier.getPhoneNum()),Supplier::getPhoneNum,supplier.getPhoneNum());
        lambdaQuery.eq(StringUtils.isNotBlank(supplier.getTelephone()),Supplier::getTelephone,supplier.getTelephone());
        lambdaQuery.like(StringUtils.isNotBlank(supplier.getDescription()),Supplier::getDescription,supplier.getDescription());
        lambdaQuery.eq(Supplier::getDeleteFlag,"0");
        Page<Supplier> page = new Page<>(currentPage,pageSize);
        IPage<Supplier> iPage = supplierMapper.selectPage(page,lambdaQuery);
        return EasyUiPageUtil.pageResult(iPage.getTotal(),iPage.getRecords());
    }

    @Override
    public int save(Supplier supplier) {
        return supplierMapper.insert(supplier);
    }

    @Override
    @Transactional(readOnly = true)
    public Boolean checkIsNameExist(String supplierName) {
        LambdaQueryWrapper<Supplier> queryWrapper = Wrappers.lambdaQuery();
        Integer count = supplierMapper.selectCount(queryWrapper.eq(Supplier::getSupplier, supplierName));
        return count > 1;
    }

    @Override
    public int batchSetEnable(Boolean enabled, String supplierIds) {
        // TODO 先将supplierIds 转为list 在利用遍历处理，可以减少SQL注入的风险
        return  supplierMapper.batchSetEnable(enabled,supplierIds);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Supplier> getExcelData(String supplier, String type, String phoneNum, String telephone, String description) {
        // 练习Mybatis的基本写法
        return supplierMapper.getExcelDataByParams(supplier,type,phoneNum,telephone,description);
    }
}
