package com.springmvc.web;

import com.springmvc.entity.TbTeacher;
import com.springmvc.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Sukiy on 2017
 * /12/27.
 */
@Controller
@RequestMapping("/teacherAction")
public class TeacherAction {

    @Resource(name = "teacherService")
    private TeacherService teacherService;

    @RequestMapping("/findTeacherList")
    @ResponseBody
    public List<TbTeacher> findTeacherList(){ //查询老师
        return teacherService.findTeacherList();
    }

    public TeacherService getTeacherService() {
        return teacherService;
    }

    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }
}
