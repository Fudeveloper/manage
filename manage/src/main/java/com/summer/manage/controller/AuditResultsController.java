package com.summer.manage.controller;

import com.summer.manage.entity.AuditResults;
import com.summer.manage.entity.User;
import com.summer.manage.service.AuditResultsService;
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
@RequestMapping("/auditResults")
public class AuditResultsController {

    @Autowired
    AuditResultsService auditResultsService;

    @GetMapping("/")
    public String index() {
        return "auditResults/index";
    }

    @GetMapping("/list")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit) {
        Page<AuditResults> list = auditResultsService.findAll(new PageRequest(page - 1, limit));


        return MapKit.okAsList(list.getContent(), list.getTotalElements()).getMap();
    }

    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(@Valid AuditResults auditResults) {
         auditResultsService.save(auditResults);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/form/{id}")
    public String form(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("me", auditResultsService.findOne(Long.valueOf(id)));
        return "auditResults/add";
    }

    @PostMapping("/delete")
    @ResponseBody
    Map<String, Object> delete(@RequestBody Iterable<AuditResults> ids) {
        auditResultsService.delete(ids);
        return MapKit.okNoContent().getMap();
    }
}