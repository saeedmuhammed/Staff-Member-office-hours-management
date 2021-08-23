/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAO;

import java.util.List;
import javainfinite.pojo.subject;


/**
 *
 * @author Saeed
 */
public interface subjectDao {
     public void saveSubject (subject subject);
    public List<subject> showAllSubject(String name);
    public void updateSubject (subject subject );
    public void deleteSubject (subject subject);
    public subject getSubjectByID(String id);
    public subject getSubjectByName(String Name);

    
}
