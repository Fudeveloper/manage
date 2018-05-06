package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.PublishingBooks;
import com.summer.manage.entity.QPublishingBooks;
import com.summer.manage.service.PublishingBooksService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class PublishingBooksServiceImpl extends BaseServiceImpl<PublishingBooks> implements PublishingBooksService {


    @Override
    public boolean save(PublishingBooks publishingBooks) {
        if (UserUtils.isTeacher())
            publishingBooks.setTeacher(UserUtils.getUser().getTeacher());
        return super.save(publishingBooks);
    }

    @Override
    public QueryResults<PublishingBooks> findList(int page, int limit) {
        QPublishingBooks publishingBooks = QPublishingBooks.publishingBooks;
        return queryFactory.selectFrom(publishingBooks).where(publishingBooks.teacher.eq(UserUtils.getUser().getTeacher())).offset(page * limit).limit(limit).fetchResults();

    }

    @Override
    public QueryResults<PublishingBooks> findList(Map<String, Object> params, int page, int limit) {
        List<Predicate> where = new ArrayList<>();
        QPublishingBooks publishingBooks = QPublishingBooks.publishingBooks;
        if (UserUtils.isTeacher()) {
            where.add(publishingBooks.teacher.user.eq(UserUtils.getUser()));
        } else {
            if (params.containsKey("teacher") && params.get("teacher") != null) {
                where.add(publishingBooks.teacher.id.eq((Long) params.get("teacher")));
            }
        }
        return queryFactory.selectFrom(publishingBooks).where(where.toArray(new Predicate[]{})).offset(page * limit).limit(limit).fetchResults();
    }
}