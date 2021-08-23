/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAO;

import javainfinite.pojo.message;
import java.util.List;

/**
 *
 * @author Dell
 */
public interface messageDao {
    public void saveMessage (message message);
    public List<message> showMessageToid(String memberID);
    public List<message> showMessageFromid(String memberID);
    public void updateMessage (message message);
    public void deleteMessage (message message);
     
    
}