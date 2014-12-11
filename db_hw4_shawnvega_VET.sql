/* author: Shawn Vega
   Professor: Deena Engel
   Class: Database Design and Web implementation 
   Homework 4: Veterinary Hospital
*/


/* ---------------------------------------PART 1:  Creating and Loading Data Section-----------------------------------------  */

DROP TABLE IF EXISTS animalTable;
DROP TABLE IF EXISTS ownerTable;
DROP TABLE IF EXISTS vetTable;
DROP TABLE IF EXISTS immunizationTable;


CREATE TABLE animalTable (
	animal_id int NOT NULL AUTO_INCREMENT,
	animal_name varchar(30),
	animal_type varchar(30),
	animal_breed varchar(30),
	animal_sex varchar(20),
	animal_dobMonth int,	
	animal_dobDay int ,
	animal_dobYear int,	
	PRIMARY KEY (animal_id),
	FOREIGN KEY(animal_id) REFERENCES ownerTable (owner_id)
);

INSERT INTO animalTable VALUES(animal_id,"booster","dog","chihuahua","male",02,02,2009);
INSERT INTO animalTable VALUES(animal_id,"maggie","cat","persian","female",05,21,2012);
INSERT INTO animalTable VALUES(animal_id,"uly","dog","poodle","male",12,21,2007);
INSERT INTO animalTable VALUES(animal_id,"crystal","dog","cockerspaniel","female",12,17,2001);
INSERT INTO animalTable VALUES(animal_id,"sherlock","cat","siamese","male",10,01,2014);
INSERT INTO animalTable VALUES(animal_id,"trick-hip","dog","chihuahua","female",02,02,2009);


SELECT *
FROM animalTable; 
/* --------------------------------------------------------------------------------  */
CREATE TABLE ownerTable (
	owner_id int NOT NULL AUTO_INCREMENT,
	owner_firstName varchar(30),
	owner_lastName varchar(30),
	owner_email varchar(30),
	owner_mobile BIGINT UNSIGNED,
	owner_streetNumber int,
	owner_streetName varchar(100),
	owner_aptNumber varchar(30),
	owner_city varchar(30),
	owner_state varchar(30),
	owner_zipCode int,
	PRIMARY KEY (owner_id),
	FOREIGN KEY(owner_id) REFERENCES animalTable (animal_id)

);

INSERT INTO ownerTable VALUES(owner_id, "Shawn", "Vega","spv224@nyu.edu",3476289717,457,"Atlantic Avenue","2B","Brooklyn","New York",11217);
INSERT INTO ownerTable VALUES(owner_id, "Jim", "Jones","jones@gmail.com",4562346789,85,"livingston street","15B","Brooklyn","New York",11213);
INSERT INTO ownerTable VALUES(owner_id, "Sally", "Mae","smae@gmail.com",1645869875,52,"Washington Place","5C","New York","New York",10012);
INSERT INTO ownerTable VALUES(owner_id, "Suzzy", "Quan","quan@gmail.com",8016748765,319,"Laffayette","4C","New York","New York",10012);
INSERT INTO ownerTable VALUES(owner_id, "James", "Smtih","smith@gmail.com",5369251637,457,"Atlantic Avenue","3D","Brooklyn","New York",11217);
INSERT INTO ownerTable VALUES(owner_id, "Caroline", "Vega","caroline@gmail.com",6192049053,457,"Atlantic Avenue","2B","Brooklyn","New York",11217);



SELECT *
FROM ownerTable; 
/* --------------------------------------------------------------------------------  */

CREATE TABLE vetTable (
	vet_id int NOT NULL AUTO_INCREMENT,
	vet_name varchar(30),
	vet_email varchar(30),
	vet_mobile BIGINT UNSIGNED,
	PRIMARY KEY (vet_id),
	FOREIGN KEY(vet_id) REFERENCES animalTable (animal_id)
);

INSERT INTO vetTable VALUES(vet_id,"Dr. Jaws","jaws@gmail.com",5869230987);
INSERT INTO vetTable VALUES(vet_id,"Dr. Animal Cracker","animalcracker@gmail.com",9782649876);
INSERT INTO vetTable VALUES(vet_id,"Dr. Snakes On A Plan","snakes@gmail.com",7564869876);
INSERT INTO vetTable VALUES(vet_id,"Dr. Lion King","lion@gmail.com",6573849763);
INSERT INTO vetTable VALUES(vet_id,"Dr. Lamb Chop","chop@gmail.com",3987469384);
INSERT INTO vetTable VALUES(vet_id,"Dr. Jaws","jaws@gmail.com",5869230987);


SELECT *
FROM vetTable;
/* --------------------------------------------------------------------------------  */

CREATE TABLE immunizationTable (
	immunization_id int NOT NULL AUTO_INCREMENT,
	immunization_name varchar(60),
	immunization_cost int,
	immunization_month int,
	immunization_day int,
	immunization_year int,
	PRIMARY KEY (immunization_id),
	FOREIGN KEY(immunization_id) REFERENCES animalTable (animal_id)
);

