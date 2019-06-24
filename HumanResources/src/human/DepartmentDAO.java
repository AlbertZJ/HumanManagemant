package human;
import java.sql.*;
import java.util.ArrayList;
import java.util.*;
 

public class DepartmentDAO {
public List readFirstTitle(){
	        List<Department> list =new ArrayList<Department>();
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
	          String sql="select * from department";
	           psmt=con.prepareStatement(sql);
	             rs=psmt.executeQuery();
	             
	             while(rs.next())
	            {String id=rs.getString("id");
	            
	            	   String department=rs.getString("department");
		             
	            	   Department tl=new Department(id,department );
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
