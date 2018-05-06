package com.summer.manage.common;


import com.querydsl.core.QueryResults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface BaseService<T> {

    boolean save(T t);

    T saveAndRet(T t);

    List<T> findAll();

    Page<T> findAll(Pageable pageable);

    T findOne(Long id);

    boolean delete(Long id);

    boolean delete(Iterable<T> ids);

    QueryResults<T> findList(int page, int limit);

    QueryResults<T> findList(Map<String, Object> params, int page, int limit);

    long findByCount();

    List<T> findByTeacher(String table,long id);
}
