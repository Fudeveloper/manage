package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.QResearchSubject;
import com.summer.manage.entity.ResearchSubject;
import com.summer.manage.service.ResearchSubjectService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ResearchSubjectServiceImpl extends BaseServiceImpl<ResearchSubject> implements ResearchSubjectService {


    @Override
    public boolean save(ResearchSubject researchSubject) {
        if (UserUtils.isTeacher())
            researchSubject.setTeacher(UserUtils.getUser().getTeacher());
        return super.save(researchSubject);
    }

    @Override
    public QueryResults<ResearchSubject> findList(int page, int limit) {
        QResearchSubject researchSubject = QResearchSubject.researchSubject;
        return queryFactory.selectFrom(researchSubject).where(researchSubject.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();

    }

    @Override
    public QueryResults<ResearchSubject> findList(Map<String, Object> params, int page, int limit) {
        List<Predicate> where = new ArrayList<>();
        QResearchSubject researchSubject = QResearchSubject.researchSubject;
        if (UserUtils.isTeacher()) {
            where.add(researchSubject.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(researchSubject.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(researchSubject).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }

    @Override
    public long findByCount() {
        List<Predicate> where = new ArrayList<>();
        QResearchSubject researchSubject = QResearchSubject.researchSubject;
        if (UserUtils.isTeacher()) {
            where.add(researchSubject.teacher.user.eq(UserUtils.getUser()));
        }
        return queryFactory.selectFrom(researchSubject).where(where.toArray(new Predicate[]{})).fetchCount();
    }
}