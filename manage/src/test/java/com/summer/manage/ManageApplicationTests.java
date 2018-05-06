package com.summer.manage;

import com.jfinal.template.Engine;
import com.jfinal.template.source.ClassPathSourceFactory;
import com.summer.manage.dao.FieldListDao;
import com.summer.manage.dao.RoleDao;
import com.summer.manage.dao.UserDao;
import com.summer.manage.entity.*;
import com.summer.manage.service.DictionaryService;
import com.summer.manage.service.FieldListService;
import com.summer.manage.service.RoleService;
import com.summer.manage.service.UserService;
import com.summer.manage.utils.StrKit;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.Class;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ManageApplicationTests {

    @Autowired
    UserDao userDao;

    @Autowired
    DictionaryService dictionaryService;

    @Autowired
    RoleDao roleDao;

    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;
    private Engine engine;

    @Autowired
    FieldListDao fieldListDao;

    @Autowired
    FieldListService fieldListService;



    @Test
    public void contextLoads() {

        System.out.println(roleService.findByTeacher("Paper",6));
       /* engine = Engine.create("test");
        engine.setBaseTemplatePath("/templates/");
        engine.setSourceFactory(new ClassPathSourceFactory());

        System.out.println(dictionaryService.findByNameAndKey("学位","学士").getId());*/

        //List<FieldList> list = fieldListDao.findByTalbeLabeList();
        //System.out.println(list);



/*

        String[] strings = new String[]{"管理员", "教师", "学生"};
        for (String string : strings) {
            Role role = new Role();
            role.setName(string);
            roleDao.save(role);
        }

        User user = new User();
        user.setUsername("admin");
        user.setPassword(new BCryptPasswordEncoder().encode("r5211314"));
        user.setFullName("管理员");
        user.setMobile("0");
        user.setBirthday(new Date());
        user.setState(0);
        Role role = roleDao.findByName("管理员");
        user.getRoles().add(role);
        Department department = new Department();
        department.setName("系部");
        departmentDao.saveAndFlush(department);
        user.setDepartment(department);
        userDao.saveAndFlush(user);
*/

        //roleService.addByRoleNameAllPermission("教师");

    }

    public void generateCode(Class c) throws IOException {
        List<HashMap<Object, Object>> maps = new ArrayList<>();

        for (Field field : c.getDeclaredFields()) {
            System.out.println(field.getName() + " - " + field.getType().getTypeName());
            HashMap<Object, Object> map = new HashMap<>();
            map.put("name", field.getName());
            map.put("type", field.getType().getTypeName());
            maps.add(map);
        }

        Map<String, Object> map = new HashMap<>();
        map.put("fieldList", maps);
        map.put("modelName", c.getSimpleName());
        map.put("remark", StrKit.toLowerCaseFirstOne(c.getSimpleName()));

        File file = new File("D://manange/" + StrKit.toLowerCaseFirstOne(c.getSimpleName()));
        file.mkdir();
        readTemplate("D://manange/" + StrKit.toLowerCaseFirstOne(c.getSimpleName()) + "/add.html", engine.getTemplate("/include/form.html").renderToString(map));
        readTemplate("D://manange/" + StrKit.toLowerCaseFirstOne(c.getSimpleName()) + "/index.html", engine.getTemplate("/include/grid.html").renderToString(map));
        readTemplate("D://manange/controller/" + c.getSimpleName() + "Controller.java", engine.getTemplate("/include/controller.java").renderToString(map));
        readTemplate("D://manange/dao/" + c.getSimpleName() + "Dao.java", engine.getTemplate("/include/dao.java").renderToString(map));
        readTemplate("D://manange/service/" + c.getSimpleName() + "Service.java", engine.getTemplate("/include/service.java").renderToString(map));
        readTemplate("D://manange/service/impl/" + c.getSimpleName() + "ServiceImpl.java", engine.getTemplate("/include/serviceImpl.java").renderToString(map));
    }

    public void readTemplate(String path, String text) throws IOException {
        File file = new File(path);
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        fileOutputStream.write(text.getBytes());
        fileOutputStream.close();
    }


}
