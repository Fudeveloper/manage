package com.summer.manage.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
public class Teacher extends BaseEntity {


    @NotBlank(message = "工号不能为空")
    String jobNumber;//工号

    @NotBlank(message = "姓名不能为空")
    String fullName;//姓名

    @NotNull(message = "性别不能为空")
    @ManyToOne
    Dictionary sex;//性别

    @ManyToOne
    Dictionary zc;//职称


    Date birthday;//出生年月


    @NotNull(message = "聘用性质不能为空")
    @ManyToOne
    Dictionary pyxz;//聘用性质

    String job;//职务

    @NotNull(message = "学历不能为空")
    @ManyToOne
    Dictionary education;//学历

    @NotNull(message = "学位不能为空")
    @ManyToOne
    Dictionary degree;//学位

    @NotNull(message = "专业领域不能为空")
    @ManyToOne
    Dictionary zyly;//专业领域

    String zytc;//专业特长

    boolean gxzg;//有无搞笑资格

    boolean ggjs;//骨干教师

    boolean ssjs;//双师教师

    @ManyToOne
    Dictionary jxms;//教学名师


    @JsonIgnore
    @JoinColumn(name = "userId", referencedColumnName = "id", unique = true)
    @OneToOne(cascade = {CascadeType.REMOVE})
    User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    String mobile;

    @Email
    String email;

    String qq;

    boolean verify = false;

    public boolean isVerify() {
        return verify;
    }

    public void setVerify(boolean verify) {
        this.verify = verify;
    }

    @NotNull(message = "系部不能为空")
    @ManyToOne(cascade = CascadeType.REMOVE)
    Department department;

    @NotNull(message = "科室不能为空")
    @ManyToOne(cascade = CascadeType.REMOVE)
    Departments departments;

    String annex;

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Departments getDepartments() {
        return departments;
    }

    public void setDepartments(Departments departments) {
        this.departments = departments;
    }

    public String getJobNumber() {
        return jobNumber;
    }

    public void setJobNumber(String jobNumber) {
        this.jobNumber = jobNumber;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Dictionary getSex() {
        return sex;
    }

    public void setSex(Dictionary sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Dictionary getPyxz() {
        return pyxz;
    }

    public void setPyxz(Dictionary pyxz) {
        this.pyxz = pyxz;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public Dictionary getEducation() {
        return education;
    }

    public void setEducation(Dictionary education) {
        this.education = education;
    }

    public Dictionary getDegree() {
        return degree;
    }

    public void setDegree(Dictionary degree) {
        this.degree = degree;
    }

    public Dictionary getZyly() {
        return zyly;
    }

    public void setZyly(Dictionary zyly) {
        this.zyly = zyly;
    }

    public String getZytc() {
        return zytc;
    }

    public void setZytc(String zytc) {
        this.zytc = zytc;
    }

    public boolean isGxzg() {
        return gxzg;
    }

    public void setGxzg(boolean gxzg) {
        this.gxzg = gxzg;
    }

    public boolean isGgjs() {
        return ggjs;
    }

    public void setGgjs(boolean ggjs) {
        this.ggjs = ggjs;
    }

    public boolean isSsjs() {
        return ssjs;
    }

    public void setSsjs(boolean ssjs) {
        this.ssjs = ssjs;
    }

    public Dictionary getJxms() {
        return jxms;
    }

    public void setJxms(Dictionary jxms) {
        this.jxms = jxms;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }


    public Dictionary getZc() {
        return zc;
    }

    public void setZc(Dictionary zc) {
        this.zc = zc;
    }
}
