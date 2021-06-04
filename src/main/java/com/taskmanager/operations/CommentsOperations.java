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
    CommentsRepository repository;

    public Comment create(Comment comment) {
        return repository.create(comment);
    }

    public void remove(long id) {
        repository.delete(id);
    }

    public Comment findUser(long id) {
        return repository.find(id);
    }

    public List<Comment> getAllComments() throws SQLException {

       List<Comment> sort = repository.findAll();
        Collections.sort(sort, new Comparator<Comment>() {
            @Override
            public int compare(Comment o1, Comment o2) {
                return o1.getCreateData().compareTo(o2.getCreateData());
            }
        });
        return sort;
    }

}


