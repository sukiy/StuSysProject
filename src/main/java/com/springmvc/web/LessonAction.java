package com.springmvc.web;

import com.springmvc.entity.Lesson;
import com.springmvc.service.LessonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Sukiy on 2017/12/11.
 */
@Controller
@RequestMapping("/lessonAction")
public class LessonAction {

    @Resource(name = "lessonService")
    private LessonService lessonService;

    //查询课程信息
    @RequestMapping("/findLessonList")
    @ResponseBody
    public List findLessonList(){
        return lessonService.findLessonList();
    }


    //添加课程信息
    @RequestMapping("/addLesson")
    @ResponseBody
    public String addLesson(Lesson lesson){
        //调用服务层方法执行添加业务
        if (lessonService.addLesson(lesson)) {
            return "success";
        }
        return null;

    }

    //删除
    @RequestMapping("/deleteLesson")
    @ResponseBody
    public int deleteLesson(int ids[]){ //删除课程信息
        int i;
        if (lessonService.deleteLesson(ids)){
            i=1;
        }else {
            i=0;
        }
        return i;
    }

    public LessonService getLessonService() {
        return lessonService;
    }

    public void setLessonService(LessonService lessonService) {
        this.lessonService = lessonService;
    }
}
