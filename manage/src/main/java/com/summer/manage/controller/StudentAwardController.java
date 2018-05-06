package com.summer.manage.controller;

import com.querydsl.core.QueryResults;
import com.summer.manage.entity.Awards;
import com.summer.manage.entity.FurtherStudy;
import com.summer.manage.entity.StudentAward;
import com.summer.manage.entity.User;
import com.summer.manage.service.DictionaryService;
import com.summer.manage.service.StudentAwardService;
import com.summer.manage.service.UserService;
import com.summer.manage.utils.ExcelService;
import com.summer.manage.utils.FileUtil;
import com.summer.manage.utils.MapKit;
import com.summer.manage.utils.UserUtils;
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
@RequestMapping("/studentAward")
public class StudentAwardController {

    @Autowired
    StudentAwardService studentAwardService;

    @GetMapping("/")
    public String index() {
        if (UserUtils.getUser().getTeacher() == null && UserUtils.isTeacher()) {
            return "error/301";
        }
        return "studentAward/index";
    }

    @GetMapping("/list")
    @ResponseBody
    public Map<String, Object> list(Integer teacher, Integer page, Integer limit) {
        MapKit map = MapKit.New();
        if (teacher != null) {
            map.set("teacher", teacher.longValue());
        }

        QueryResults<StudentAward> list = studentAwardService.findList(map.getMap(), page - 1, limit);

        return MapKit.okAsList(list.getResults(), list.getTotal()).getMap();
    }

    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(@Valid StudentAward studentAward) {
        studentAwardService.save(studentAward);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/form/{id}")
    public String form(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("me", studentAwardService.findOne(Long.valueOf(id)));
        return "studentAward/add";
    }

    @PostMapping("/delete")
    @ResponseBody
    Map<String, Object> delete(@RequestBody Iterable<StudentAward> ids) {
        studentAwardService.delete(ids);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/export")
    public void form(HttpServletResponse response) throws IOException {
        String name = "学生获奖";
        ServletOutputStream out = response.getOutputStream();
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(name + ".xls", "UTF-8"));

        ExcelVO excelVo = new ExcelVO();
        excelVo.setPrefix("xlsx");
        List<SheetVO> sheetInfoList = new ArrayList<>();

        SheetVO sheetVo = new SheetVO();
        String[] headerTitle = new String[]{"系部_#_3000", "工号_#_3000",
                "姓名_#_3000", "性别_#_3000", "职称_#_3000", "获奖名称_#_5000",
                "获奖单位_#_3000", "获奖学生_#_3000", "获奖年度_#_3000", "本人排名_#_3000", "获奖级别_#_3000"};
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
        List<StudentAward> list = studentAwardService.findAll();
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> map = new HashMap<>();
            StudentAward studentAward = list.get(i);
            map.put("0",studentAward.getTeacher().getDepartment().getName());
            map.put("1", studentAward.getTeacher().getJobNumber());
            map.put("2", studentAward.getTeacher().getFullName());
            map.put("3", studentAward.getTeacher().getSex().getName());
            map.put("4", studentAward.getTeacher().getZc().getName());
            map.put("5", studentAward.getName());
            map.put("6", studentAward.getAwarding_unit());
            map.put("7",studentAward.getStudent());
            map.put("8",studentAward.getAward_year());
            map.put("9", studentAward.getMyRanking().getName());
            map.put("10", studentAward.getLevel().getName());
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