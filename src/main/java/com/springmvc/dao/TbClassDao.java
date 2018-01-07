package com.springmvc.dao;

import com.springmvc.entity.TbClass;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Sukiy on 2017/12/25.
 */
@Repository("clsDao")
public class TbClassDao extends BaseDao{

    public List<TbClass> findClsList(String hql){   //查询班级
            return getSession().createQuery(hql).list();
    }

    public boolean addCls(TbClass cls){ //添加班级
            getSession().save(cls);
            return true;
    }

    public List countCls(String hql){ //查询班级人数
        return getSession().createQuery(hql).list();
    }
}
