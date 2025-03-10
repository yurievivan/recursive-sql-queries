DROP TABLE IF EXISTS FLIGHTS;
DROP TABLE IF EXISTS AIRPORT;

-- Table structure for table AIRPORT

CREATE TABLE AIRPORT(
	country VARCHAR NOT NULL,
	city VARCHAR NOT NULL,
	port_code CHAR(3) NOT NULL,
	PRIMARY KEY (port_code)
);

insert into AIRPORT values ('United States of America','New York','JFK');
insert into AIRPORT values ('United States of America','New York','LGA');
insert into AIRPORT values ('Japan','Tokyo','HND');
insert into AIRPORT values ('Japan','Tokyo','NRT');
insert into AIRPORT values ('United States of America','New York','EWR');
insert into AIRPORT values ('China','Hong Kong','HKG');
insert into AIRPORT values ('South Korea','Seoul','ICN');
insert into AIRPORT values ('South Korea','Seoul','GMP');
insert into AIRPORT values ('Philippines','Manila','MNL');
insert into AIRPORT values ('China','Taipe','TPE');
insert into AIRPORT values ('Turkey','Istanbul','IST');
insert into AIRPORT values ('Egypt','Cairo','CAI');
insert into AIRPORT values ('United States of America','Detroit','DTW');
insert into AIRPORT values ('United States of America','Seattle','SEA');
insert into AIRPORT values ('Ethiopia','Addis Ababa','ADD');
insert into AIRPORT values ('United States of America','Dallas','DFW');
insert into AIRPORT values ('United States of America','Virginia','IAD');
insert into AIRPORT values ('United States of America','Denver','DEN');
insert into AIRPORT values ('United States of America','Los Angeles','LAX');
insert into AIRPORT values ('United States of America','San Francisco','SFO');
insert into AIRPORT values ('United States of America','Houston','IAH');
insert into AIRPORT values ('United States of America','Minneapolis–Saint Paul','MSP');

-- Table structure for table FLIGHTS

CREATE TABLE FLIGHTS(	
	start_date TIMESTAMP NOT NULL,
	end_date TIMESTAMP NOT NULL,
	start_port CHAR(3) NOT NULL,
	end_port CHAR(3) NOT NULL,
	FOREIGN KEY (start_port) REFERENCES AIRPORT(port_code),
    FOREIGN KEY (end_port) REFERENCES AIRPORT(port_code)
);

