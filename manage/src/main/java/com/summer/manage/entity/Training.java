package com.summer.manage.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.Date;

//培训学习
@Entity
public class Training extends BaseEntity {

    @NotNull(message = "培训时间不能为空")
    Date trainingPeriod;//培训时间

    @NotNull(message = "完成时间不能为空")
    Date completeTime;//完成时间

    @NotBlank(message = "培训名称不能为空")
    String trainingName;//培训名称

    @NotBlank(message = "获取证书不能为空")
    String getACertificate;//获取证书

    String remark;//备注

    String annex;//附件

    @ManyToOne
    Teacher teacher;

    public Date getTrainingPeriod() {
        return trainingPeriod;
    }

    public void setTrainingPeriod(Date trainingPeriod) {
        this.trainingPeriod = trainingPeriod;
    }

    public Date getCompleteTime() {
        return completeTime;
    }

    public void setCompleteTime(Date completeTime) {
        this.completeTime = completeTime;
    }

    public String getTrainingName() {
        return trainingName;
    }

    public void setTrainingName(String trainingName) {
        this.trainingName = trainingName;
    }

    public String getGetACertificate() {
        return getACertificate;
    }

    public void setGetACertificate(String getACertificate) {
        this.getACertificate = getACertificate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
}


