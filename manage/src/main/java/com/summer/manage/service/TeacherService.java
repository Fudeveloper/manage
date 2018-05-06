package com.summer.manage.service;

import com.querydsl.core.QueryResults;
import com.summer.manage.common.BaseService;
import com.summer.manage.entity.Teacher;

import java.util.List;

public interface TeacherService extends BaseService<Teacher> {

    /**
     * 根据参数查找列表
     * @return
     */
    QueryResults<Teacher> findByParamsList(Integer xb, Integer zc, String fullName, Integer page, Integer limit);

    Teacher findByCurrent();

    void updateAuditStatus(long id,boolean state);
    List<Teacher> findByParamsImportList(Integer xb, Integer ks, String jobNumber, String fullName);

}
