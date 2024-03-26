--CREATE DATABASE Moovit_plus;

CREATE TABLE PERSON (
Person_ssn varchar(11) NOT NULL,
Person_name varchar(50) NOT NULL,
Person_gender varchar(1),
Person_birthdate Date,
Person_mail varchar(100) NOT NULL,
Person_phoneNumber varchar(15) NOT NULL,
PRIMARY KEY (Person_ssn),
)
ALTER TABLE Person
ADD CONSTRAINT chk_Person_gender 
CHECK (
    Person_gender = 'E' OR 
    Person_gender = 'e' OR 
    Person_gender = 'K' OR 
    Person_gender = 'k'
),
CHECK (
	LEN(Person_ssn)= 11
);
--person verileri ekleniyor
INSERT INTO PERSON (Person_ssn,Person_name,Person_gender,Person_birthdate,Person_mail,Person_phoneNumber)
VALUES ('11111111111','Berk Þahin','E','08/28/2002','berk@gmail.com','555555555')
--hatalý veri denemesi gender
INSERT INTO PERSON (Person_ssn,Person_name,Person_gender,Person_birthdate,Person_mail,Person_phoneNumber)
VALUES ('33333333333','Timurcan Bozkurt',0,'11/14/2001','timur@gmail.com','232232232')
--düzeltilmis hali 
INSERT INTO PERSON (Person_ssn,Person_name,Person_gender,Person_birthdate,Person_mail,Person_phoneNumber)
VALUES ('33333333333','Timurcan Bozkurt','E','11/14/2001','timur@gmail.com','232232232')
-- hatalý ssn girilmis veri(eksik)
INSERT INTO PERSON (Person_ssn,Person_name,Person_gender,Person_birthdate,Person_mail,Person_phoneNumber)
VALUES ('333333333','Timurcan Bozkurt','E','04/08/2004','timur@gmail.com','232232232')

INSERT INTO PERSON (Person_ssn,Person_name,Person_gender,Person_birthdate,Person_mail,Person_phoneNumber)
VALUES ('11111111121','Mustafa Sahin','E','05/28/2003','mustafa@gmail.com','555554444')

INSERT INTO PERSON (Person_ssn,Person_name,Person_gender,Person_birthdate,Person_mail,Person_phoneNumber)
VALUES ('77777777777','Simge Cengiz','K','09/03/2001','simge@gmail.com','123456789')

CREATE TABLE CARD (
Card_id INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
Student_Flag bit,
Martyr_Flag bit,
Elderly_Flag bit,
Regular_Flag bit,
Person_ssn varchar(11) NOT NULL UNIQUE,
FOREIGN KEY(Person_ssn) REFERENCES PERSON ,
CHECK (
        CAST(Student_Flag AS INT) +
        CAST(Martyr_Flag AS INT) +
        CAST(Elderly_Flag AS INT) +
        CAST(Regular_Flag AS INT) = 1
    ),
)


INSERT INTO CARD(Student_Flag,Martyr_Flag,Elderly_Flag,Regular_Flag,Person_ssn)
VALUES(1,0,0,0,'11111111111')
--Person tablosunda bulunmayan ssn eklenmeye çalýþtý.
INSERT INTO CARD(Student_Flag,Martyr_Flag,Elderly_Flag,Regular_Flag,Person_ssn)
VALUES(1,0,0,0,'11111111112')
INSERT INTO CARD(Student_Flag,Martyr_Flag,Elderly_Flag,Regular_Flag,Person_ssn)
VALUES(0,0,0,1,'33333333333')
INSERT INTO CARD(Student_Flag,Martyr_Flag,Elderly_Flag,Regular_Flag,Person_ssn)
VALUES(0,0,1,0,'77777777777')
--Birden fazla flag'in 1 yapýlmasý durumu HATALI!
INSERT INTO CARD(Student_Flag,Martyr_Flag,Elderly_Flag,Regular_Flag,Person_ssn)
VALUES(1,1,0,0,'11111111121')
INSERT INTO CARD(Student_Flag,Martyr_Flag,Elderly_Flag,Regular_Flag,Person_ssn)
VALUES(1,0,0,0,'11111111121')




