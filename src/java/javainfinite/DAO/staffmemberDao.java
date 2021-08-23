/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAO;

import java.util.List;
import javainfinite.pojo.staffmember;
 
/**
 *
 * @author Dell
 */
public interface staffmemberDao {
     public void saveStaffMember (staffmember staffmember);
    public List<staffmember> showAllStaffMember(String subjectid);
    public void updateStaffMember (staffmember staffmember);
    public void deleteStaffMember (staffmember staffmember);
    public staffmember getStaffMemberByID(String id);
    
}
