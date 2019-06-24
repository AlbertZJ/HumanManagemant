package human;
 
public class Speciality {
	/**
　　　　*下面这四个属性为数据库表中的四个属性
　　　　*/
	 
    private String speciality;
    private String id;
     
	public Speciality( String id,String speciality) {
          super();
          this.id = id;
         this.speciality = speciality;
       
          
     }

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
