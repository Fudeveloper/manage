package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.QTechnologyPatent;
import com.summer.manage.entity.TechnologyPatent;
import com.summer.manage.service.TechnologyPatentService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class TechnologyPatentServiceImpl extends BaseServiceImpl<TechnologyPatent> implements TechnologyPatentService {


    @Override
    public boolean save(TechnologyPatent technologyPatent) {
        if (UserUtils.isTeacher())
            technologyPatent.setTeacher(UserUtils.getUser().getTeacher());
        return super.save(technologyPatent);
    }

    @Override
    public QueryResults<TechnologyPatent> findList(int page, int limit) {
        QTechnologyPatent technologyPatent = QTechnologyPatent.technologyPatent;
        return queryFactory.selectFrom(technologyPatent).where(technologyPatent.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();

    }

    @Override
    public QueryResults<TechnologyPatent> findList(Map<String, Object> params, int page, int limit) {
        List<Predicate> where = new ArrayList<>();
        QTechnologyPatent technologyPatent = QTechnologyPatent.technologyPatent;
        if (UserUtils.isTeacher()) {
            where.add(technologyPatent.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(technologyPatent.teacher.id.eq((Long) params.get("teacher")));
            }

        }
        return queryFactory.selectFrom(technologyPatent).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }

    @Override
    public long findByCount() {
        List<Predicate> where = new ArrayList<>();
        QTechnologyPatent technologyPatent = QTechnologyPatent.technologyPatent;
        if (UserUtils.isTeacher()) {
            where.add(technologyPatent.teacher.user.eq(UserUtils.getUser()));
        }
        return queryFactory.selectFrom(technologyPatent).where(where.toArray(new Predicate[]{})).fetchCount();
    }
}