insert into FLIGHTS values ('21-03-2025 11:00','22-03-2025 14:35','JFK','HND');
insert into FLIGHTS values ('21-03-2025 12:35','22-03-2025 15:55','EWR','NRT');
insert into FLIGHTS values ('21-03-2025 01:40','22-03-2025 05:05','JFK','HND');
insert into FLIGHTS values ('21-03-2025 13:50','22-03-2025 17:15','JFK','HND');
insert into FLIGHTS values ('21-03-2025 10:45','22-03-2025 14:20','EWR','HND');
insert into FLIGHTS values ('21-03-2025 01:50','22-03-2025 05:25','JFK','HND');
insert into FLIGHTS values ('21-03-2025 10:00','22-03-2025 14:10','JFK','HKG');
insert into FLIGHTS values ('22-03-2025 15:25','22-03-2025 20:20','HKG','NRT');
insert into FLIGHTS values ('22-03-2025 16:25','22-03-2025 21:15','HKG','HND');
insert into FLIGHTS values ('21-03-2025 00:50','22-03-2025 05:30','JFK','ICN');
insert into FLIGHTS values ('22-03-2025 09:00','22-03-2025 11:05','GMP','HND');
insert into FLIGHTS values ('21-03-2025 02:40','22-03-2025 07:45','JFK','MNL');
insert into FLIGHTS values ('22-03-2025 08:50','22-03-2025 13:55','MNL','HND');
insert into FLIGHTS values ('22-03-2025 09:55','22-03-2025 12:20','ICN','NRT');
insert into FLIGHTS values ('21-03-2025 14:50','22-03-2025 19:05','JFK','HKG');
insert into FLIGHTS values ('23-03-2025 01:25','23-03-2025 06:30','HKG','NRT');
insert into FLIGHTS values ('21-03-2025 01:05','22-03-2025 06:25','JFK','TPE');
insert into FLIGHTS values ('22-03-2025 09:30','22-03-2025 13:30','TPE','NRT');
insert into FLIGHTS values ('21-03-2025 07:55','21-03-2025 09:57','LGA','MSP');
insert into FLIGHTS values ('21-03-2025 11:35','22-03-2025 14:35','MSP','HND');
insert into FLIGHTS values ('21-03-2025 11:35','22-03-2025 14:35','MSP','HND');
insert into FLIGHTS values ('21-03-2025 21:55','22-03-2025 21:30','JFK','ADD');
insert into FLIGHTS values ('22-03-2025 22:35','23-03-2025 19:05','ADD','NRT');
insert into FLIGHTS values ('22-03-2025 13:25','22-03-2025 15:55','ICN','NRT');
insert into FLIGHTS values ('21-03-2025 12:30','22-03-2025 17:15','JFK','ICN');
insert into FLIGHTS values ('22-03-2025 22:40','23-03-2025 00:50','ICN','HND');
insert into FLIGHTS values ('22-03-2025 20:40','22-03-2025 22:50','ICN','HND');
insert into FLIGHTS values ('22-03-2025 21:30','22-03-2025 23:25','ICN','HND');
insert into FLIGHTS values ('23-03-2025 07:45','23-03-2025 09:45','GMP','HND');
insert into FLIGHTS values ('21-03-2025 06:00','23-03-2025 09:12','LGA','DFW');
insert into FLIGHTS values ('21-03-2025 14:50','22-03-2025 18:25','DFW','HND');
insert into FLIGHTS values ('21-03-2025 14:50','22-03-2025 18:25','DFW','HND');
insert into FLIGHTS values ('22-03-2025 19:10','23-03-2025 00:15','MNL','HND');
insert into FLIGHTS values ('21-03-2025 11:11','21-03-2025 11:50','LGA','IAD');
insert into FLIGHTS values ('21-03-2025 12:35','22-03-2025 14:20','IAD','HND');
insert into FLIGHTS values ('21-03-2025 07:21','21-03-2025 10:05','LGA','DEN');
insert into FLIGHTS values ('21-03-2025 12:20','22-03-2025 15:35','DEN','NRT');
insert into FLIGHTS values ('21-03-2025 06:00','21-03-2025 09:40','EWR','SFO');
insert into FLIGHTS values ('21-03-2025 11:40','22-03-2025 15:00','SFO','NRT');
insert into FLIGHTS values ('21-03-2025 06:00','21-03-2025 09:05','EWR','LAX');
insert into FLIGHTS values ('21-03-2025 11:50','22-03-2025 15:35','LAX','NRT');
insert into FLIGHTS values ('21-03-2025 12:30','22-03-2025 16:30','LAX','NRT');
insert into FLIGHTS values ('21-03-2025 11:00','22-03-2025 06:30','EWR','ADD');
insert into FLIGHTS values ('21-03-2025 08:05','21-03-2025 11:25','JFK','DFW');
insert into FLIGHTS values ('21-03-2025 12:05','22-03-2025 15:30','DFW','NRT');
insert into FLIGHTS values ('23-03-2025 07:40','23-03-2025 12:45','MNL','NRT');
insert into FLIGHTS values ('21-03-2025 20:49','21-03-2025 23:59','EWR','IAH');
insert into FLIGHTS values ('22-03-2025 11:00','23-03-2025 15:10','IAH','NRT');
insert into FLIGHTS values ('21-03-2025 01:30','21-03-2025 18:00','EWR','IST');
insert into FLIGHTS values ('21-03-2025 01:30','21-03-2025 18:00','EWR','IST');
insert into FLIGHTS values ('22-03-2025 02:35','22-03-2025 19:45','IST','HND');
insert into FLIGHTS values ('21-03-2025 19:30','22-03-2025 23:01','EWR','LAX');
insert into FLIGHTS values ('22-03-2025 12:30','23-03-2025 16:30','LAX','HND');
insert into FLIGHTS values ('21-03-2025 07:00','21-03-2025 10:23','JFK','LAX');
insert into FLIGHTS values ('22-03-2025 01:00','23-03-2025 05:05','LAX','HND');
insert into FLIGHTS values ('21-03-2025 14:00','21-03-2025 22:49','LGA','SEA');
insert into FLIGHTS values ('22-03-2025 16:45','23-03-2025 19:15','SEA','HND');
insert into FLIGHTS values ('21-03-2025 12:45','22-03-2025 04:55','JFK','CAI');
insert into FLIGHTS values ('22-03-2025 23:10','23-03-2025 18:10','CAI','NRT');
insert into FLIGHTS values ('21-03-2025 13:00','22-03-2025 17:45','JFK','ICN');
insert into FLIGHTS values ('22-03-2025 18:35','22-03-2025 21:05','ICN','NRT');
insert into FLIGHTS values ('21-03-2025 13:30','22-03-2025 17:30','LAX','HND');
insert into FLIGHTS values ('21-03-2025 07:30','21-03-2025 10:51','EWR','LAX');
insert into FLIGHTS values ('21-03-2025 09:45','21-03-2025 11:45','LGA','DTW');
insert into FLIGHTS values ('21-03-2025 12:30','22-03-2025 16:30','DTW','ICN');
insert into FLIGHTS values ('22-03-2025 18:40','22-03-2025 21:00','ICN','NRT');
insert into FLIGHTS values ('21-03-2025 09:32','21-03-2025 11:35','EWR','DTW');
