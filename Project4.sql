USE world;

SET FOREIGN_KEY_CHECKS = 1;


/*
#1
INSERT INTO city
		(ID, 	name, 	CountryCode, 	District, 	Population) 
VALUES 	(1,		'Foo',	'ABW',			'Whee',		100000);


#2

INSERT INTO countrylanguage
		(CountryCode, 	language, 	isOfficial, 	Percentage) 
VALUES 	('ZZZ',		'	Zebraese',	'T',				34.2);




#3
DELETE FROM country
WHERE code = 'ABW';


#4
UPDATE country
SET Continent = 'Minionland'
WHERE Code = 'ABW';


#5
INSERT INTO city
VALUES ( DEFAULT, 'Whoville', 'ABW', 'DistrictX', NULL);


#6
INSERT INTO city
		(		name, 		CountryCode, 	District, 	Population) 
VALUES 	(		'Impact',	'USA',			'Texas',		43);

#7
DELETE FROM city
WHERE ID = 4087;


#8
INSERT INTO city
VALUES 	(DEFAULT,'Impact',		'USA',			'Texas',		43),
		(DEFAULT,'Errie',		'USA',			'Indiana',		143),
        (DEFAULT,'South Park',	'USA',			'Colorado',		243),
        (DEFAULT,'Quahog',		'USA',			'Rhode Island',	343),
        (DEFAULT,'Langley Falls','USA',			'Virginia',		43);

*/
#9
UPDATE city
SET population = 49
WHERE ID = 4082;

/*
UPDATE city
SET population = population + 1
WHERE ID = 4082;

*/