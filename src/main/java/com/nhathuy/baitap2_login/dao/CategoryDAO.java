package com.nhathuy.baitap2_login.dao;

import com.nhathuy.baitap2_login.model.Category;
import java.util.List;

public interface CategoryDAO {
    void insert(Category category);
    void edit(Category category);
    void delete(int id);
    Category get(int id);
    Category get(String name);
    List<Category> getAll();
    List<Category> search(String keyword);
}
