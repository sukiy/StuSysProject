package com.springmvc.dao;

import com.springmvc.entity.Lesson;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Sukiy on 2017/12/11.
 */
@Repository("lessonDao")
public class LessonDao extends BaseDao{

    public List findLessonList(String hql){ //查询课程信息
        return getSession().createQuery(hql).list();
    }

    public boolean deleteLesson(Lesson lesson){
        try {
            getSession().delete(lesson);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;

    }

    public boolean addLesson(Lesson lesson){
        try{
            getSession().save(lesson);
            return true;
        } catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
