package org.StudentTaskForFlexSolutions.incorrectDataInput;

import org.StudentTaskForFlexSolutions.model.Student;

import java.text.SimpleDateFormat;
import java.util.Date;

public class IncorrectDataHandler
{
    public boolean isAgeNormal(Student student) { if((student.getAge() > 0) &&(student.getAge() < 110)) return true; return false;}

    public boolean isNameCorrect(Student student) { return isStringContainsOnlyLetters(student.getName()); }

    public boolean isSurnameCorrect(Student student) { return isStringContainsOnlyLetters(student.getSurname()); }

    public boolean isDateOfBirthCorrect(Student student)
    {
        try
        {
            String sDate1 = student.getDateOfBirth();
            Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(sDate1);
        }
        catch (Exception e) { return false;}
        return true;
    }

    public boolean isStudentDataCorrect(Student student)
    {
        if(isAgeNormal(student) && isDateOfBirthCorrect(student) && isNameCorrect(student) && isSurnameCorrect(student) && isDateOfBirthCorrect(student)) {return true;}
        return false;
    }

    private boolean isStringContainsOnlyLetters(String string)
    {
        StringValidation obj = new StringValidation();
        boolean bool = obj.validateString(string);
        if(!bool) { return false; }
        return true;
    }
}

class StringValidation
{
    //checks if argument has only letters
    public boolean validateString(String str)
    {
        str = str.toLowerCase();
        char[] charArray = str.toCharArray();
        for (int i = 0; i < charArray.length; i++)
        {
            char ch = charArray[i];
            if (!(ch >= 'a' && ch <= 'z')) { return false; }
        }
        return true;
    }
}
