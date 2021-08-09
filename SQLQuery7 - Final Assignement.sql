use Library;

create table Book_Authors (
	BookID int not null constraint fk_BA_BookID foreign key references Books(BookID) on update cascade on delete cascade,
	AuthorName varchar (80) not null
);

create table Publisher(
	PublisherName varchar (80) primary key not null,
	Adress varchar (80) not null,
	Phone varchar (80) not null
);

create table Books (
	BookID int primary key not null identity,
	Title varchar(80) not null,
	PublisherName varchar(80) not null constraint fk_PublisherName foreign key references Publisher(PublisherName) on update cascade on delete cascade
);

create table Book_Loans (
	BookID int not null  constraint fk_B_BookID foreign key references Books(BookID) on update cascade on delete cascade,
	BranchID int not null constraint fk_LB_BookID foreign key references Library_Branch(BranchID) on update cascade on delete cascade,
	CardNo int not null constraint fk_BL_CardNo foreign key references Borrower(CardNo) on update cascade on delete cascade,
	DateOut varchar(80) not null,
	DateDue varchar(80) not null
);

create table Book_Copies (
	BookID int primary key not null constraint fk_Books_BookID foreign key references Books(BookID) on update cascade on delete cascade,
	BranchID int not null constraint fk_BC_BookID foreign key references Library_Branch(BranchID) on update cascade on delete cascade,
	Number_Of_Copies int not null
);

create table Borrower (
	CardNo int primary key not null identity,
	[Name] varchar (80) not null,
	[Address] varchar (80) not null,
	Phone varchar (80) not null
);

create table Library_Branch (
	BranchID int primary key not null identity,
	BranchName varchar (80) not null,
	[Address] varchar (100) not null
);

insert into Library_Branch
	(BranchName, [Address])
	values
	('Sharpstown', '4268 Bellaire Blvd'),
	('Walter Neighborhood Library', '7660 Clarewood Dr'),
	('HPL Express Southwest Library', '6400 High Start Dr'),
	('St Anthony Public Library', '420 N Bridge St'),
	('Rigby City Library', '110 N State St'),
	('Madison Library', '73 N Center St')
;

insert into Borrower
	([Name], [Address], Phone)
	values
	('John Locke', '302 Woodhill Avenue', '410-739-8542'),
	('Kate Austen', '4999 Turkey Pen Lane', '334-608-0551'),
	('Jack Shephard', '4923 Lightning Point Drive', '901-535-9993'),
	('James Ford', '4575 Luke Lane', '580-209-4247'),
	('Hugo Reyes', '2190 Clifford Street', '510-683-8421'),
	('Sun-Hwa Kwon', '3145 Hanover Street', '917-656-5513'),
	('Sayid Jarrah', '183 Oakdale Avenue', '863-526-4994'),
	('Desmond Hume', '2360 Hanover Street', '917-692-7984')
;

insert into Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	values
	('19','6','2','7/10/21','7/17/21'),
	('20','6','2','7/25/21','8/1/21'),
	('21','6','2','8/2/21','8/9/21'),
	('18','1','1','8/4/21','8/11/21'),
	('15','5','8','2/1/21','2/9/21'),
	('16','5','8','2/9/21','2/16/21'),
	('17','5','8','2/16/21','2/23/21'),
	('12','4','7','5/2/21','5/9/21'),
	('13','4','7','5/9/21','5/16/21'),
	('14','4','7','5/16/21','5/23/21')
;

insert into Publisher
	(PublisherName, [Address], Phone)
	values
	('Orbit', '1450 N 2nd E', '281-392-6620'),
	('Little, Brown Books for Young Readers', '1642 Columbia Road', '302-870-6630'),
	('Crown Publishing Group', '2043 Arbor Court', '307-370-2215'),
	('Penguin Random House','2212 Rinehart Road','786-371-2552'),
	('HarperCollins','4346 Parrish Avenue','786-319-6245'),
	('Simon & Schuster','3704 Kemper Lane','801-917-6899'),
	('The Hachette Book Group','1457 Gladwell Street','901-888-1270'),
	('Macmillan Publishers','4160 Oakmound Drive','773-323-3705'),
	('Scholastic','4042 Mount Street','989-669-4622'),
	('Bloomsbury Publishing','3822 Wiseman Street','865-518-9600')
