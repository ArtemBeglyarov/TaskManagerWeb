package com.taskmanager.repository;

import com.taskmanager.entity.Comments;
import com.taskmanager.entity.User;

import javax.annotation.Resource;
import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@ApplicationScoped
public class CommentsRepository implements Repository<Comments>{

    @Resource(lookup = "java:/AppDS")
    DataSource dataSource;

    @PersistenceContext(unitName = "tm")
    EntityManager entityManager;
    private static final String findAllCommentsId = "SELECT id FROM comments";

    @Override
    public Comments create(Comments comments)  {
        entityManager.persist(comments);
        return comments;
    }

    @Override
    public Comments find(long id)  {
     Comments comments = entityManager.find(Comments.class, id);
        return comments;
    }

    @Override
    public Comments update(Comments comments)  {
        entityManager.merge(comments);
        return comments;
    }

    @Override
    public void delete(long id)  {
        Comments comments = entityManager.find(Comments.class, id);
        entityManager.remove(comments);
    }

    @Override
    public List<Comments> findAll() throws SQLException {
        List<Long> ids = getAllUsersIds();
        List<Comments> users = new ArrayList<>();
        for(Long id : ids){
            users.add(find(id));
        }
        return users;
    }

    public List<Long> getAllUsersIds() throws SQLException {
        List<Long> idAllComments= new ArrayList<>();
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(findAllCommentsId);

        while (resultSet.next()) {
            idAllComments.add(resultSet.getLong("id"));
        }
        return idAllComments;
    }
}
