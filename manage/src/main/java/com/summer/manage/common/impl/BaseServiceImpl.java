package com.summer.manage.common.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.summer.manage.common.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.Map;


public class BaseServiceImpl<T> implements BaseService<T> {

    @Autowired
    protected JpaRepository<T, Long> repository;

    @Autowired
    @PersistenceContext
    protected EntityManager entityManager;

    protected JPAQueryFactory queryFactory;

    @PostConstruct
    public void init() {
        queryFactory = new JPAQueryFactory(entityManager);
    }

    @Override
    public boolean save(T t) {
        try {
            repository.saveAndFlush(t);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    @Override
    public T saveAndRet(T t) {
        return repository.saveAndFlush(t);
    }

    @Override
    public List<T> findAll() {
        return repository.findAll();
    }

    @Override
    public Page<T> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public T findOne(Long id) {
        return repository.findOne(id);
    }

    @Override
    public boolean delete(Long id) {
        try {
            repository.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(Iterable<T> ids) {
        try {
            repository.deleteInBatch(ids);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return false;
    }

    @Override
    public QueryResults<T> findList(int page, int limit) {
        return null;
    }

    @Override
    public QueryResults<T> findList(Map<String, Object> params, int page, int limit) {
        return null;
    }

    @Override
    public long findByCount() {
        return 0;
    }

    @Override
    public List<T> findByTeacher(String table, long id) {

        Query query = entityManager.createQuery("SELECT t from " + table + " t where t.teacher.id = " + id);
        return query.getResultList();
    }


}
