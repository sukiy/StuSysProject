package com.springmvc.dao;

import com.springmvc.entity.Users;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Sukiy on 2017/11/6.
 */
@Repository("usersDao")
public class UsersDao extends BaseDao {

    public boolean addUsers(Users users){   //添加用户
        getSession().save(users);
        return true;
    }

    public List findUserList(String hql){   //查询用户
        return getSession().createQuery(hql).list();
    }


}
