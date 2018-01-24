package com.springmvc.service;

import com.springmvc.dao.TbClassDao;
import com.springmvc.entity.TbClass;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Sukiy on 2017/12/25.
 */
@Service("clsService")
@Transactional(propagation = Propagation.REQUIRED)
public class TbClassService {

    @Resource(name = "clsDao")
    private TbClassDao clsDao;

    public List<TbClass> findClsList(){
        return clsDao.findClsList("select c.cno,c.cname from TbClass c");
    }

    public boolean addCls(TbClass cls){

        return clsDao.addCls(cls);
    }

    public List countCls(){
        return clsDao.countCls("select c.cname,count(s.sname),t.tname from TbStu s right join s.tbClass c inner join c.tbTeacher t group by c.cname");
    }

    public TbClassDao getClsDao() {
        return clsDao;
    }

    public void setClsDao(TbClassDao clsDao) {
        this.clsDao = clsDao;
    }
}
