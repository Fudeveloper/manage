package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.Paper;
import com.summer.manage.entity.QPaper;
import com.summer.manage.service.PaperService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class PaperServiceImpl extends BaseServiceImpl<Paper> implements PaperService {

    @Override
    public boolean save(Paper paper) {
        if (UserUtils.isTeacher()) {
            paper.setTeacher(UserUtils.getUser().getTeacher());
        }
        return super.save(paper);
    }

    @Override
    public QueryResults<Paper> findList(int page, int limit) {
        QPaper qPaper = QPaper.paper;
        return queryFactory.selectFrom(qPaper).where(qPaper.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();
    }

    @Override
    public QueryResults<Paper> findList(Map<String, Object> params, int page, int limit) {
        List<Predicate> where = new ArrayList<>();
        QPaper qPaper = QPaper.paper;
        if (UserUtils.isTeacher()) {
            where.add(qPaper.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(qPaper.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(qPaper).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }

    @Override
    public long findByCount() {
        List<Predicate> where = new ArrayList<>();
        QPaper qPaper = QPaper.paper;
        if (UserUtils.isTeacher()) {
            where.add(qPaper.teacher.user.eq(UserUtils.getUser()));
        }
        return queryFactory.selectFrom(qPaper).where(where.toArray(new Predicate[]{})).fetchCount();
    }
}