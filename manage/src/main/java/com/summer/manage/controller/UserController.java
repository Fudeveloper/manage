package com.summer.manage.controller;

import com.summer.manage.entity.Role;
import com.summer.manage.entity.Teacher;
import com.summer.manage.entity.User;
import com.summer.manage.service.*;
import com.summer.manage.utils.MapKit;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    DictionaryService dictionaryService;


    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;

    @Autowired
    DepartmentService departmentService;

    @Autowired
    DepartmentsService departmentsService;

    @Autowired
    TeacherService teacherService;

    @GetMapping("/")
    public String index() {
        return "user/index";
    }

    @GetMapping("/list")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit) {
        Page<User> list = userService.findAll(new PageRequest(page - 1, limit));


        return MapKit.okAsList(list.getContent(), list.getTotalElements()).getMap();
    }

    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(@Valid User user) {

        if (user.getId() > 0) {
            if (!user.getPassword().equals(userService.findOne(user.getId()))) {
                userService.updatePassword(user.getId(), user.getPassword());
            }
        } else {
            user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
            user.getRoles().add(roleService.findByName("教师"));
            userService.save(user);
        }
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/form/{id}")
    public String form(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("me", userService.findOne(Long.valueOf(id)));
        return "user/add";
    }

    @PostMapping("/delete")
    @ResponseBody
    Map<String, Object> delete(@RequestBody Iterable<User> ids) {
        userService.delete(ids);
        return MapKit.okNoContent().getMap();
    }

    @PostMapping("/import")
    @ResponseBody
    @Transactional
    Map<String, Object> importUser(@RequestParam("file") MultipartFile multipartFile) {

        try {
            XSSFWorkbook wb = new XSSFWorkbook(multipartFile.getInputStream());
            //Excel工作表
            XSSFSheet sheet = wb.getSheetAt(0);

            Iterator<Row> rows = sheet.rowIterator();
            Row cell = rows.next();
            Role role = roleService.findByName("教师");

            while (rows.hasNext()) {
                cell = rows.next();
                String userName = cell.getCell(0).getStringCellValue();
                cell.getCell(1).setCellType(CellType.STRING);
                String jobNumber = cell.getCell(1).getStringCellValue();
                String fullName = cell.getCell(2).getStringCellValue();
                String sex = cell.getCell(3).getStringCellValue();
                cell.getCell(4).setCellType(CellType.STRING);
                String dateOfBirth = cell.getCell(4).getStringCellValue();
                String pyxz = cell.getCell(5).getStringCellValue();
                String xb = cell.getCell(6).getStringCellValue();
                String ks = cell.getCell(7).getStringCellValue();
                String zw = cell.getCell(8).getStringCellValue();
                String xl = cell.getCell(9).getStringCellValue();
                String xw = cell.getCell(10).getStringCellValue();
                String zyly = cell.getCell(11).getStringCellValue();
                String zytc = cell.getCell(12).getStringCellValue();
                String ywgxzg = cell.getCell(13).getStringCellValue();
                String sfggjs = cell.getCell(14).getStringCellValue();
                String sfsjjs = cell.getCell(15).getStringCellValue();
                String jxms = cell.getCell(16).getStringCellValue();
                cell.getCell(17).setCellType(CellType.STRING);
                String mobile = cell.getCell(17).getStringCellValue();
                String email = cell.getCell(18).getStringCellValue();
                cell.getCell(19).setCellType(CellType.STRING);
                String qq = cell.getCell(19).getStringCellValue();


                User user = new User();
                user.setPassword(new BCryptPasswordEncoder().encode("666666"));
                user.setUsername(userName);
                user.getRoles().add(role);
                user.setState(Math.toIntExact(dictionaryService.findByNameAndKey("用户状态", "正常").getId()));
                user = userService.saveAndRet(user);
                System.out.println(user.getId());

                Teacher teacher = new Teacher();
                teacher.setFullName(fullName);
                teacher.setBirthday(new SimpleDateFormat("yyyy-MM-dd").parse(dateOfBirth));
                teacher.setDepartment(departmentService.findByName(xb));
                teacher.setDepartments(departmentsService.findByName(ks));
                teacher.setJobNumber(jobNumber);
                teacher.setDegree(dictionaryService.findByNameAndKey("学位", xw));
                teacher.setSex(dictionaryService.findByNameAndKey("性别", sex));
                teacher.setPyxz(dictionaryService.findByNameAndKey("聘用性质", pyxz));
                teacher.setJob(zw);
                teacher.setEducation(dictionaryService.findByNameAndKey("学历", xl));
                teacher.setZyly(dictionaryService.findByNameAndKey("专业领域", zyly));
                teacher.setZytc(zytc);
                teacher.setGxzg(ywgxzg.equals("是") ? true : false);
                teacher.setGgjs(sfggjs.equals("是") ? true : false);
                teacher.setSsjs(sfsjjs.equals("是") ? true : false);
                teacher.setMobile(mobile);
                teacher.setEmail(email);
                teacher.setQq(qq);
                teacher.setUser(user);
                teacherService.saveAndRet(teacher);

            }
        } catch (Exception e) {
            System.out.println("错误消息 "+ e.getMessage());
        }

        return MapKit.okNoContent().getMap();
    }

}
