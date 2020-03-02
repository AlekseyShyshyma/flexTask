package org.StudentTaskForFlexSolutions.controller;

import org.StudentTaskForFlexSolutions.incorrectDataInput.IncorrectDataHandler;
import org.StudentTaskForFlexSolutions.model.Student;
import org.StudentTaskForFlexSolutions.pagination.PaginationEntity;
import org.StudentTaskForFlexSolutions.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class StudentController
{
    private StudentService studentService;
    //paggination represents methods, which make possible to divide full databaselist into pages
    PaginationEntity paggination = new PaginationEntity(7);

    @Autowired(required = true)
    @Qualifier(value = "studentService")
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    @RequestMapping(value = "students/{page}", method = RequestMethod.GET)
    public String listStudents(Model model, @PathVariable("page") int page)
    {
        //if users input to the url number of leaf, which is not in boundary, we redirect him to 1 page
        if(paggination.getPagesCount() < page || page <= 0) { return "redirect:/studentspage/1"; }
        model.addAttribute("student", new Student());
        model.addAttribute("listStudents", studentService.listStudents());
        model.addAttribute("stud", paggination.getPageStudentList());
        if(paggination.isDataBaseNotDownloaded()){ paggination.setDataBaseNotDownloaded(false); return "redirect:/studentspage/1";}
        model.addAttribute("paggination", paggination);
        return "students";
    }


    @RequestMapping(value = "/students/add", method = RequestMethod.POST)
    public String addStudent(@ModelAttribute("student") Student student)
    {
        if(new IncorrectDataHandler().isStudentDataCorrect(student))
        {
            if (student.getId() == 0) { this.studentService.addStudent(student); }
            else { this.studentService.updateStudent(student); }
            return "redirect:/studentspage/" + paggination.getPagesCount();
        }
        //if student data incorrect, we redirect into first page
        return "redirect:/";
    }


    @RequestMapping("/remove/{id}/{page}")
    public String removeStudent(@PathVariable("id") int id, @PathVariable("page") int page)
    {
        /*get id, find student by id and then delete it by method which implements
        StudentService object
         */
        this.studentService.removeStudent(id);
        return "redirect:/studentspage/{page}";
    }



    @RequestMapping(value = "edit/{id}/save/{page}", method = RequestMethod.POST)
    public String save(@PathVariable("id") int id, @PathVariable("page") int page, @ModelAttribute("student") Student student)
    {
        if(new IncorrectDataHandler().isStudentDataCorrect(student))
        {
            this.studentService.updateStudent(student);
            return "redirect:/studentspage/{page}";
        }
        //if student-edit data incorrect, we redirect into first page
        return "redirect:/studentspage/{page}";
    }



    @RequestMapping(value = "edit/{id}/{page}", method = RequestMethod.GET)
    public String editStudent(@PathVariable("id") int id, Model model, @PathVariable("page") int page)
    {
        model.addAttribute("student", this.studentService.getStudentById(id));
        model.addAttribute("listStudents", this.studentService.listStudents());
        Student student = studentService.getStudentById(id);
        model.addAttribute("command", student);
        model.addAttribute("pageId", new Integer(page));
        return "editModalWindow";
    }


    @RequestMapping(value = "/studentspage/{page}", method = RequestMethod.GET)
    public String list(@PathVariable("page") int page, Model model)
    {
        //if users input to the url number of page, which is not in boundary, we redirect him to 1 page
        if (paggination.getPagesCount() < page || page <= 0)
        {
            List<Student> studentListOnPage = paggination.getListOfStudentsbyPageId(1, studentService.listStudents());
            model.addAttribute("student", new Student());
            model.addAttribute("listStudents", studentListOnPage);
            return "redirect:/students/1";
        }
        List<Student> studentListOnPage = paggination.getListOfStudentsbyPageId(page, studentService.listStudents());
        model.addAttribute("student", new Student());
        model.addAttribute("listStudents", studentListOnPage);
        return "redirect:/students/{page}";
    }

}
