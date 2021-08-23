/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAO;

import java.util.List;
import javainfinite.pojo.slot;

/**
 *
 * @author Saeed
 */
public interface slotDao {
   public void saveSlot (slot slot);
    public List<slot> showAllSlotsOfOfficeHours(String officeHourID);
    public List<slot> showSlotInScepificTime(String from , String to);
    public void updateSlot (slot slot);
    public void deleteslot (slot slot);
    public slot getSlotByID(int id);
}
