package com.summer.manage.controller;

import com.alibaba.fastjson.JSON;
import com.summer.manage.dao.DictionaryDao;
import com.summer.manage.entity.Dictionary;
import com.summer.manage.utils.MapKit;
import com.summer.manage.utils.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.*;
import java.util.function.Predicate;

@Controller
@RequestMapping("/dictionary")
public class DictionaryController {

    @Autowired
    DictionaryDao dictionaryDao;

    @GetMapping("/")
    String index() {
        return "dictionary/index";
    }

    @GetMapping("/form/{id}")
    String form(@PathVariable("id") Integer id, Model model) {
        List<Dictionary> list = dictionaryDao.findAll();
        list.removeIf(dictionary -> dictionary.getId() == id);
        model.addAttribute("parentList", TreeUtil.listToTree2(list));
        model.addAttribute("me", dictionaryDao.findOne(Long.valueOf(id)));
        return "dictionary/add";
    }

    @PostMapping("/save")
    @ResponseBody
    Map<String, Object> save(@Valid Dictionary dictionary) {
        dictionaryDao.saveAndFlush(dictionary);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/list")
    @ResponseBody
    Map<String, Object> list() {
        List<Dictionary> list = dictionaryDao.findAll();
        return MapKit.okAsList(TreeUtil.listToTree2(list), Long.valueOf(list.size())).getMap();
    }

    @PostMapping("/delete")
    @ResponseBody
    Map<String, Object> delete(@RequestBody Iterable<Dictionary> ids) {
        dictionaryDao.deleteInBatch(ids);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/getByName")
    @ResponseBody
    Map<String, Object> getByName(String name) {
        return MapKit.okAsList(dictionaryDao.findByName(name), 0l).getMap();
    }

}
