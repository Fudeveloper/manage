package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.QServiceProject;
import com.summer.manage.entity.ServiceProject;
import com.summer.manage.service.ServiceProjectService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ServiceProjectServiceImpl extends BaseServiceImpl<ServiceProject> implements ServiceProjectService {


    @Override
    public boolean save(ServiceProject serviceProject) {
        if (UserUtils.isTeacher()) {
            serviceProject.setTeacher(UserUtils.getUser().getTeacher());
        }
        return super.save(serviceProject);
    }

    @Override
    public QueryResults<ServiceProject> findList(int page, int limit) {
        QServiceProject qServiceProject = QServiceProject.serviceProject;
        return queryFactory.selectFrom(qServiceProject).where(qServiceProject.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();

    }

    @Override
    public List<ServiceProject> findAll() {
        return super.findAll();
    }

    @Override
    public QueryResults<ServiceProject> findList(Map<String, Object> params, int page, int limit) {
        QServiceProject qServiceProject = QServiceProject.serviceProject;
        List<Predicate> where = new ArrayList<>();
        if (UserUtils.isTeacher()) {
            where.add(qServiceProject.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(qServiceProject.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(qServiceProject).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }
}