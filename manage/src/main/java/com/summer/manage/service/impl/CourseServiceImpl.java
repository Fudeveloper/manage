package com.summer.manage.service.impl;

import com.querydsl.core.types.Predicate;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.Course;
import com.summer.manage.entity.QCourse;
import com.summer.manage.service.CourseService;
import com.summer.manage.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CourseServiceImpl extends BaseServiceImpl<Course> implements CourseService {

    @Override
    public long findByCount() {
      return 0;
    }
}