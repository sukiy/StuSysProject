package com.springmvc.dao;

import com.springmvc.entity.TbStu;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Sukiy on 2017/12/13.
 */
@Repository("stuDao")
public class StuDao extends BaseDao{

    public boolean addStu(TbStu stu){ //添加学生
        try {
            getSession().save(stu);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    public List findStuList(String hql){ //查询学生信息
        return getSession().createQuery(hql).list();
    }

    public TbStu findStuById(int id){ //根据id查询
        return getSession().get(TbStu.class,id);
    }

    public boolean updateStu(TbStu stu){ //修改学生信息
        try {
            getSession().update(stu);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteStu(TbStu stu){ //删除学生信息
        try {
            getSession().delete(stu);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
