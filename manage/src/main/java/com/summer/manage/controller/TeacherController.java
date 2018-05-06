package com.summer.manage.controller;


import com.querydsl.core.QueryResults;
import com.summer.manage.dao.MenuDao;
import com.summer.manage.dao.TeacherDao;
import com.summer.manage.entity.CourseBuild;
import com.summer.manage.entity.Menu;
import com.summer.manage.entity.Teacher;
import com.summer.manage.service.TeacherService;
import com.summer.manage.utils.*;
import com.summer.manage.vo.ExcelVO;
import com.summer.manage.vo.SheetVO;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    TeacherService teacherService;


    @GetMapping("/")
    public String index() {
        return "teacher/index";
    }

    @GetMapping("/list")
    @ResponseBody
    public Map<String, Object> list(@RequestParam(defaultValue = "0") Integer xb, @RequestParam(defaultValue = "0") Integer zc, String fullName, Integer page, Integer limit) {
        QueryResults<Teacher> list = teacherService.findByParamsList(xb, zc, fullName, page - 1, limit);
        return MapKit.okAsList(list.getResults(), list.getTotal()).getMap();
    }

    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(@Valid Teacher teacher) {
        teacherService.save(teacher);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/form/{id}")
    public String form(@PathVariable("id") Integer id, Model model) {

        model.addAttribute("me", UserUtils.isTeacher() ? teacherService.findByCurrent() : teacherService.findOne(Long.valueOf(id)));
        return "teacher/add";
    }

    @PostMapping("/delete")
    @ResponseBody
    Map<String, Object> delete(@RequestBody Iterable<Teacher> ids) {
        teacherService.delete(ids);

        return MapKit.okNoContent().getMap();
    }

    @PostMapping("/{id}/check")
    @ResponseBody
    Map<String, Object> check(@PathVariable("id") Integer id, boolean state) {
        teacherService.updateAuditStatus(id.longValue(), state);

        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/detail/{id}")
    String detail(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("id", id);
        model.addAttribute("me", UserUtils.isTeacher() ? teacherService.findByCurrent() : teacherService.findOne(Long.valueOf(id)));
        return "list";
    }

    @GetMapping("/export")
    public void form(HttpServletResponse response) throws IOException {
        String name = "教师资料";
        ServletOutputStream out = response.getOutputStream();
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(name + ".xls", "UTF-8"));

        ExcelVO excelVo = new ExcelVO();
        excelVo.setPrefix("xlsx");
        List<SheetVO> sheetInfoList = new ArrayList<>();

        SheetVO sheetVo = new SheetVO();
        String[] headerTitle = new String[]{"系部_#_3000", "工号_#_3000",
                "姓名_#_3000", "性别_#_3000", "职称_#_3000", "出生年月_#_3000",
                "聘用性质_#_3000", "学历_#_3000", "学位_#_3000", "专业领域_#_3000","职务_#_3000",
                "专业特长_#_6000","有无高校资格证_#_3000","是否骨干教师_#_3000","是否双师教师_#_3000","QQ_#_3000","邮箱_#_3000","手机号_#_3000"};
        sheetVo.setHeaderTitle(headerTitle);
        sheetVo.setRowNum(0);
        List<String> titles = new ArrayList<>();
        for (int i = 0; i < headerTitle.length; i++) {
            titles.add(String.valueOf(i));
        }
        sheetVo.setTitles(titles.toArray(new String[]{}));
        sheetVo.setTitle(name);
        Map<String, CellStyle> style = new HashMap<>();

        sheetVo.setStyles(style);
        sheetVo.setSheetName(name);
        List<Map<String, Object>> sheetContentMap = new ArrayList<>();
        List<Teacher> list = teacherService.findAll();
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> map = new HashMap<>();
            Teacher teacher = list.get(i);
            map.put("0", teacher.getDepartment().getName());
            map.put("1", teacher.getJobNumber());
            map.put("2", teacher.getFullName());
            map.put("3", teacher.getSex().getName());
            map.put("4", teacher.getZc().getName());
            map.put("5", teacher.getBirthday());
            map.put("6", teacher.getPyxz().getName());
            map.put("7", teacher.getEducation().getName());
            map.put("8", teacher.getDegree().getName());
            map.put("9", teacher.getZyly().getName());
            map.put("10", teacher.getJob());
            map.put("11", teacher.getZytc());
            map.put("12", teacher.isGxzg()?"是":"否");
            map.put("13", teacher.isGgjs()?"是":"否");
            map.put("14", teacher.isSsjs()?"是":"否");
            map.put("15", teacher.getQq());
            map.put("16", teacher.getEmail());
            map.put("17", teacher.getMobile());
            sheetContentMap.add(map);
        }
        sheetVo.setSheetContentMap(sheetContentMap);
        sheetInfoList.add(sheetVo);

        excelVo.setSheets(sheetInfoList);
        InputStream stream = new ExcelService().createTableViewerExcelStream(excelVo);
        int ch;
        while ((ch = stream.read()) != -1) {
            out.write(ch);
        }
        out.close();
        stream.close();
    }
}
