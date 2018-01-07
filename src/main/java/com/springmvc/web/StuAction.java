package com.springmvc.web;

import com.springmvc.entity.TbStu;
import com.springmvc.service.StuService;
import javafx.scene.control.Alert;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Sukiy on 2017/12/13.
 */
@Controller
@RequestMapping("/stuAction")
public class StuAction {

    @Resource(name = "stuService")
    private StuService stuService;

    @RequestMapping("/findStuList")
    @ResponseBody
    public List findStuList(){ //查询学生信息
        return stuService.findStuList();
    }

    @RequestMapping("/addStu")
    @ResponseBody
    public int addStu(TbStu stu){
           //调用服务层方法执行添加业务
        if(stuService.addStu(stu)){
            return 1;
        }
        return 0;
    }

    @RequestMapping("/deleteStu")
    @ResponseBody
    public int deleteStu(int ids[]){ //删除学生信息
        int i;
        if (stuService.deleteStu(ids)){
            i=1;
        }else {
            i=0;
        }
        return i;
    }

    @RequestMapping("/toUpdate")
    @ResponseBody
    public TbStu toUpdate(TbStu stu){
        //直接把查询出来的stu对象返回到前台，这是异步的做法
        //如果是同步，再参数列表里加上model|modelMap...,用来把你查出来的数据保存到作用域中，带到前台
        return stuService.findStuById(stu.getSno());
    }

    @RequestMapping("/updateStu")
    @ResponseBody
    public int updateStu(TbStu stu){
        System.out.println(stu.getSname());
        if (stuService.updateStu(stu)){
            return 11;
        }
        return 10;
    }

    public StuService getStuService() {
        return stuService;
    }

    public void setStuService(StuService stuService) {
        this.stuService = stuService;
    }
}
