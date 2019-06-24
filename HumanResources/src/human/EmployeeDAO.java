package human;
import java.sql.*;
import java.util.ArrayList;
import java.util.*;
 

public class EmployeeDAO {
public List readFirstTitle(){
	        List<Employee> list =new ArrayList<Employee>();
		         Connection con=null;
		        PreparedStatement psmt=null;
	         ResultSet rs=null;
	         try {
	             Class.forName("com.mysql.jdbc.Driver");
	         } catch (ClassNotFoundException e) {
	             e.printStackTrace();
	        }
		        
	         try {
	            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/humanresources","root","123456");
	          String sql="select * from employee";
	           psmt=con.prepareStatement(sql);
	             rs=psmt.executeQuery();
	             
	             while(rs.next())
	            {
	            	 String e_id=rs.getString("e_id");
	                String e_name=rs.getString("e_name");
		              String sex=rs.getString("sex");
		              String age=rs.getString("age");
		              String edu_background=rs.getString("edu_background");
		              String speciality=rs.getString("speciality");
		              String foreign_language=rs.getString("foreign_language");
		              String grad_time=rs.getString("grad_time");
		              String marriage=rs.getString("marriage");
		              String post=rs.getString("post");
		              String department=rs.getString("department");
		              String technical_title=rs.getString("technical_title");
		              String state=rs.getString("state");
	              
		              Employee tl=new Employee(e_id, e_name,  sex, age,  edu_background, speciality,foreign_language,grad_time,marriage,post,department,technical_title,state);
                list.add(tl); 
	            }
		            
	        } catch (SQLException e) {
	           e.printStackTrace();
	        }finally
	         {
	           try {
	                 if(rs!=null)
	                 {
	                     rs.close();
	                }
	                if(psmt!=null)
	                {
	                    psmt.close();
	                 }
	                 if(con!=null)
	                 {
	                     con.close();
	                 }
	             } catch (SQLException e) {
	                  e.printStackTrace();
		              }
		         }
	         return list;
		      }
		    
}
