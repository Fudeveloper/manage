package com.summer.manage.dao;

import com.summer.manage.entity.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.transaction.annotation.Transactional;

public interface TeacherDao extends JpaRepository<Teacher, Long>, QueryDslPredicateExecutor<Teacher> {

    @Transactional
    @Modifying
    @Query("update Teacher t set t.verify=?2 where t.id=?1")
    void updateState(long id, boolean state);
}
