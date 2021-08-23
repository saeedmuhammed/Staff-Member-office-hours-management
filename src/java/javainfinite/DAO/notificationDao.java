/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAO;

import java.util.List;
import javainfinite.pojo.notificationn;

/**
 *
 * @author Dell
 */
public interface notificationDao {
     public void savenotification (notificationn notification);
     public void updatenotification (notificationn notification);
     public void deletenotification (notificationn notification);
     public List<notificationn> showAllNotificationDate(String Date);
     public List<notificationn> showAllNotification();
  
}