CREATE TABLE STATION(
	Station_id INTEGER NOT NULL  IDENTITY(1,1)  PRIMARY KEY ,
	Station_Name varchar(50) NOT NULL UNIQUE,
	Station_City varchar(50) NOT NULL,
	Airport_Flag bit DEFAULT(0),
	Dock_Flag bit DEFAULT(0),
	Bus_Flag bit DEFAULT(0),
	Izban_Flag bit DEFAULT(0),
	Rent_a_Car_Flag bit DEFAULT(0),
	Train_Flag bit DEFAULT(0),
	Martý_Flag bit DEFAULT(0),
	Martý_Type tinyint DEFAULT(0),
CHECK( 
	Martý_Type BETWEEN 0 AND 2
	),
CHECK (
        CAST(Airport_Flag AS INT) +
        CAST(Dock_Flag AS INT) +
        CAST(Bus_Flag AS INT) +
		CAST(Rent_a_Car_Flag AS INT) +
		CAST(Train_Flag AS INT) +
		CAST(Martý_Flag AS INT) +
        CAST(Izban_Flag AS INT) = 1
 ),
CHECK (
    (Martý_Flag =  1 AND Martý_Type IS NOT NULL AND Martý_Type BETWEEN 0 AND 2) OR
    (Martý_Flag = 0)
 )
);
--HAVALÝMANLARI EKLENDÝ
 INSERT INTO STATION(Airport_flag,Station_Name,Station_City)
 VALUES (1,'Adnan Menderes Havalimaný','Ýzmir')
  INSERT INTO STATION(Airport_flag,Station_Name,Station_City)
 VALUES (1,'Ýstanbul Havalimani','Ýstanbul')
   INSERT INTO STATION(Airport_flag,Station_Name,Station_City)
 VALUES (1,'Sabih Gökçen Havalimani','Ýstanbul')
   INSERT INTO STATION(Airport_flag,Station_Name,Station_City)
 VALUES (1,'Esenboða Havalimani','Ankara')
   INSERT INTO STATION(Airport_flag,Station_Name,Station_City)
 VALUES (1,'GAP Havalimani','Urfa')
   INSERT INTO STATION(Airport_flag,Station_Name,Station_City)
 VALUES (1,'Edremit Havalimani','Balýkesir')
   INSERT INTO STATION(Airport_flag,Station_Name,Station_City)
 VALUES (1,'Antalya Havalimani','Antalya')
   INSERT INTO STATION(Airport_flag,Station_Name,Station_City)
 VALUES (1,'Rize Havalimani','Rize')
 --OTOGARLAR EKLENDÝ
 INSERT INTO STATION(Bus_flag,Station_Name,Station_City)
 VALUES (1,'Balýkesir Otogarý','Balýkesir')
 INSERT INTO STATION(Bus_flag,Station_Name,Station_City)
 VALUES (1,'Kýrýkkale Otogarý','Kýrýkkale')
 INSERT INTO STATION(Bus_flag,Station_Name,Station_City)
 VALUES (1,'Kars Otogarý','Kars')
  INSERT INTO STATION(Bus_flag,Station_Name,Station_City)
 VALUES (1,'Aydýn Otogarý','Aydýn')
  INSERT INTO STATION(Bus_flag,Station_Name,Station_City)
 VALUES (1,'Ýzmir Otogarý','Ýzmir')
  INSERT INTO STATION(Bus_flag,Station_Name,Station_City)
 VALUES (1,'Bursa Otogarý','Bursa')
  INSERT INTO STATION(Bus_flag,Station_Name,Station_City)
 VALUES (1,'Erzurum Otogarý','Erzurum')
  INSERT INTO STATION(Bus_flag,Station_Name,Station_City)
 VALUES (1,'Mersin Otogarý','Mersin')
 
 --TREN ÝSTASYONLARI EKLENDÝ
  INSERT INTO STATION(Train_flag,Station_Name,Station_City)
 VALUES (1,'Basmane Tren Garý','Ýzmir')
   INSERT INTO STATION(Train_flag,Station_Name,Station_City)
 VALUES (1,'Kars Tren Garý','Kars')
   INSERT INTO STATION(Train_flag,Station_Name,Station_City)
 VALUES (1,'Ankara Tren Garý','Ankara')
   INSERT INTO STATION(Train_flag,Station_Name,Station_City)
 VALUES (1,'Kýrýkkale Tren Garý','Kýrýkkale')
   INSERT INTO STATION(Train_flag,Station_Name,Station_City)
 VALUES (1,'Sivas Tren Garý','Sivas')
   INSERT INTO STATION(Train_flag,Station_Name,Station_City)
 VALUES (1,'Ýstanbul Tren Garý','Ýstanbul')
 --ÝSKELELER EKLENDÝ
   INSERT INTO STATION(Dock_Flag,Station_Name,Station_City)
 VALUES (1,'Karþýyaka Ýskele','Ýzmir')
   INSERT INTO STATION(Dock_Flag,Station_Name,Station_City)
 VALUES (1,'Alsancak Ýskele','Ýzmir')
   INSERT INTO STATION(Dock_Flag,Station_Name,Station_City)
 VALUES (1,'Bostanlý Ýskele','Ýzmir')
   INSERT INTO STATION(Dock_Flag,Station_Name,Station_City)
 VALUES (1,'Bandýrma Ýskele','Balýkesir')
   INSERT INTO STATION(Dock_Flag,Station_Name,Station_City)
 VALUES (1,'Mudanya Ýskele','Bursa')
   INSERT INTO STATION(Dock_Flag,Station_Name,Station_City)
 VALUES (1,'Samsun Ýskele','Samsun')

 --MARTILAR EKLENDÝ
 INSERT INTO STATION(Martý_Flag, Martý_Type,Station_Name,Station_City)
 VALUES(1,0,'Konak Metro','Ýzmir')
 INSERT INTO STATION(Martý_Flag,Martý_Type, Station_Name, Station_City)
 VALUES (1,0,'Bornova Metro', 'Ýzmir')
 INSERT INTO STATION(Martý_Flag,Martý_Type, Station_Name, Station_City)
 VALUES (1,1,'Bornova Küçükpark', 'Ýzmir')
  INSERT INTO STATION(Martý_Flag,Martý_Type, Station_Name, Station_City)
 VALUES (1,1,'Ege Bilgisayar Mühendisliði', 'Ýzmir')
  INSERT INTO STATION(Martý_Flag, Martý_Type,Station_Name, Station_City)
 VALUES (1,0,'Ege Kütüphane', 'Ýzmir')
  INSERT INTO STATION(Martý_Flag,Martý_Type, Station_Name, Station_City)
 VALUES (1,2,'Alsancak Ýskele', 'Ýzmir')
  INSERT INTO STATION(Martý_Flag,Martý_Type, Station_Name, Station_City)
 VALUES (1,2,'Manisa Kavþaðý', 'Ýzmir')

 -- IZBANLAR EKLENDÝ
 INSERT INTO STATION(Izban_Flag,Station_Name,Station_City)
 VALUES (1, 'Hilal Ýzban Duraðý' , 'Ýzmir')
  INSERT INTO STATION(Izban_Flag,Station_Name,Station_City)
 VALUES (1, 'Halkapýnar Ýzban Duraðý' , 'Ýzmir')
  INSERT INTO STATION(Izban_Flag,Station_Name,Station_City)
 VALUES (1, 'Selçuk Ýzban Duraðý' , 'Ýzmir')
  INSERT INTO STATION(Izban_Flag,Station_Name,Station_City)
 VALUES (1, 'Gaziemir Ýzban Duraðý' , 'Ýzmir')
  INSERT INTO STATION(Izban_Flag,Station_Name,Station_City)
 VALUES (1, 'Menemen Ýzban Duraðý' , 'Ýzmir')

 --RENT ÝSTASYONLARI EKLENDÝ
 INSERT INTO STATION(Rent_a_Car_Flag,Station_Name,Station_City)
 VALUES (1, 'Sabiha Gökçen Havalimaný' , 'Ýstanbul')
  INSERT INTO STATION(Rent_a_Car_Flag,Station_Name,Station_City)
 VALUES (1, 'Ýstanbul Dudullu Otogar' , 'Ýstanbul')
 INSERT INTO STATION(Rent_a_Car_Flag,Station_Name,Station_City)
 VALUES (1, 'Ankara Havalimaný' , 'Ankara')
 INSERT INTO STATION(Rent_a_Car_Flag,Station_Name,Station_City)
 VALUES (1, 'Ankara Kýzýlay Merkez' , 'Ankara')


 CREATE TABLE TRIP(
 Trip_id INT NOT NULL IDENTITY(1,1) Primary Key ,
 Trip_date Date NOT NULL,
 Arrival_station_id INT NOT NULL,
 Departure_station_id INT NOT NULL,
 Foreign Key (Arrival_Station_id) REFERENCES STATION,
 Foreign Key (Departure_Station_id) REFERENCES STATION,
 )
  --otobüs yolculuklarý
  -- balýkesir kýrýkkale
 INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('03/09/2024',3,4)
 -- kars aydýn
  INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('10/09/2024',5,33)
 -- bursa izmir
   INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('09/10/2024',35,34)
 --mersin kýrýkkale
    INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('12/30/2023',37,4)

 --izban yolculuklarý
 --hilal halkapýnar
    INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('12/12/2023',10,11)
 -- hilal selçuk
    INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('12/12/2023',10,12)
 -- gaziemir menemen
    INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('12/12/2023',13,14)
  -- menemen hilal
    INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('12/12/2023',14,10)

 --tren yolculuklarý
 --basmane kars
  INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('01/01/2024',6,38)
 --kars sivas
   INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('04/01/2024',38,41)
 -- kýrýkkale istanbul
    INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('10/02/2024',40,42)

 --uçak yolculuklarý
 -- izmir istanbul sabiha
  INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('08/12/2024',1,15)
 --ankara antalya
   INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('10/20/2024',17,30)
 -- rize izmir
   INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('09/25/2024',31,1)

 --feribot yolculuklarý
 -- bostanlý alsancak
  INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('7/11/2024',8,9)
 --alsancak bostanlý
   INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('7/11/2024',9,8)
    INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('7/11/2024',9,8)
     INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('02/14/2024',44,45)

 --rent a car yolculuklarý

 --sabiha gökçen - ankara havalimaný
      INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('03/19/2024',15,17)
 -- ankara - ankara
      INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('04/17/2024',17,17)
 --dudullu otogar - kýzýlay merkez
      INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('05/03/2024',16,18)
 -- istanbul dudullu oagar- istanbul sabiha gökçen
      INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('06/01/2024',15,16)

 --martý yolculuklarý 
 -- bornova metro - ege kütüphane
 INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('07/18/2024',20,23)
 --manisa kavþaðý - ege bilmüh
 INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('08/11/2024',25,22)
 --konak metro- küçükpark
 INSERT INTO TRIP (Trip_date, Arrival_station_id, Departure_station_id)
 VALUES ('02/14/2024',19,21)

 CREATE VIEW MakroMikro AS
