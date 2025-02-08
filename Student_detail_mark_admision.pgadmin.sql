Create Table Student_details(
StudentId Serial Not Null Primary Key,
Student_name varchar(50),
Age bigint,
City varchar(50),
Phone_number Varchar(50),
EmailId varchar(50)
);

Insert Into Student_details(Student_name,Age,City,Phone_number,EmailId)
Values 
('Dhiya',23,'Erode','8838746872','dhiya2001@gmail.com'),
('Dhilip',24,'Erode','9965658939','dhilip2000@gmail.com'),
('Santhosh',21,'Gobi','2347893478','santhosh45@gmail.com'),
('Mohan',22,'Kavundapadi','6383931009','mohan2001@gmail.com'),
('Dharani',24,'Gobi','5678432098','dharanikutti@gmail.com'),
('Saranya',25,'Sakthi','4578746856','saranmami@gmail.com'),
('Sneha',24,'Gobi','8838567843','snehamohan@gmail.com'),
('Mohan',27,'Gobi','9967534767','mohansneha@gmail.com'),
('Swetha',28,'Sakthi','8967746872','swethabby@gmail.com'),
('Elamathi',21,'Nambiur','9988746872','mathidharan@gmail.com'),
('Dharanidharan',23,'Vetrangoil','5838778564','dhranimathi@gmail.com'),
('Agni',25,'Coimbathor','7860850675','agnipapa@gmail.com'),
('Kasthuri',25,'Anthiur','6678746872','kachudear@gmail.com'),
('Sandhiya',22,'Kadambur','9938744562','sandyclm@gmail.com'),
('Honey',27,'Kunnathour','9945746872','Dheanhoney@gmail.com'),
('Mouni',27,'Suriyampalayam','9090876549','mouni8978@gmail.com'),
('Vishnu',20,'Erode','8856780943','vishnuvarthini@gmail.com'),
('Manju',28,'Sembur','8898763872','manjula@gmail.com'),
('Riththu',20,'Chennai','7799856434','riththuvasanthi@gmail.com'),
('Vinitha',23,'Bhavani','9900873254','vinicute@gmail.com')

Create Table Student_mark_details(
Rollno serial Not Null Primary Key,
StudentId Bigint References Student_details(StudentId),
Tenth_mark bigint,
Tweleth_mark bigint,
Performance varchar(50),
Grade varchar(10)
);

Insert Into Student_mark_details(StudentId,Tenth_mark,Tweleth_mark,Performance,Grade)
Values 
(1,478,488,'Outstanding','A'),
(2,498,489,'outstanding','A'),
(3,399,412,'Good','B'),
(4,422,448,'Good','B'),
(5,355,413,'Not_bad','C'),
(6,312,319,'Bad','D'),
(7,456,319,'Bad','D'),
(8,445,478,'Outstanding','A'),
(9,212,378,'Bad','D'),
(10,467,499,'Outstanding','A'),
(11,399,401,'Not_bad','C'),
(12,433,420,'Good','B'),
(13,421,455,'Good','B'),
(14,443,478,'Good','B'),
(15,433,411,'Not_bad','C'),
(16,405,444,'Good','B'),
(17,497,488,'Outstanding','A'),
(18,476,458,'Good','B'),
(19,456,467,'Good','B'),
(20,433,396,'Not_bad','c')

Create Table Admission_Clg(
AdmissionId Serial Not Null Primary Key,
StudentId Bigint References Student_details,
Rollno Bigint References Student_mark_details,
Corse varchar(50),
Resulting varchar(10)
);

Insert Into Admission_Clg(StudentId,Rollno,Corse,Resulting)
Values 
(1,1,'Maths','Yes'),
(2,2,'IT','Yes'),
(3,3,'Maths','Yes'),
(4,4,'Botny','Yes'),
(5,5,'Science','Waiting'),
(6,6,'Chemistry','No'),
(7,7,'Maths','No'),
(8,8,'IT','Yes'),
(9,9,'Biograpy','No'),
(10,10,'Business','Yes'),
(11,11,'Law','Waiting'),
(12,12,'Ecnomic','Yes'),
(13,13,'medicine','Yes'),
(14,14,'MA','Yes'),
(15,15,'Art','Waiting'),
(16,16,'BTech','Yes'),
(17,17,'Science','Yes'),
(18,18,'Maths','Yes'),
(19,19,'Business','Yes'),
(20,20,'Law','Waiting')