package org.StudentTaskForFlexSolutions.service;

import org.StudentTaskForFlexSolutions.dao.StudentDAO;
import org.StudentTaskForFlexSolutions.model.Student;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StudentServiceImplementation implements StudentService
{
    private StudentDAO studentDao;

    public void setStudentDao(StudentDAO StudentDao) { this.studentDao = StudentDao; }

    @Override
    @Transactional
    public void addStudent(Student student) { this.studentDao.addStudent(student); }

    @Override
    @Transactional
    public void updateStudent(Student student) { this.studentDao.updateStudent(student); }

    @Override
    @Transactional
    public void removeStudent(int id) {
        this.studentDao.removeStudent(id);
    }

    @Override
    @Transactional
    public Student getStudentById(int id) {
        return this.studentDao.getStudentById(id);
    }

    @Override
    @Transactional
    public List<Student> listStudents() {
        return this.studentDao.listStudents();
    }
}