SELECT 
    t.Trip_id,
    t.Trip_date,
    a.Station_City AS Arrival_City,
    d.Station_City AS Departure_City,
    CASE 
        WHEN a.Station_City = d.Station_City THEN 'Mikro Trip'
        ELSE 'Makro Trip'
    END AS TripType
FROM 
    TRIP t
INNER JOIN 
    STATION a ON t.Arrival_station_id = a.Station_id
INNER JOIN 
    STATION d ON t.Departure_station_id = d.Station_id;




 CREATE TABLE TICKET(
 Ticket_id INT NOT NULL IDENTITY(1,1) Primary Key,
 Trip_id INT  NOT NULL,
 Card_id INT NOT NULL,
 Bus_Flag bit NOT NULL DEFAULT (0),
 Bus_Seat_Number tinyint ,
 Izban_Flag bit NOT NULL DEFAULT (0),
 Plane_Flag bit NOT NULL DEFAULT (0),
 Plane_Seat_Number tinyint,
 Plane_Ticket_Type varchar(4),
 Train_Flag bit NOT NULL DEFAULT (0),
 Train_Seat_Number tinyint,
 Train_Ticket_Type varchar(4),
 Rent_a_Car_Flag bit NOT NULL DEFAULT (0),
 Rent_a_Car_person_count tinyint,
 Rent_a_Car_km_limit  int,
 Rent_a_Car_deposite int,
 Rent_a_Car_model varchar(40),
 Rent_a_Car_gear varchar(1),
 Rent_a_Car_fuel_Type varchar(1) ,
 Rent_a_Car_company varchar(50),
 Rent_a_Car_Type varchar(4),
 Ferry_Flag bit NOT NULL DEFAULT (0),
 Ferry_With_Vehicle_Flag bit  DEFAULT(0),
 Ferry_Without_Vehicle_Flag bit DEFAULT(0),
 Ferry_With_Vehicle_Type varchar(4),
 Ferry_Truck_Tonnage float,
 Ferry_Without_Vehicle_Type varchar(4),
 Ferry_Ticket_Number_of_People tinyint,
 Ferry_Ticket_Seat_Number tinyint,
 Martý_Tag_Flag bit NOT NULL DEFAULT (0),
 Martý_Tag_Ticket_Type varchar(4),
 Martý_Flag bit NOT NULL DEFAULT (0),
 Martý_Ticket_Type varchar(4),
 Foreign Key (Trip_id) REFERENCES TRIP,
 Foreign Key(Card_id) REFERENCES CARD,
 UNIQUE (Card_id, Trip_id),
 CHECK (
        CAST(Bus_Flag AS INT) +
        CAST(Izban_Flag AS INT) +
        CAST(Plane_Flag AS INT) +
		CAST(Rent_a_Car_Flag AS INT) +
		CAST(Train_Flag AS INT) +
		CAST(Martý_Flag AS INT) +
		CAST(Martý_Tag_Flag AS INT) +
        CAST(Ferry_Flag AS INT) = 1
 ),
 CHECK (
	 (Martý_Flag =  1 AND Martý_Ticket_Type IS NOT NULL AND Martý_Ticket_Type IN ('BIK','SCO') ) OR
    (Martý_Flag = 0)
 ),
   CHECK (
	 (Martý_Tag_Flag =  1 AND Martý_Tag_Ticket_Type IS NOT NULL AND Martý_Tag_Ticket_Type IN ('STD','LUX','TBIK') ) OR
    (Martý_Tag_Flag = 0)
 ),
  CHECK (
	 (Plane_Flag =  1 AND Plane_Ticket_Type IS NOT NULL AND Plane_Ticket_Type IN ('BUSN','ECON') AND Plane_Seat_Number IS NOT NULL  AND Bus_Seat_Number != 0) OR
    (Plane_Flag = 0)
 ),
  CHECK (
	 (Rent_a_Car_Flag =  1 AND Rent_a_Car_Type IS NOT NULL AND Rent_a_Car_Type IN ('ECON','STND','SUV','LUX','MIN') 
	 AND Rent_a_Car_person_count IS NOT NULL AND Rent_a_Car_person_count != 0
	 AND Rent_a_Car_km_limit IS NOT NULL AND Rent_a_Car_km_limit >0
	 AND  Rent_a_Car_deposite IS NOT NULL AND  Rent_a_Car_deposite >=0
	 AND Rent_a_Car_model IS NOT NULL
	 AND Rent_a_Car_gear IS NOT NULL AND Rent_a_Car_gear IN ('A','M')
	 AND Rent_a_Car_fuel_Type IS NOT NULL AND Rent_a_Car_fuel_Type IN ('D','G')
	 AND Rent_a_Car_company IS NOT NULL
	 ) OR
    (Rent_a_Car_Flag = 0)
 ),
CHECK (
    (Ferry_Flag = 1 AND (
        (
            Ferry_With_Vehicle_Flag = 1 AND 
            Ferry_With_Vehicle_Type IS NOT NULL AND 
            Ferry_Ticket_Number_of_People > 0 AND 
            Ferry_With_Vehicle_Type IN ('CAR', 'MINI', 'BIKE', 'CRVN', 'TRCK', 'BUS')
        ) OR (
            Ferry_With_Vehicle_Type = 'TRCK' AND 
            Ferry_Truck_Tonnage > 0
        ) OR (
            Ferry_Without_Vehicle_Flag = 1 AND 
            Ferry_Without_Vehicle_Type IS NOT NULL AND 
            Ferry_Ticket_Seat_Number > 0 AND 
            Ferry_Without_Vehicle_Type IN ('PRMO', 'BUSI', 'ECON', 'FRST')
        )
    )) OR (Ferry_Flag = 0)
),

  CHECK (
	 (Train_Flag =  1 AND Train_Ticket_Type IS NOT NULL AND Train_Ticket_Type IN ('DING','BUSN','ECON') AND Train_Seat_Number IS NOT NULL ) OR
    (Train_Flag = 0) 
 ),
   CHECK (
	 (Bus_Flag =  1 AND Bus_Seat_Number IS NOT NULL AND Bus_Seat_Number != 0 ) OR Bus_Flag = 0
 ) 
)


