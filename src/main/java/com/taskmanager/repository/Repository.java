package com.taskmanager.repository;

public interface Repository<T> {
    T create(T t);
    T find(long id);
    T update(T t);
    void delete(T t);

}
