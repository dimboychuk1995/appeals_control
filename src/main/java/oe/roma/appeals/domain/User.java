package oe.roma.appeals.domain;

/**
 * A simple POJO to represent our user domain  
 *
 */
public class User {

	private Integer id;
	private String login;
	private String password;
    private Integer enabled;
    private Role role = new Role();
    private String fullname;
    private Integer tab_num;
    private String email;
    private String job_position;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getJob_position() {
        return job_position;
    }

    public void setJob_position(String job_position) {
        this.job_position = job_position;
    }

    public Integer getEnabled() {
        return enabled;
    }

    public void setEnabled(Integer enabled) {
        this.enabled = enabled;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Integer getTab_num() {
        return tab_num;
    }

    public void setTab_num(Integer tab_num) {
        this.tab_num = tab_num;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "id = " + id +
                "login = " + login +
                "password = " + password +
                "enabled = " + enabled +
                "role = " + role +
                "fullname = " + fullname +
                "tab_num = " + tab_num +
                "email = " + email +
                "job_position" + job_position +
                "}";
    }

    public User(){};

}


