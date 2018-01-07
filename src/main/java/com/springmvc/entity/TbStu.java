package com.springmvc.entity;

import javax.persistence.*;


/**
 * Created by Sukiy on 2017/12/13.
 */
@Entity
@Table(name = "tb_stu")
public class TbStu {

    private int sno;
    private String sname;
    private int sage;
    private String sex;
    private String sintime;

    //多个学生对应一个班级
    private TbClass tbClass;

    public TbStu() {
    }

    public TbStu(int sno, String sname, int sage, String sex, String sintime) {
        this.sno = sno;
        this.sname = sname;
        this.sage = sage;
        this.sex = sex;
        this.sintime = sintime;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public int getSage() {
        return sage;
    }

    public void setSage(int sage) {
        this.sage = sage;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSintime() {
        return sintime;
    }

    public void setSintime(String sintime) {
        this.sintime = sintime;
    }

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "scno")
    public TbClass getTbClass() {
        return tbClass;
    }

    public void setTbClass(TbClass tbClass) {
        this.tbClass = tbClass;
    }
}
