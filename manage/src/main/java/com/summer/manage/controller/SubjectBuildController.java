package com.summer.manage.controller;

import com.querydsl.core.QueryResults;
import com.summer.manage.entity.StudentAward;
import com.summer.manage.entity.SubjectBuild;
import com.summer.manage.entity.User;
import com.summer.manage.service.DictionaryService;
import com.summer.manage.service.SubjectBuildService;
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
@RequestMapping("/subjectBuild")
public class SubjectBuildController {

    @Autowired
    SubjectBuildService subjectBuildService;

    @GetMapping("/")
    public String index() {
        if (UserUtils.getUser().getTeacher() == null && UserUtils.isTeacher()) {
            return "error/301";
        }
        return "subjectBuild/index";
    }

    @GetMapping("/list")
    @ResponseBody
    public Map<String, Object> list(Integer teacher, Integer page, Integer limit) {
        MapKit map = MapKit.New();
        if (teacher != null) {
            map.set("teacher", teacher.longValue());
        }

        QueryResults<SubjectBuild> list = subjectBuildService.findList(map.getMap(), page - 1, limit);

        return MapKit.okAsList(list.getResults(), list.getTotal()).getMap();
    }

    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(@Valid SubjectBuild subjectBuild) {
        subjectBuildService.save(subjectBuild);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/form/{id}")
    public String form(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("me", subjectBuildService.findOne(id.longValue()));
        return "subjectBuild/add";
    }

    @PostMapping("/delete")
    @ResponseBody
    Map<String, Object> delete(@RequestBody Iterable<SubjectBuild> ids) {
        subjectBuildService.delete(ids);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/export")
    public void form(HttpServletResponse response) throws IOException {
        String name = "专业建设";
        ServletOutputStream out = response.getOutputStream();
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(name + ".xls", "UTF-8"));

        ExcelVO excelVo = new ExcelVO();
        excelVo.setPrefix("xlsx");
        List<SheetVO> sheetInfoList = new ArrayList<>();

        SheetVO sheetVo = new SheetVO();
        String[] headerTitle = new String[]{"系部_#_3000", "工号_#_3000",
                "姓名_#_3000", "性别_#_3000", "职称_#_3000", "建设项目名称_#_5000",
                "相关文件名_#_3000"};
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
        List<SubjectBuild> list = subjectBuildService.findAll();
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> map = new HashMap<>();
            SubjectBuild subjectBuild = list.get(i);
            map.put("0", subjectBuild.getTeacher().getDepartment().getName());
            map.put("1", subjectBuild.getTeacher().getJobNumber());
            map.put("2", subjectBuild.getTeacher().getFullName());
            map.put("3", subjectBuild.getTeacher().getSex().getName());
            map.put("4", subjectBuild.getTeacher().getZc().getName());
            map.put("5", subjectBuild.getName());
            map.put("6", subjectBuild.getRelatedFileName());
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