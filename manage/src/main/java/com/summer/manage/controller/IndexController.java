package com.summer.manage.controller;

import com.summer.manage.dao.PermissionDao;
import com.summer.manage.entity.User;
import com.summer.manage.service.AwardsService;
import com.summer.manage.service.PaperService;
import com.summer.manage.service.ResearchSubjectService;
import com.summer.manage.service.TechnologyPatentService;
import com.summer.manage.utils.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @Autowired
    PermissionDao permissionDao;

    @Autowired
    PaperService paperService;

    @Autowired
    AwardsService awardsService;

    @Autowired
    TechnologyPatentService technologyPatentService;

    @Autowired
    ResearchSubjectService researchSubjectService;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("me", (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        return "index";
    }

    @GetMapping("/main")
    public String main(Model model) {
        model.addAttribute("paper",paperService.findByCount());
        model.addAttribute("awards",awardsService.findByCount());
        model.addAttribute("technologyPatent",technologyPatentService.findByCount());
        model.addAttribute("researchSubject",researchSubjectService.findByCount());
        return "main";
    }
}
