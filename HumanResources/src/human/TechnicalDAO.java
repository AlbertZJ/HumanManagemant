package human;
import java.sql.*;
import java.util.ArrayList;
import java.util.*;
 

public class TechnicalDAO {
public List readFirstTitle(){
	        List<Technical> list =new ArrayList<Technical>();
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
	          String sql="select * from technical_title";
	           psmt=con.prepareStatement(sql);
	             rs=psmt.executeQuery();
	             
	             while(rs.next())
	            {String id=rs.getString("id");
	            
	            	   String technical_title=rs.getString("technical_title");
		             
	            	   Technical tl=new Technical(id,technical_title );
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
