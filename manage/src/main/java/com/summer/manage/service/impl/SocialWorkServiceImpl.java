package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.QSocialWork;
import com.summer.manage.entity.SocialWork;
import com.summer.manage.entity.User;
import com.summer.manage.service.SocialWorkService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class SocialWorkServiceImpl extends BaseServiceImpl<SocialWork> implements SocialWorkService {


    @Override
    public boolean save(SocialWork socialWork) {
        if (UserUtils.isTeacher())
            socialWork.setTeacher(UserUtils.getUser().getTeacher());
        return super.save(socialWork);
    }

    @Override
    public QueryResults<SocialWork> findList(int page, int limit) {
        QSocialWork socialWork = QSocialWork.socialWork;
        return queryFactory.selectFrom(socialWork).where(socialWork.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();

    }

    @Override
    public QueryResults<SocialWork> findList(Map<String, Object> params, int page, int limit) {
        QSocialWork socialWork = QSocialWork.socialWork;
        List<Predicate> where = new ArrayList<>();
        if (UserUtils.isTeacher()) {
            where.add(socialWork.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(socialWork.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(socialWork).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }
}