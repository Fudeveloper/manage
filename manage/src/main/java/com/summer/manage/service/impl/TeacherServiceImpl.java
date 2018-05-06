package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.dao.TeacherDao;

import com.summer.manage.entity.QTeacher;
import com.summer.manage.entity.Teacher;
import com.summer.manage.service.TeacherService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class TeacherServiceImpl extends BaseServiceImpl<Teacher> implements TeacherService {

    @Autowired
    TeacherDao teacherDao;


    @Override
    public QueryResults<Teacher> findByParamsList(Integer xb, Integer zc, String fullName, Integer page, Integer limit) {
        QTeacher qTeacher = QTeacher.teacher;
        List<Predicate> list = new ArrayList<>();
        if (xb > 0) {
            list.add(qTeacher.pyxz.id.eq(xb.longValue()));
        }
        if (zc > 0) {
            list.add(qTeacher.zc.id.eq(zc.longValue()));
        }

        if (!StringUtils.isEmpty(fullName)) {
            list.add(qTeacher.fullName.eq(fullName));
        }

        if (UserUtils.isTeacher()) {
            list.add(qTeacher.user.id.eq(UserUtils.getUser().getId()));
        }


        return queryFactory.selectFrom(qTeacher).where(list.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }

    @Override
    public Teacher findByCurrent() {
        QTeacher qTeacher = QTeacher.teacher;
        return queryFactory.selectFrom(qTeacher).where(qTeacher.user.eq(UserUtils.getUser())).fetchOne();
    }

    @Override
    public void updateAuditStatus(long id, boolean state) {
        teacherDao.updateState(id, state);
    }

    @Override
    public List<Teacher> findByParamsImportList(Integer xb, Integer ks, String jobNumber, String fullName) {
        QTeacher qTeacher = QTeacher.teacher;
        List<Predicate> list = new ArrayList<>();
        if (xb > 0) {
            list.add(qTeacher.department.id.eq(xb.longValue()));
        }
        if (ks > 0) {
            list.add(qTeacher.departments.id.eq(ks.longValue()));
        }

        if (!StringUtils.isEmpty(fullName)) {
            list.add(qTeacher.fullName.eq(fullName));
        }
        if (!StringUtils.isEmpty(jobNumber)) {
            list.add(qTeacher.jobNumber.eq(jobNumber));
        }

        return queryFactory.selectFrom(qTeacher).where(list.toArray(new Predicate[]{})).fetch();
    }

    @Override
    public boolean save(Teacher teacher) {
        if (UserUtils.isTeacher()) teacher.setUser(UserUtils.getUser());
        return super.save(teacher);
    }
}
