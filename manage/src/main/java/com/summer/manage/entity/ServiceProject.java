package com.summer.manage.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@Entity
public class ServiceProject extends BaseEntity {


    @NotBlank
    String projectName;

    String projectInstitution;

    String projectTeam;

    @ManyToOne
    Dictionary myRanking;

    String otherMember;

    String cooperationInstitution;

    String projectContent;

    String projectOfficialDocument;

    int contractMoney;

    String achievementName;

    @ManyToOne
    Dictionary achievementType;

    String achievementOwner;

    String achievementContent;

    String achievementAdscription;

    String achievementOfficialDocument;

    @ManyToOne
    Teacher teacher;

    String remark;

    @Lob
    @Column(columnDefinition = "TEXT")
    String annex;


    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectInstitution() {
        return projectInstitution;
    }

    public void setProjectInstitution(String projectInstitution) {
        this.projectInstitution = projectInstitution;
    }

    public String getProjectTeam() {
        return projectTeam;
    }

    public void setProjectTeam(String projectTeam) {
        this.projectTeam = projectTeam;
    }

    public Dictionary getMyRanking() {
        return myRanking;
    }

    public void setMyRanking(Dictionary myRanking) {
        this.myRanking = myRanking;
    }

    public String getOtherMember() {
        return otherMember;
    }

    public void setOtherMember(String otherMember) {
        this.otherMember = otherMember;
    }

    public String getCooperationInstitution() {
        return cooperationInstitution;
    }

    public void setCooperationInstitution(String cooperationInstitution) {
        this.cooperationInstitution = cooperationInstitution;
    }

    public String getProjectContent() {
        return projectContent;
    }

    public void setProjectContent(String projectContent) {
        this.projectContent = projectContent;
    }

    public String getProjectOfficialDocument() {
        return projectOfficialDocument;
    }

    public void setProjectOfficialDocument(String projectOfficialDocument) {
        this.projectOfficialDocument = projectOfficialDocument;
    }

    public int getContractMoney() {
        return contractMoney;
    }

    public void setContractMoney(int contractMoney) {
        this.contractMoney = contractMoney;
    }

    public String getAchievementName() {
        return achievementName;
    }

    public void setAchievementName(String achievementName) {
        this.achievementName = achievementName;
    }

    public Dictionary getAchievementType() {
        return achievementType;
    }

    public void setAchievementType(Dictionary achievementType) {
        this.achievementType = achievementType;
    }

    public String getAchievementOwner() {
        return achievementOwner;
    }

    public void setAchievementOwner(String achievementOwner) {
        this.achievementOwner = achievementOwner;
    }

    public String getAchievementContent() {
        return achievementContent;
    }

    public void setAchievementContent(String achievementContent) {
        this.achievementContent = achievementContent;
    }

    public String getAchievementAdscription() {
        return achievementAdscription;
    }

    public void setAchievementAdscription(String achievementAdscription) {
        this.achievementAdscription = achievementAdscription;
    }

    public String getAchievementOfficialDocument() {
        return achievementOfficialDocument;
    }

    public void setAchievementOfficialDocument(String achievementOfficialDocument) {
        this.achievementOfficialDocument = achievementOfficialDocument;
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
}
