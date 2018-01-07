package com.springmvc.service;

import com.springmvc.dao.StuDao;
import com.springmvc.entity.TbStu;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Sukiy on 2017/12/13.
 */
@Service("stuService")
@Transactional(propagation = Propagation.REQUIRED)
public class StuService {

    @Resource(name = "stuDao")
    private StuDao stuDao;

    public List findStuList(){ //查询学生
        String hql="select s.sno,s.sname,s.sage,s.sex,s.sintime,c.cname,t.tname from TbStu s" +
                " inner join s.tbClass c left join c.tbTeacher t order by c.cname asc";
        return stuDao.findStuList(hql);
    }

    public boolean addStu(TbStu stu){ //添加学生
        return stuDao.addStu(stu);
    }

    public boolean deleteStu(int ids[]){ //删除学生
        if(ids.length > 0){
            for(int id : ids){
                TbStu stu = new TbStu();
                stu.setSno(id);
                stuDao.deleteStu(stu);
            }
            return true;
        }
        return false;
    }

    public boolean updateStu(TbStu stu){ //修改学生
        return stuDao.updateStu(stu);
    }

    public TbStu findStuById(int id){ //根据id查询
        return stuDao.findStuById(id);
    }

    public StuDao getStuDao() {
        return stuDao;
    }

    public void setStuDao(StuDao stuDao) {
        this.stuDao = stuDao;
    }
}
