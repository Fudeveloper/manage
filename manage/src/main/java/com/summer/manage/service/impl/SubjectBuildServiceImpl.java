package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.QSubjectBuild;
import com.summer.manage.entity.SubjectBuild;
import com.summer.manage.service.SubjectBuildService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class SubjectBuildServiceImpl extends BaseServiceImpl<SubjectBuild> implements SubjectBuildService {

    @Override
    public boolean save(SubjectBuild subjectBuild) {
        if (UserUtils.isTeacher()) {
            subjectBuild.setTeacher(UserUtils.getUser().getTeacher());
        }
        return super.save(subjectBuild);
    }

    @Override
    public QueryResults<SubjectBuild> findList(int page, int limit) {
        QSubjectBuild qSubjectBuild = QSubjectBuild.subjectBuild;
        return queryFactory.selectFrom(qSubjectBuild).where(qSubjectBuild.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();

    }

    @Override
    public QueryResults<SubjectBuild> findList(Map<String, Object> params, int page, int limit) {
        QSubjectBuild qSubjectBuild = QSubjectBuild.subjectBuild;
        List<Predicate> where = new ArrayList<>();
        if (UserUtils.isTeacher()) {
            where.add(qSubjectBuild.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(qSubjectBuild.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(qSubjectBuild).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }
}