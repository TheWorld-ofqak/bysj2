package com.bysj.AnalysisSystem.entity;


import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author 
 * @since 2020-03-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;
    @TableId(value = "c_id", type = IdType.AUTO)
    private Integer cId;

    private String uName;

    private String oType;

    /**
     * 评论的内容
     */
    private String content;
    //评论的 类型方向
    private  String commenttype;

    /**
     * 评论的时间
     */

    @TableField(fill = FieldFill.INSERT)
    private Date createTime;


}
