package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.PostWorkout;
import com.summer.manage.entity.QPostWorkout;
import com.summer.manage.service.PostWorkoutService;
import com.summer.manage.utils.UserUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class PostWorkoutServiceImpl extends BaseServiceImpl<PostWorkout> implements PostWorkoutService {

    @Override
    public boolean save(PostWorkout postWorkout) {
        if (UserUtils.isTeacher())
            postWorkout.setTeacher(UserUtils.getUser().getTeacher());
        return super.save(postWorkout);
    }

    @Override
    public QueryResults<PostWorkout> findList(int page, int limit) {
        QPostWorkout postWorkout = QPostWorkout.postWorkout;
        return queryFactory.selectFrom(postWorkout).where(postWorkout.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();

    }

    @Override
    public QueryResults<PostWorkout> findList(Map<String, Object> params, int page, int limit) {
        List<Predicate> where = new ArrayList<>();
        QPostWorkout postWorkout = QPostWorkout.postWorkout;
        if (UserUtils.isTeacher()) {
            where.add(postWorkout.teacher.user.eq(UserUtils.getUser()));
        }
        else{
            if(params.containsKey("teacher") && params.get("teacher")!=null){
                where.add(postWorkout.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(postWorkout).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }
}