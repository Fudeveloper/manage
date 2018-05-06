package com.summer.manage.dao;

import com.summer.manage.entity.ReportData;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface ReportDataDao extends JpaRepository<ReportData,Long> {

    Page<ReportData> findByFormIdEquals(long id,Pageable pageable);

    @Query("select count(t) from ReportData t where formId=?1")
    long  findByFormIdCount(long id);

    @Modifying
    @Transactional
    void deleteAllByFormIdEquals(long id);
}
