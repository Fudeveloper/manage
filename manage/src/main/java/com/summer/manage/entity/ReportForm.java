package com.summer.manage.entity;

import com.summer.manage.converter.ItemConverter;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.List;

@Entity
@Table(name = "report_form")
public class ReportForm extends BaseEntity {

    String name;

    String bh;

    @Column(columnDefinition = "TEXT")
    @Convert(converter = ItemConverter.class)
    List<String> fieldBase;

    String tableExpend;

    @Column(columnDefinition = "TEXT")
    @Convert(converter = ItemConverter.class)
    List<String> fieldExpend;

    String fieldCustom;

    long createdTeacherId;

    long rangeId;

    String remark;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBh() {
        return bh;
    }

    public void setBh(String bh) {
        this.bh = bh;
    }



    public String getTableExpend() {
        return tableExpend;
    }

    public void setTableExpend(String tableExpend) {
        this.tableExpend = tableExpend;
    }



    public String getFieldCustom() {
        return fieldCustom;
    }

    public void setFieldCustom(String fieldCustom) {
        this.fieldCustom = fieldCustom;
    }

    public long getCreatedTeacherId() {
        return createdTeacherId;
    }

    public void setCreatedTeacherId(long createdTeacherId) {
        this.createdTeacherId = createdTeacherId;
    }

    public long getRangeId() {
        return rangeId;
    }

    public void setRangeId(long rangeId) {
        this.rangeId = rangeId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<String> getFieldBase() {
        return fieldBase;
    }

    public void setFieldBase(List<String> fieldBase) {
        this.fieldBase = fieldBase;
    }

    public List<String> getFieldExpend() {
        return fieldExpend;
    }

    public void setFieldExpend(List<String> fieldExpend) {
        this.fieldExpend = fieldExpend;
    }
}
