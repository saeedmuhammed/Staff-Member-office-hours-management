/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAO;

import java.util.List;
import javainfinite.pojo.student;


/**
 *
 * @author Saeed
 */
public interface studentDao {
    public void saveStudent (student student);
    public List<student> showAllStudents();
    public void updateStudent (student student);
    public void deleteStudent (student student);
    public student getStudentByID(String id);
    public boolean getStudentByEmail(String email);
    
}
