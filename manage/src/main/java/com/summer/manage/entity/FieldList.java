package com.summer.manage.entity;

import com.summer.manage.converter.ItemConverter;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "teacher_field")
public class FieldList extends BaseEntity {

    String tableLabel;

    String tableName;

    String fieldLabel;

    String fieldName;

    String typeLabel;

    String typeName;

    String fieldAttr;

    String tableEntity;

    public String getTableLabel() {
        return tableLabel;
    }

    public void setTableLabel(String tableLabel) {
        this.tableLabel = tableLabel;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getFieldLabel() {
        return fieldLabel;
    }

    public void setFieldLabel(String fieldLabel) {
        this.fieldLabel = fieldLabel;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getTypeLabel() {
        return typeLabel;
    }

    public void setTypeLabel(String typeLabel) {
        this.typeLabel = typeLabel;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getFieldAttr() {
        return fieldAttr;
    }

    public void setFieldAttr(String fieldAttr) {
        this.fieldAttr = fieldAttr;
    }

    public String getTableEntity() {
        return tableEntity;
    }

    public void setTableEntity(String tableEntity) {
        this.tableEntity = tableEntity;
    }
}
