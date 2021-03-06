package com.schoolar.modules.dao;


import java.io.Serializable;
import java.util.List;

public interface BasicCrudDao<E, I extends Serializable> {
    void save(E e);
    void update(E e);
    E findById(I id);
    void delete(I id);
    List<E> getList();

}
