package com.summer.manage.service.impl;

import com.querydsl.core.QueryResults;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.FieldList;
import com.summer.manage.entity.QFieldList;
import com.summer.manage.entity.QReportForm;
import com.summer.manage.entity.ReportForm;
import com.summer.manage.service.FieldListService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FieldListServiceImpl extends BaseServiceImpl<ReportForm> implements FieldListService {

    @Override
    public List<FieldList> findByTableLabelEquals(String tableLabel) {
        QFieldList qFieldList = QFieldList.fieldList;

        return queryFactory.selectFrom(qFieldList).where(qFieldList.tableLabel.eq(tableLabel)).fetch();
    }

    @Override
    public List<String> findDistinctByTableLabelNot(String tableLabel) {
        QFieldList qFieldList = QFieldList.fieldList;

        return queryFactory.selectDistinct(qFieldList.tableLabel).from(qFieldList).where(qFieldList.tableLabel.eq(tableLabel)).fetch();
    }

    @Override
    public QueryResults<ReportForm> findList(int page, int limit) {
        QReportForm qReportForm = QReportForm.reportForm;

        return queryFactory.selectFrom(qReportForm).offset(page * limit).limit(limit).fetchResults();
    }
}
