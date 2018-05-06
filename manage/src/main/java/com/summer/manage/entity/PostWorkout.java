package com.summer.manage.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.Date;

//挂职锻炼
@Entity
public class PostWorkout extends BaseEntity {

    @NotBlank(message = "单位名称不能为空")
    String companyName;//单位名称

    @NotBlank(message = "岗位不能为空")
    String job;//岗位

    @NotNull(message = "开始时间不能为空")
    Date startingTime;//开始时间

    @NotNull(message = "结束时间不能为空")
    Date endTime;//结束时间

    @NotNull(message = "派出部门不能为空")
    @ManyToOne
    Dictionary dispatchDepartment;//派出部门*

    @ManyToOne
    Teacher teacher;

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public Date getStartingTime() {
        return startingTime;
    }

    public void setStartingTime(Date startingTime) {
        this.startingTime = startingTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Dictionary getDispatchDepartment() {
        return dispatchDepartment;
    }

    public void setDispatchDepartment(Dictionary dispatchDepartment) {
        this.dispatchDepartment = dispatchDepartment;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
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

    String remark;//备注

    String annex;//附件
}
