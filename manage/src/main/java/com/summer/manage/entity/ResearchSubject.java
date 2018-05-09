package com.summer.manage.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.Date;

//研究课题
@Entity
public class ResearchSubject extends BaseEntity {

    @NotNull(message = "课题性质不能为空")
    @ManyToOne
    Dictionary natureOfTheProject;//课题性质

    @NotBlank(message = "名称不能为空")
    String name;

    @NotNull(message = "立项日期不能为空")
    Date dateOfEstablishment;//立项日期

    @NotBlank(message = "项目来源不能为空")
    String projectSource;//项目来源

    @NotBlank(message = "立项编号不能为空")
    String projectNumber;//立项编号

    @NotNull(message = "到款金额不能为空")
    int theAmountOfMoney;//到款金额

    @NotNull(message = "本人排名不能为空")
    @ManyToOne
    Dictionary myRanking;//本人排名

    String remark;//备注

    String annex;

    @ManyToOne
    Teacher teacher;
    
    public Dictionary getMyRanking() {
        return myRanking;
    }

    public void setMyRanking(Dictionary myRanking) {
        this.myRanking = myRanking;
    }

    public Dictionary getNatureOfTheProject() {
        return natureOfTheProject;
    }

    public void setNatureOfTheProject(Dictionary natureOfTheProject) {
        this.natureOfTheProject = natureOfTheProject;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDateOfEstablishment() {
        return dateOfEstablishment;
    }

    public void setDateOfEstablishment(Date dateOfEstablishment) {
        this.dateOfEstablishment = dateOfEstablishment;
    }

    public String getProjectSource() {
        return projectSource;
    }

    public void setProjectSource(String projectSource) {
        this.projectSource = projectSource;
    }

    public String getProjectNumber() {
        return projectNumber;
    }

    public void setProjectNumber(String projectNumber) {
        this.projectNumber = projectNumber;
    }

    public int getTheAmountOfMoney() {
        return theAmountOfMoney;
    }

    public void setTheAmountOfMoney(int theAmountOfMoney) {
        this.theAmountOfMoney = theAmountOfMoney;
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
