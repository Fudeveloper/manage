package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.QTrainBuild;
import com.summer.manage.entity.TrainBuild;
import com.summer.manage.service.TrainBuildService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class TrainBuildServiceImpl extends BaseServiceImpl<TrainBuild> implements TrainBuildService {

    @Override
    public boolean save(TrainBuild trainBuild) {
        if (UserUtils.isTeacher()) {
            trainBuild.setTeacher(UserUtils.getUser().getTeacher());
        }
        return super.save(trainBuild);
    }

    @Override
    public QueryResults<TrainBuild> findList(int page, int limit) {
        QTrainBuild qTrainBuild = QTrainBuild.trainBuild;
        return queryFactory.selectFrom(qTrainBuild).where(qTrainBuild.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();

    }

    @Override
    public QueryResults<TrainBuild> findList(Map<String, Object> params, int page, int limit) {
        QTrainBuild qTrainBuild = QTrainBuild.trainBuild;
        List<Predicate> where = new ArrayList<>();
        if (UserUtils.isTeacher()) {
            where.add(qTrainBuild.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(qTrainBuild.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(qTrainBuild).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }
}