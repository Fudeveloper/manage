package com.summer.manage.dao;

import com.summer.manage.entity.JobCertificate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface JobCertificateDao extends JpaRepository<JobCertificate, Long> ,QueryDslPredicateExecutor<JobCertificate> {


}