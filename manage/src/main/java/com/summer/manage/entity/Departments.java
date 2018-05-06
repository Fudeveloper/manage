package com.summer.manage.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@Entity
public class Departments extends BaseEntity {

    @NotBlank(message = "名称不能为空")
    String name;

    @NotNull(message = "系部不能为空")
    @ManyToOne
    Department department;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
