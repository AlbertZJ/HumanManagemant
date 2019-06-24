package human;
 
public class Post {
	/**
　　　　*下面这四个属性为数据库表中的四个属性
　　　　*/
	 
    private String post;
    private String id;
    
   	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public Post( String id,String post) {
          super();
          this.id = id;
         this.post = post;
       
          
     }
}