CREATE TRIGGER CheckTransportFlags
ON TICKET
INSTEAD OF INSERT, UPDATE
AS
BEGIN
    DECLARE 
	@tripId INT,
	@arrivalTrainFlag BIT, @departureTrainFlag BIT, @trainFlag BIT, 
	@arrivalBusFlag BIT, @departureBusFlag BIT,@busFlag BIT,
	@arrivalPlaneFlag BIT, @departurePlaneFlag BIT,  @planeFlag BIT,
	@arrivalFerryFlag BIT, @departureFerryFlag BIT,  @ferryFlag BIT,
	@arrivalIzbanFlag BIT, @departureIzbanFlag BIT,  @izbanFlag BIT,
	@arrivalMartýFlag BIT, @departureMartýFlag BIT,  @martýFlag BIT,
    @martýTagFlag BIT,
	@arrivalRentFlag BIT, @departureRentFlag BIT,  @rentFlag BIT;
    

    -- inserted sanal tablosundan gerekli deðerleri al
    SELECT @tripId = Trip_id, 
	@trainFlag = Train_Flag,
	@planeFlag = Plane_Flag ,
	@busFlag = Bus_Flag ,
	@ferryFlag = Ferry_Flag ,
	@izbanFlag = Izban_Flag ,
	@martýFlag = Martý_Flag ,
	@rentFlag = Rent_a_Car_Flag,
	@martýTagFlag = Martý_Tag_Flag
	FROM inserted;

    -- Trip tablosundan ilgili stationlarý al
    SELECT @arrivalTrainFlag = st1.Train_Flag, @departureTrainFlag = st2.Train_Flag,
	 @arrivalPlaneFlag = st1.Airport_Flag , @departurePlaneFlag = st2.Airport_Flag,
	 @arrivalFerryFlag = st1.Dock_Flag , @departureFerryFlag = st2.Dock_Flag,
	 @arrivalIzbanFlag = st1.Izban_Flag , @departureIzbanFlag = st2.Izban_Flag,
	 @arrivalMartýFlag = st1.Martý_Flag , @departureMartýFlag = st2.Martý_Flag,
	 @arrivalRentFlag = st1.Rent_a_Car_Flag , @departureRentFlag = st2.Rent_a_Car_Flag,
	 @arrivalBusFlag = st1.Bus_Flag , @departureBusFlag = st2.Bus_Flag
    FROM inserted i
    INNER JOIN TRIP t ON i.Trip_id = t.Trip_id
    INNER JOIN STATION st1 ON t.Arrival_station_id = st1.Station_id
    INNER JOIN STATION st2 ON t.Departure_station_id = st2.Station_id;

    -- Train_Flag ve Plane_Flag kontrolleri
    IF (@arrivalTrainFlag = 0 AND @departureTrainFlag = 0 AND @trainFlag = 1)
    BEGIN
        RAISERROR ('Eðer Trip ile iliþkili her iki istasyonun Train_Flag\i 0 ise, Ticket\ta Train_Flag 1 olamaz.', 16, 1);
    END
    ELSE IF (@arrivalPlaneFlag = 0 AND @departurePlaneFlag = 0 AND @planeFlag = 1)
    BEGIN
        RAISERROR ('Eðer Trip ile iliþkili her iki istasyonun Airport_Flag\i 0 ise, Ticket\ta Plane_Flag 1 olamaz.', 16, 1);
    END
	ELSE IF (@arrivalBusFlag = 0 AND @departureBusFlag = 0 AND @busFlag = 1)
    BEGIN
        RAISERROR ('Eðer Trip ile iliþkili her iki istasyonun Bus_Flag\i 0 ise, Bus\ta Bus_Flag 1 olamaz.', 16, 1);
    END
	ELSE IF (@arrivalFerryFlag = 0 AND @departureFerryFlag = 0 AND @ferryFlag = 1)
    BEGIN
        RAISERROR ('Eðer Trip ile iliþkili her iki istasyonun Ferry_Flag\i 0 ise, Ticket\ta Ferry_Flag 1 olamaz.', 16, 1);
    END
	ELSE IF (@arrivalIzbanFlag = 0 AND @departureIzbanFlag = 0 AND @izbanFlag = 1)
    BEGIN
        RAISERROR ('Eðer Trip ile iliþkili her iki istasyonun Izban_Flag\i 0 ise, Ticket\ta Izabn_Flag 1 olamaz.', 16, 1);
    END
	ELSE IF (@arrivalRentFlag = 0 AND @departureRentFlag = 0 AND @rentFlag = 1)
    BEGIN
        RAISERROR ('Eðer Trip ile iliþkili her iki istasyonun Rent_Flag\i 0 ise, Ticket\ta Rent_Flag 1 olamaz.', 16, 1);
    END
	ELSE IF (@arrivalMartýFlag = 0 AND @departureMartýFlag = 0 AND (@martýFlag = 1 OR @martýFlag = 1))
    BEGIN
        RAISERROR ('Eðer Trip ile iliþkili her iki istasyonun Martý_Flag\i 0 ise, Ticket\ta Martý_Flag 1 olamaz.', 16, 1);
    END
    ELSE
    BEGIN
         --Eðer kontroller baþarýlýysa, orijinal ekleme veya güncelleme iþlemini yap
       INSERT INTO TICKET (
    Trip_id,
	Card_id,
    Bus_Flag, 
    Bus_Seat_Number, 
    Izban_Flag, 
    Plane_Flag, 
    Plane_Seat_Number, 
    Plane_Ticket_Type, 
    Train_Flag, 
    Train_Seat_Number, 
    Train_Ticket_Type, 
    Rent_a_Car_Flag, 
    Rent_a_Car_person_count, 
    Rent_a_Car_km_limit, 
    Rent_a_Car_deposite, 
    Rent_a_Car_model, 
    Rent_a_Car_gear, 
    Rent_a_Car_fuel_Type, 
    Rent_a_Car_company, 
    Rent_a_Car_Type, 
    Ferry_Flag, 
    Ferry_With_Vehicle_Flag, 
    Ferry_Without_Vehicle_Flag, 
    Ferry_With_Vehicle_Type, 
    Ferry_Truck_Tonnage, 
    Ferry_Without_Vehicle_Type, 
    Ferry_Ticket_Number_of_People, 
    Ferry_Ticket_Seat_Number, 
    Martý_Tag_Flag, 
    Martý_Tag_Ticket_Type, 
    Martý_Flag, 
    Martý_Ticket_Type
)
SELECT 
    Trip_id,
	Card_id,
    Bus_Flag, 
    Bus_Seat_Number, 
    Izban_Flag, 
    Plane_Flag, 
    Plane_Seat_Number, 
    Plane_Ticket_Type, 
    Train_Flag, 
    Train_Seat_Number, 
    Train_Ticket_Type, 
    Rent_a_Car_Flag, 
    Rent_a_Car_person_count, 
    Rent_a_Car_km_limit, 
    Rent_a_Car_deposite, 
    Rent_a_Car_model, 
    Rent_a_Car_gear, 
    Rent_a_Car_fuel_Type, 
    Rent_a_Car_company, 
    Rent_a_Car_Type, 
    Ferry_Flag, 
    Ferry_With_Vehicle_Flag, 
    Ferry_Without_Vehicle_Flag, 
    Ferry_With_Vehicle_Type, 
    Ferry_Truck_Tonnage, 
    Ferry_Without_Vehicle_Type, 
    Ferry_Ticket_Number_of_People, 
    Ferry_Ticket_Seat_Number, 
    Martý_Tag_Flag, 
    Martý_Tag_Ticket_Type, 
    Martý_Flag, 
    Martý_Ticket_Type
