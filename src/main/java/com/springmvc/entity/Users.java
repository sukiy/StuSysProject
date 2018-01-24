package com.springmvc.entity;

import javax.persistence.*;

/**
 * Created by Sukiy on 2017/11/6.
 */
@Entity
@Table(name = "tb_user")
public class Users {

    private int uno;
    private String uname;
    private String upwd;
    private int ustatus=1;
    public Users() {
    }

    public Users(int uno, String uname, String upwd, int ustatus) {
        this.uno = uno;
        this.uname = uname;
        this.upwd = upwd;
        this.ustatus = ustatus;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getUno() {
        return uno;
    }

    public void setUno(int uno) {
        this.uno = uno;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public int getUstatus() {
        return ustatus;
    }

    public void setUstatus(int ustatus) {
        this.ustatus = ustatus;
    }
}

