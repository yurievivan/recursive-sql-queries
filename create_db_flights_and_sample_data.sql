DROP TABLE IF EXISTS FLIGHTS;

-- Table structure for table FLIGHTS

CREATE TABLE FLIGHTS (
	FromCity VARCHAR(50) NOT NULL,
	ToCity   VARCHAR(50) NOT NULL,
	Price  bigint NOT NULL    
 );


insert into FLIGHTS values ('Athens','Singapore',348);
insert into FLIGHTS values ('Athens','Dubai',410);
insert into FLIGHTS values ('Athens','Doha',738);
insert into FLIGHTS values ('Athens','Istanbul',125);
insert into FLIGHTS values ('Athens','Amsterdam',280);
insert into FLIGHTS values ('Singapore','Denpasar',91);
insert into FLIGHTS values ('Dubai','Denpasar',713);
insert into FLIGHTS values ('Doha','Denpasar',915);
insert into FLIGHTS values ('Istanbul','Denpasar',908);
insert into FLIGHTS values ('Amsterdam','Denpasar',962);