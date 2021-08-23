/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Dell
 */
@Entity
public class notificationn implements Serializable{
    
    @Id
    private int id;
    
    
    private String tostudent;
    private String tomember;
    private String studentid;
    private String memberid;
    private String mesg;

    public int getIdd() {
        return id;
    }

    public void setIdd(int id) {
        this.id = id;
    }
    private String sent;
    
     @Temporal(TemporalType.DATE)
   private Date date;
    
    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }
    

    public void setId(String studentid) {
        this.studentid = studentid;
    }
    
    
    public String getTo() {
        return tostudent;
    }

    public void setTo(String to) {
        this.tostudent = to;
    }
    
    
    
    
    public String getSent() {
        return sent;
    }

    public void setSent(String sent) {
        this.sent = sent;
    }
    
    
    
   public String getToMember() {
        return tomember;
    }

    public void setToMember(String tomember) {
        this.tomember = tomember;
    }
     
    
    
    public String getBody() {
        return mesg;
    }

    public void setBody(String body) {
        this.mesg = body;
    }
    
    
    
    
    public Date getDate() {
        return date;
    }

    public void setDate(String date) {
        
        Date sqldate=  java.sql.Date.valueOf(date);
        this.date = sqldate;
    }

    
    
    
    
    
   public String getStudentId() {
        return studentid;
    }
    public void setStudentid(String studentid) {
        this.studentid = studentid;
    }
}
