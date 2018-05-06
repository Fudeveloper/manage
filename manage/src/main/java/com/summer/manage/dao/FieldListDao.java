package com.summer.manage.dao;

import com.summer.manage.entity.FieldList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface FieldListDao extends JpaRepository<FieldList, Long> {

    List<FieldList> findByTableLabelEquals(String tableLabel);

    List<FieldList> findByTableEntityEquals(String tableLabel);
    FieldList findFirstByTableEntityEquals(String tableLabel);
    @Query("select distinct(t.tableLabel),t.tableEntity from FieldList t where t.tableLabel<>'基本资料'")
    List<FieldList> findByTalbeLabeList();
}
