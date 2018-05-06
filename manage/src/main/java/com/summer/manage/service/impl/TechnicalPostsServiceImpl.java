package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.QTechnicalPosts;
import com.summer.manage.entity.TechnicalPosts;
import com.summer.manage.service.TechnicalPostsService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class TechnicalPostsServiceImpl extends BaseServiceImpl<TechnicalPosts> implements TechnicalPostsService {

    @Override
    public boolean save(TechnicalPosts technicalPosts) {
        if (UserUtils.isTeacher())
            technicalPosts.setTeacher(UserUtils.getUser().getTeacher());
        return super.save(technicalPosts);
    }

    @Override
    public QueryResults<TechnicalPosts> findList(int page, int limit) {
        QTechnicalPosts technicalPosts = QTechnicalPosts.technicalPosts;
        return queryFactory.selectFrom(technicalPosts).where(technicalPosts.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();

    }

    @Override
    public QueryResults<TechnicalPosts> findList(Map<String, Object> params, int page, int limit) {
        QTechnicalPosts technicalPosts = QTechnicalPosts.technicalPosts;
        List<Predicate> where = new ArrayList<>();
        if (UserUtils.isTeacher()) {
            where.add(technicalPosts.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(technicalPosts.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(technicalPosts).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }
}