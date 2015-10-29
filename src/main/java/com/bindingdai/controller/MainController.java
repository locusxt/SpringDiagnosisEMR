package com.bindingdai.controller;

import com.bindingdai.model.UserEntity;
import com.bindingdai.repository.DoctorRepository;
import com.bindingdai.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by daibinding on 15/10/15.
 */
@Controller
public class MainController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private DoctorRepository doctorRepository;


    @RequestMapping(value="/",method = RequestMethod.GET)
    public String index()
    {
        return "index";
    }

    @RequestMapping(value = "/users",method = RequestMethod.GET)
    public String users(ModelMap modelmap)
    {
        List<UserEntity> userlist=userRepository.findAll();

        modelmap.addAttribute("userList",userlist);

        return "userManage";
    }

    @RequestMapping(value = "/addUser",method = RequestMethod.GET)
    public String adduser()
    {
        return "addUser";
    }

    @RequestMapping(value = "/adduserPost",method = RequestMethod.POST)
    public String adduserPost(@ModelAttribute ("user") UserEntity userEntity)
    {
        userRepository.saveAndFlush(userEntity);
        return "redirect:/users";
    }
    @RequestMapping(value="/testjsp")
    public String testjsp()
    {
        return "testjsp";
    }



}
