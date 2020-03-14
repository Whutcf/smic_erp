package com.jshlearn.smicerp.config;

import com.baomidou.mybatisplus.core.parser.ISqlParser;
import com.baomidou.mybatisplus.core.parser.ISqlParserFilter;
import com.baomidou.mybatisplus.core.parser.SqlParserHelper;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.extension.plugins.tenant.TenantHandler;
import com.baomidou.mybatisplus.extension.plugins.tenant.TenantSqlParser;
import com.jshlearn.smicerp.pojo.User;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.LongValue;
import net.sf.jsqlparser.expression.operators.relational.ExpressionList;
import net.sf.jsqlparser.expression.operators.relational.InExpression;
import net.sf.jsqlparser.schema.Column;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.reflection.MetaObject;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description mybatis-plus 相关配置
 * @ClassName MybatisConfig
 * @Author 蔡明涛
 * @Date 2020/3/7 18:41
 **/
@Configuration
@MapperScan("com.jshlearn.smicerp.mapper")
public class MybatisConfig {

    /**
     * 分页插件，自动识别数据库类型
     * 多租户，请参考官网【插件扩展】
     */
    @Bean
    public PaginationInterceptor paginationInterceptor(HttpServletRequest request) {
        PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
        //设置数据库方言
        paginationInterceptor.setDialectType("mysql");

        /*
         * 什么是多租户？
         * 多租户技术或称多重租赁技术，简称SaaS，是一种软件架构技术，是实现如何在多用户环境下（一般指的是面向企业用户），共同用相同的系统或
         * 程序组件，并且可确保个用户间的数据的隔离性。
         * 简单来说：在一台服务器上运行单个应用实例，它为多个租户（客户）提供服务，可理解为，该系统架构的目的是为了让多用户环境下使用同一套程序，且保证用户间数据隔离
         *
         * 业务场景：不同系统用同一个数据库或者数据表，如大企业具有内部的多个系统，但是数据结构是相同的，可采用公共数据库，数据不同
         * 解决方案：租户共享一个Database，同一个schema，但在表中增加TenantId(多租户的数据字段)，是共享程度最高，隔离级别最低的模式
         */
        // SQL 解析器
        List<ISqlParser> sqlParsers = new ArrayList<>();
        TenantSqlParser tenantSqlParser = new TenantSqlParser();
        tenantSqlParser.setTenantHandler(new TenantHandler() {
            @Override
            public Expression getTenantId(boolean where) {
                //如果是WHERE，可以追加多租户多个条件In，不是where的情况：比如当insert的情况，不能Insert into user (name,tenant_id) values ('kevin',tenant_id in (1,2));
                //TODO 在后续可能会碰到了多个多租户的情况，需要自行判断是单个tenantId还是多个id ex. in (1,2,3)
                final boolean multipleTenantIds = true;
                if(where && multipleTenantIds){
                    //演示如何实现 tenant_id in (20,30)
                    return multipleTenantIdCondition();
                }else {
                    //本项目会遇到的情形
                    return singleTenantIdCondition();
                }
            }

            private Expression singleTenantIdCondition() {
                //从session中得到tenantId
                Object tenantId = request.getSession().getAttribute("tenantId");
                if (tenantId != null){
                    return new LongValue(Long.parseLong(tenantId.toString()));
                }else {
                    return null;
                }
            }

            private Expression multipleTenantIdCondition() {
                final InExpression inExpression = new InExpression();
                inExpression.setLeftExpression(new Column(getTenantIdColumn()));
                final ExpressionList itemList = new ExpressionList();
                final List<Expression> inValues = new ArrayList<>();
                //这里需要对多个tenantId处理,这边只是模拟这种情况
                inValues.add(new LongValue(20));
                inValues.add(new LongValue(30));
                itemList.setExpressions(inValues);
                inExpression.setRightItemsList(itemList);
                return inExpression;
            }

            @Override
            public String getTenantIdColumn() {
                return "tenant_id";
            }

            @Override
            public boolean doTableFilter(String tableName) {
                //判断是否需要过滤表
                Object tenantId = request.getSession().getAttribute("tenantId");
                String loginName = null;
                if (tenantId != null){
                    Object userInfo = request.getSession().getAttribute("user");
                    if (userInfo != null){
                        User user = (User) userInfo;
                        loginName = user.getLoginName();
                    }
                    if (("admin").equals(loginName)){
                        return true;
                    }else {
                        //将没有tenantId的表过滤掉
                        if (("smic_functions").equals(tableName) || ("smic_user_business").equals(tableName) || ("smic_sequence").equals(tableName)
                            || ("smic_material_property").equals(tableName) || ("smic_tenant").equals(tableName)){
                            return true;
                        }else {
                            return false;
                        }
                    }
                }else {
                    return true;
                }
            }
        });

        sqlParsers.add(tenantSqlParser);
        paginationInterceptor.setSqlParserList(sqlParsers);
        paginationInterceptor.setSqlParserFilter(new ISqlParserFilter() {
            @Override
            public boolean doFilter(MetaObject metaObject) {
                MappedStatement ms = SqlParserHelper.getMappedStatement(metaObject);
                // TODO 过滤自定义查询时无租户信息约束出现的情况
                return "com.jshlearn.smicerp.mapper.xxxMapper.xxxMethod1".equals(ms.getId()) || "com.jshlearn.smicerp.mapper.xxxMapper.xxxMethod2".equals(ms.getId());
            }
        });
        return paginationInterceptor;
    }

}
