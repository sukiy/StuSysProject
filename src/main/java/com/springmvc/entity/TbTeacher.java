package com.springmvc.entity;

import javax.persistence.*;

/**
 * Created by Sukiy on 2017/12/11.
 */
@Entity
@Table(name = "tb_teacher")
public class TbTeacher {

    private int tno;
    private String tname;

    public TbTeacher() {
    }

    public TbTeacher(int tno, String tname) {
        this.tno = tno;
        this.tname = tname;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getTno() {
        return tno;
    }

    public void setTno(int tno) {
        this.tno = tno;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

}
