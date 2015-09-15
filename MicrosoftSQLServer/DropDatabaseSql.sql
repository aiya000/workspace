if exists(select * from sys.databases where name = 'TestC2MS')
begin
	drop database TestC2MS;
end