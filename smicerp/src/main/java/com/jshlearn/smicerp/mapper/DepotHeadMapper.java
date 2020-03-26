package com.jshlearn.smicerp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jshlearn.smicerp.pojo.DepotHead;
import com.jshlearn.smicerp.vo.DepotHeadVo4List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Description
 * @ClassName DepotHeadMapper
 * @Author 蔡明涛
 * @Date 2020/3/22 15:44
 **/
@Mapper
public interface DepotHeadMapper extends BaseMapper<DepotHead> {
    /**
     * 根据条件获取零售展示对象
     * @param type 出入库类型
     * @param subType 出入库子类
     * @param number 单据编号
     * @param beginTime 查询开始时间
     * @param endTime 查询结束时间
     * @param materialParam 材料产品相关参数
     * @param depotIdList 仓库id的集合
     * @param offSet 当前页
     * @param pageSize 每页显示记录数
     * @return java.util.List<com.jshlearn.smicerp.vo.DeportHeadVo4List>
     * @author 蔡明涛
     * @date 2020/3/23 23:17
     */
    List<DepotHeadVo4List> selectByConditionDeportHead(@Param("type") String type,
                                                       @Param("subType") String subType,
                                                       @Param("number") String number,
                                                       @Param("beginTime") String beginTime,
                                                       @Param("endTime") String endTime,
                                                       @Param("materialParam") String materialParam,
                                                       @Param("depotIdList") List<String> depotIdList,
                                                       @Param("offSet") Integer offSet,
                                                       @Param("pageSize") Integer pageSize);

    /**
     * 根据单据主表的id及单据子表的headId 和 单据子表中的materialId及产品表的id 取得产品名称加信号的字符串
     * @param id 单据主表的id，对应的是单据子表中的headId
     * @return String 产品名称+型号的字符串
     * @author 蔡明涛
     * @date 2020/3/24 19:09
     */
    String findMaterialsListByHeaderId(Long id);
}
