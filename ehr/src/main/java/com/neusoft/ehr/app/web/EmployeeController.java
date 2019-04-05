package com.neusoft.ehr.app.web;

import com.neusoft.ehr.app.entity.Employee;
import com.neusoft.ehr.app.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService userService;

    @RequestMapping("findAll")
    @ResponseBody
    public List<Employee> findAll(){
        List<Employee> all = userService.findAll();
        return all;
    }

    @RequestMapping("")
    public String userList(){


        return "table";
    }
}
