package com.bysj.AnalysisSystem.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.bysj.AnalysisSystem.entity.Comment;
import com.bysj.AnalysisSystem.entity.Orders;
import com.bysj.AnalysisSystem.entity.User;
import com.bysj.AnalysisSystem.service.ICommentService;
import com.bysj.AnalysisSystem.service.IOrdersService;
import com.bysj.AnalysisSystem.service.IUserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.bysj.AnalysisSystem.vo.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.baomidou.mybatisplus.core.toolkit.Wrappers.update;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author xx
 * @since 2019-10-18
 *
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

    //普通用户
    @Autowired
    private IUserService userService;
    @Autowired
    private IOrdersService ordersService;
    @Autowired
    private ICommentService commentService;





    @RequestMapping("/register")
    public String userRegister(User user){
        if (user.getUsername()==null)
            return "register-user";
        user.setRole("user");
        userService.save(user);

        return "redirect:http://106.54.123.171:8110/";
    }



    @ApiOperation("用户登陆")
    @PostMapping("/login")
    public String userLogin(@RequestParam("username")String username,
                            @RequestParam("pwd")String password,HttpSession session,Model model) {




        //获取前端输入的密码和数据库中的密码对比
        String datapassword=userService.selectpassword(username);

//        if (password.equals(datapassword)&&rememberMe.equals("1")) {
//               session.setAttribute("user",username);
//               session.setAttribute("pwd",datapassword);
         if(password.equals(datapassword)){
            session.setAttribute("username", username);
            return "user_main";

        }else
            model.addAttribute("msg","密码错误");
            return "index";

    }

   @ApiOperation("用户修改个人信息")
   @PostMapping("/fixinfo")
    public String userfixpwd(User user){
        if (user.getUsername()==null)
            return "user_mine";

       boolean b =userService.updateById(user);
           return "user_mine";



   }




    @ApiOperation("找回密码")
    @GetMapping("findpwd")
    public String findpwd(String username,
                          String phonenumber, Model model){
        if (phonenumber==null)
            return "find_pwd";

        QueryWrapper queryWrapper=new QueryWrapper();
        queryWrapper.eq("phonenumber",phonenumber);
        queryWrapper.eq("username",username);

        User user = userService.getOne(queryWrapper);
        if (user!=null)
        model.addAttribute("tip","你的密码"+user.getPassword());
        else
            model.addAttribute("tip","根据你的账号或手机号找不到密码，请输入正确的");

        return "find_pwd";
    }



    @ApiOperation("发表评论")
    @RequestMapping(value = "comment")
    public String addCommont(String type, Comment comment, Model model){
        if (comment.getUName()==null&&type==null)
            return "user_comment";
        if (type!=null){
            model.addAttribute("type",type);
            return "user_comment_one";
        }


        if (comment.getUName()!=null)

        commentService.save(comment);
        return "user_comment";
    }


    @ApiOperation("查看自己评论")
    @RequestMapping("findcommont")
    public String findCommont(Model model,HttpSession session){

        String username = (String) session.getAttribute("username");

        QueryWrapper queryWrapper=new QueryWrapper();
       queryWrapper.eq("u_name",username);

        List<Comment> list = commentService.list(queryWrapper);
        model.addAttribute("myconmmentlist",list);
        return "user_findcomment_one";

    }

    @RequestMapping("deleteComment")
    @ResponseBody
    public String deleteComment(Integer id){

        boolean b = ordersService.removeById(id);
        if(b){
            return "OK";
        }else{
            return "FAIL";
        }

    }





    @ApiOperation("查看其他人的评论")
    @RequestMapping("allcommont")
    public String allCommont(Model model){

        List<Comment> list = commentService.list();
        model.addAttribute("conmmentlist",list);

        return "user_findcomment";

    }





    @ApiOperation("商品种类的柱状图")
    @GetMapping("getchart1")
    public ModelAndView getchart1(String type){

        ModelAndView mv=new ModelAndView();
         if (type==null){
                mv.setViewName("user_chart");
             return mv;
         }

        List<chart> char1= ordersService.getchart1(type);
        List<chart> char2= ordersService.getchart2(type);
        mv.addObject("chart1",char1);
        mv.addObject("chart2",char2);

       mv.setViewName("statistic");

       return mv;
   }



//    @ApiOperation("好评度的饼状图")
//    @GetMapping("getchart2")
//    public ModelAndView getchart2(@RequestParam("type") String type){
//
//        ModelAndView mv=new ModelAndView();
//
//        mv.setViewName("statistic");
//
//        return mv;
//    }


    @ApiOperation("词云图")
    @RequestMapping("wordspicture")
    public String wordspicture(Model model){

       List<wordsPicture> list= ordersService.wordspicture();
//       wordsPicture wordsPicture=new wordsPicture("<ahr",4181);
//       list.remove(list.indexOf(wordsPicture));

        model.addAttribute("wordslist",list);

       return "user_Word";
    }


    @ApiOperation("对比图")
    @RequestMapping("balancespicture")
    public String balance(Model model){

        List<chart2> list= ordersService.balancepicture();
//       wordsPicture wordsPicture=new wordsPicture("<ahr",4181);
//       list.remove(list.indexOf(wordsPicture));

        List<HashMap<String,Object>> list1 = ordersService.specialtxtlist();

        model.addAttribute("balancelist",list);
        model.addAttribute("specialtxt",list1);

        return "statistic1";
    }


    @ApiOperation("我的信息")
    @RequestMapping("myinfo")
    public String myifo(HttpSession session,Model model){

        String username = (String) session.getAttribute("username");

        QueryWrapper queryWrapper=new QueryWrapper();
        queryWrapper.eq("username",username);

        User user = userService.getOne(queryWrapper);

        model.addAttribute("user",user);

        return "user_mine";
    }




}
