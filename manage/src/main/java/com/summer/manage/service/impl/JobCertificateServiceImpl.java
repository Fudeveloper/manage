package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.FurtherStudy;
import com.summer.manage.entity.JobCertificate;
import com.summer.manage.entity.QFurtherStudy;
import com.summer.manage.entity.QJobCertificate;
import com.summer.manage.service.JobCertificateService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class JobCertificateServiceImpl extends BaseServiceImpl<JobCertificate> implements JobCertificateService {

    @Override
    public boolean save(JobCertificate jobCertificate) {
        if (UserUtils.isTeacher())
            jobCertificate.setTeacher(UserUtils.getUser().getTeacher());
        return super.save(jobCertificate);
    }

    @Override
    public QueryResults<JobCertificate> findList(int page, int limit) {
        QJobCertificate jobCertificate = QJobCertificate.jobCertificate;
        return queryFactory.selectFrom(jobCertificate).where(jobCertificate.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();
    }

    @Override
    public QueryResults<JobCertificate> findList(Map<String, Object> params, int page, int limit) {
        List<Predicate> where = new ArrayList<>();
        QJobCertificate jobCertificate = QJobCertificate.jobCertificate;
        if (UserUtils.isTeacher()) {
            where.add(jobCertificate.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(jobCertificate.teacher.id.eq((Long) params.get("teacher")));
            }

        }

        return queryFactory.selectFrom(jobCertificate).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }
}