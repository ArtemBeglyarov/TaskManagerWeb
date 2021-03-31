package com.taskmanager;

import javax.naming.InitialContext;
import javax.naming.NamingException;

public class BeansStore {
    public static Object getBean(Class clazz) {
        try {
            InitialContext initialContext = new InitialContext();
            System.out.println(initialContext.getEnvironment());
            return initialContext.lookup("java:comp/" + clazz.getSimpleName());

        } catch (NamingException e) {
            throw new RuntimeException(e);
        }

    }
}
