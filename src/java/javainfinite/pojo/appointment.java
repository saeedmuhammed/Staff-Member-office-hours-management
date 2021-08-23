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
 * @author Saeed
 */
@Entity

public class appointment implements Serializable {
    @Id
   private int id;
    
   private String studentid;
    private String memberid;
    private String slotid;
    private String start;
    private String endd;
    
    @Temporal(TemporalType.DATE)
   private Date date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid;
    }

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return endd;
    }

    public void setEnd(String end) {
        this.endd = end;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(String date) {
        
        Date sqldate=  java.sql.Date.valueOf(date);
        this.date = sqldate;
    }

    public String getSlotid() {
        return slotid;
    }

    public void setSlotid(String slotid) {
        this.slotid = slotid;
    }
    
    
    
}
