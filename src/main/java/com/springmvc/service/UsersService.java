package com.springmvc.service;

import com.springmvc.dao.UsersDao;
import com.springmvc.entity.Users;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Sukiy on 2017/11/6.
 */

@Service("usersService")
@Transactional(propagation = Propagation.REQUIRED)
public class UsersService {

    @Resource
    private UsersDao usersDao;

    public Users doLogin(Users users){  //处理用户登陆的方法
        String hql="from Users u where u.uname='"+users.getUname()+"' and u.ustatus=1";
        List<Users> list=usersDao.findUserList(hql);   //取出同名的所有用户
        if(list!=null&&list.size()>0){
            for (Users user:list){
                if(user.getUname().equals(users.getUname()) && user.getUpwd().equals(users.getUpwd())){
                    return user;
                }
            }
        }
        return null;
    }

    public boolean doRegist(Users users){ //处理用户注册的方法
        return usersDao.addUsers(users);
    }

}