INSERT INTO immunizationTable VALUES(immunization_id,"Parvovirus", 45,10,02,2010);
INSERT INTO immunizationTable VALUES(immunization_id,"Rabies", 100,09,08,2014);
INSERT INTO immunizationTable VALUES(immunization_id,"Bordetella", 75,06,03,2014);
INSERT INTO immunizationTable VALUES(immunization_id,"Leptospirosis", 90,05,06,2014);
INSERT INTO immunizationTable VALUES(immunization_id,"Lyme Disease", 75,03,21,2013);
INSERT INTO immunizationTable VALUES(immunization_id,"Rabies", 100,09,08,2011);



SELECT *
FROM immunizationTable;


/* ------------------------------------------PAART 2: Run The Query Section------------------------------------------------------  */

/* PROBLEM 1:  Display the name of the animal, type of animal and breed (if available) for all of the animals who live with owners in our zip code (10012).*/
/* animal name, type of animal, animal breed, owner info....*/ 	
SELECT animalTable.animal_name, animalTable.animal_type, animalTable.animal_breed, CONCAT(ownerTable.owner_firstName,'-',ownerTable.owner_lastName) AS OWNER_NAME,
ownerTable.owner_email,CONCAT(ownerTable.owner_streetNumber,'-',ownerTable.owner_streetName ,'-',ownerTable.owner_aptNumber,'-',ownerTable.owner_city ,'-',ownerTable.owner_state,'-',ownerTable.owner_zipCode ) AS OWNER_ADDRESS
FROM animalTable, ownerTable
WHERE animalTable.animal_id=ownerTable.owner_id AND ownerTable.owner_zipCode =10012;

/*PROBLEM 2: How many female cats are in the practice combined?*/
SELECT animalTable.animal_name, animalTable.animal_type, animalTable.animal_breed, animalTable.animal_sex, vetTable.vet_name AS Doctor
FROM animalTable,ownerTable, vetTable
WHERE animalTable.animal_id=ownerTable.owner_id AND animalTable.animal_id= vetTable.vet_id AND animalTable.animal_type="cat" AND animalTable.animal_sex="female";

SELECT  COUNT(animalTable.animal_type) AS FEMALE_CATS_IN_THE_PRACTICE
FROM animalTable, ownerTable
WHERE animalTable.animal_id=ownerTable.owner_id AND animalTable.animal_type ="cat" AND animalTable.animal_sex ="female";

/*PROBLEM 3: How many poodles are in the practice? (A poodle is a dog.)*/
SELECT animalTable.animal_name, animalTable.animal_type, animalTable.animal_breed, ownerTable.owner_firstName,ownerTable.owner_lastName
FROM animalTable, ownerTable
WHERE animalTable.animal_id=ownerTable.owner_id AND animalTable.animal_breed ="poodle";

SELECT  COUNT(animalTable.animal_breed) AS NUMBER_OF_POODLES
FROM animalTable, ownerTable
WHERE animalTable.animal_id=ownerTable.owner_id AND animalTable.animal_breed ="poodle";

/* PROBLEM 4: List every dog and its owner on file by name in alphabetical order by the owner's last name along with every immunization and the date.*/
SELECT animalTable.animal_name,animalTable.animal_type, CONCAT(ownerTable.owner_lastName,'-', ownerTable.owner_firstName) AS OWNER, immunizationTable.immunization_name,CONCAT('$',immunizationTable.immunization_cost) AS Immunization_Cost, CONCAT(immunizationTable.immunization_month,'-',immunizationTable.immunization_day,'-',immunizationTable.immunization_year) AS Immunization_Date
FROM animalTable, ownerTable, immunizationTable
WHERE animalTable.animal_id=ownerTable.owner_id AND animalTable.animal_id=immunizationTable.immunization_id
ORDER BY ownerTable.owner_lastname;

/* PROBLEM 5: How much money has this veterinary practiced charged for immunizations for dogs during the current year?*/
SELECT vetTable.vet_name,vetTable.vet_email,vetTable.vet_mobile, CONCAT(animalTable.animal_name,'-',animalTable.animal_type) AS ANIMALE,immunizationTable.immunization_name,CONCAT('$',immunizationTable.immunization_cost) AS Immunization_Cost,CONCAT(immunizationTable.immunization_month,'-',immunizationTable.immunization_day,'-',immunizationTable.immunization_year) AS Immunization_Date
FROM animalTable, vetTable, immunizationTable
WHERE animalTable.animal_id=vetTable.vet_id AND animalTable.animal_id=immunizationTable.immunization_id AND animalTable.animal_type="dog" AND immunizationTable.immunization_year=2014;

SELECT CONCAT('$',SUM(immunizationTable.immunization_cost)) AS Immunization_Cost
FROM animalTable, vetTable, immunizationTable
WHERE animalTable.animal_id=vetTable.vet_id AND animalTable.animal_id=immunizationTable.immunization_id AND animalTable.animal_type="dog" AND immunizationTable.immunization_year=2014;