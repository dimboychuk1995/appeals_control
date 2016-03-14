package oe.roma.appeals.domain;

/**
 * Created by us8610 on 15.05.14.
 */
public class Role {

    private Integer user_id;
    private String role_name;

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }
}
