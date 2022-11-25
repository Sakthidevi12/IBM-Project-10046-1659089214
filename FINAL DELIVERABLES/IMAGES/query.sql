
create database train;
use train;
drop table TrainTable;
create table TrainTable(
id int auto_increment,
train_id varchar(10),
train_name varchar(100),
startTime varchar(20),
endTime varchar(20),
monday boolean,
tuesday boolean,
wednesday boolean,
thursday boolean,
friday boolean,
saturday boolean,
sunday boolean,
primary key(id));

alter table TrainTable
add (SourceStation varchar(100), DestinationStation varchar(100));
alter table TrainTable 
add(City varchar(100));

desc TrainTable; 
select * from traintable;

insert into TrainTable(train_id, train_name, startTime, endTime, monday, tuesday, wednesday, thursday, friday, saturday, sunday, SourceStation, DestinationStation, City)
value("02759", "HYB FEST SPL", "5:30 PM", "6:35 AM", true, true, true, true, true, true, true, "Chennai Egmore", "Secunderabad Jn", "Hyderbad"),
("12603", "MAS HYB EXPRESS",  "4:45 PM", "5:05 AM", true, true, true, true, true, true, true, "MGR Chennai Central", "Secunderabad Jn", "Hyderbad"),
("06059", "MAS SC EXPRESS",  "7:30 PM", "8:25 AM", false, false, false, false, true, false, false, "MGR Chennai Central", "Secunderabad Jn", "Hyderbad"),
("12759", "CHARMINAR EXP",  "6:10 PM", "7:15 AM", true, true, true, true, true, true, true, "MGR Chennai Central", "Secunderabad Jn", "Hyderbad"),
("06043", "VM SC EXP",  "6:05 PM", "8:25 AM", false, false, true, false, false, false, false, "Tambaram", "Secunderabad Jn", "Hyderbad"),
("06059", "MAS NSL EPRESS",  "8:55 AM", "11:20 PM", false, false, false, false, false, false, true, "MGR Chennai Central", "Secunderabad Jn","Hyderbad"),
("17651", "CGL KCG EXPRESS", "3:50 PM", "7:55 AM", true, true, true, true, true, true, true, "Tambaram", "Secunderabad Jn", "Hyderbad"),
("12604", "CHENNAI SF EXP", "5:15 PM", "5:55 AM", true, true, true, true, true, true, true, "Secunderabad Jn", "MGR Chennai Central", "Chennai"),
("12760", "CHARMINAR", "6:55 PM", "8:15 AM", true, true, true, true, true, true, true, "Secunderabad Jn", "MGR Chennai Central","Chennai"),
("16004", "NSL MAC WKLY EXP", "1:35 aA", "4:45 PM", false, false, false, true, false, false, false, "Kacheguda", "MGR Chennai Central","Chennai"),
("17652", "KCG CGL EXPRESS", "4:30 PM", "8:08 AM", true, true, true, true, true, true, true, "Kacheguda", "Tambaram","Chennai"),
("22808", "MAS SRC AC EXP", "8:10 AM", "10:30 AM", false, false, false, true, false, false, true,"MGR Chennai Central", "Santragachi Jn", "Kolkata"),
("12842", "COROMANDEL EXP", "8:45 AM", "11:55 AM", true, true, true, true, true,true, true, "MGR Chennai Central", "Howrah Jn", "Kolkata"),
("06058", "MAS SRC EXPRESS", "3:15 PM", "7:00 PM", false, false, true, false, false, false, false, "MGR Chennai Central", "Howrah Jn", "Kolkata"),
("12841", "COROMANDAL EXP", "2:50 PM", "5:00 PM", true, true, true, true , true, true, true, "Howrah Jn", "MGR Chennai Cental",  "Chennai"),
("02663", "HWH TPJ SF SPL", "5:35 PM", "8:45 PM", false, false, false, true, false, false, true,"Howrah Jn", "MGR Chennai Central", "Chennai"),
("12839", "CHENNAI MAIL", "11:45 PM","3:50 AM", true, true, true, true, true, true, true, "Howrah Jn", "MGR Chennai Central", "Chennai"),
("16115", "MS PDY EXPRESS", "6:10 PM", "10:15 PM", true, true, true, true, true, true, true, "Chennai Egmore", "Villupuram Jn", "Pondicherry"),
("06101", "MS QLN EXPRESS", "5:00 PM", "7:20 PM", true, true, true, true, true, true, true, "Chennai Egmore", "Villupuram Jn", "Pondicherry"),
("08496", "BBS PDY SPL", "8:10 AM", "11:50 AM", false, false, true, false, false, false, false, "Chennai Egmore","Pondicherry", "Pondicherry"),
("12897", "PDY BBS EXPRESS", "6:45 PM", "10:05 PM", false, false, true, false, false, false, false, "Pondicherry", "Chennai Egmore", "Chennai"),
("16116", "PDY MS EXPRESS", "5:35 AM", "9:30 AM", true, true, true, true, true, true, true, "Pondicherry", "Chennai Egmore", "Chennai"),
("06010", "PDY SRC EXPRESS", "6:45 PM", "10:40 PM", false, false, false, false, false, false, true, "Pondicherry", "Chennai Egmore", "Chennai"),
("12704", "FALAKNUMA EXP", "3:55 PM", "5:55 PM", true, true, true, true, true, true, true, "Secunderbad Jn", "HowRah Jn", "Kolkata"),
("12774", "SC SHM AC EXP", "5:40 AM", "9:05 AM", false, true, false, false, false, false, false, "Secunderbad Jn", "HowRah Jn", "Kolkata"),
("22850", "SC SHM WKLY EXP", "5:40 AM", "9:05 AM", true, true, true, true, true, true, true, "Secunderbad Jn", "HowRah Jn", "Kolkata"),
("12703", "FALAKNUMA EXP", "7:25 AM", "9:15 AM",  true, true, true, true, true, true, true, "Howrah Jn", "Secunderbad Jn", "Hyderbad"),
("22849", "SHM SC SUF EXP", "12:10 PM", "2:25 PM", false, false, true, false, false, false, false, "Howrah Jn", "Secunderbad Jn", "Hyderbad"),
("12514", "GHY SC EXPRESS", "1:05 AM", "4:00 AM", false, false, false, false,true, false, false, "Howrah Jn", "Secunderbad Jn", "Hyderbad"),
("07254","MDC SC SPL", "10:25 PM", "4:00 PM", false, false, false, false,true, false, false, "Villupuram Jn", "Secunderbad Jn", "Hyderbad"),
("07696","RMM SC SPL", "5:20 PM", "12:50 PM", false, false, false, false,true, false, false, "Villupuram Jn", "Secunderbad Jn", "Hyderbad"),
("07192","MDC SC SPL", "10:40 AM", "7:25 AM", false, false, true, false,false, false, false, "Villupuram Jn", "Secunderbad Jn", "Hyderbad"),
("07253", "HYB MDU SPL", "4:35 PM", "8:35 AM", false, false, false, true, false, false, false, "Secunderbad Jn", "Villupuram Jn", "Pondicherry"),
("07191", "SC MDU SPL", "9:25 PM", "3:30 PM", true, false, false, false, false, false, false, "Secunderbad Jn", "Villupuram Jn", "Pondicherry"),
("07695", "SC RMM SPL", "7:05 PM", "1:16 PM", false, false, true, false, false, false, false, "Secunderbad Jn", "Villupuram Jn", "Pondicherry"),
("06009", "SRC PDY SPL", "2:10 PM", "9:45 PM", true,  false, false, false,false, false, false, "SANTRAGACHI Jn", "Pondicherry", "Pondicherry"),
("12867", "HUH PDY SUF SPL", "11:30 PM", "8:50 PM", false,  false, false, false,false, false, true, "Howrah Jn", "Pondicherry", "Pondicherry"),
("06010", "PDY SRC EXPRESS", "6:45 PM", "4:30 AM", false,  false, false, false,false, true, false, "Pondicherry", "Santragachi Jn", "Kolkata"),
("12868", "PDY HOWRAH EXP", "12:45 PM", "10:40 PM", false, false, true, false, false, false, false, "Pondicherry", "Howrah Jn", "Kolkata")
; 