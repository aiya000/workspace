use TestC2MS;
go
create table dbo.Persons (  -- dbo.(PascalCase&•¡”Œ`)
	PersonID int primary key identity(0,1)  -- PascalCase, auto_increment
	, PersonName varchar(32) not null
	, PersonNote text default null
);