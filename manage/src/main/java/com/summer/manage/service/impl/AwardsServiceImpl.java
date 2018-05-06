package com.summer.manage.service.impl;

import com.querydsl.core.QueryModifiers;
import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Expression;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.Awards;
import com.summer.manage.entity.QAwards;
import com.summer.manage.entity.User;
import com.summer.manage.service.AwardsService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class AwardsServiceImpl extends BaseServiceImpl<Awards> implements AwardsService {
    @Override
    public boolean save(Awards awards) {
        if (UserUtils.isTeacher())  awards.setTeacher(UserUtils.getUser().getTeacher());
        return super.save(awards);
    }

    @Override
    public Page<Awards> findAll(Pageable pageable) {
        return super.findAll(pageable);
    }

    @Override
    public QueryResults<Awards> findList(int page, int limit) {
        QAwards qAwards = QAwards.awards;
        return queryFactory.selectFrom(qAwards).where(qAwards.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();
    }

    @Override
    public QueryResults<Awards> findList(Map<String, Object> params, int page, int limit) {
        QAwards qAwards = QAwards.awards;
        List<Predicate> where = new ArrayList<>();
        if (UserUtils.isTeacher()) {
            where.add(qAwards.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(qAwards.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(qAwards).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }

    @Override
    public long findByCount() {
        QAwards qAwards = QAwards.awards;
        List<Predicate> where = new ArrayList<>();
        if (UserUtils.isTeacher()) {
            where.add(qAwards.teacher.user.eq(UserUtils.getUser()));
        }
        return queryFactory.selectFrom(qAwards).where(where.toArray(new Predicate[]{})).fetchCount();
    }
}