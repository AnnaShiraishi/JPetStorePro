package org.csu.jpetstore.persistence;

import org.csu.jpetstore.domain.Category;

import java.util.List;

public interface CategoryDAO {

    List<Category> getCategoryList();

    Category getCategory(String categoryId);
}
