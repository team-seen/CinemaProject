package Beans;

public class UserBeans {

    private String username;
    private String fname;
    private String lname;
    private int age;
    private String email;
    private int phone_number;
    private String password;

    public UserBeans(String username, String password, String fname, String lname, int age, String email, int phone_number) {
        this.username = username;
        this.fname = fname;
        this.lname = lname;
        this.age = age;
        this.email = email;
        this.phone_number = phone_number;
        this.password = password;
    }



    public UserBeans() {
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }



    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(int phone_number) {
        this.phone_number = phone_number;
    }

}
