create database Highschool;
use Highschool;

create table teachers (
	teacher_id int primary key not null identity,
	teacher_fname varchar (80) not null
	teacher_lname varchar (80) not null
	teacher_contact varchar (80) not null

);

insert into teachers
	(teacher_fname, teacher_lname, teacher_contact)
	values
	('margret', 'nyguen', '384-576-5258'),
	('mary', 'fischer', '916-752-7747'),
	('arnold', 'holden', '530-754-5689'),
	('kem', 'byesan', '516-886-1102'),
	('delmonte', 'fyedo', '612-552-5565')
;

create table classes (
	class_id int primary key not null identity,
	class_subject varchar(50) not null,
	class_teacher int not null constraint fk_teacher_id foreign key references teachers(teacher_id) on update cascade on delete cascade,
);

insert into classes
	(class_subject, class_teacher)
	values
	('English', '3'),
	('Math', '1'),
	('History', '2'),
	('Science', '5'),
	('Physical Education', '4')
;

select * from teachers;
select * from classes;

select 
	class_subject as [Class Subject:], teacher_fname as [Teacher First Name:], teacher_lname as [Teacher Last Name:]
	from classes
	inner join teachers on teacher_id=class_teacher
;
