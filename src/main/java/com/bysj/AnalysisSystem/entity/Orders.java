package com.bysj.AnalysisSystem.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author qak
 * @since 2019-10-22
 */
@Data
@TableName("orders")
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "skuid")
    private double skuid;

    private String name;

    private String type;

    private Float price;

    private String vipprice;

    private Integer goodnumber;

    private Integer midnumber;

    private Integer lownumber;

    private String goodsay;

    private String specialtxt;


}
