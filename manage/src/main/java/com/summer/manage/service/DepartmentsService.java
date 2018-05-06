package com.summer.manage.service;

import com.summer.manage.common.BaseService;
import com.summer.manage.entity.Departments;

import java.util.List;
import java.util.Map;

public interface DepartmentsService extends BaseService<Departments> {


    Departments findByName(String name);

}