package com.test;
import com.springmvc.entity.*;
import com.springmvc.web.StuAction;
import com.springmvc.web.UsersAction;
import org.junit.Test;



/**
 * Created by Sukiy on 2018/1/23.
 */
public class AppTest{


    @Test
    public void testUsers(){
        Users user = new Users(100,"dididi","dididi",1);
        System.out.println(user);
    }

    @Test
    public void testLesson(){
        Lesson lesson=new Lesson(0,"计算机基础");
        System.out.println(lesson);
    }

    @Test
    public void testClass(){
        TbClass tbClass=new TbClass(0,"SJ141");
        System.out.println(tbClass);
    }

    @Test
    public void testStu(){
        TbStu stu=new TbStu(0,"Tim",18,"男","2017-9-8");
        System.out.println(stu);
    }

    @Test
    public void testTeacher(){
        TbTeacher tbTeacher=new TbTeacher(0,"张老师");
        System.out.println(tbTeacher);
    }
}
