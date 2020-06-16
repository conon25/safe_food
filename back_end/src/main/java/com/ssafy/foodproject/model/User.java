package com.ssafy.foodproject.model;

public class User {
    private String id;
    private String pw;
    private String name;
    private String email;
    private String allergy;
    private int flag;
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public User() {
        super();
    }
	public User(String id, String pw) {
	       this.id = id;
	        this.pw = pw;
	}
    public User(String id, String pw, String name, String email, String allergy, int flag) {
        super();
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.email = email;
        this.allergy = allergy;
        this.flag = flag;
    }
 
    @Override
    public String toString() {
        return "User [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", allergy=" + allergy + "]";
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPw() {
        return pw;
    }
    public void setPw(String pw) {
        this.pw = pw;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getAllergy() {
        return allergy;
    }
    public void setAllergy(String allergy) {
        this.allergy = allergy;
    }
}