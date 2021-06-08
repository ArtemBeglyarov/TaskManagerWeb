package com.taskmanager.operations;

;
import com.taskmanager.entity.Comment;
import com.taskmanager.repository.CommentsRepository;
import javax.ejb.Stateless;
import javax.inject.Inject;
import java.sql.SQLException;
import java.util.*;

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

    public List<Comment> getSortComment(Set<Comment> comments) throws SQLException {
       List<Comment> sort = new ArrayList<>(comments);
        Collections.sort(sort, new Comparator<Comment>() {
            @Override
            public int compare(Comment o1, Comment o2) {
                return o1.getCreateData().compareTo(o2.getCreateData());
            }
        });
        return sort;
    }

}


