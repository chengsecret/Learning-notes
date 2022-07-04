package com.baizhi.controller;

import com.baizhi.entity.Dept;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("dept")
public class DeptController {

    @RequestMapping("findAll")
    public void findAll(HttpServletResponse response) throws IOException {

        List<Dept> depts = new ArrayList<>();
        depts.add(new Dept("1","小卖部"));
        depts.add(new Dept("2","研发部"));
        depts.add(new Dept("3","教学部"));

        StringBuilder sb = new StringBuilder();

        sb.append("<select>");

        depts.forEach(dept-> {
            sb.append("<option value='"+dept.getId()+"'>"+dept.getName()+"</option>");
        });

        sb.append("</select>");

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println(sb.toString());

    }
}
