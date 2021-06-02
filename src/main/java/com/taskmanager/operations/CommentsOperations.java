package com.taskmanager.operations;

;
import com.taskmanager.entity.Comment;
import com.taskmanager.repository.CommentsRepository;
import javax.ejb.Stateless;
import javax.inject.Inject;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Stateless
public class CommentsOperations {



    @Inject
    CommentsRepository cr;

    public Comment create(Comment comment) {
        return cr.create(comment);
    }

    public void remove(long id) {
        cr.delete(id);
    }

    public Comment findUser(long id) {
        return cr.find(id);
    }

    public List<Comment> getAllComments() throws SQLException {

       List<Comment> sort = cr.findAll();
        Collections.sort(sort, new Comparator<Comment>() {
            @Override
            public int compare(Comment o1, Comment o2) {
                return o1.getCreateData().compareTo(o2.getCreateData());
            }
        });
        return sort;
    }

}


