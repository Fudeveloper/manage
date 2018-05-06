package com.summer.manage.controller;

import com.querydsl.core.QueryResults;
import com.summer.manage.entity.ServiceProject;
import com.summer.manage.service.ServiceProjectService;
import com.summer.manage.utils.ExcelService;
import com.summer.manage.utils.MapKit;
import com.summer.manage.utils.UserUtils;
import com.summer.manage.vo.ExcelVO;
import com.summer.manage.vo.SheetVO;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.InputStream;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/serviceProject")
public class ServiceProjectController {

    @Autowired
    ServiceProjectService serviceProjectService;

    @GetMapping("/")
    public String index() {
        if (UserUtils.getUser().getTeacher() == null && UserUtils.isTeacher()) {
            return "error/301";
        }
        return "serviceProject/index";
    }

    @GetMapping("/list")
    @ResponseBody
    public Map<String, Object> list(Integer teacher, Integer page, Integer limit) {
        MapKit map = MapKit.New();
        if (teacher != null) {
            map.set("teacher", teacher.longValue());
        }

        QueryResults<ServiceProject> list = serviceProjectService.findList(map.getMap(), page - 1, limit);

        return MapKit.okAsList(list.getResults(), list.getTotal()).getMap();
    }

    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(@Valid ServiceProject serviceProject) {
        serviceProjectService.save(serviceProject);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/form/{id}")
    public String form(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("me", serviceProjectService.findOne(Long.valueOf(id)));
        return "serviceProject/add";
    }

    @PostMapping("/delete")
    @ResponseBody
    Map<String, Object> delete(@RequestBody Iterable<ServiceProject> ids) {
        serviceProjectService.delete(ids);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/export")
    public void form(HttpServletResponse response) throws Exception {


        String name = "社会技术项目";
        ServletOutputStream out = response.getOutputStream();
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(name + ".xls", "UTF-8"));

        ExcelVO excelVo = new ExcelVO();
        excelVo.setPrefix("xlsx");
        List<SheetVO> sheetInfoList = new ArrayList<SheetVO>();

        SheetVO sheetVo = new SheetVO();
        String[] headerTitle = new String[]{"系部_#_3000", "工号_#_3000",
                "姓名_#_3000", "性别_#_3000", "职称_#_3000", "项目名称_#_3000",
                "承担单位或部门_#_3000", "依托机构或团队_#_3000", "本人排名_#_3000",
                "其他成员_#_3000", "合作单位_#_3000", "项目内容_#_3000", "项目相关文件_#_3000",
                "合同金额_#_3000", "成果名称_#_3000", "成果类型_#_3000", "成果权利人_#_3000", "成果内容_#_3000", "成功归属_#_3000", "成果相关文件_#_3000"};
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
        List<ServiceProject> serviceProjectList = serviceProjectService.findAll();
        for (int i = 0; i < serviceProjectList.size(); i++) {
            Map<String, Object> map = new HashMap<>();
            ServiceProject serviceProject = serviceProjectList.get(i);
            map.put("0", serviceProject.getTeacher().getDepartment().getName());
            map.put("1", serviceProject.getTeacher().getJobNumber());
            map.put("2", serviceProject.getTeacher().getFullName());
            map.put("3", serviceProject.getTeacher().getSex().getName());
            map.put("4", serviceProject.getTeacher().getZc().getName());
            map.put("5", serviceProject.getProjectName());
            map.put("6", serviceProject.getProjectInstitution());
            map.put("7", serviceProject.getProjectTeam());
            map.put("8", serviceProject.getMyRanking().getName());
            map.put("9", serviceProject.getOtherMember());
            map.put("10", serviceProject.getCooperationInstitution());
            map.put("11", serviceProject.getProjectContent());
            map.put("12", serviceProject.getProjectOfficialDocument());
            map.put("13", serviceProject.getContractMoney());
            map.put("14", serviceProject.getAchievementName());
            map.put("15", serviceProject.getAchievementType().getName());
            map.put("16", serviceProject.getAchievementOwner());
            map.put("17", serviceProject.getAchievementContent());
            map.put("18", serviceProject.getAchievementAdscription());
            map.put("19", serviceProject.getAchievementOfficialDocument());
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