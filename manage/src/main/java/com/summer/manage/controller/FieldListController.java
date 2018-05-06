package com.summer.manage.controller;

import com.querydsl.core.QueryResults;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.dao.FieldListDao;
import com.summer.manage.dao.ReportDataDao;
import com.summer.manage.dao.ReportFormDao;
import com.summer.manage.entity.*;
import com.summer.manage.service.DepartmentService;
import com.summer.manage.service.DepartmentsService;
import com.summer.manage.service.FieldListService;
import com.summer.manage.service.TeacherService;
import com.summer.manage.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ReflectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.lang.reflect.Field;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@RequestMapping("/fieldList")
@Controller
public class FieldListController {

    @Autowired
    FieldListDao fieldListDao;

    @Autowired
    FieldListService fieldListService;

    @Autowired
    TeacherService teacherService;

    @Autowired
    DepartmentsService departmentsService;

    @Autowired
    DepartmentService departmentService;

    @Autowired
    ReportDataDao reportDataDao;


    @GetMapping("/form/{id}")
    public String form(Model model, @PathVariable Integer id) {
        model.addAttribute("me", fieldListService.findOne(id.longValue()));
        model.addAttribute("list", fieldListDao.findByTableLabelEquals("基本资料"));
        model.addAttribute("tableList", fieldListDao.findByTalbeLabeList());
        return "fieldList/add";
    }

    @GetMapping("/childData")
    @ResponseBody
    public Map<String, Object> childData(String name) {

        return MapKit.New().set("data", fieldListDao.findByTableEntityEquals(name)).getMap();
    }

    @GetMapping("/")
    public String index(Model model) {

        return "fieldList/index";
    }

