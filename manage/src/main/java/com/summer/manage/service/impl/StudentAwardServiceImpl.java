package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.QStudentAward;
import com.summer.manage.entity.StudentAward;
import com.summer.manage.service.StudentAwardService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class StudentAwardServiceImpl extends BaseServiceImpl<StudentAward> implements StudentAwardService {


    @Override
    public boolean save(StudentAward studentAward) {
        if (UserUtils.isTeacher()) {
            studentAward.setTeacher(UserUtils.getUser().getTeacher());
        }
        return super.save(studentAward);
    }

    @Override
    public QueryResults<StudentAward> findList(int page, int limit) {
        QStudentAward qStudentAward = QStudentAward.studentAward;
        return queryFactory.selectFrom(qStudentAward).where(qStudentAward.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();

    }

    @Override
    public QueryResults<StudentAward> findList(Map<String, Object> params, int page, int limit) {
        QStudentAward qStudentAward = QStudentAward.studentAward;
        List<Predicate> where = new ArrayList<>();
        if (UserUtils.isTeacher()) {
            where.add(qStudentAward.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(qStudentAward.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(qStudentAward).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }
}