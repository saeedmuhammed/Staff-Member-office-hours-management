/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Saeed
 */
@Entity
public class officehourss implements Serializable {
    @Id 
    private int id;
    
    private String memberid;
    private String fromm;
    private String too;
    private String location;
    private String type;
    
    @Temporal(TemporalType.DATE)
    private Date date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }

    public String getFrom() {
        return fromm;
    }

    public void setFrom(String from) {
        this.fromm = from;
    }

    public String getTo() {
        return too;
    }

    public void setTo(String to) {
        this.too = to;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getOnoroff() {
        return type;
    }

    public void setOnoroff(String onoroff) {
        this.type = onoroff;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(String date) {
         Date sqldate=  java.sql.Date.valueOf(date);
        this.date = sqldate;
    }
    
    
    
}