FROM 
    INSERTED;
    END
END;

--tren biletleri
INSERT INTO TICKET(Card_id,Trip_id,Train_flag,Train_Seat_Number,Train_Ticket_Type)
VALUES (1,5,1,3,'DING')
INSERT INTO TICKET(Card_id,Trip_id,Train_flag,Train_Seat_Number,Train_Ticket_Type)
VALUES (3,6,1,5,'BUSN')
-- trip ticket uyumsuz bilet ekleme denemesi
INSERT INTO TICKET(Card_id,Trip_id,Train_flag,Train_Seat_Number,Train_Ticket_Type)
VALUES (2,1,1,3,'DING')

-- feribot biletleri
INSERT INTO TICKET(Card_id,Trip_id,Ferry_Flag,Ferry_Without_Vehicle_Flag,Ferry_Without_Vehicle_Type,Ferry_Ticket_Seat_Number)
VALUES (4,14,1,1,'ECON',22)
INSERT INTO TICKET(Card_id,Trip_id,Ferry_Flag,Ferry_Without_Vehicle_Flag,Ferry_Without_Vehicle_Type,Ferry_Ticket_Seat_Number)
VALUES (4,15,1,1,'ECON',18)


--uçak biletleri
INSERT INTO TICKET (Card_id,Trip_id,Plane_Flag,Plane_Ticket_Type,Plane_Seat_Number)
VALUES (6,13,1,'BUSN', 33)
INSERT INTO TICKET (Card_id,Trip_id,Plane_Flag,Plane_Ticket_Type,Plane_Seat_Number)
VALUES (4,11,1,'BUSN', 13)
INSERT INTO TICKET (Card_id,Trip_id,Plane_Flag,Plane_Ticket_Type,Plane_Seat_Number)
VALUES (6,12,1,'BUSN', 23)



 CREATE TABLE TRANSPORTATION (
 Transportation_num INT NOT NULL,
 Trip_id INT NOT NULL,
 Card_id INT NOT NULL,
 Foreign Key (Trip_id) REFERENCES TRIP,
 Foreign Key (Card_id) REFERENCES CARD,
 Primary Key (Trip_id,Card_id)
 )

 CREATE TRIGGER AddToPreferenceOnTransportation
