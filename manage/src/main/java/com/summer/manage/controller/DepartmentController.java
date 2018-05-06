package com.summer.manage.controller;

import com.summer.manage.entity.Department;
import com.summer.manage.entity.User;
import com.summer.manage.service.DepartmentService;
import com.summer.manage.service.DictionaryService;
import com.summer.manage.service.UserService;
import com.summer.manage.utils.MapKit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @GetMapping("/")
    public String index() {
        return "department/index";
    }

    @GetMapping("/list")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit) {
        Page<Department> list = departmentService.findAll(new PageRequest(page - 1, limit));


        return MapKit.okAsList(list.getContent(), list.getTotalElements()).getMap();
    }

    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(@Valid Department department) {
         departmentService.save(department);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/form/{id}")
    public String form(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("me", departmentService.findOne(Long.valueOf(id)));
        return "department/add";
    }

    @PostMapping("/delete")
    @ResponseBody
    Map<String, Object> delete(@RequestBody Iterable<Department> ids) {
        departmentService.delete(ids);
        return MapKit.okNoContent().getMap();
    }
}