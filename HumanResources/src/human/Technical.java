package human;
 
public class Technical {
	/**
　　　　*下面这四个属性为数据库表中的四个属性
　　　　*/
	 
    private String technical_title;
     
	private String id;
     
	public Technical( String id,String technical_title) {
          super();
          this.id = id;
         this.technical_title = technical_title;
       
          
     }

	public String getTechnical_title() {
		return technical_title;
	}

	public void setTechnical_title(String technical_title) {
		this.technical_title = technical_title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
