package com.springmvc.entity;

import javax.persistence.*;

/**
 * Created by Sukiy on 2017/12/11.
 */
@Entity
@Table(name = "tb_lesson")
public class Lesson {

    private int lno;
    private String lname;

    //一个课程对应一个老师
    private TbTeacher tbTeacher;

    public Lesson() {
    }

    public Lesson(int lno, String lname) {
        this.lno = lno;
        this.lname = lname;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getLno() {
        return lno;
    }

    public void setLno(int lno) {
        this.lno = lno;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    @OneToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "ltno")
    public TbTeacher getTbTeacher() {
        return tbTeacher;
    }

    public void setTbTeacher(TbTeacher tbTeacher) {
        this.tbTeacher = tbTeacher;
    }
}
