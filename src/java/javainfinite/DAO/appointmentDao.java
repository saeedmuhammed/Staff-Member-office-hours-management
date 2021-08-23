/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAO;

import java.util.List;
import javainfinite.pojo.appointment;

/**
 *
 * @author Saeed
 */
public interface appointmentDao {
  public void saveAppointment (appointment appointment);
    public List<appointment> showAllAppointmentsOfStudent(String id);
    public List<appointment> showAllAppointmentsOfMember(String id);
    public List<appointment> showAllAppointments(String col, String data,String id);
    public List<appointment> showAllAppointmentsOfSlotid(String slotid);    
    public void updateAppointment (appointment appointment);
    public void deleteAppointment (appointment appointment);
    public appointment getAppointmentByID(int id);
}
