CREATE TABLE SocietyYear(
Year INTEGER not NULL,
Fee FLOAT not NULL,
Member_count INTEGER,
PRIMARY KEY(Year)
);
INSERT INTO SocietyYear VALUE (2019,4.5,0);
INSERT INTO SocietyYear VALUE (2018,4.5,0);
INSERT INTO SocietyYear VALUE (2017,4,0);
SELECT * FROM SocietyYear;

CREATE TABLE SocietyMember(
S_id INTEGER not NULL,
Fname VARCHAR(20) not NULL,
Lname VARCHAR(20) not NULL,
DOB DATE ,
Society_year INTEGER(4) not NULL,
Course VARCHAR(20) not NULL,
Course_year INTEGER(4) not NULL,
PRIMARY KEY(S_id)
);
ALTER TABLE societymember
ADD CONSTRAINT FOREIGN KEY (Society_year) REFERENCES SocietyYear(Year);

INSERT INTO SocietyMember VALUES(18335382, 'Komal','Malviya','1999-01-01',2019,'Computer Enginnering', 4);
INSERT INTO SocietyMember VALUES(18335380, 'Kate','Smirnova','1997-07-09',2019,'Environment Science', 3);
INSERT INTO SocietyMember VALUES(18335383, 'Linette','Hartzell','1996-05-31',2019,'Biomedical Engineering', 4);
INSERT INTO SocietyMember VALUES(18335384, 'Samprati','Jain','1998-12-20',2019,'Computer Engineering', 4);
INSERT INTO SocietyMember VALUES(18335385, 'Brian','Neville','1997-07-20',2019,'German and Law', 2);
INSERT INTO SocietyMember VALUES(18335381, 'Shibeak','Macan','1998-02-09',2019,'Environmental Engineering ', 4);
INSERT INTO SocietyMember VALUES(18335386, 'Emily','Nol','1996-01-01',2019,'Business', 1);
INSERT INTO SocietyMember VALUES(18335386, 'Emily','Nol','1996-01-01',2018,'Business', 1);
ALTER table societymember 
MODIFY Course VARCHAR(50) NOT NULL;
DESCRIBE SocietyMember;

CREATE TABLE Committee(
C_id INTEGER not NULL,
Position VARCHAR(20) not NULL,
Student_id INTEGER not NULL,
PRIMARY KEY(C_id),
FOREIGN KEY(Student_id) REFERENCES SocietyMember(S_id)
);
ALTER tABLE committee
MODIFY Position VARCHAR(30) not null;
INSERT INTO committee VALUES(2,'Secretary',18335380);
INSERT INTO committee VALUES(1,'Chair',18335381);
INSERT INTO committee VALUES(3,'Treasurer',18335382);
INSERT INTO committee VALUES(4,'OCM',18335383);
INSERT INTO committee VALUES(5,'International Representative',18335384);
INSERT INTO committee VALUES(6,'PRO',18335385);
SELECT * FROM Committee;

CREATE TABLE Event(
E_id INTEGER not NULL,
E_name VARCHAR(20) not NULL,
E_date DATE ,
E_location VARCHAR(20) not NULL,
Attendance 	INTEGER not NULL,
PRIMARY KEY(E_id)
);
ALTER TABLE event
ADD Expenditure INTEGER;
INSERT INTO event VALUES(1,'Midweek Muchies','2019-11-22','Society Room',10,15);
INSERT INTO event VALUES(2,'Movie night','2019-11-13','Attrium',7,10);
INSERT INTO event VALUES(3,'BEach Cleanup','2019-10-13',"Bull's island",16,50);
INSERT INTO event VALUES(4,'Wild Ball','2019-03-10','Wigwam',150,2000);
INSERT INTO event VALUES(5,'IPCC Report talk','2019-09-01','Attrium',25,31);
INSERT INTO event VALUES(6,'MidWeek Muchies','2019-11-13','Society Room',12,10);
SELECT * FROM Event;

CREATE TABLE Event_Collaboration(
E_id INTEGER not NULL,
Society_name VARCHAR(20) not NULL,
PRIMARY KEY(Society_name,E_id),
FOREIGN KEY(E_id) REFERENCES Event(E_id)
);
INSERT INTO Event_Collaboration VALUES(2,'Movie Society');
SELECT * FROM Event_Collaboration;

CREATE TABLE Event_type(
E_id INTEGER not NULL,
E_type VARCHAR(20) not NULL,
PRIMARY KEY(E_id,E_type),
FOREIGN KEY(E_id) REFERENCES Event(E_id)
);
INSERT INTO event_type VALUES(1,'Weekly');
INSERT INTO event_type VALUES(2,'Movie');
INSERT INTO event_type VALUES(3,'Cleanup');
INSERT INTO event_type VALUES(4,'Reception');
INSERT INTO event_type VALUES(5,'Talk');
INSERT INTO event_type VALUES(6,'Weekly');
SELECT * FROM Event_type;

CREATE TABLE Organize(
E_id INTEGER not NULL,
C_id INTEGER not NULL,
PRIMARY KEY(E_id,C_id),
FOREIGN KEY(E_id) REFERENCES Event(E_id),
FOREIGN KEY(C_id) REFERENCES Committee(C_id)
);
INSERT INTO organize VALUES(1,3);
INSERT INTO organize VALUES(1,2);
INSERT INTO organize VALUES(1,1);
INSERT INTO organize VALUES(2,4);
INSERT INTO organize VALUES(2,6);
INSERT INTO organize VALUES(3,1);
INSERT INTO organize VALUES(4,3);
INSERT INTO organize VALUES(4,5);
INSERT INTO organize VALUES(4,6);
INSERT INTO organize VALUES(4,2);
INSERT INTO organize VALUES(5,1);
INSERT INTO organize VALUES(6,6);
INSERT INTO organize VALUES(6,1);
SELECT * FROM Organize;

CREATE TABLE Transaction(
T_id INTEGER not NULL,
C_id INTEGER not NULL,
IBAN VARCHAR(34) not NULL, #IBAN consists of up to 34 alphanumeric characters
T_date DATE not NULL,
T_time TIME not NULL,
Amount INTEGER not NULL,
Purpose VARCHAR(50) not NULL,
Committee_member VARCHAR(1), 
PRIMARY KEY(T_id),
FOREIGN KEY(C_id) REFERENCES Committee(C_id)
);
INSERT INTO transaction VALUES (102290,3,'IE64BOFI90583812345678','2019-11-23','13:08:00',34,'Snacks','y');
INSERT INTO transaction VALUES (105684,3,'IE64BOFI90583812345677','2019-11-14','15:34:00',34,'Supplies','y');
INSERT INTO transaction VALUES (105687,3,'IE64BOFI90583812345679','2019-10-11','11:54:00',50,'Speaker Fee','n');
INSERT INTO transaction VALUES (105699,3,'IE64BOFI90583812345333','2019-10-13','17:34:00',5,'Snacks','y');
INSERT INTO transaction VALUES (108684,3,'IE64BOFI90583812367578','2019-09-08','22:34:00',10,'Location Booking','y');

SELECT * FROM Transaction;