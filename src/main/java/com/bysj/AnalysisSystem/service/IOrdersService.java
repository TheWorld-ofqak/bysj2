package com.bysj.AnalysisSystem.service;
import com.bysj.AnalysisSystem.vo.chart;
import com.bysj.AnalysisSystem.entity.Orders;
import com.baomidou.mybatisplus.extension.service.IService;

import com.bysj.AnalysisSystem.vo.chart2;
import com.bysj.AnalysisSystem.vo.wordsPicture;
import org.jfree.chart.JFreeChart;

import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qak
 * @since 2019-10-22
 */

public interface IOrdersService extends IService<Orders> {

    void insertorder(Orders orders);

    List<String> selectciyun();

    JFreeChart createColumnarTools();

    List<chart> getchart1(String type);

    List<chart> getchart2(String type);

    List<wordsPicture> wordspicture();

    List<Orders> orders();

    List<chart2> balancepicture();

    List<HashMap<String,Object>> specialtxtlist();
}
