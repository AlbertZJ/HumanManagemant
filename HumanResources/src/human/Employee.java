package human;
 
public class Employee {
	/**
　　　　*下面这四个属性为数据库表中的四个属性
　　　　*/
	private String e_id; 
	private String e_name;
     private String sex;     
	private String age; 
    private String edu_background;
    private String speciality;  
    private String foreign_language;
    private String grad_time;
    private String marriage;
    private String post;
    private String department;  
    private String technical_title;
    public String getE_id() {
		return e_id;
	}



	public void setE_id(String e_id) {
		this.e_id = e_id;
	}



	public String getE_name() {
		return e_name;
	}



	public void setE_name(String e_name) {
		this.e_name = e_name;
	}



	public String getSex() {
		return sex;
	}



	public void setSex(String sex) {
		this.sex = sex;
	}



	public String getAge() {
		return age;
	}



	public void setAge(String age) {
		this.age = age;
	}



	public String getEdu_background() {
		return edu_background;
	}



	public void setEdu_background(String edu_background) {
		this.edu_background = edu_background;
	}



	public String getSpeciality() {
		return speciality;
	}



	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}



	public String getForeign_language() {
		return foreign_language;
	}



	public void setForeign_language(String foreign_language) {
		this.foreign_language = foreign_language;
	}



	public String getGrad_time() {
		return grad_time;
	}



	public void setGrad_time(String grad_time) {
		this.grad_time = grad_time;
	}



	public String getMarriage() {
		return marriage;
	}



	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}



	public String getPost() {
		return post;
	}



	public void setPost(String post) {
		this.post = post;
	}



	public String getDepartment() {
		return department;
	}



	public void setDepartment(String department) {
		this.department = department;
	}



	public String getTechnical_title() {
		return technical_title;
	}



	public void setTechnical_title(String technical_title) {
		this.technical_title = technical_title;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}



	private String state;    
    

      
	public Employee(String e_id, String e_name, String sex, String age, String edu_background, String speciality, String foreign_language, String grad_time, String marriage, String post, String department, String technical_title, String state) {
          super();
          this.e_id = e_id; 
          this.e_name = e_name;
         this.sex = sex;
         this.age = age;
         this.edu_background = edu_background;
         this.speciality = speciality;
         this.foreign_language = foreign_language;
         this.grad_time = grad_time;
         this.marriage = marriage;
         this.post = post;
         this.department = department;
         this.technical_title = technical_title;
         this.state = state;
          
     }
}
