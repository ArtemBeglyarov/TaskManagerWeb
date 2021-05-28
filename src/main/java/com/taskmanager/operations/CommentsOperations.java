package com.taskmanager.operations;

import com.taskmanager.entity.Comments;
import com.taskmanager.repository.CommentsRepository;

import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.List;

@Stateless
public class CommentsOperations {



    @Inject
    CommentsRepository cr;

    public Comments create(Comments comments) {
        return cr.create(comments);
    }

    public void remove(long id) {
        cr.delete(id);
    }

    public Comments findUser(long id) {
        return cr.find(id);
    }

//    public void updateUser(Comments user) {
//        cr.update(user);
//    }
//
    public List<Comments> getAllComments() throws SQLException {

      return cr.findAll();
    }
}


