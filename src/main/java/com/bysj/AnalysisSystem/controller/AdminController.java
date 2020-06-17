package com.bysj.AnalysisSystem.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.bysj.AnalysisSystem.entity.Admin;
import com.bysj.AnalysisSystem.entity.Comment;
import com.bysj.AnalysisSystem.entity.Orders;
import com.bysj.AnalysisSystem.entity.User;
import com.bysj.AnalysisSystem.mapper.OrdersMapper;
import com.bysj.AnalysisSystem.mapper.UserMapper;
import com.bysj.AnalysisSystem.service.IAdminService;
import com.bysj.AnalysisSystem.service.ICommentService;
import com.bysj.AnalysisSystem.service.IOrdersService;
import com.bysj.AnalysisSystem.service.IUserService;
import com.bysj.AnalysisSystem.untils.MySQLDatabaseBackup;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author
 * @since 2019-10-17
 */
@Api(value = "管理员页面")
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    IAdminService adminService;
    @Autowired
    ICommentService commentService;
    @Autowired
    IUserService userService;
    @Autowired
    UserMapper userMapper;
    @Autowired
    IOrdersService ordersService;
    @Autowired
    OrdersMapper ordersMapper;




    @ApiOperation("用户登陆")
    @PostMapping("/login")
    public String userLogin(@RequestParam("username")String username,
                            @RequestParam("pwd")String password,HttpSession session) {

        String datapassword=adminService.selectpassword(username);

        if(password.equals(datapassword)){
            session.setAttribute("username",username);
            return "adminMain";
        }

        else
            return "failerlogin";

    }



    @ApiOperation("展示所有的用户")
    @RequestMapping(value = "/showuser",method = RequestMethod.GET)
    public String showuser(Model model){

       List<User> userlist=adminService.selectall();

         model.addAttribute("userList",userlist);

         return "adminUserlist";

     }


    @ApiOperation("编辑用户信息")
    @GetMapping(value = "filesEdit" )
    @ResponseBody
    public User userEdit(String id){
        User byId = userMapper.selectById(id);

        return byId;
    }

    @PostMapping(value = "updateuser" )
    @ResponseBody
    public String userupdate(User id){
        boolean r=userService.updateById(id);
        if(r){
            return "OK";
        }else{
            return "FAIL";
        }
    }

    @ApiOperation("用户的删除")
    @PostMapping("userdelete")
    @ResponseBody
    public String  userdeletet(Integer id){

        boolean r= userService.removeById(id);
        if( r){
            return "OK";
        }else{
            return "FAIL";
        }

    }


    @ApiOperation("增加user权限的为admin权限")
    @PostMapping("/uprole")
    public String uprole(String username){
        User user=  adminService.selectbyusername(username);
        Admin admin = new Admin();
        admin.setUsername(user.getUsername());
        admin.setPassword(user.getPassword());
        admin.setAge(user.getAge());
        admin.setPhonenumber(user.getPhonenumber());
        admin.setRole("admin");

        adminService.addadmin(admin);
        adminService.deleteuserbyname(username);

     return "OK";

    }



    @ApiOperation("展示所有评论")
    @GetMapping("/showcomment")
    public ModelAndView showcomment(){

        List<Comment> list = commentService.list();

        ModelAndView mv =new ModelAndView();
        mv.addObject("commentList",list);
        mv.setViewName("adminComment");
        return mv;

    }


    @ApiOperation("展示所有订单")
    @GetMapping("/showorders")
    public ModelAndView showorders(){

        List<Orders> list=ordersService.orders();

        ModelAndView mv =new ModelAndView();
        mv.addObject("ordersList",list);
        mv.setViewName("adminOrders");
        return mv;

    }



    @ApiOperation("编辑订单商品")
    @GetMapping(value = "ordersEdit" )
    @ResponseBody
    public Orders ordersEdit(String id){

       QueryWrapper queryWrapper=new QueryWrapper();
       queryWrapper.eq("skuid",id);

        Orders byId = ordersMapper.selectOne(queryWrapper);

        return byId;
    }

    @ApiOperation("订单商品的更新")
    @PostMapping(value = "updateorders" )
    @ResponseBody
    public String ordersupdate(Orders id){
        int r=ordersMapper.updateById(id);
        if(r>0){
            return "OK";
        }else{
            return "FAIL";
        }
    }

    @ApiOperation("订单商品的删除")
    @PostMapping("ordersdelete")
    @ResponseBody
    public String  ordersdeletet(String id){

        boolean r= ordersService.removeById(id);
        if(r){
            return "OK";
        }else{
            return "FAIL";
        }

    }




    @ApiOperation("评论的删除")
    @RequestMapping("commontdelete")
    @ResponseBody
    public String  commontdeletet(String id){

        System.out.println("aaaaaaaaa");
        boolean r= commentService.removeById(id);
        if( r){
            return "OK";
        }else{
            return "FAIL";
        }

    }



    @ApiOperation("我的信息")
    @RequestMapping("myifo")
    public String myifo(HttpSession session, Model model){

        String username = (String) session.getAttribute("username");

        QueryWrapper queryWrapper=new QueryWrapper();
        queryWrapper.eq("username",username);

          Admin admin = adminService.getOne(queryWrapper);
          model.addAttribute("admin",admin);

        return "adminMine";
    }

    @ApiOperation("管理员修改个人信息")
    @PostMapping("/fixinfo")
    public String userfixpwd(Admin user){

        boolean b =adminService.updateById(user);
        return "adminMine";


    }


    @GetMapping("import")
    public  String importe(){
        return  "adminImport";
    }




    @PostMapping("/import1")
    public String improtExcel(MultipartFile filepath) throws Exception {


        InputStream is = filepath.getInputStream();
        System.out.println("qqqq");

       // InputStream is = new FileInputStream((File) filepath);

        Workbook workbook = new XSSFWorkbook(is);
        Sheet sheet = workbook.getSheetAt(0);

//        // 读取标题所有内容
        //      Row rowTitle = sheet.getRow(1);
//        if (rowTitle != null) {// 行不为空
//            // 读取cell
//            int cellCount = rowTitle.getPhysicalNumberOfCells();
//            for (int cellNum = 0; cellNum < cellCount; cellNum++) {
//                Cell cell = rowTitle.getCell(cellNum);
//                List<Orders> list=new LinkedList<>();
//                if (cell != null) {
//
//                    Object cellValue = cell.getStringCellValue();
//
//                    list.add((Orders) cellValue);
//
//                }
//            }
//            Mapper插入
//        }
        List<Orders> list1 = new LinkedList<>();

        // 读取商品列表数据
        for (Row row : sheet) {

            //首行（即表头）不读取
            if (row.getRowNum() == 0) {
                continue;
            }

            Orders orders = new Orders();
            row.getCell(0).setCellType(Cell.CELL_TYPE_NUMERIC);
            orders.setSkuid(row.getCell(0).getNumericCellValue());


            if (row.getCell(1) != null) {
                row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
                orders.setName(row.getCell(1).getStringCellValue());
            } else
                orders.setName("空");

            orders.setType(row.getCell(2).getStringCellValue());
            row.getCell(3).setCellType(Cell.CELL_TYPE_NUMERIC);
            orders.setPrice((float) row.getCell(3).getNumericCellValue());
            row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
            orders.setVipprice(row.getCell(4).getStringCellValue());
            row.getCell(5).setCellType(Cell.CELL_TYPE_NUMERIC);
            orders.setGoodnumber((int) row.getCell(5).getNumericCellValue());
            row.getCell(6).setCellType(Cell.CELL_TYPE_NUMERIC);
            orders.setMidnumber((int) row.getCell(6).getNumericCellValue());
            row.getCell(7).setCellType(Cell.CELL_TYPE_NUMERIC);
            orders.setLownumber((int) row.getCell(7).getNumericCellValue());

            row.getCell(8).setCellType(Cell.CELL_TYPE_STRING);
            orders.setGoodsay(row.getCell(8).getStringCellValue());
            if (row.getCell(9) != null)
                orders.setSpecialtxt(row.getCell(9).getStringCellValue());
            else
                orders.setSpecialtxt("good");
            System.out.println(orders);


            ordersService.insertorder(orders);
        }

        is.close();



         return  "adminImport";

    }



//    @Value(value = "username")
//    String username;
    //备份数据操作

    @GetMapping("saveandrecover")
    public  String savesql(){
        return  "adminBackup";
    }

    @RequestMapping(value = "backup" ,method = RequestMethod.GET)
    @ResponseBody
    public String  backup(HttpSession session){


        String savePath="E:\\mysql";
        String[] list=new File(savePath).list();
        session.setAttribute("backupName",list);

        try {
            Date date=new Date();
            DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd_hh-mm-ss");
            String name="backup-"+dateFormat.format(date)+".sql";

            String IP="127.0.0.1";//你的

            String username="root";
            String password="qak195085";  //此处修改你的密码

            String dataBase="bysj2";
            if (MySQLDatabaseBackup.exportDatabaseTool(IP, username, password, savePath, name, dataBase)) {
                return "OK";
            } else {
                return "FALSE";
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return "FALSE";
    }
    //还原数据库
    @RequestMapping(value = "rebackup",method = RequestMethod.POST)
    @ResponseBody
    public String  rebackup(String mess){
        try {
            MySQLDatabaseBackup.restore(mess);
            return "OK";
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "FALSE";
    }




}
