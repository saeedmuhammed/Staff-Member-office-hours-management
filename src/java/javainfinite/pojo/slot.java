/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.pojo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author Saeed
 */
@Entity
public class slot implements Serializable {
    
 @Id
 private int slotid;
 
 private String officehoursid;
 private String fromm;
 private String too;
 private String reservedd;

    public int getSlotid() {
        return slotid;
    }

    public void setSlotid(int slotid) {
        this.slotid = slotid;
    }

    public String getOfficehoursid() {
        return officehoursid;
    }

    public void setOfficehoursid(String officehoursid) {
        this.officehoursid = officehoursid;
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

    public String getReserved() {
        return reservedd;
    }

    public void setReserved(String reserved) {
        this.reservedd = reserved;
    }
 
 
    
}
