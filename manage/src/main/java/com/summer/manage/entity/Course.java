package com.summer.manage.entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@Entity
public class Course extends BaseEntity {
    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    @NotNull(message = "系部不能为空")
    Department department;

    @NotBlank(message = "名称不能为空")
    @Column(nullable = false, length = 30)
    String name;

    @Column(nullable = false, length = 255)
    String remark;

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
