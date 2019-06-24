package human;
import java.sql.*;
import java.util.ArrayList;
import java.util.*;
 

public class SpecialityDAO {
public List readFirstTitle(){
	        List<Speciality> list =new ArrayList<Speciality>();
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
	          String sql="select * from think";
	           psmt=con.prepareStatement(sql);
	             rs=psmt.executeQuery();
	             
	             while(rs.next())
	            {String id=rs.getString("id");
	            
	            	   String speciality=rs.getString("speciality");
		             
	            	   Speciality tl=new Speciality(id,speciality);
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
