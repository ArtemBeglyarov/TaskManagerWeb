package com.taskmanager.operations;

;
import com.taskmanager.entity.Comments;
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

    public Comments create(Comments comments) {
        return cr.create(comments);
    }

    public void remove(long id) {
        cr.delete(id);
    }

    public Comments findUser(long id) {
        return cr.find(id);
    }

    public List<Comments> getAllComments() throws SQLException {

       List<Comments> sort = cr.findAll();
        Collections.sort(sort, new Comparator<Comments>() {
            @Override
            public int compare(Comments o1, Comments o2) {
                return o1.getCreateData().compareTo(o2.getCreateData());
            }
        });
        return sort;
    }

}


