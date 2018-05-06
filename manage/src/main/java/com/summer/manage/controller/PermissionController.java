package com.summer.manage.controller;

import com.summer.manage.dao.PermissionDao;
import com.summer.manage.entity.Node;
import com.summer.manage.entity.Permission;
import com.summer.manage.service.PermissionService;
import com.summer.manage.utils.MapKit;
import com.summer.manage.utils.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    PermissionService permissionService;

    @GetMapping("/")
    String index() {
        return "permission/index";
    }

    @GetMapping("/list")
    @ResponseBody
    Map<String, Object> list() {
        List<Permission> list = permissionService.findAll();
        return MapKit.okAsList(TreeUtil.listToTree2(list), Long.valueOf(list.size())).getMap();
    }

    @GetMapping("/form/{id}")
    String form(@PathVariable("id") Integer id, Model model) {
        List<Permission> list = permissionService.findAll();
        list.removeIf(permission -> permission.getId() == id);
        model.addAttribute("parentList", TreeUtil.listToTree2(list));
        model.addAttribute("me", permissionService.findOne(Long.valueOf(id)));
        return "permission/add";
    }

    @PostMapping("/save")
    @ResponseBody
    Map<String, Object> save(@Valid Permission permission) {
        permissionService.save(permission);
        return MapKit.okNoContent().getMap();
    }

    @PostMapping("/delete")
    @ResponseBody
    Map<String, Object> delete(@RequestBody Iterable<Permission> ids) {
        permissionService.delete(ids);
        return MapKit.okNoContent().getMap();
    }

}
