package com.taskmanager.repository;

import com.taskmanager.entity.Comment;

import javax.annotation.Resource;
import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@ApplicationScoped
public class CommentsRepository implements Repository<Comment>{

    @Resource(lookup = "java:/AppDS")
    DataSource dataSource;

    @PersistenceContext(unitName = "tm")
    EntityManager entityManager;
    private static final String findAllCommentsId = "SELECT id FROM comments";

    @Override
    public Comment create(Comment comment)  {
        entityManager.persist(comment);
        return comment;
    }

    @Override
    public Comment find(long id)  {
     Comment comment = entityManager.find(Comment.class, id);
        return comment;
    }

    @Override
    public Comment update(Comment comment)  {
        entityManager.merge(comment);
        return comment;
    }

    @Override
    public void delete(long id)  {
        Comment comment = entityManager.find(Comment.class, id);
        entityManager.remove(comment);
    }

    @Override
    public List<Comment> findAll() throws SQLException {
        List<Long> ids = getAllUsersIds();
        List<Comment> users = new ArrayList<>();
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
