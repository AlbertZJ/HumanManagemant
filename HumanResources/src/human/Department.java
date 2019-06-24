package human;
 
public class Department {
	/**
　　　　*下面这四个属性为数据库表中的四个属性
　　　　*/
	 
    private String department;
    public String getDepartment() {
		return department;
	}


	public void setDepartment(String department) {
		this.department = department;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	private String id;
     

	public Department( String id,String department) {
          super();
          this.id = id;
         this.department = department;
       
          
     }
}
