-- Online SQL Editor to Run SQL Online.
-- Use the editor to create new tables, insert data and all other SQL operations.
  
drop table if exists Branches;
create table Branches ( BranchName varchar(255) not null primary key, location varchar(255) not null);
INSERT INTO `Branches`(`BranchName`,`location`) VALUES ('Miami Branch', 'Miami');

drop table if exists Positions;
create table Positions ( 
    BranchID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Branch_Name varchar(255) not null, 
    Position varchar(255) not null,
    constraint FK_BN FOREIGN KEY (Branch_Name) REFERENCES Branches(BranchName)
    );

--ALTER TABLE `Positions`
 -- Modify `BranchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


INSERT INTO `Positions`(`Branch_Name`, `Position`) VALUES ('Miami Branch', 'Cooks');

drop table if exists Postings;


create table Postings (
    Ref_Nbr int not null primary key , 
    Branch_Name varchar(255) not null,
    FOREIGN KEY (Branch_Name) REFERENCES Branches(BranchName), 
    Position varchar(255) not null, 
  
INSERT INTO `Postings`(`Ref_Nbr`, `Branch_Name`,`Position`) VALUES ( 1,'Miami Branch','Waiter' );

drop table if exists Offers;
create table Offers ( 
    RefNbr int, 
    FOREIGN KEY (RefNbr) REFERENCES Posting(Ref_Nbr),
    Position varchar(255) not null,
    applicantname varchar(255) not null, 
    status varchar(32) not null
    ) ;
INSERT INTO `Offers` (`RefNbr`, `Position`,`applicantname`,`status`) VALUES (1, 'Waiter', 'Catherine Philip', 'Pending' );



drop table if exists Applicant;
create table Applicant(
    email varchar(255) not null PRIMARY KEY,
     RefNbr int, 
    FOREIGN KEY (RefNbr) REFERENCES Postings(Ref_Nbr), 
    applicantname varchar(32)not null, 
    password varchar(255) not null);

INSERT INTO `Applicant`(`email`,`RefNbr`, `applicantname`, `password`) VALUES  ('john@gmail.com', 1,'john Paul','john1234');

drop table if exists Applicants;
create table Applicants (
    applicantID INT PRIMARY KEY,
    e_mail varchar(255) not null,
    FOREIGN KEY (e_mail) REFERENCES applicant(email),
    initials varchar (255) not null, 
    FirstName varchar(255) not null, 
    MiddleName varchar(255) not null, 
    Lastname varchar(255) not null, 
    othername varchar(255), 
    aptnumber int not null, 
    city varchar(255) not null,
    state varchar(255) not null,
    zipcode int not null,
    TelephoneNbr int not null, 
    bestcalltime varchar(20) not null,

    dob varchar(255) not null,
    date_today timestamp NULL DEFAULT current_timestamp()
    );


INSERT INTO `Applicants`(`applicantID`,`e_mail`,`first_name`,`middle_name`, `last_name`,`homeaddress`, `aptnumber`,`city`,`state`, drop table if exists applicantposition;
`zip`,`telephone`,`bestcalltime` ,`DOB`)
VALUES (1,'john@gmail.com','Mr.',  'John', 'Martin', 'paul','20002 Miami', 213, 'Miami', 'Home Area', 800043 , 08262435,'Afternoon','12/12/1995');

create table RoleDesired (
    id int,
    FOREIGN KEY (id) REFERENCES Applicants(applicantID),
    positionApplying varchar (255) not null,
    startdate DATE not null,
    desiredPay float not null, 
    advertSource varchar(255),
    workLocation varchar(255) not null,
    daysAvailable int not null
) ;

ALTER TABLE RoleDesired 
ADD PRIMARY KEY (id),
ADD column HR_ID INT NOT NULL,
ADD column Manager_ID INT NOT NULL,
ADD constraint HR_ID_fk FOREIGN KEY (HR_ID) REFERENCES HR(HR_ID),
ADD constraint Manager_ID_fk FOREIGN KEY (Manager_ID) REFERENCES Manager(Manager_ID);

ALTER TABLE RoleDesired 
ADD column App_Status VARCHAR(255);

INSERT INTO `RoleDesired`( `ID`, `positionApplying`, `startdate`, `desiredPay`, `advertSource`,`worklocation`, `daysAvailable`)
VALUES( 1,'Waiter','2022-09-09',200,'Television', 'Miami', 6  );

select * from RoleDesired;
drop table if exists generalInformation;
create table generalInformation (
    ID int,
    FOREIGN KEY (ID) REFERENCES Applicants(applicantID),
    over18 varchar(32) not null,
    proofOfEligibility varchar(32) not null,
    convicted varchar(255) not null,
    convictionExplanation varchar(255), 
    validdrivinglicense varchar (255) not null,
    licenseNumber int,
    professionalDesignations varchar(255),
    foreignLanguages varchar(255),
    readFluency varchar(255) not null,
    workingForMihotel varchar(32) not null,
    pastworker varchar (32) not null,
    pastworkdate varchar(32)
    ) ;
INSERT INTO `generalInformation`( `ID`, `over18`, `proofOfEligibility`, `convicted`,
    `validdrivinglicense`,`professionalDesignations`, `foreignLanguages`,`readFluency`,`workingForMihotel`, `pastworker`, `pastworkdate`)
VALUES( 1,'YES','YES','NO', 'NO','Catering certificate','french', 'Native english speaker','No', 'Yes' , '11//11/2019');

drop table if exists Highschool;
create table Highschool (
    ID int,
    FOREIGN KEY (ID) REFERENCES Applicants(applicantID),
    highschoolname varchar (255) not null,
    years_completed int not null,
    graduated varchar(32) not null,
    subjectsstudied varchar (255) not null
    ) ;
INSERT INTO `Highschool`(`ID`,`highschoolname`, `yearscompleted`, `graduated`,`subjectsstudied` ) 
VALUES (1, 'Michigan High School',4, 'YES', 'Biology, Mathematics, MEchanics');
    

drop table if exists JuniorCollege;
create table JuniorCollege (
    ID int,
    FOREIGN KEY (ID) REFERENCES Applicants(applicantID),
    collegename varchar(255) not null,
    yearscompleted int not null,
    graduated varchar(32) not null,
    degree varchar (255) not null
    );
INSERT INTO `JuniorCollege`(`id`, `collegename`, `yearscompleted`, `graduated`, `degree`)
VALUES (1,'Michigan STate college', 3, 'YES','Diploma in Hospitality')    ;


drop table if exists College;
create table College (
    ID int,
    FOREIGN KEY (ID) REFERENCES Applicants(applicantID),
    collegename varchar(255) not null,
    yearscompleted int not null,
    graduated varchar(32) not null,
    degree varchar (255) not null
    ) ;
INSERT INTO `College`(`ID`,`collegename`, `yearscompleted`, `graduated`,`degree`)
VALUES (1, 'Washington Community College', 3,'YES', 'Bachelors Degree in Hospitality and Hotel MAnagement');
    
 drop table if exists postgrad;
create table postgrad (
    ID int,
    FOREIGN KEY (ID) REFERENCES Applicants(applicantID),
    collegename varchar(255) not null,
     yearscompleted int not null,
    graduated varchar(32) not null,
    degree varchar (255) not null
    ) ;
INSERT INTO `postgrad`(`ID`, `collegename`, `yearscompleted`, `graduated`, `degree`)
VALUES (1, 'Washington State University', 4, 'YES', 'Masters Degree in Hotel Management');

drop table if exists military;
create table military (
    ID int ,
    FOREIGN KEY (ID) REFERENCES Applicants(applicantID),
    servedBefore varchar (255) not null,
     startdate DATE,
    enddate DATE,
    branch varchar (255),
    rank varchar(255),
    currentlyServing varchar(255)
    ) ;
INSERT INTO `military`(`ID`, `servedBefore`) VALUES ( 1,'NO');
  
drop table if exists employment_History;
create table employment_History (
    ID int,
    FOREIGN KEY (ID) REFERENCES Applicants(applicantID),
    dateOfEmployment DATE ,
     employer varchar(255),
    supervisor varchar(255),
    supervisorPhone int(15) ,
    responsibilities varchar(255),
    reasonForLeaving varchar(255)
    ) ;
INSERT INTO `employment_History`(`ID`, `dateOfEmployment`, `employer`,`supervisor`, `supervisorPhone`, `responsibilities`, `reasonForLeaving`)
VALUES (1, '2019-10-09', 'Serena Hotels', 'John Washington', 012284782, 'BAckoffice management', 'Sickness');
 
drop table if exists references;
create table references (
    ID int,
    FOREIGN KEY (ID) REFERENCES Applicants(applicantID),
    refname varchar(255) ,
    relationship varchar(255),
    occupation varchar(255),
    yearsknown varchar(255),
    PhoneNbr int(15) 
    ) ;
INSERT INTO `references`(`ID`, `refname`, `relationship`, `occupation`, `yearsknown`, `PhoneNbr`)
VALUES(1, 'Whitney Michelle', 'Mother','COmpany HRM', '2 years',0373937363) ;


drop table if exists otherinformation;
create table otherinformation (
    ID int,
    FOREIGN KEY (ID) REFERENCES Applicants(applicantID),
    otherinformation varchar(255) ) ;
INSERT INTO `anyotherinformation`(`ID`, `otherinformation`)
VALUES (1, 'I will appreciate if given a chance to serve in the organization');

CREATE TABLE Manager (
Manager_ID INT NOT NULL PRIMARY KEY,
branch varchar(255) not null,
ManagerFirst_Name varchar(255) not null,
ManagerLast__LName varchar(255) not null,
CONSTRAINT FK_BH FOREIGN KEY (branch) references Branches(BranchName));

CREATE TABLE HR (
HR_ID INT NOT NULL PRIMARY KEY,
HRFirst_Name varchar(255) not null,
HRLast_Name varchar(255) not null);

insert into Manager values (101, 'Miami Branch','Thomas', 'shelby');
insert into HR values (007,'jAMES', 'Bond');

UPDATE Roledesired 
SET HR_ID = 007 WHERE HR_ID = 0;
UPDATE Roledesired 
SET Manager_ID = 101 WHERE Manager_ID = 0;
UPDATE Roledesired 
SET App_Status = 'Offer requested' WHERE Manager_ID = 101;


ALTER TABLE Postings 
add column HR_ID INT NOT NULL,
ADD constraint HR_ID_JB FOREIGN KEY (HR_ID) REFERENCES HR(HR_ID);

alter TABLE Offers 
add column App_decision varchar(255);

UPDATE Postings
SET HR_ID = 007 WHERE HR_ID = 0;
