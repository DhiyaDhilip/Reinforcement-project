Create Table Pets(
PetId serial Not Null Primary key,
Pet_name varchar(150),
Pet_type varchar(150),
capacity bigint
);

Insert into pets(Pet_name,pet_type,capacity)
values ('dog','animal',20),
('monkey','wild',50),
('love_birds','birds',45),
('parrot','birds',58),
('cat','animal',67)

Create table Cages(
CageId serial not null primary key,
Cage_type varchar(150),
Price bigint,
Quantity bigint
);

Insert into Cages(Cage_type,Price,Quantity)
values ('net',600,50),
('Floor',1050,100),
('Outdoor',2500,50),
('Hanging',500,150),
('Breeder',2900,60)

Create table Orderplace(
OrderId Serial not null primary key,
PersonId bigint,
PetId Bigint References Pets(PetId),
CageId Bigint References Cages(CageId)
);

Insert Into Orderplace(PersonId,PetId,CageId)
values (25,3,2),
(45,5,2),
(55,4,3),
(65,3,2),
(85,1,4)