package com.bindingdai.controller;

import com.bindingdai.repository.PatientRepository;
import com.google.gson.*;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bindingdai.model.*;
import java.util.List;

/**
 * Created by daibinding on 16/6/20.
 */
@Controller
public class PatientManageController {
    @Autowired
    private com.bindingdai.repository.DoctorRepository DoctorRepository;
    @Autowired
    private PatientRepository patientRepository;

    @RequestMapping(value = "/patientManage", method = RequestMethod.GET)
    public String patientManage(Model model)
    {
        return "patientManage";

    }




    @RequestMapping("/post_patient_info_manage")
    public void post_patient_info_manage(HttpServletRequest request, HttpServletResponse response) throws Exception {

        List<PatientEntity> patientEntityList=patientRepository.findAll();
        JsonArray jsons=new JsonArray();
        for(PatientEntity patientkey:patientEntityList)
        {

            JsonObject jsonObject=new JsonObject();
            jsonObject.addProperty("id",patientkey.getIdpatient());
            jsonObject.addProperty("name",patientkey.getPatientName());
            jsonObject.addProperty("person_id",patientkey.getPatientPersonId());
            jsonObject.addProperty("clinic_id",patientkey.getPatientClinicId());
            jsonObject.addProperty("paycard_id",patientkey.getPatientPaycardId());
            jsonObject.addProperty("age",patientkey.getPatientAge());
            jsonObject.addProperty("telnumber",patientkey.getPatientTelNumber());
            jsonObject.addProperty("gender",patientkey.getPatientGender());
            System.out.println("生成json成功test");
            if(patientkey.getPatientPaytype()!=null)
            {
                if(patientkey.getPatientPaytype().equals("public"))
                {
                    jsonObject.addProperty("paytype","公费");
                }
                else if(patientkey.getPatientPaytype().equals("private"))
                {
                    jsonObject.addProperty("paytype","自费");
                }
                else
                {
                    jsonObject.addProperty("paytype",patientkey.getPatientPaytype());
                }
            }
            else
            {
                jsonObject.addProperty("paytype","未知");
            }


            //jsonObject.put("id",patientkey.getIdPatient());
            //jsonObject.put("id",patientkey.getIdPatient());
            //jsons.add(jsonObject);
            jsons.add(jsonObject);
        }
        response.getWriter().print(jsons.toString());
        //System.out.println("生成json成功");
    }

    @RequestMapping (value = "/ajax/add_patient_info", method=RequestMethod.POST)
    @ResponseBody
    public String add_patient_info(@RequestBody String newPatient ) throws Exception
    {
        //System.out.println("begin_post_knowledge");
        //System.out.println(patient_info);

        JSONObject jb=new JSONObject(newPatient);

        PatientEntity newpa=new PatientEntity();


        String name=jb.getString("name");
        String clinicid=jb.getString("clinicid");
        String gender=jb.getString("gender");
        String birthday=jb.getString("birthday");
        String age=jb.getString("age");
        String personid=jb.getString("personid");
        String paytype=jb.getString("paytype");
        //String m=jb.getString("name");

        System.out.println(name+"save patient_info begin");
        newpa.setPatientName(name);

        newpa.setPatientClinicId(clinicid);
        newpa.setPatientGender(gender);
        newpa.setPatientAge(age);
        newpa.setPatientBirthday(birthday);
        newpa.setPatientPersonId(personid);
        newpa.setPatientPaytype(paytype);
        newpa.setPatientClinicState("1");

        System.out.println(name+"save patient_info finished1");
        patientRepository.saveAndFlush(newpa);
        System.out.println(name+"save patient_info finished2");
        System.out.println(clinicid);
        return "";
    }


}


