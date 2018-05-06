package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.CourseBuild;
import com.summer.manage.entity.QCourseBuild;
import com.summer.manage.service.CourseBuildService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CourseBuildServiceImpl extends BaseServiceImpl<CourseBuild> implements CourseBuildService {


    @Override
    public boolean save(CourseBuild courseBuild) {
        if (UserUtils.isTeacher()) {
            courseBuild.setTeacher(UserUtils.getUser().getTeacher());
        }
        return super.save(courseBuild);
    }

    @Override
    public QueryResults<CourseBuild> findList(int page, int limit) {
        QCourseBuild qCourseBuild = QCourseBuild.courseBuild;
        return queryFactory.selectFrom(qCourseBuild).where(qCourseBuild.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();

    }

    @Override
    public QueryResults<CourseBuild> findList(Map<String, Object> params, int page, int limit) {
        QCourseBuild qCourseBuild = QCourseBuild.courseBuild;
        List<Predicate> where = new ArrayList<>();
        if (UserUtils.isTeacher()) {
            where.add(qCourseBuild.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(qCourseBuild.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(qCourseBuild).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }
}