    @GetMapping("/list")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit) {
        QueryResults<ReportForm> list = fieldListService.findList(page - 1, limit);
        return MapKit.okAsList(list.getResults().stream().map(reportForm -> {
            Map<String, Object> map = new HashMap<>(0);
            map.put("id", reportForm.getId());
            map.put("name", reportForm.getName());
            map.put("tableExpend", reportForm.getTableExpend());
            map.put("bh", reportForm.getBh());
            map.put("count", reportDataDao.findByFormIdCount(reportForm.getId()));
            return map;
        }).collect(Collectors.toList()), list.getTotal()).getMap();
    }

    @GetMapping("/rd/{id}")
    public String reportDataList(@PathVariable Integer id, Model model) {
        model.addAttribute("me", fieldListService.findOne(id.longValue()));
        model.addAttribute("department", departmentService.findAll());

        model.addAttribute("departments", departmentsService.findAll());
        return "fieldList/reportData";
    }

    @GetMapping("/rd/data/{id}")
    public String reportDataForm(@PathVariable Integer id, Model model) {
        model.addAttribute("me", reportDataDao.findOne(id.longValue()));
        return "fieldList/reportData-add";
    }

    @PostMapping("/rd/data/save")
    @ResponseBody
    public Map<String, Object> reportDataSave(@RequestBody Map<String, Object> map) {
        Long id = Long.valueOf(map.get("id").toString());
        ReportData reportData = reportDataDao.findOne(id);
        reportData.getDataBase().keySet().forEach(s -> {
            reportData.getDataBase().replace(s, map.get(s));
        });
        reportData.getDataExpand().keySet().forEach(s -> {
            reportData.getDataExpand().replace(s, map.get(s));
        });
        reportDataDao.save(reportData);
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/rd/data/list/{id}")
    @ResponseBody
    public Map<String, Object> reportDataList(@PathVariable Integer id, Integer page, Integer limit) {
        Page<ReportData> list = reportDataDao.findByFormIdEquals(id.longValue(), new PageRequest(page - 1, limit));
        return MapKit.okAsList(list.getContent().stream().map(c -> {
            Map<String, Object> objectMap = new HashMap<>(0);
            objectMap.put("id", c.getId());
            objectMap.put("teacher_id", c.getTeacherId());
            objectMap.putAll(c.getDataBase());
            objectMap.putAll(c.getDataExpand());
            return objectMap;
        }).collect(Collectors.toList()), list.getTotalElements()).getMap();
    }

    @GetMapping("/rd/list")
    @ResponseBody
    public Map<String, Object> reportDataDetailsList(Integer page, Integer limit, Model model) {
        //model.addAttribute("me",fieldListService.findOne(id.longValue()));
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/rd/data/delete/{id}")
    @ResponseBody
    public Map<String, Object> reportDataDetailsDelete(@PathVariable Integer id) {
        reportDataDao.deleteAllByFormIdEquals(id);
        //model.addAttribute("me",fieldListService.findOne(id.longValue()));
        return MapKit.okNoContent().getMap();
    }

    @PostMapping("/delete")
    @ResponseBody
    public Map<String, Object> delete(@RequestBody Iterable<ReportForm> ids) {
        fieldListService.delete(ids);
        ids.forEach(reportForm -> reportDataDao.deleteAllByFormIdEquals(reportForm.getId()));
        //model.addAttribute("me",fieldListService.findOne(id.longValue()));
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/rd/import/{id}")
    @ResponseBody
    public Map<String, Object> reportDataImport(@PathVariable Integer id, Integer xb, Integer ks, String jobNumber, String fullName) {
        //model.addAttribute("me",fieldListService.findOne(id.longValue()));
        ReportForm field = fieldListService.findOne(id.longValue());
        Object service = SpringUtils.getBean(ObjectUtil.toLowerCaseFirstOne(field.getTableExpend()) + "ServiceImpl");
        /*  List<ReportForm> list = fieldListService.findByTeacher(field.getTableExpend(), 6);*/
        teacherService.findByParamsImportList(xb, ks, jobNumber, fullName).forEach(teacherItem -> {
            Map<String, Object> hashMap = new HashMap<>(0);
            for (String s : field.getFieldBase()) {
                FieldList fieldList = UserUtils.forField(s);
                for (Field field1 : teacherItem.getClass().getDeclaredFields()) {
                    if (!fieldList.getFieldAttr().equals(field1.getName())) {
                        continue;
                    }
                    field1.setAccessible(true);
                    try {
                        //System.out.println(field1.getName() + " - " + field1.get(teacherItem));
                        Object data = field1.get(teacherItem);
                        if (data instanceof Date){
                            DateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd"); //HH表示24小时制
                            hashMap.put(field1.getName(), dFormat.format((Date) data));
                        }
                        else if (data instanceof Dictionary){
                            hashMap.put(field1.getName(), ((Dictionary) data).getName());
                        }
                        else if (data instanceof Department){
                            hashMap.put(field1.getName(),((Department) data).getName());
                        }
                        else if (data instanceof Departments){
                            hashMap.put(field1.getName(),((Departments) data).getName());
                        }
                        else{
                            hashMap.put(field1.getName(),data);
                        }
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    }
                }
            }

            if (service instanceof BaseServiceImpl) {
                List list = ((BaseServiceImpl) service).findByTeacher(field.getTableExpend(), teacherItem.getId());
                list.forEach(o -> {
                    Map<String, Object> objectMap = new HashMap<>(0);
                    for (String s : field.getFieldExpend()) {
                        FieldList fieldList = UserUtils.forField(s);

                        for (Field field1 : o.getClass().getDeclaredFields()) {
                            try {
                                if (!fieldList.getFieldAttr().equals(field1.getName())) {
                                    continue;
                                }
                                field1.setAccessible(true);
                                Object data = field1.get(o);
                                if (data instanceof Teacher) {
                                    objectMap.put(field1.getName(), ((Teacher) data).getFullName());
                                } else if (data instanceof Dictionary) {
                                    objectMap.put(field1.getName(), ((Dictionary) data).getName());
                                } else if (data instanceof Date) {
                                    DateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd"); //HH表示24小时制
                                    objectMap.put(field1.getName(), dFormat.format((Date) data));
                                } else {
                                    objectMap.put(field1.getName(), data);
                                }
                            } catch (IllegalAccessException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                    ReportData reportData = new ReportData();
                    reportData.setFormId(id);
                    reportData.setDataBase(hashMap);
                    reportData.setDataExpand(objectMap);
                    reportDataDao.save(reportData);
                    objectMap.putAll(hashMap);
                    System.out.println(objectMap);

                });

                // System.out.println(list);
            }
        });


        return MapKit.okNoContent().getMap();
    }

    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(@RequestBody @Valid ReportForm fieldList) {
        fieldListService.save(fieldList);
        return MapKit.okNoContent().getMap();
    }
}