ON TRANSPORTATION
AFTER INSERT
AS
BEGIN
    DECLARE @tripId INT, @cardId INT, @ticketId INT;

    -- TRANSPORTATION'dan Trip_id ve Card_id'yi al
    SELECT @tripId = Trip_id, @cardId = Card_id FROM inserted;

    -- TICKET tablosundan ilgili Ticket_id'yi al
    SELECT TOP 1 @ticketId = Ticket_id FROM TICKET
    WHERE Trip_id = @tripId AND Card_id = @cardId;

    -- Eðer Ticket_id bulunamazsa hata mesajý göster
    IF @ticketId IS NULL
    BEGIN
        RAISERROR ('Ýlgili Ticket_id bulunamadý.', 16, 1);
        RETURN;
    END

    -- PREFERENCE tablosuna ekle
    INSERT INTO PREFERENCE (Card_id, Trip_id, Ticket_id)
    VALUES (@cardId, @tripId, @ticketId);
END;

 --6 numaralý kartýn aktarmalarý 1 numaralý aktarmalarý
 INSERT INTO TRANSPORTATION(Transportation_num, Trip_id, Card_id)
 VALUES (1, 12 , 6)

  INSERT INTO TRANSPORTATION(Transportation_num, Trip_id, Card_id)
 VALUES (1, 13 , 6)

 INSERT INTO TRANSPORTATION(Transportation_num, Trip_id, Card_id)
 VALUES (2, 14 , 4)
  INSERT INTO TRANSPORTATION(Transportation_num, Trip_id, Card_id)
 VALUES (2, 15 , 4)

 