;

insert into Books
	(Title, PublisherName)
	values
	('The Assassin''s Blade','Bloomsbury Publishing'),
	('Throne of Glass','Bloomsbury Publishing'),
	('Crown of Midnight','Bloomsbury Publishing'),
	('Heir of Fire','Bloomsbury Publishing'),
	('Queen of Shadows','Bloomsbury Publishing'),
	('Empire of Storms','Bloomsbury Publishing'),
	('Tower of Dawn','Bloomsbury Publishing'),
	('Kingdom of Ash','Bloomsbury Publishing'),
	('Ready Player One','Crown Publishing Group'),
	('Ready Player Two','Crown Publishing Group'),
	('Frostblood','Little, Brown Books for Young Readers'),
	('Fireblood','Little, Brown Books for Young Readers'),
	('Nightblood','Little, Brown Books for Young Readers'),
	('The Way of Shadows','Orbit'),
	('Shadow''s Edge','Orbit'),
	('Beyond the Shadows','Orbit'),
	('The Lost Tribe','Macmillan Publishers'),
	('Dragons of Autumn Twilight','Penguin Random House'),
	('Dragons of Winter Night','Penguin Random House'),
	('Dragons of Spring Dawning','Penguin Random House')
;

insert into Book_Authors
	(BookID, AuthorName)
	values
	('12','Elly Blake'),
	('13','Elly Blake'),
	('14','Elly Blake'),
	('15','Brent Weeks'),
	('16','Brent Weeks'),
	('17','Brent Weeks'),
	('18','C. Taylor-Butler'),
	('2','Sarah J. Maas'),
	('3','Sarah J. Maas'),
	('4','Sarah J. Maas'),
	('5','Sarah J. Maas'),
	('6','Sarah J. Maas'),
	('7','Sarah J. Maas'),
	('8','Sarah J. Maas'),
	('9','Sarah J. Maas')
;

insert into Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	values
	('2','6','5'),
	('3','6','6'),
	('4','6','5'),
	('5','6','2'),
	('6','6','5'),
	('7','6','4'),
	('8','6','3'),
	('9','6','3'),
	('10','5','3'),
	('11','5','3'),
	('12','4','2'),
	('13','4','4'),
	('14','4','5'),
	('15','3','6'),
	('16','3','5'),
	('17','3','3'),
	('18','1','5'),
	('19','2','4'),
	('20','2','3'),
	('21','2','3')
;

select * from ((Book_Loans full outer join Borrower on Book_Loans.CardNo = Borrower.CardNo) full outer join Books on Book_Loans.BookID = Books.BookID);

select 
	Title, AuthorName
	from Books
	inner join Book_Authors on Books.BookID = Book_Authors.BookID;

select
	Title, BranchName, Number_Of_Copies
	from Books
	inner join Book_Copies on Book_Copies.BookID = Books.BookID
	inner join Library_Branch on Library_Branch.BranchID = Book_Copies.BranchID
	where Title = 'The Lost Tribe' and BranchName = 'Sharpstown'; 

select
	Title, BranchName, Number_Of_Copies
	from Books
	inner join Book_Copies on Book_Copies.BookID = Books.BookID
	inner join Library_Branch on Library_Branch.BranchID = Book_Copies.BranchID
	where Title = 'The Lost Tribe';

select 
	[Name]
	from Borrower
	where not exists(
		select 
		* 
		from Book_Loans
		where Borrower.CardNo = Book_Loans.CardNo)
;