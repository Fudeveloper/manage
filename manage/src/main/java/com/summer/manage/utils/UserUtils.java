package com.summer.manage.utils;

import com.summer.manage.dao.FieldListDao;
import com.summer.manage.entity.FieldList;
import com.summer.manage.entity.ReportForm;
import com.summer.manage.entity.User;
import com.summer.manage.service.FieldListService;
import com.summer.manage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class UserUtils {

    @Autowired
    UserService getUserService;

    @Autowired
    FieldListDao getFieldListDao;

    @Autowired
    FieldListService getFieldListService;

    static UserService userService;

    static FieldListDao fieldListDao;

    static FieldListService fieldListService;


    @PostConstruct
    private void init() {
        userService = getUserService;
        fieldListDao = getFieldListDao;
        fieldListService = getFieldListService;
    }

    public static boolean isTeacher() {
        if (getUser().getRoles().stream().filter(role -> role.getName().equals("教师")).count() == 0) {
            return false;
        }
        return true;
    }

    public static User getUser() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return userService.findOne(user.getId());
    }

    public static FieldList forField(String id) {
        return fieldListDao.findOne(Long.valueOf(id));
    }
    public static String getField(String tableEntity) {
        return fieldListDao.findFirstByTableEntityEquals(tableEntity).getTableLabel();
    }
    public static ReportForm getReportForm(Long id) {
        return fieldListService.findOne(id);
    }
}
