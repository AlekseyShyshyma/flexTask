package org.StudentTaskForFlexSolutions.pagination;

import org.StudentTaskForFlexSolutions.model.Student;

import java.util.ArrayList;
import java.util.List;

public class PaginationEntity
{
    private List<Student> pageStudentList;

    boolean isDataBaseNotDownloaded = true;

    //maximal value students on page
    private int countOfStudens;

    public int getPagesCount() { return pagesCount; }

    public void setPagesCount(int pagesCount) { this.pagesCount = pagesCount; }

    private int pagesCount = 1;

    private int pageId = 1;

    public int getPageId() { return pageId; }

    public PaginationEntity(int countOfStudens) { this.countOfStudens = countOfStudens; }

    public PaginationEntity() { }

    public void setPageId(int pageId) { this.pageId = pageId; }

    public int getCountOfStudens() { return countOfStudens; }

    public void setCountOfStudens(int countOfStudens) { this.countOfStudens = countOfStudens; }

    public List<Student> getPageStudentList() { return pageStudentList; }

    public void setPageStudentList(List<Student> pageStudentList) { this.pageStudentList = pageStudentList; }

    public boolean isDataBaseNotDownloaded() { return isDataBaseNotDownloaded; }

    public void setDataBaseNotDownloaded(boolean dataBaseNotDownloaded) { isDataBaseNotDownloaded = dataBaseNotDownloaded; }

    public List<Student> getListOfStudentsbyPageId(int pageId, List<Student> studentDataBase)
    {
        pageStudentList = new ArrayList<Student>();
        this.setPageId(pageId);
        //update count of pages
        this.setPagesCount((studentDataBase.size() / this.getCountOfStudens()) + 1);
        //find start student on current page
        int pageLowBoundary = (pageId - 1) * this.getCountOfStudens();
        for(int i = pageLowBoundary; i < pageLowBoundary + this.getCountOfStudens(); i++)
        {
            //if studentDataBase contains less students then exit
            try { this.getPageStudentList().add(studentDataBase.get(i)); }
            catch (IndexOutOfBoundsException ex) { break; }
        }
        return pageStudentList;
    }

}
