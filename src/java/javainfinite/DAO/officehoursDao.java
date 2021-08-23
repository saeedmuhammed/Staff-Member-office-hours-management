/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAO;

import java.util.List;
import javainfinite.pojo.officehourss;

/**
 *
 * @author Saeed
 */
public interface officehoursDao {
    public void saveOfficeHours (officehourss officehour);
    public List<officehourss> showAllOfficeHoursOfMember(String memberID);
    public List<officehourss> showAllOfficeHours(String memberID,String col , String data);
    public void updateOfficeHours (officehourss officehour);
    public void deleteOfficeHour (officehourss officehour);
    public officehourss getOfficeHourByID(String id);
    public List<officehourss> getOfficeHourByDate(String date,String id);
    public List<officehourss> getOfficeHourByID(String id,String memberid);
    
    
}
