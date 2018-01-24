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

    @RequestMapping("/findStuByName")
    @ResponseBody
    public List findStuByName(String name){ //根据姓名查询 ，在这里，我们可以看到，你是要把这个值封装到变量中，所以，，，
        return stuService.findStuByName(name);
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
