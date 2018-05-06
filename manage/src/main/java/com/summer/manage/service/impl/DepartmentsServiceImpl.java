package com.summer.manage.service.impl;

import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.Departments;
import com.summer.manage.entity.QDepartments;
import com.summer.manage.service.DepartmentService;
import com.summer.manage.service.DepartmentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

@Service
public class DepartmentsServiceImpl extends BaseServiceImpl<Departments> implements DepartmentsService {


    @Override
    public Departments findByName(String name) {
        QDepartments departments = QDepartments.departments;
        return queryFactory.selectFrom(departments).where(departments.name.eq(name)).fetchOne();
    }
}