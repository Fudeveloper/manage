package com.summer.manage.service.impl;

import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.Department;
import com.summer.manage.entity.QDepartment;
import com.summer.manage.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

@Service
public class DepartmentServiceImpl extends BaseServiceImpl<Department> implements DepartmentService {


    @Override
    public Department findByName(String name) {
        QDepartment qDepartment = QDepartment.department;
        return queryFactory.selectFrom(qDepartment).where(qDepartment.name.eq(name)).fetchOne();
    }
}