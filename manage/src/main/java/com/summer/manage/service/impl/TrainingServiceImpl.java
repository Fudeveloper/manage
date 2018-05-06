package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.QTraining;
import com.summer.manage.entity.Training;
import com.summer.manage.service.TrainingService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class TrainingServiceImpl extends BaseServiceImpl<Training> implements TrainingService {


    @Override
    public boolean save(Training training) {
        if (UserUtils.isTeacher())
            training.setTeacher(UserUtils.getUser().getTeacher());
        return super.save(training);
    }

    @Override
    public QueryResults<Training> findList(int page, int limit) {
        QTraining training = QTraining.training;
        return queryFactory.selectFrom(training).where(training.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();
    }

    @Override
    public QueryResults<Training> findList(Map<String, Object> params, int page, int limit) {
        List<Predicate> where = new ArrayList<>();
        QTraining training = QTraining.training;
        if (UserUtils.isTeacher()) {
            where.add(training.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(training.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(training).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }
}