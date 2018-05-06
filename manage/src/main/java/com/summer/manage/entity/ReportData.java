package com.summer.manage.entity;

import com.summer.manage.converter.MapConverter;

import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Map;

@Table(name = "report_data")
@Entity
public class ReportData extends BaseEntity {


    long formId;

    long teacherId;

    @Convert(converter = MapConverter.class)
    Map<String,Object> dataBase;

    @Convert(converter = MapConverter.class)
    Map<String,Object> dataExpand;

    String dataCustom;


    public Map<String, Object> getDataBase() {
        return dataBase;
    }

    public void setDataBase(Map<String, Object> dataBase) {
        this.dataBase = dataBase;
    }

    public Map<String, Object> getDataExpand() {
        return dataExpand;
    }

    public void setDataExpand(Map<String, Object> dataExpand) {
        this.dataExpand = dataExpand;
    }

    public String getDataCustom() {
        return dataCustom;
    }

    public void setDataCustom(String dataCustom) {
        this.dataCustom = dataCustom;
    }

    public long getFormId() {
        return formId;
    }

    public void setFormId(long formId) {
        this.formId = formId;
    }

    public long getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(long teacherId) {
        this.teacherId = teacherId;
    }
}
