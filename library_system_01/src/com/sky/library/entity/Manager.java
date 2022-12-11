package com.sky.library.entity;

public class Manager {
    private String manager_name;
    private String manager_password;


    @Override
    public String toString() {
        return "Manager{" +
                "manager_name='" + manager_name + '\'' +
                ", manager_password='" + manager_password + '\'' +
                '}';
    }

    public String getManager_name() {
        return manager_name;
    }

    public void setManager_name(String manager_name) {
        this.manager_name = manager_name;
    }

    public String getManager_password() {
        return manager_password;
    }

    public void setManager_password(String manager_password) {
        this.manager_password = manager_password;
    }

    public Manager() {
    }

    public Manager(String manager_name, String manager_password) {
        this.manager_name = manager_name;
        this.manager_password = manager_password;
    }
}
