package org.StudentTaskForFlexSolutions.dao;

import org.StudentTaskForFlexSolutions.model.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class StudentDAOImplementation implements StudentDAO
{
    private static final Logger logger = LoggerFactory.getLogger(StudentDAOImplementation.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addStudent(Student student)
    {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(student);
        logger.info("Student successfully saved. Student details: " + student);
    }

    @Override
    public void updateStudent(Student student)
    {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(student);
        logger.info("Student successfully update. Student details: " + student);
    }

    @Override
    public void removeStudent(int id)
    {
        Session session = this.sessionFactory.getCurrentSession();
        Student student = (Student) session.load(Student.class, new Integer(id));
        if(student!=null){ session.delete(student); }
        logger.info("Student successfully removed. Student details: " + student);
    }

    @Override
    public Student getStudentById(int id)
    {
        Session session =this.sessionFactory.getCurrentSession();
        Student student = (Student) session.load(Student.class, new Integer(id));
        logger.info("Student successfully loaded. Student details: " + student);
        return student;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Student> listStudents()
    {
        Session session = this.sessionFactory.getCurrentSession();
        List<Student> studentsList = session.createQuery("from Student").list();
        for(Student student: studentsList){
            logger.info("Student list: " + student);
        }
        return studentsList;
    }
}