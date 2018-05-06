package com.summer.manage.service;

import com.summer.manage.common.BaseService;
import com.summer.manage.entity.FieldList;
import com.summer.manage.entity.ReportForm;

import java.util.List;

public interface FieldListService extends BaseService<ReportForm> {

    List<FieldList> findByTableLabelEquals(String tableLabel);


    List<String> findDistinctByTableLabelNot(String tableLabel);
}
