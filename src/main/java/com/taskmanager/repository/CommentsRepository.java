package com.taskmanager.repository;

import com.taskmanager.entity.Comments;
import com.taskmanager.entity.User;

import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import java.util.List;

@ApplicationScoped
public class CommentsRepository implements Repository<Comments>{

    @PersistenceContext(unitName = "tm")
    EntityManager entityManager;

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
    public List<Comments> findAll() {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Comments> cq = cb.createQuery(Comments.class);
        Root<Comments> commentRoot = cq.from(Comments.class);
        CriteriaQuery<Comments> all = cq.select(commentRoot).where();
        TypedQuery<Comments> allQuery = entityManager.createQuery(all);
        return allQuery.getResultList();
    }
}
