package com.nhathuy.baitap2_login.model;

public class Category {
    private int id;
    private String name;
    private String icon;
    
    public Category() {
    }
    
    public Category(String name, String icon) {
        this.name = name;
        this.icon = icon;
    }
    
    public Category(int id, String name, String icon) {
        this.id = id;
        this.name = name;
        this.icon = icon;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getIcon() {
        return icon;
    }
    
    public void setIcon(String icon) {
        this.icon = icon;
    }
}
