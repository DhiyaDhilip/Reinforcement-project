Create Table Users(
UserId serial Not Null Primary key,
Username Varchar(250),
Email Varchar(250),
Address Varchar(250),
Phone_number varchar(250),
UserBio Varchar(250)
);

Insert into Users(Username,Email,Address,Phone_number,UserBio) 
Values ('Dhiya','sandhiyam082001@gmail.com','23A,Kavindapadi,Gobi','8838746872','Fresher,find a job'),
('Dhilip','dhilipkannan143@gmail.com','26t,Palayam,erode','9965658939','Manager,good professional'),
('Banu','banusundari098@gmail.com','5t,suryapalayam,Gobi','5789075632','Hiring Officer,Stirct and Sencer'),
('Santhosh','santhoshkumarkannan@gmail.com','34,P.Vellalapalayam,Gobi','8975382762','System analyst'),
('Vishnu','varthinikutti123@gmail.com','3/45,rangampalayam,Erode','9845673298','IT coordinator');



Create Table Education(
EduId serial Not Null Primary key,
Userdegree varchar(250),
Passedout_Year bigint,
Percentage bigint,
UserId bigint  References Users(UserId),
Institute_Name Varchar(250) References Institute(Institute_Name) 
);

Insert into Education(Userdegree,Passedout_Year,Percentage,UserId,Institute_Name)
Values ('Bsc_Maths',2022,2.5,1,'Harvard Univ.'),
('Msc_Maths',2024,1.9,1,'Bharathiyar Univ.'),
('Computer_Science',2012,2.92,2,'Harvard Univ.'),
('IT',2015,4.0,2,'Ohio State Univ.'),
('Computer_Eng',2014,3.9,3,'Harvard Univ.'),
('Software_developer',2017,3.7,3,'Bharathiyar Univ.'),
('Business_Analaysis',2019,4.9,4,'Ohio State Univ.'),
('Business_Management',2023,2.9,4,'Bharathiyar Univ.'),
('B.com',2020,1.4,5,'Harvard Univ.'),
('MBA',2024,1.5,5,'Ohio State Univ.');

Create Table Institute(
InstituteId serial Not Null,
Institute_Name Varchar(250) Primary key
);


Insert into Institute(Institute_Name)
Values ('Harvard Univ.'),
('Bharathiyar Univ.'),
('Ohio State Univ.');

Create Table Branch(
BranchId serial Not Null Primary key,
Branch_Name Varchar(250),
Area Varchar(250)
);

Insert into Branch(Branch_Name,Area)
Values ('Kgisl','Coimbatore'),
('Tittle_Park','Bangalore'),
('Fita','Chennai');

Create Table Company(
CompanyId serial Not Null Primary key,
Company_Name Varchar(250),
BranchId bigint References Branch(BranchId)
);

Insert into Company(Company_Name,BranchId)
Values ('iTech software Group',1),
('Cap Digisoft Solutions Pvt.Ltd',2),
('Techcent IT Solution',3);

Create Table Cab(
CabId bigint Not Null Primary key,
Cab_Name Varchar(250)
);

Insert into Cab(CabId,Cab_Name)
Values (101,'Callme_Taxi'),
(102,'Oneway_Call_Taxi'),
(103,'ARM_Cabs'),
(104,'VWay_Taxi'),
(105,'Snap_Way');

Create Table Works(
Work_Id Bigint Not Null Primary key,
Tittle Varchar(250),
Salary bigint,
Start_Date date,
End_Date date,
UserId bigint References Users(UserId),
CompanyId bigint References Company(CompanyId),
CabId bigint References Cab(CabId)
);

table Works

Insert into Works
Values (111,'IT Manager',20000,'2012-04-22','2022-05-15',1,1,101),
(222,'Software Engeinee',25000,'2015-03-12','2022-09-22',2,2,102),
(333,'Network Administrator',23000,'2013-05-24','2023-05-16',3,3,103),
(444,'System Administrator',25000,'2014-06-17','2023-09-18',4,2,104),
(555,'Web Developer',40000,'2015-06-25','2023-05-18',5,3,105),
(666,'System Analyst',28000,'2010-05-14','2012-03-15',2,1,103),
(777,'IT supporter',23000,'2019-06-28','2015-03-22',4,3,102);

Select Users.Username,Works.Tittle,Works.Salary
From Users
Inner Join Works ON Users.UserId=Works.UserId;

Select Users.Username,Branch.Branch_Name,Branch.Area,Company.Company_name,Works.Tittle,Works.Salary
From Users
Inner Join Works ON Users.UserId=Works.UserId
Inner Join Company ON Works.CompanyId=Company.CompanyId
Inner Join Branch ON Company.BranchId=Branch.BranchId;

Select Userdegree,Passedout_Year, Institute_Name
From Education
Where Institute_Name IN (Select Institute_Name From Institute Where Institute_Name In ('Harvard Univ.') )

Select Userdegree,Passedout_Year, Institute_Name
From Education
Where Institute_Name Not In (Select Institute_Name From Institute Where Institute_Name In ('Harvard Univ.') )

Select Userdegree,Passedout_Year, Institute_Name
From Education
Where Institute_Name = (Select Institute_Name From Institute Where Institute_Name In ('Harvard Univ.') )

Select Userdegree,Passedout_Year
From Education
Where Passedout_Year =(Select Max(Passedout_Year) From Education )

Select Userdegree,Passedout_Year
From Education
Where Passedout_Year >(Select Max(Passedout_Year) From Education )

Select Userdegree,Passedout_Year
From Education
Where Passedout_Year <(Select Max(Passedout_Year) From Education )





