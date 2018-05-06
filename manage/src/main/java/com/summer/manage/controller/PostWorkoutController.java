package com.summer.manage.controller;

import com.querydsl.core.QueryResults;
import com.summer.manage.entity.PostWorkout;
import com.summer.manage.entity.User;
import com.summer.manage.service.DictionaryService;
import com.summer.manage.service.PostWorkoutService;
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
@RequestMapping("/postWorkout")
public class PostWorkoutController {

    @Autowired
    PostWorkoutService postWorkoutService;

    @GetMapping("/")
    public String index() {
        if (UserUtils.getUser().getTeacher() == null && UserUtils.isTeacher()) {
            return "error/301";
        }
        return "postWorkout/index";
    }

    @GetMapping("/list")
    @ResponseBody
    public Map<String, Object> list(Integer teacher, Integer page, Integer limit) {
        MapKit map = MapKit.New();
        if (teacher != null) {
            map.set("teacher", teacher.longValue());
        }

        QueryResults<PostWorkout> list = postWorkoutService.findList(map.getMap(), page - 1, limit);

        return MapKit.okAsList(list.getResults(), list.getTotal()).getMap();
    }

    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(@Valid PostWorkout postWorkout) {
        postWorkoutService.save(postWorkout);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/form/{id}")
    public String form(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("me", postWorkoutService.findOne(Long.valueOf(id)));
        return "postWorkout/add";
    }

    @PostMapping("/delete")
    @ResponseBody
    Map<String, Object> delete(@RequestBody Iterable<PostWorkout> ids) {
        postWorkoutService.delete(ids);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/export")
    public void form(HttpServletResponse response) throws IOException {


        String name = "挂职锻炼";
        ServletOutputStream out = response.getOutputStream();
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(name + ".xls", "UTF-8"));

        ExcelVO excelVo = new ExcelVO();
        excelVo.setPrefix("xlsx");
        List<SheetVO> sheetInfoList = new ArrayList<>();

        SheetVO sheetVo = new SheetVO();
        String[] headerTitle = new String[]{"系部_#_3000", "工号_#_3000",
                "姓名_#_3000", "性别_#_3000", "职称_#_3000", "单位名称_#_5000",
                "岗位_#_3000", "开始时间_#_3000", "结束时间_#_3000", "派出部门_#_3000"};
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
        List<PostWorkout> list = postWorkoutService.findAll();
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> map = new HashMap<>();
            PostWorkout postWorkout = list.get(i);
            map.put("0", postWorkout.getTeacher().getDepartment().getName());
            map.put("1", postWorkout.getTeacher().getJobNumber());
            map.put("2", postWorkout.getTeacher().getFullName());
            map.put("3", postWorkout.getTeacher().getSex().getName());
            map.put("4", postWorkout.getTeacher().getZc().getName());
            map.put("5", postWorkout.getCompanyName());
            map.put("6", postWorkout.getJob());
            map.put("7", postWorkout.getStartingTime());
            map.put("8", postWorkout.getEndTime());
            map.put("9", postWorkout.getDispatchDepartment().getName());

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