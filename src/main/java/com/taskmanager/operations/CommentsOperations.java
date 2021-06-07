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
import java.util.Set;

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

//    public Set<Comment> getAllComments(Set<Comment> comments) throws SQLException {
//
//       Set<Comment> sort =
//        Collections.sort(sort, new Comparator<Comment>() {
//            @Override
//            public int compare(Comment o1, Comment o2) {
//                return o1.getCreateData().compareTo(o2.getCreateData());
//            }
//        });
//        return sort;
//    }

}


