package com.springmvc.service;

import com.springmvc.dao.TeacherDao;
import com.springmvc.entity.TbTeacher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Sukiy on 2017/12/27.
 */
@Service("teacherService")
@Transactional(propagation = Propagation.REQUIRED)
public class TeacherService {

    @Resource(name = "teacherDao")
    private TeacherDao teacherDao;

    public List<TbTeacher> findTeacherList(){
        return teacherDao.findTeacherList("from TbTeacher");
    }

    public TeacherDao getTeacherDao() {
        return teacherDao;
    }

    public void setTeacherDao(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }
}
