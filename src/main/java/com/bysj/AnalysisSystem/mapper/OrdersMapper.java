package com.bysj.AnalysisSystem.mapper;

import com.bysj.AnalysisSystem.entity.Orders;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.bysj.AnalysisSystem.vo.chart;
import com.bysj.AnalysisSystem.vo.chart2;
import com.bysj.AnalysisSystem.vo.chart3;
import com.bysj.AnalysisSystem.vo.wordsPicture;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author qak
 * @since 2019-10-22
 */

@Repository
@Mapper
public interface OrdersMapper extends BaseMapper<Orders> {

    @Select("select specialtxt from orders")
    List<String> selectcolun();

    @Select("select count(type) from orders where type='水果'")
      int getfruitcolumar();


    @Select("select count(type) from orders where type='海鲜水产'")
    int getseafoodscolumar();

    @Select("select count(type) from orders where type='猪牛羊肉'")
    Integer getmeatcolumar();

    @Select("select count(type) from orders where type='冷藏/冷冻食品'")
    Integer getfreezefoodcolumar();
    @Select("select count(type) from orders where type='蔬菜'")
    Integer getvegetablescolumar();

    List<chart> getchart1(@Param("type")String type);
    List<chart> getchart2(@Param("type")String type);

    List<wordsPicture> getwordspicture();
    @Select("select * from orders limit 100")
    List<Orders> orders();

    @Select("select goodnumber ,midnumber,lownumber from orders where type = '水果' limit 1")
    chart3 getbalance1();


    @Select("select goodnumber ,midnumber,lownumber from orders where type = '冷藏/冷冻食品' limit 1")
    chart3 getbalance2();

    @Select("select goodnumber ,midnumber,lownumber from orders where type = '海鲜水产' limit 1")
    chart3 getbalanc3();
    @Select("select goodnumber ,midnumber,lownumber from orders where type = '猪牛羊肉' limit 1")
    chart3 getbalance4();
    @Select("select goodnumber ,midnumber,lownumber from orders where type = '蔬菜' limit 1")
    chart3 getbalance5();
//    @Select("select DISTINCT SUBSTR(specialtxt,1,11) specialtxt  from orders limit 50")
//    List<String> getspecialtxt();
    @Select("select  content ,count(*) as num  from comment group by content")
    List<HashMap<String,Object>> getspecialtxt();
}
