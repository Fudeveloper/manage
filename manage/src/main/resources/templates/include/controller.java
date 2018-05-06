package com.summer.manage.controller;

import com.summer.manage.entity.User;
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
@RequestMapping("/#(remark)")
public class #(modelName)Controller {

    @Autowired
    #(modelName)Service #(remark)Service;

    @GetMapping("/")
    public String index() {
        return "#(remark)/index";
    }

    @GetMapping("/list")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit) {
        Page<#(modelName)> list = #(remark)Service.findAll(new PageRequest(page - 1, limit));


        return MapKit.okAsList(list.getContent(), list.getTotalElements()).getMap();
    }

    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(@Valid #(modelName) #(remark)) {
         #(remark)Service.save(#(remark));
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/form/{id}")
    public String form(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("me", #(remark)Service.findOne(Long.valueOf(id)));
        return "#(remark)/add";
    }

    @PostMapping("/delete")
    @ResponseBody
    Map<String, Object> delete(@RequestBody Iterable<#(modelName)> ids) {
        #(remark)Service.delete(ids);
        return MapKit.okNoContent().getMap();
    }
}
