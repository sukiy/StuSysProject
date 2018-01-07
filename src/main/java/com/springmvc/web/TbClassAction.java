package com.springmvc.web;

import com.springmvc.entity.TbClass;
import com.springmvc.service.TbClassService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Sukiy on 2017/12/25.
 */
@Controller
@RequestMapping("/clsAction")
public class TbClassAction {

    @Resource(name = "clsService")
    private TbClassService clsService;

    @RequestMapping("/findClsList")
    @ResponseBody
    public List findClsList(){ //查询班级信息
        return clsService.findClsList();
    }

    @RequestMapping("/addCls")
    @ResponseBody
    public String addCls(TbClass cls){
        if (clsService.addCls(cls)){
            return "success";
        }
        return null;
    }

    @RequestMapping("/countCls")
    @ResponseBody
    public List countCls(){ //查询班级人数
        return clsService.countCls();
    }

    public TbClassService getClsService() {
        return clsService;
    }

    public void setClsService(TbClassService clsService) {
        this.clsService = clsService;
    }
}
