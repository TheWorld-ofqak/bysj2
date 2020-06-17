package com.bysj.AnalysisSystem.controller;


import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 
 * @since 2020-03-10
 */
@Controller
public class CommentController {

    @RequestMapping("/")
    public String index() {
      return "index1";
    }
    @RequestMapping("/1")
    public String index1() {
        return "register-user";
    }



}
