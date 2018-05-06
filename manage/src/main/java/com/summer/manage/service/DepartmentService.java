package com.summer.manage.service;

import com.summer.manage.common.BaseService;
import com.summer.manage.entity.Department;

import java.util.List;
import java.util.Map;

public interface DepartmentService extends BaseService<Department> {

    Department findByName(String name);
}