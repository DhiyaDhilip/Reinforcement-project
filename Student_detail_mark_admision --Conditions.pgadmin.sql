--select * from student_details
--Order by studentId ASC
--select * from student_mark_details
--Order by Rollno ASC
--select * from admission_clg
--Order by AdmissionId ASC

--// Where Classes
--Select Student_name as Name,age,city as place From Student_details
--Where Age>22 order by Age desc
--Where Age>22 order by Age
--Where Age=23
--Where city='Erode'
--Where corse in ('Maths','IT')
--Where grade='A' and tweleth_mark>450
--Where Grade='B' or tenth_mark<425
--Where Age>22
--Where tenth_mark<300
--Where not Age=23
--Where Age between 24 and 26
--Where Student_name like 'D%'
--Where Student_name like '%S'
--Where Student_name like 'D____'
--where Student_name not like '%s'
--where Age>25 and Student_name not like '%s'
--where Age>25 or Student_name not like '%s'

--//Update
--Update student_mark_details set performance='Not_bad' where studentid=7;
--update student_details set student_name='sara' where studentId=6;

--//Delete
--delete from Admission_clg where corse='Science' or resulting='Waiting';
--delete from admission_clg where corse='Chemistry';

--//Inner Join
--select * from student_details inner join student_mark_details on student_details.studentId=Student_mark_details.studentId;
--select Student_name,emailid,Grade from student_details inner join student_mark_details on student_details.studentId=Student_mark_details.studentId;

--//Left Join
--select * from student_mark_details left join admission_clg on student_mark_details.rollno=admission_clg.rollno;
--select grade,corse from student_mark_details left join admission_clg on student_mark_details.rollno=admission_clg.rollno;

--//Right Join
--Select * from student_mark_details right join admission_clg on student_mark_details.rollno=admission_clg.rollno;
--Select Tenth_mark,Tweleth_mark,Grade,Corse,resulting from student_mark_details right join admission_clg on student_mark_details.rollno=admission_clg.rollno;

--//Full Outer Join
--select * from student_mark_details full outer join Student_details on student_mark_details.StudentId=Student_details.studentId;
--select performance,Student_name,Age,emailid from student_mark_details full outer join Student_details on student_mark_details.StudentId=Student_details.studentId;
