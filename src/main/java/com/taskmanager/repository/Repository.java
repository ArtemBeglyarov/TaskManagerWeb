package com.taskmanager.repository;

import java.sql.SQLException;
import java.util.List;

public interface Repository<T> {
     T create(T t) throws SQLException;
     T find(long id) throws SQLException;
     T update(T t) throws SQLException;
     void delete(long t) throws SQLException;

     List<T> findAll() throws SQLException;
 }
