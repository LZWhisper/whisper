package com.neusoft.ehr.app.web;

import com.neusoft.ehr.app.entity.Employee;
import com.neusoft.ehr.app.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    private EmployeeService userService;
    /**
     * 验证是否登录
     * @param employee
     * @return
     */
    @RequestMapping("/login")
    public String login(Employee employee, HttpSession session, Model model){
        //交给数据库去获得指定密码和用户名的数据，有就代表登录

        //1查询数据
        Employee principal = userService.get(employee);

        //2验证：如果为空，失败并返回登录页面，提示失败，否则返回首页
        if (principal != null) {
            session.setAttribute("principal",principal);
            return "redirect:index";
        }
        model.addAttribute("message","登录失败，请重新输入用户名和密码");
        return "forward:/login.jsp";
    }

    @RequestMapping("logout")
    public String logout(HttpSession httpSession){
        httpSession.invalidate();
        return "redirect:/login.jsp";
    }
    
    @RequestMapping("/index")
    public String index(){
        return "index";
    }
}
