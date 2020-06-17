package com.bysj.AnalysisSystem.controller;


import com.bysj.AnalysisSystem.service.IOrdersService;
import com.kennycason.kumo.CollisionMode;
import com.kennycason.kumo.WordCloud;
import com.kennycason.kumo.WordFrequency;
import com.kennycason.kumo.bg.CircleBackground;
import com.kennycason.kumo.font.KumoFont;
import com.kennycason.kumo.font.scale.SqrtFontScalar;
import com.kennycason.kumo.nlp.FrequencyAnalyzer;
import com.kennycason.kumo.nlp.tokenizers.ChineseWordTokenizer;
import com.kennycason.kumo.palette.LinearGradientColorPalette;
import com.bysj.AnalysisSystem.entity.Orders;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.servlet.ServletUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author qak
 * @since 2019-10-22
 */
@Controller
@RequestMapping("/orders")
public class OrdersController {


    @Autowired
    IOrdersService ordersService;





       @RequestMapping("getcolumn")
        public String ColumnChart(){


         return "dataSet";
        }






    @RequestMapping ("getciyun")
    public void ciyun() throws Exception {


       List<String> list =ordersService.selectciyun();



        //建立词频分析器，设置词频，以及词语最短长度，此处的参数配置视情况而定即可
        FrequencyAnalyzer frequencyAnalyzer = new FrequencyAnalyzer();
        frequencyAnalyzer.setWordFrequenciesToReturn(20000);
        frequencyAnalyzer.setMinWordLength(3);
        frequencyAnalyzer.setMaxWordLength(6);
        //引入中文解析器
        frequencyAnalyzer.setWordTokenizer(new ChineseWordTokenizer());
        //指定文本文件路径，生成词频集合


        final List<WordFrequency> wordFrequencyList = frequencyAnalyzer.load(list);
        //	load("E:\\ciyun/wordcloud.txt");
        //设置图片分辨率
        Dimension dimension = new Dimension(700, 400);
        //此处的设置采用内置常量即可，生成词云对象
        WordCloud wordCloud = new WordCloud(dimension, CollisionMode.PIXEL_PERFECT);
        //设置边界及字体
        wordCloud.setPadding(5);
        java.awt.Font font = new java.awt.Font("STSong-Light", 15, 20);
        //设置词云显示的三种颜色，越靠前设置表示词频越高的词语的颜色  ,
        wordCloud.setColorPalette(new LinearGradientColorPalette(Color.RED, Color.BLUE, Color.GREEN, 30, 30));

        wordCloud.setKumoFont(new KumoFont(font));
        //设置背景色
        wordCloud.setBackgroundColor(new Color(255, 255, 255));
        //设置背景图片
        //wordCloud.setBackground(new PixelBoundryBackground("E:\\爬虫/google.jpg"));
        //设置背景图层为圆形
        wordCloud.setBackground(new CircleBackground(255));
        wordCloud.setFontScalar(new SqrtFontScalar(12, 45));
        //生成词云
        wordCloud.build(wordFrequencyList);
        wordCloud.writeToFile("E:\\谷歌浏览器下载\\baomidou-mybatis-plus-samples-master\\project1\\src\\main\\webapp\\img\\ciyun2.png");


    }




    @RequestMapping("getColumnChart")
    public String getColumnChart(HttpServletRequest request,
                                       HttpServletResponse response, Model model) throws Exception {
        // 在业务层获取创建的柱状图（此时柱状图已经创建完成的）
        JFreeChart chart = ordersService.createColumnarTools();
        // 将图形转换为图片传到dateSet.jsp
        String fileName = ServletUtilities.saveChartAsPNG(chart, 700, 400,
                null, request.getSession());

        String chartURL = request.getContextPath() + "/orders/getColumnChart?filename="
                + fileName;

        model.addAttribute("dataSet",chartURL);

        return  "dataSet";
    }




}