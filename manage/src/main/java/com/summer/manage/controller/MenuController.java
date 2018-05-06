package com.summer.manage.controller;


import com.summer.manage.dao.MenuDao;
import com.summer.manage.entity.Menu;
import com.summer.manage.utils.MapKit;
import com.summer.manage.utils.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    MenuDao menuDao;


    @GetMapping("/")
    public String index() {
        return "menu/index";
    }

    @GetMapping("/list")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit) {
        Page<Menu> list = menuDao.findAll(new PageRequest(page - 1, limit));
        return MapKit.okAsList(list.getContent(), list.getTotalElements()).getMap();
    }

    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(@Valid Menu menu) {
        menuDao.save(menu);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/form/{id}")
    public String form(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("me", menuDao.findOne(Long.valueOf(id)));
        List<Menu> list = menuDao.findAll();
        list.removeIf(menu -> menu.getId() == id);
        model.addAttribute("menuList", TreeUtil.listToTree2(list));
        return "menu/add";
    }

    @PostMapping("/delete")
    @ResponseBody
    Map<String, Object> delete(@RequestBody Iterable<Menu> ids) {
        menuDao.deleteInBatch(ids);

        return MapKit.okNoContent().getMap();
    }
}
