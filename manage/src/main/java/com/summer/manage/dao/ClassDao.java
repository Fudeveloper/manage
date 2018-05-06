package com.summer.manage.dao;

import com.summer.manage.entity.TClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ClassDao extends JpaRepository<TClass, Long> {


}