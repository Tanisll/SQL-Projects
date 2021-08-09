use l

create proc CreateZooDB
as
begin

create table animalia (
	animalia_id int primary key not null identity,
	animalia_type varchar(50) not null
);

insert into animalia
	(animalia_type)
	values
	('vertebrate'),
	('invertebrate')
;
select * from animalia;

create table class (
	class_id int primary key not null identity (100,1),
	class_type varchar (50) not null
);

insert into class
	(class_type)
	values
	('bird'),
	('reptilian'),
	('mammal'),
	('arthropod'),
	('fish'),
	('worm'),
	('cnidaria'),
	('echinoderm,')
;

select * from class;

create table [order] (
	order_id int primary key not null identity (1,1),
	order_type varchar (50) not null
);

create table care (
	care_id varchar(50) primary key not null,
	care_type varchar(50) not null,
	care_specialist int not null
);

create table nutrition (
	nutrition_id int primary key not null identity (2200,1),
	nutrition_type varchar(50) not null,
	nutrition_cost money not null
);

create table habitat (
	habitat_id int primary key not null identity (5000,1),
	habitat_type varchar(50) not null,
	habitat_cost money not null
);

create table specialist (
	specialist_id int primary key not null identity (1,1),
	specialist_fname varchar(50) not null,
	specialist_lname varchar(50) not null,
	specialist_contact varchar(50) not null
);

insert into [order]
	(order_type)
	values
	('carnivore'),
	('herbivore'),
	('omnivore')
;

select * from [order];

select * from care;

insert into care
	(care_id, care_type, care_specialist)
	values
	('care_0', 'replace the straw', 1),
	('care_1', 'repair or replace broken toys', 4),
	('care_2', 'bottle feed vitimans', 1),
	('care_3', 'human contact_pet subject', 2),
	('care_4', 'clean up animal waste', 1),
	('care_5', 'move subject to exercise pen', 3),
	('care_6', 'drain and refill aquarium', 1),
	('care_7', 'extensive dental work', 3)
;

insert into nutrition
	(nutrition_type, nutrition_cost)
	values
	('raw fish', 1500),
	('living rodents', 600),
	('mixture of fruit and rice', 800),
	('warm bottle of milk', 600),
	('syringe feed broth', 600),
	('lard and seed mix', 300),
	('aphids', 150),
	('vitimans and marrow', 3500)
;

select * from nutrition;

insert into habitat
	(habitat_type, habitat_cost)
	values
	('tundra', 40000),
	('grassy gnoll with trees', 12000),
	('10 ft pond and rocks', 30000),
	('icy aquirium with snowy facade', 50000),
	('short grass, shade, and moat', 50000),
	('netted forestr atrium', 10000),
	('jungle vines and winding branches', 15000),
	('cliff with shaded cave', 15000)
;

select * from habitat;

insert into specialist
	(specialist_fname, specialist_lname, specialist_contact)
	values
	('margret', 'nyguen', '384-576-5258'),
	('mary', 'fischer', '916-752-7747'),
	('arnold', 'holden', '530-754-5689'),
	('kem', 'byesan', '516-886-1102'),
	('delmonte', 'fyedo', '612-552-5565')
;

select * from specialist;

create table species (
	species_id int primary key not null identity (1,1),
	species_name varchar(50) not null,
	species_animalia int not null constraint fk_animalia_id foreign key references animalia(animalia_id) on update cascade on delete cascade,
	species_class int not null constraint fk_class_id foreign key references class(class_id) on update cascade on delete cascade,
	species_order int not null constraint fk_order_id foreign key references [order](order_id) on update cascade on delete cascade,
	species_habitat int not null constraint fk_habitat_id foreign key references habitat(habitat_id) on update cascade on delete cascade,
	species_nutrition int not null constraint fk_nutrition_id foreign key references nutrition(nutrition_id) on update cascade on delete cascade,
	species_care varchar(50) not null constraint fk_care_id foreign key references care(care_id) on update cascade on delete cascade
);

insert into species
	(species_name, species_animalia, species_class,species_order,species_habitat,species_nutrition,species_care)
	values
	('brown bear',1,102,3,5007,2200,'care_1'),
	('jaguar',1,102,1,5007,2200,'care_4'),
	('penguin',1,100,1,5003,2200,'care_6'),
	('ghost bat',1,102,1,5007,2204,'care_2'),
	('chicken',1,100,3,5001,2205,'care_0'),
	('panda',1,102,3,5006,2202,'care_4'),
	('bobcat',1,102,1,5001,2204,'care_5'),
	('grey wolf',1,102,1,5000,2201,'care_4')
;

SELECT
	a1.species_name, a2.animalia_type,
	a3.class_type, a4.order_type, a5.habitat_type,
	a6.nutrition_type, a7.care_type
	FROM species a1
	INNER JOIN animalia a2 ON a2.animalia_id = a1.species_animalia
	INNER JOIN class a3 ON a3.class_id = a1.species_class
	INNER JOIN [order] a4 ON a4.order_id = a1.species_order
	INNER JOIN habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN nutrition a6 on a6.nutrition_id = a1.species_nutrition
	INNER JOIN care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'brown bear'
;
END