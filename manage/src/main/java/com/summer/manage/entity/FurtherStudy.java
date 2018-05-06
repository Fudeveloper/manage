package com.summer.manage.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.Date;

//进修学习
@Entity
public class FurtherStudy extends BaseEntity {

    @NotNull(message = "进修时间不能为空")
    Date trainingTime;//进修时间

    @NotNull(message = "完成时间不能为空")
    Date completeTime;//完成时间

    @NotBlank(message = "进修学校不能为空")
    String studySchool;//进修学校

    @NotBlank(message = "专业名称不能为空")
    String professionalTitle;//专业名称

    @NotBlank(message = "进修学历不能为空")
    String furtherEducation;//进修学历

    @NotBlank(message = "进修学位不能为空")
    String advancedDegree;//进修学位

    @ManyToOne
    Teacher teacher;

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    String remark;//备注

    String annex;//附件

    public Date getTrainingTime() {
        return trainingTime;
    }

    public void setTrainingTime(Date trainingTime) {
        this.trainingTime = trainingTime;
    }

    public Date getCompleteTime() {
        return completeTime;
    }

    public void setCompleteTime(Date completeTime) {
        this.completeTime = completeTime;
    }

    public String getStudySchool() {
        return studySchool;
    }

    public void setStudySchool(String studySchool) {
        this.studySchool = studySchool;
    }

    public String getProfessionalTitle() {
        return professionalTitle;
    }

    public void setProfessionalTitle(String professionalTitle) {
        this.professionalTitle = professionalTitle;
    }

    public String getFurtherEducation() {
        return furtherEducation;
    }

    public void setFurtherEducation(String furtherEducation) {
        this.furtherEducation = furtherEducation;
    }

    public String getAdvancedDegree() {
        return advancedDegree;
    }

    public void setAdvancedDegree(String advancedDegree) {
        this.advancedDegree = advancedDegree;
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
}
