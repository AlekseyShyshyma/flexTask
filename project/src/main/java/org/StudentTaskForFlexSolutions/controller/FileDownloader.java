package org.StudentTaskForFlexSolutions.controller;
import org.StudentTaskForFlexSolutions.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;

@Controller
public class FileDownloader
{
    private StudentService studentService;

    @Autowired(required = true)
    @Qualifier(value = "studentService")
    public void setBookService(StudentService studentService) {
        this.studentService = studentService;
    }
    @RequestMapping(value = "/downloadXLS")
    public void downloadXLS(HttpServletResponse response) {

        try {
            response.setContentType("application/vnd.ms-excel");
            String reportName = "StudentsList.xls";
            response.setHeader("Content-disposition", "attachment; filename=" + reportName);
            ArrayList<String> rows = new ArrayList<String>();
            rows.add("Name");
            rows.add("\t");
            rows.add("Surname");
            rows.add("\t");
            rows.add("Age");
            rows.add("\t");
            rows.add("Date of birth");
            rows.add("\t");
            rows.add("Department");
            rows.add("\n");

            for (int i = 0; i < studentService.listStudents().size(); i++) {
                rows.add(studentService.listStudents().get(i).getName());
                rows.add("\t");
                rows.add(studentService.listStudents().get(i).getSurname());
                rows.add("\t");
                rows.add(new Integer(studentService.listStudents().get(i).getAge()).toString());
                rows.add("\t");
                rows.add(studentService.listStudents().get(i).getDateOfBirth());
                rows.add("\t");
                rows.add(studentService.listStudents().get(i).getFaculty());
                rows.add("\n");
            }
            Iterator<String> iter = rows.iterator();
            while (iter.hasNext())
            {
                String outputString = (String) iter.next();
                response.getOutputStream().print(outputString);
            }

            response.getOutputStream().flush();

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
