package com.springmvc.web;

import com.springmvc.entity.Users;
import com.springmvc.service.UsersService;
import jdk.nashorn.internal.objects.Global;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * Created by Sukiy on 2017/11/6.
 */
@Controller
@RequestMapping("usersAction")
public class UsersAction {

    @Resource(name = "usersService")
    private UsersService usersService;
    @Resource
    HttpServletRequest request;

    @RequestMapping("/doLogin")
    @ResponseBody
    public String doLogin(Users users, HttpSession session){    //用户登录
        users=usersService.doLogin(users);
        if (users!=null){
            session.setAttribute("users",users);
            return "success";
        }
        return "faild";
    }

    @RequestMapping("/doRegist")
    public String doRegist(Users users, Model attr, HttpSession session){    //用户注册
        if (usersService.doRegist(users)){
            session.setAttribute("users",users);
            attr.addAttribute("rtype","1");
        }else {
            attr.addAttribute("rtype","-1");
        }
        return "redirect:/index.jsp";
    }



    public UsersService getUsersService() {
        return usersService;
    }

    public void setUsersService(UsersService usersService) {
        this.usersService = usersService;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
}
