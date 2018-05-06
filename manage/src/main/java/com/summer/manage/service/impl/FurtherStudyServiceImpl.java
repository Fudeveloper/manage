package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.FurtherStudy;
import com.summer.manage.entity.QFurtherStudy;
import com.summer.manage.service.FurtherStudyService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class FurtherStudyServiceImpl extends BaseServiceImpl<FurtherStudy> implements FurtherStudyService {

    @Override
    public boolean save(FurtherStudy furtherStudy) {
        if (UserUtils.isTeacher())
            furtherStudy.setTeacher(UserUtils.getUser().getTeacher());
        return super.save(furtherStudy);
    }

    @Override
    public QueryResults<FurtherStudy> findList(int page, int limit) {
        QFurtherStudy qFurtherStudy = QFurtherStudy.furtherStudy;
        return queryFactory.selectFrom(qFurtherStudy).where(qFurtherStudy.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();
    }

    @Override
    public QueryResults<FurtherStudy> findList(Map<String, Object> params, int page, int limit) {
        List<Predicate> where = new ArrayList<>();
        QFurtherStudy qFurtherStudy = QFurtherStudy.furtherStudy;
        if (UserUtils.isTeacher()) {
            where.add(qFurtherStudy.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(qFurtherStudy.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(qFurtherStudy).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }
}