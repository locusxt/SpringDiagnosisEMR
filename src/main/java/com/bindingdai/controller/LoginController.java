package com.bindingdai.controller;

import com.bindingdai.model.DoctorTableEntity;
import com.bindingdai.repository.DoctorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * Created by daibinding on 15/10/16.
 */
@Controller
public class LoginController {
    @Autowired
    private DoctorRepository doctorRepository;

    @RequestMapping(value="/index",method = RequestMethod.GET)
    public String index(Model model)
    {
        List<DoctorTableEntity> doctorTableEntityList=doctorRepository.findAll();
        model.addAttribute("doctorlist",doctorTableEntityList);
        return "index";
    }



    @RequestMapping(value="/knowledge",method = RequestMethod.POST)
    public String login(HttpSession session,HttpServletRequest request,Model model)
    {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        session.setAttribute("usernamesession",username);
        List<DoctorTableEntity> doctorTableEntityList=doctorRepository.findAll();
        int flag=0;
        for(DoctorTableEntity doctor:doctorTableEntityList)
        {
            if(username.equals(doctor.getUsername()))
            {
                if(password.equals(doctor.getPassword()))
                {
                    System.out.println("kkk到达");
                    model.addAttribute("username",username);
                    return "knowledge";
                }
                flag=1;

            }
        }
        System.out.println(username);
        System.out.println(password);

        return "redirect:/";
    }

    @RequestMapping(value="/knowledge",method = RequestMethod.GET)
    public String knowledgeBase(HttpSession session,Model model)
    {
        String username =(String) session.getAttribute("usernamesession");
        System.out.println("登录后的username"+username);
        model.addAttribute("username",username);
        return "knowledge";
    }
}