CREATE TABLE PREFERENCE(
	Card_id INT NOT NULL ,
	Trip_id INT NOT NULL,
	Ticket_id INT NOT NULL,
	Foreign Key (Card_id) REFERENCES CARD,
	Foreign Key (Trip_id) REFERENCES TRIP,
	Foreign Key (Ticket_id) REFERENCES TICKET,
	PRIMARY KEY (Card_id, Trip_id, Ticket_id),
)

CREATE VIEW CardPreferences AS
SELECT 
    Pref.Card_id,
    Pref.MostPreferredTicketType,
    Pref.TicketTypeCount,
    Search.MostSearchedName
FROM
    (SELECT 
         Card_id,
         TicketType AS MostPreferredTicketType,
         COUNT(*) AS TicketTypeCount,
         ROW_NUMBER() OVER (PARTITION BY Card_id ORDER BY COUNT(*) DESC) as rn
     FROM 
         (SELECT 
              Card_id,
              CASE 
                  WHEN Bus_Flag = 1 THEN 'Bus'
                  WHEN Plane_Flag = 1 THEN 'Plane'
                  WHEN Train_Flag = 1 THEN 'Train'
                  WHEN Rent_a_Car_Flag = 1 THEN 'Rent_a_Car'
                  WHEN Ferry_Flag = 1 THEN 'Ferry'
                  WHEN Martý_Flag = 1 THEN 'Martý'
                  WHEN Martý_Tag_Flag = 1 THEN 'Martý_Tag'
                  WHEN Izban_Flag = 1 THEN 'Izban'
              END AS TicketType
          FROM 
              TICKET) AS TicketSub
     GROUP BY 
         Card_id, TicketType) AS Pref
