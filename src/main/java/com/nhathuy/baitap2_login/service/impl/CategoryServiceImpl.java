package com.nhathuy.baitap2_login.service.impl;

import com.nhathuy.baitap2_login.dao.CategoryDAO;
import com.nhathuy.baitap2_login.dao.impl.CategoryDAOImpl;
import com.nhathuy.baitap2_login.model.Category;
import com.nhathuy.baitap2_login.service.CategoryService;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    private final CategoryDAO categoryDAO;

    public CategoryServiceImpl() {
        this.categoryDAO = new CategoryDAOImpl();
    }

    public CategoryServiceImpl(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @Override
    public void insert(Category category) {
        categoryDAO.insert(category);
    }

    @Override
    public void edit(Category category) {
        Category current = categoryDAO.get(category.getId());
        if (current == null) return;
        current.setName(category.getName());
        if (category.getIcon() != null) {
            current.setIcon(category.getIcon());
        }
        categoryDAO.edit(current);
    }

    @Override
    public void delete(int id) {
        categoryDAO.delete(id);
    }

    @Override
    public Category get(int id) {
        return categoryDAO.get(id);
    }

    @Override
    public Category get(String name) {
        return categoryDAO.get(name);
    }

    @Override
    public List<Category> getAll() {
        return categoryDAO.getAll();
    }

    @Override
    public List<Category> search(String keyword) {
        return categoryDAO.search(keyword);
    }
}
