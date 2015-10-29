package com.bindingdai.controller;

import com.bindingdai.model.DoctorTableEntity;
import com.bindingdai.repository.DoctorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by daibinding on 15/10/18.
 */
@Controller
public class RegisterController {
    @Autowired
    DoctorRepository doctorRepository;

    @RequestMapping(value="/register",method = RequestMethod.POST)
    public String Register(@ModelAttribute ("Doctor") DoctorTableEntity doctortable)
    {
        doctorRepository.saveAndFlush(doctortable);
        System.out.println("注册");
        return "redirect:/";

    }


}
