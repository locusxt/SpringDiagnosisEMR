package com.bindingdai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by daibinding on 15/10/16.
 */
@Controller
public class DiagnosisController {
    @RequestMapping(value = "/diagnosis",method = RequestMethod.POST)
    public String diagnosis(HttpSession session)
    {
        return "diagnosis";
    }
    @RequestMapping(value = "/diagnosis",method = RequestMethod.GET)
    public String diagnosis()
    {
        return "diagnosis";
    }


}
