create database CinemaTickets
on
(
	name= ExamDB,
	filename='D:\CinemaTickets.mdf',
	size=5mb,
	maxsize=20mb,
	filegrowth=1mb
)
log on
(
	name=ExamDB_log,
	filename='D:\CinemaTickets.ldf',
	size=2mb,
	maxsize=10mb,
	filegrowth=1mb
)
use[CinemaTickets]
CREATE TABLE Users
(
	ID int primary key identity(1,1),
	zhName varchar(30) not null,
	UserName varchar(30) not null unique,
	Pwd varchar(30) not null,
	Birthday datetime not null,
	Bank nvarchar(20) not null,
	Phone varchar(20) not null,
	[Admin] int not null check ([Admin]= 0 or [Admin]= 1) default 0
)

create table MovieInfo
(
	MovieID int primary key identity(1,1),
	MovieName nvarchar(30) not null, --��Ӱ��
	Director nvarchar(30) not null, --����
	ToStar nvarchar(100) not null, --����
	MovieType nvarchar(30) not null, --����
	MovieImage nvarchar(100) not null, --ͼƬ
	Introduce nvarchar(500), --����
	Price float, --Ʊ�� 
)
create table OrderInfo
(
	orderId int primary key identity(1,1),
	MovieId int FOREIGN KEY REFERENCES MovieInfo(MovieID), --��ӰID
	UserId int FOREIGN KEY REFERENCES Users(ID), --�û�ID
	addTime datetime not null default getdate(), --����ʱ��
	addMoney float not null, --������
	addNumber int not null, --��������
	Seat nvarchar(10) not null, --��λ
	MovieUptime datetime not null --��ӳʱ��
)
create table ShowMovie
(
	id int primary key identity(1,1),
	MovieId int FOREIGN KEY REFERENCES MovieInfo(MovieID), --��ӰID
	upshow datetime not null, --��ӳʱ��
)
create table Seat
(
	id int primary key identity(1,1),
	showId int foreign key references ShowMovie(id), --��ӳʱ��ID
	seatId nvarchar(10) not null, --��λ���
)
create table addtime
(
	id int primary key identity(1,1),
	addtime datetime, --�ϼ�ʱ��
	MovieId int FOREIGN KEY REFERENCES MovieInfo(MovieID), --��ӰID
)