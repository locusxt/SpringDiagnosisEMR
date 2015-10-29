package com.bindingdai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by daibinding on 15/10/20.
 */
@Controller
public class KnowledgeController {
    @RequestMapping (value = "/ajax/post_knowledge", method=RequestMethod.POST)
    @ResponseBody
    public String knowledgeUpdate(@RequestBody String knowledge)
    {
        System.out.println("begin_post_knowledge");
        System.out.println(knowledge);
        return "knowledge";
    }
}

