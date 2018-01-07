package com.springmvc.dao;

import com.springmvc.entity.TbTeacher;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * Created by Sukiy on 2017/12/27.
 */
@Repository("teacherDao")
public class TeacherDao extends BaseDao{

    public List<TbTeacher> findTeacherList(String hql){ //查询老师
        return getSession().createQuery(hql).list();
    }
}
