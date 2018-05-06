package com.summer.manage.controller;

import com.summer.manage.dao.PermissionDao;
import com.summer.manage.dao.RoleDao;
import com.summer.manage.entity.Role;
import com.summer.manage.service.PermissionService;
import com.summer.manage.service.RoleService;
import com.summer.manage.utils.JsonKit;
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
@RequestMapping("/role")
public class RoleController {


    @Autowired
    RoleService roleService;

    @Autowired
    PermissionService permissionService;

    @GetMapping("/")
    String index() {
        return "role/index";
    }

    @GetMapping("/form/{id}")
    String form(@PathVariable("id") Integer id, Model model) {
        Role role = roleService.findOne(Long.valueOf(id));
        model.addAttribute("me", role);
        model.addAttribute("permissionList", JsonKit.toJson(TreeUtil.listToTree(permissionService.findAll())));
        if (id > 0)
            model.addAttribute("selectedList", role.getPermissions() != null ? JsonKit.toJson(role.getPermissions()) : "[]");

        return "role/add";
    }

    @PostMapping("/save")
    @ResponseBody
    Map<String, Object> save(@RequestBody @Valid Role role) {
        roleService.save(role);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/list")
    @ResponseBody
    Map<String, Object> list() {
        List<Role> list = roleService.findAll();
        return MapKit.okAsList(list, Long.valueOf(list.size())).getMap();
    }

    @PostMapping("/delete")
    @ResponseBody
    Map<String, Object> delete(@RequestBody Iterable<Role> ids) {
        roleService.delete(ids);
        return MapKit.okNoContent().getMap();
    }

}
