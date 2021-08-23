/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAO;

import java.util.List;
import javainfinite.pojo.messagestaffmember;

/**
 *
 * @author Dell
 */
public interface messagestaffmemberDao {
     public void saveMessage (messagestaffmember messagestaffmember );
    public List<messagestaffmember> showAllMessage(String memberID);
    public void updateMessage (messagestaffmember messagestaffmember);
    public void deleteMessage (messagestaffmember messagestaffmember);
    public messagestaffmember getMessageByID(String id);
    
}
