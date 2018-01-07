package com.springmvc.service;

import com.springmvc.dao.LessonDao;
import com.springmvc.entity.Lesson;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Sukiy on 2017/12/11.
 */
@Service("lessonService")
@Transactional(propagation = Propagation.REQUIRED)
public class LessonService {

    @Resource(name = "lessonDao")
    private LessonDao lessonDao;


    public List findLessonList(){
        return lessonDao.findLessonList("select l.lno,l.lname,t.tname from Lesson l inner join l.tbTeacher t");
    }

    public boolean addLesson(Lesson lesson){
        return lessonDao.addLesson(lesson);
    }

    public boolean deleteLesson(int ids[]){ //删除课程
        if(ids.length > 0){
            for(int id : ids){
                Lesson lesson=new Lesson();
                lesson.setLno(id);
                lessonDao.deleteLesson(lesson);
            }
            return true;
        }
        return false;
    }

    public LessonDao getLessonDao() {
        return lessonDao;
    }

    public void setLessonDao(LessonDao lessonDao) {
        this.lessonDao = lessonDao;
    }
}
