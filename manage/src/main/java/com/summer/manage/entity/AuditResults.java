package com.summer.manage.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import java.util.Date;

//教师结果
@Entity
public class AuditResults extends BaseEntity {


    @NotNull(message = "教师不能为空")
    @ManyToOne
    Teacher teacher;

    @NotBlank(message = "整改意见不能为空")
    String co;

    @NotBlank(message = "审改人不能为空")
    String reviewer;

    Date auditTime;

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }


    public String getCo() {
        return co;
    }

    public void setCo(String co) {
        this.co = co;
    }

    public String getReviewer() {
        return reviewer;
    }

    public void setReviewer(String reviewer) {
        this.reviewer = reviewer;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }
}
