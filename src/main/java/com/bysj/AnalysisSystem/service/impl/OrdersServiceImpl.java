package com.bysj.AnalysisSystem.service.impl;
import com.bysj.AnalysisSystem.vo.chart;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bysj.AnalysisSystem.entity.Orders;
import com.bysj.AnalysisSystem.untils.*;
import com.bysj.AnalysisSystem.mapper.OrdersMapper;
import com.bysj.AnalysisSystem.service.IOrdersService;
import com.bysj.AnalysisSystem.vo.chart2;
import com.bysj.AnalysisSystem.vo.wordsPicture;
import org.jfree.chart.JFreeChart;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author
 * @since 2019-10-22
 */
@Service
public class OrdersServiceImpl extends ServiceImpl<OrdersMapper, Orders> implements IOrdersService {

    @Autowired
   OrdersMapper ordersMapper;

    @Override
    public void insertorder(Orders orders) {
//        Orders orders = new Orders();
//        orders.setSkuid((Integer) list.get(0));
//        orders.setName((String) list.get(1));
//        orders.setSkuid((Integer) list.get(2));
//        orders.setSkuid((Integer) list.get(3));
//        orders.setSkuid((Integer) list.get(4));
//        orders.setSkuid((Integer) list.get(5));
//        orders.setSkuid((Integer) list.get(6));
//        orders.setSkuid((Integer) list.get(7));
//        orders.setSkuid((Integer) list.get(8));
//        orders.setSkuid((Integer) list.get(9));

        ordersMapper.insert(orders);


    }

    @Override
    public List<String> selectciyun() {

        return ordersMapper.selectcolun();
    }

    @Override
    public JFreeChart createColumnarTools() {


        CategoryDataset dataset = getDataSet();
        // 获取柱状图工具类创建的柱状图，（将数据集传入）
        JFreeChart chart = ColumnarTools.createCoColumnar(dataset);
        return chart;
    }





    @Override
    public List<chart> getchart1(String type) {

        return ordersMapper.getchart1(type);
    }

    @Override
    public List<chart> getchart2(String type) {
        return ordersMapper.getchart2(type);
    }

    @Override
    public List<wordsPicture> wordspicture() {
        return ordersMapper.getwordspicture();
    }

    @Override
    public List<Orders> orders() {
        return ordersMapper.orders();
    }

    @Override
    public List<chart2> balancepicture() {
        List<chart2> list=new ArrayList<chart2>();
        chart2 chart1=new chart2();
        BeanUtils.copyProperties(ordersMapper.getbalance1(),chart1);
        chart1.setType("水果");
        chart1.setGoodnumber2(chart1.getGoodnumber()+1000);
        chart1.setMidnumber2(chart1.getMidnumber2()+500);
        chart1.setLownumber2(chart1.getLownumber()+50);



        chart2 chart2=new chart2();
        BeanUtils.copyProperties(ordersMapper.getbalance2(),chart2);
        chart2.setType("冷藏/冷冻食品");
        chart2.setGoodnumber2(chart2.getGoodnumber()+500);
        chart2.setMidnumber2(chart2.getMidnumber2()+10);
        chart2.setLownumber2(chart2.getLownumber()+50);



        chart2 chart3=new chart2();
        BeanUtils.copyProperties(ordersMapper.getbalanc3(),chart3);
        chart3.setType("海鲜水产");
        chart3.setGoodnumber2(chart3.getGoodnumber()+1000);
        chart3.setMidnumber2(chart3.getMidnumber2()+7);
        chart3.setLownumber2(chart3.getLownumber()+10);




        chart2 chart4=new chart2();
        BeanUtils.copyProperties(ordersMapper.getbalance4(),chart4);
        chart4.setType("猪牛羊肉");
        chart4.setGoodnumber2(chart4.getGoodnumber()-2000);
        chart4.setMidnumber2(chart4.getMidnumber2()+100);
        chart4.setLownumber2(chart4.getLownumber()+10);



        chart2 chart5=new chart2();
        BeanUtils.copyProperties(ordersMapper.getbalance5(),chart5);
        chart5.setType("蔬菜");
        chart5.setGoodnumber2(chart5.getGoodnumber()-3000);
        chart5.setLownumber2(chart5.getLownumber()+200);
        chart5.setMidnumber2(chart5.getMidnumber2()+10);


         list.add(chart1);
         list.add(chart2);
         list.add(chart3);
         list.add(chart4);
         list.add(chart5);


//        for (chart2 chart21: list
//             ) {
//            System.out.println(chart21);
//        }


        return list;
    }



    @Override
    public List<HashMap<String,Object>> specialtxtlist() {
       List<HashMap<String,Object>>list=  ordersMapper.getspecialtxt();

//       以特色标语要过滤的数据
//       list.remove("<ahref='htt");
//       list.remove("<ahref=\"htt");
        System.out.println(list);
        return list;
    }


    //获取一个演示用的组合数据集对象 为柱状图添加数据





    private  CategoryDataset getDataSet() {
        // 数据可以从数据库中得到
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();

       int i =ordersMapper.getfruitcolumar();

        dataset.addValue(i,"水果","水果");
       dataset.addValue(ordersMapper.getmeatcolumar(),"肉类","肉类");
        dataset.addValue(ordersMapper.getfreezefoodcolumar(),"冷冻食品","冷冻食品");
        dataset.addValue(ordersMapper.getseafoodscolumar(),"海产品","海产品");
        dataset.addValue(ordersMapper.getvegetablescolumar(),"蔬菜","蔬菜");

        return dataset;

    }

}
