package com.springmvc.entity;

import javax.persistence.*;

/**
 * Created by Sukiy on 2017/12/11.
 */
@Entity
@Table(name = "tb_class")
public class TbClass {

    private int cno;
    private String cname;

    //一个班级对应一个老师
    private TbTeacher tbTeacher;

    public TbClass() {
    }

    public TbClass(int cno, String cname) {
        this.cno = cno;
        this.cname = cname;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getCno() {
        return cno;
    }

    public void setCno(int cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @OneToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "ctno")
    public TbTeacher getTbTeacher() {
        return tbTeacher;
    }

    public void setTbTeacher(TbTeacher tbTeacher) {
        this.tbTeacher = tbTeacher;
    }
}