INNER JOIN
    (SELECT 
         c.Card_id,
         sh.Search_Name AS MostSearchedName,
         ROW_NUMBER() OVER (PARTITION BY c.Card_id ORDER BY COUNT(*) DESC) as rn
     FROM 
         SEARCH_HISTORY sh
     JOIN 
         CARD c ON sh.Person_ssn = c.Person_ssn
     GROUP BY 
         c.Card_id, sh.Search_Name) AS Search
ON Pref.Card_id = Search.Card_id AND Pref.rn = 1 AND Search.rn = 1;



CREATE TABLE SEARCH_HISTORY (
	Person_ssn varchar(11) NOT NULL,
	Search_id INT NOT NULL IDENTITY(100,1),
	Search_Name varchar(50) NOT NULL
	FOREIGN KEY (Person_ssn) REFERENCES PERSON,
	PRIMARY KEY (Person_ssn,Search_id),
)
INSERT INTO SEARCH_HISTORY(Person_ssn,Search_Name)
VALUES ('11111111111','Kýrýkkale')
INSERT INTO SEARCH_HISTORY(Person_ssn,Search_Name)
VALUES ('11111111111','Ýzmir')
INSERT INTO SEARCH_HISTORY(Person_ssn,Search_Name)
VALUES ('11111111111','Çeþme')
INSERT INTO SEARCH_HISTORY(Person_ssn,Search_Name)
VALUES ('11111111111','Ýzmir')

DROP TABLE SEARCH_HISTORY
DROP TABLE PREFERENCE
DROP TABLE TICKET
DROP TABLE TRANSPORTATION
DROP TABLE TRIP
DROP TABLE STATION
DROP TABLE CARD
DROP TABLE PERSON

SELECT TOP 1 TicketType, Count
FROM (
    SELECT 'Bus' AS TicketType, COUNT(*) AS Count FROM TICKET WHERE Bus_Flag = 1
    UNION ALL
    SELECT 'Izban', COUNT(*) FROM TICKET WHERE Izban_Flag = 1
    UNION ALL
    SELECT 'Plane', COUNT(*) FROM TICKET WHERE Plane_Flag = 1
    UNION ALL
    SELECT 'Train', COUNT(*) FROM TICKET WHERE Train_Flag = 1
    UNION ALL
    SELECT 'Rent_a_Car', COUNT(*) FROM TICKET WHERE Rent_a_Car_Flag = 1
    UNION ALL
    SELECT 'Ferry', COUNT(*) FROM TICKET WHERE Ferry_Flag = 1
    UNION ALL
    SELECT 'Martý', COUNT(*) FROM TICKET WHERE Martý_Flag = 1
    UNION ALL
    SELECT 'Martý_Tag', COUNT(*) FROM TICKET WHERE Martý_Tag_Flag = 1
) AS TicketCounts
ORDER BY Count DESC;
