create database tourismDB;
use tourismDB;
create table destination(
destinationid bigint primary key,
destinationname varchar(30) not null,
city varchar(24),
region varchar(20),
category varchar(20),
bestvisitseason varchar(20),
description varchar(100));
desc destinations;

create table attractions(
attractionid int primary key,
destinationid bigint,
attractionname varchar(24),
attractiontype varchar(28),
entryfee varchar(20),
timings varchar(40),
constraint fk_destinationid foreign key attractions(destinationid) references destination(destinationid)); -- (columnname) in brackets

create table hotels(
hotelid int primary key,
destinationid bigint,
hotelname varchar(28),
starrating int(6),
pricepernight int(10),
contactnumber varchar(20),
constraint  fk_hotelsdestinationid foreign key hotels(destinationid) references destination(destinationid));

create table blogposts(
blogid int primary key,
destinationid bigint,
title varchar(50),
publishdate varchar(20),
summary varchar(34),
constraint fk_blogpostsdestinationid foreign key blogposts(destinationid) references destination(destinationid)  );

alter table blogposts add column author varchar(24);

create table users(
userid int primary key,
name varchar(24),
email varchar(24),
city varchar(15),
joindate varchar(24));

create table reviews(
reviewid bigint primary key,
destinationid bigint,
userid int,
rating int,
comment varchar(24),
reviewdate varchar(28),
constraint fk_reviewdestinationid foreign key reviews(destinationid) references destination(destinationid),
constraint fk_userid foreign key reviews(userid) references users(userid));

create table festivals(
festivalid int primary key,
destinationid bigint,
festivalname varchar(24),
month varchar(20),
description varchar(40),
constraint fk_festivalsdestinationid foreign key festivals(destinationid) references destination(destinationid));

alter table destination rename to destinations;

desc destinations;
alter table destinations drop column description;

INSERT INTO Destinations VALUES (1, 'Gateway of India', 'Mumbai', 'Konkan', 'Historical', 'Winter'),
(2, 'Ajanta Caves', 'Aurangabad', 'Marathwada', 'Historical', 'Winter'),
(3, 'Ellora Caves', 'Aurangabad', 'Marathwada', 'Historical', 'Winter'),
(4, 'Mahabaleshwar', 'Mahabaleshwar', 'Western Maharashtra', 'Hill Station', 'Summer'),
(5, 'Lonavala', 'Lonavala', 'Western Maharashtra', 'Hill Station','Monsoon'),
(6, 'Tadoba National Park', 'Chandrapur', 'Vidarbha', 'Wildlife', 'Winter'),
(7, 'Shirdi', 'Shirdi', 'Western Maharashtra', 'Religious', 'Winter'),
(8, 'Alibaug Beach', 'Alibaug', 'Konkan', 'Beach', 'Winter'),
(9, 'Raigad Fort', 'Raigad', 'Konkan', 'Historical', 'Monsoon'),
(10, 'Malshej Ghat', 'Pune', 'Western Maharashtra', 'Nature', 'Monsoon');

select * from destinations;
desc attractions;
insert into destinations (destinationid,destinationname,city,region,category,bestvisitseason) values (9,'Raigad Fort','Raigad','Konkan','Historical','Monsoon');
delete from destinations where destinationid=9;
use tourismdb;
INSERT INTO Destinations (DestinationID, DestinationName, City, Region, Category, BestVisitSeason)
VALUES (11, 'Ganpatipule', 'Ratnagiri', 'Konkan', 'Beach', 'Winter'),
(12, 'DagdushethHalwai GanpatiTemple', 'Pune', 'Western Maharashtra', 'Religious', 'Winter'),
(13, 'Pandharpur', 'Solapur', 'Western Maharashtra', 'Religious', 'Monsoon');

INSERT INTO Attractions
(AttractionID, DestinationID, AttractionName, AttractionType, EntryFee, Timings)
VALUES (1, 1, 'Arabian Sea View', 'Scenic Spot', 'Free', 'Open 24 Hours'),
(2, 2, 'Cave Paintings', 'Historical Site', '₹40', '9:00 AM - 5:30 PM'),
(3, 3, 'Kailasa Temple', 'Temple', '₹40', '6:00 AM - 6:00 PM'),
(4, 4, 'Arthur Seat Point', 'View Point', 'Free', '6:00 AM - 7:00 PM'),
(5, 5, 'Tiger Point', 'View Point', 'Free', 'Open 24 Hours'),
(6, 6, 'Tiger Safari', 'Wildlife Safari', '₹1500', '6:00 AM - 10:00 AM'),
(7, 7, 'Sai Baba Samadhi', 'Temple', 'Free', '4:00 AM - 11:00 PM'),
(8, 8, 'Kolaba Fort', 'Historical Fort', '₹20', '8:00 AM - 6:00 PM'),
(9, 9, 'Raj Darbar', 'Historical Site', '₹25', '8:00 AM - 6:00 PM'),(10, 10, 'Harishchandragad View', 'Nature Spot', 'Free', 'Open 24 Hours'),
(11, 11, 'Ganpatipule Beach', 'Beach', 'Free', 'Open 24 Hours'),
(12, 11, 'Ganpati Temple', 'Temple', 'Free', '5:00 AM - 9:00 PM'),
(13, 12, 'Main Ganesh Shrine', 'Temple', 'Free', '6:00 AM - 11:00 PM'),
(14, 13, 'Vitthal Rukmini Temple', 'Temple', 'Free', '5:00 AM - 11:00 PM'),
(15, 13, 'Chandrabhaga River Ghat', 'Pilgrimage Spot', 'Free', 'Open 24 Hours');

desc blogposts;
INSERT INTO Festivals
(FestivalID, DestinationID, FestivalName, Month, Description)
VALUES
(1, 1, 'Mumbai Festival', 'January', 'Celebrates Mumbai culture and heritage'),
(2, 2, 'Ajanta Ellora Festival', 'March', 'Classical dance and music festival'),
(3, 3, 'Ajanta Ellora Festival', 'March', 'Cultural performances at Ellora'),
(4, 4, 'Strawberry Festival', 'April', 'Celebration of strawberry harvest'),
(5, 5, 'Monsoon Festival', 'July', 'Music and food during monsoon'),
(6, 6, 'Wildlife Week', 'October', 'Wildlife awareness and safaris'),
(7, 7, 'Ram Navami', 'April', 'Major celebration at Sai Baba Temple'),
(8, 8, 'Narali Purnima', 'August', 'Fisherfolk celebrate the sea'),
(9, 9, 'Shiv Jayanti', 'February', 'Honouring Chhatrapati Shivaji Maharaj'),
(10, 10, 'Monsoon Nature Festival', 'August', 'Nature walks and photography'),
(11, 11, 'Maghi Ganesh Festival', 'February', 'Grand celebration at Ganpatipule'),
(12, 12, 'Ganesh Chaturthi', 'September', 'Largest Ganesh celebrations'),
(13, 13, 'Ashadhi Ekadashi', 'July', 'Annual Wari pilgrimage to Pandharpur');

delete from festivals where festivalid=3;
insert into festivals values(3, 3, 'Ajanta Ellora Festival', 'March', 'Cultural performances at Ellora');
select * from festivals;
select * from destinations where destinationid=3;

INSERT INTO BlogPosts
(BlogID, DestinationID, Title, PublishDate, Summary, Author)
VALUES
(1, 1,'Top Things to Do at Gateway of India','2025-01-10','Explore iconic waterfront in Mumbai','Aditi Joshi'),
(2, 2,'Why Ajanta Caves Are a Must Visit','2025-02-15','Discover ancient Buddhist art.','Rahul Patil'),
(3, 3,'Exploring the Magnificent Ellora Caves','2025-02-20','Journey through rock-cut wonders.','Neha Kulkarni'),
(4, 4,'Weekend Guide to Mahabaleshwar','2025-03-18','Best viewpoints and strawberries.','Sneha Deshmukh'),
(5, 5,'Lonavala During the Monsoon','2025-07-12','Experience lush green valleys.','Kunal Shinde'),
(6, 6,'Tiger Safari at Tadoba','2025-04-05','Tips for an exciting safari.','Vivek More'),
(7, 7,'A Spiritual Visit to Shirdi','2025-05-08','Plan your Sai Baba pilgrimage.','Priya Pawar'),
(8, 8,'Perfect Weekend at Alibaug','2025-06-15','Beaches, forts and local food.','Rohan Sawant'),
(9, 9,'History of Raigad Fort','2025-02-19','Explore Shivaji Maharaj''s capital.','Amruta Patil'),
(10, 10,'Nature Escape to Malshej Ghat','2025-08-02','Waterfalls, trekking and mist.','Akash Jadhav'),
(11, 11,'Ganpatipule Beach Travel Guide','2025-11-14','Temple, beach and local cuisine.','Pooja Naik'),
(12, 12,'Visiting Dagdusheth Ganpati','2025-09-05','Everything firsttime visitors need','Saurabh Kulkarni'),
(13, 13,'Experience Ashadhi Wari','2025-07-01','Witness biggest pilgrimage of Maharashtra','Meera Chavan');
desc blogposts;
alter table blogposts modify column summary varchar(50);

select * from users;
use tourismdb;
-- hotels review users to add

INSERT INTO Destinations
(DestinationID, DestinationName, City, Region, Category, BestVisitSeason)
VALUES
(14,'Sindhudurg Fort','Malvan','Konkan','Historical','Winter'),
(15,'Bhimashankar Temple','Pune','Western Maharashtra','Religious','Monsoon'),
(16,'Harihareshwar Beach','Raigad','Konkan','Beach','Winter'),
(17,'Lonar Lake','Buldhana','Vidarbha','Nature','Winter'),
(18,'Chikhaldara','Amravati','Vidarbha','Hill Station','Winter'),
(19,'Kaas Plateau','Satara','Western Maharashtra','Nature','Monsoon'),
(20,'Pratapgad Fort','Satara','Western Maharashtra','Historical','Monsoon'),
(21,'Bhandardara','Ahmednagar','Western Maharashtra','Nature','Monsoon'),
(22,'Murud-Janjira Fort','Raigad','Konkan','Historical','Winter'),
(23,'Amboli','Sindhudurg','Konkan','Hill Station','Monsoon'),
(24,'Trimbakeshwar Temple','Nashik','North Maharashtra','Religious','Winter'),
(25,'Igatpuri','Nashik','North Maharashtra','Hill Station','Monsoon'),
(26,'Matheran','Raigad','Konkan','Hill Station','Winter'),
(27,'Pench National Park','Nagpur','Vidarbha','Wildlife','Winter'),
(28,'Naneghat','Pune','Western Maharashtra','Historical','Monsoon');

INSERT INTO Attractions (AttractionID,DestinationID,AttractionName,AttractionType,EntryFee,Timings) VALUES
(16,14,'Sindhudurg Fort','Historical Fort','₹100','9:00 AM - 5:30 PM'),
(17,14,'Shivaji Memorial','Memorial','Free','9:00 AM - 6:00 PM'),
(18,15,'Jyotirlinga Shrine','Temple','Free','4:30 AM - 9:30 PM'),
(19,15,'Temple Forest Trail','Nature Trail','Free','6:00 AM - 6:00 PM'),
(20,16,'Harihareshwar Beach','Beach','Free','Open 24 Hours'),
(21,16,'Kalbhairav Temple','Temple','Free','6:00 AM - 8:00 PM'),
(22,17,'Lonar Crater Lake','Nature Spot','₹50','8:00 AM - 6:00 PM'),
(23,18,'Sunrise Point','View Point','Free','6:00 AM - 7:00 PM'),
(24,18,'Gavilgad Fort','Historical Fort','₹25','8:00 AM - 5:30 PM'),
(25,19,'Flower Valley','Nature Reserve','₹100','8:00 AM - 6:00 PM'),
(26,20,'Pratapgad Fort','Historical Fort','₹20','8:00 AM - 6:00 PM'),
(27,21,'Arthur Lake','Lake','Free','Open 24 Hours'),
(28,21,'Randha Falls','Waterfall','Free','7:00 AM - 6:30 PM'),
(29,22,'Janjira Fort','Historical Fort','₹50','8:00 AM - 5:30 PM'),
(30,23,'Amboli Waterfall','Waterfall','Free','Open 24 Hours'),
(31,24,'Kushavarta Kund','Holy Tank','Free','5:00 AM - 8:00 PM'),
(32,25,'Camel Valley','View Point','Free','Open 24 Hours'),
(33,26,'Panorama Point','View Point','Free','5:30 AM - 7:00 PM'),
(34,27,'Tiger Safari','Wildlife Safari','₹1500','6:00 AM - 10:00 AM'),
(35,28,'Naneghat Caves','Historical Cave','₹25','7:00 AM - 6:00 PM');

select * from attractions;
select * from destinations;

INSERT INTO Festivals(FestivalID,DestinationID,FestivalName,Month,Description) VALUES
(14,14,'Malvan Festival','December','Cultural festival by the sea'),
(15,15,'Mahashivratri','February','Grand celebration at the temple'),
(16,16,'Narali Purnima','August','Traditional coastal festival'),
(17,17,'Lonar Festival','November','Promotes the crater lake'),
(18,18,'Chikhaldara Festival','January','Showcases local culture'),
(19,19,'Kaas Flower Festival','September','Celebrates blooming flowers'),
(20,20,'Shiv Jayanti','February','Honours Shivaji Maharaj'),
(21,21,'Fireflies Festival','June','Nature festival before monsoon'),
(22,22,'Janjira Festival','December','Celebrates fort heritage'),
(23,23,'Amboli Monsoon Festival','July','Music and nature events'),
(24,24,'Maha Shivratri','February','Major temple celebrations'),
(25,25,'Igatpuri Monsoon Fest','July','Monsoon trekking events'),
(26,26,'Matheran Festival','December','Cultural performances'),
(27,27,'Wildlife Week','October','Tiger conservation programs'),
(28,28,'Naneghat Trek Festival','August','Historic trekking event');

INSERT INTO BlogPosts(BlogID,DestinationID,Title,PublishDate,Summary,Author) VALUES
(14,14,'Discover Sindhudurg Fort','2025-10-10','Explore Shivaji''s sea fort.','Rohan Patil'),
(15,15,'Pilgrimage to Bhimashankar','2025-08-14','Visit a sacred Jyotirlinga.','Sneha Joshi'),
(16,16,'Relax at Harihareshwar Beach','2025-11-03','Beach and temple getaway.','Aditi Kulkarni'),
(17,17,'Mystery of Lonar Lake','2025-09-18','India''s meteor crater lake.','Kunal More'),
(18,18,'Weekend in Chikhaldara','2025-01-20','Nature and viewpoints await.','Neha Deshmukh'),
(19,19,'Flowers of Kaas Plateau','2025-09-08','Witness seasonal blooms.','Priya Patil'),
(20,20,'History of Pratapgad Fort','2025-06-15','Walk through Maratha history.','Rahul Shinde'),
(21,21,'Escape to Bhandardara','2025-07-05','Lakes and waterfalls galore.','Pooja Sawant'),
(22,22,'Visit Murud-Janjira Fort','2025-12-01','Explore the island fortress.','Akash Chavan'),
(23,23,'Monsoon Magic in Amboli','2025-07-25','Experience misty landscapes.','Meera Naik'),
(24,24,'Trimbakeshwar Travel Guide','2025-02-12','Temple and spiritual journey.','Vivek Pawar'),
(25,25,'Why Visit Igatpuri?','2025-08-28','Perfect for trekking lovers.','Amruta Jadhav'),
(26,26,'A Day in Matheran','2025-12-15','Enjoy a vehicle-free retreat.','Saurabh Kulkarni'),
(27,27,'Tiger Safari at Pench','2025-03-22','Best safari travel tips.','Nikhil Patil'),
(28,28,'Explore Ancient Naneghat','2025-08-09','Historic pass with caves.','Shweta More');

select * from festivals;
select * from blogposts;

desc users;
desc reviews;

INSERT INTO Hotels(HotelID,DestinationID,HotelName,StarRating,PricePerNight,ContactNumber) VALUES
(1,1,'The Taj Palace',5,8500,'9876500001'),
(2,2,'Ajanta Residency',4,4200,'9876500002'),
(3,3,'Ellora Heritage',4,4500,'9876500003'),
(4,4,'Hill View Resort',4,5200,'9876500004'),
(5,5,'Lonavala Retreat',5,7000,'9876500005'),
(6,6,'Tadoba Jungle Camp',4,6500,'9876500006'),
(7,7,'Sai Palace',3,2800,'9876500007'),
(8,8,'Alibaug Beach Resort',4,6000,'9876500008'),
(9,9,'Raigad Fort View',3,3200,'9876500009'),
(10,10,'Malshej Nature Stay',4,4800,'9876500010'),
(11,11,'Ganpatipule Beach Resort',5,7200,'9876500011'),
(12,12,'Ganesh Inn',3,2600,'9876500012'),
(13,13,'Vitthal Residency',3,2400,'9876500013'),
(14,14,'Sindhudurg Sea View',4,5500,'9876500014'),
(15,15,'Bhimashankar Lodge',3,2200,'9876500015'),
(16,16,'Harihareshwar Resort',4,5000,'9876500016'),
(17,17,'Lonar Lake Resort',4,4600,'9876500017'),
(18,18,'Chikhaldara Heights',4,5100,'9876500018'),
(19,19,'Kaas Valley Resort',4,5800,'9876500019'),
(20,20,'Pratapgad Stay',3,2700,'9876500020'),
(21,21,'Bhandardara Lake View',4,5300,'9876500021'),
(22,22,'Janjira Beach Hotel',4,6100,'9876500022'),
(23,23,'Amboli Mist Resort',4,4900,'9876500023'),
(24,24,'Trimbak Residency',3,3000,'9876500024'),
(25,25,'Igatpuri Hills',4,5600,'9876500025'),
(26,26,'Matheran Green Stay',4,5400,'9876500026'),
(27,27,'Pench Safari Resort',5,7800,'9876500027'),
(28,28,'Naneghat Eco Camp',3,2500,'9876500028'),
(29,4,'Strawberry Valley Hotel',5,7600,'9876500029'),
(30,8,'Konkan Holiday Inn',4,5900,'9876500030');

select * from hotels;
INSERT INTO Users(UserID,Name,Email,City,JoinDate) VALUES
(1,'Aarav Patil','aarav01@gmail.com','Mumbai','2025-01-10'),
(2,'Sneha Joshi','sneha02@gmail.com','Pune','2025-01-18'),
(3,'Rohan Kulkarni','rohan03@gmail.com','Nashik','2025-02-01'),
(4,'Priya Deshmukh','priya04@gmail.com','Nagpur','2025-02-15'),
(5,'Kunal Shinde','kunal05@gmail.com','Kolhapur','2025-03-01'),
(6,'Neha Patil','neha06@gmail.com','Thane','2025-03-09'),
(7,'Akash Pawar','akash07@gmail.com','Aurangabad','2025-03-20'),
(8,'Pooja More','pooja08@gmail.com','Ratnagiri','2025-04-02'),
(9,'Vivek Jadhav','vivek09@gmail.com','Satara','2025-04-15'),
(10,'Meera Chavan','meera10@gmail.com','Solapur','2025-04-30'),
(11,'Saurabh Naik','saurabh11@gmail.com','Amravati','2025-05-05'),
(12,'Nikhil Patil','nikhil12@gmail.com','Raigad','2025-05-16'),
(13,'Aditi Sawant','aditi13@gmail.com','Sindhudurg','2025-05-29'),
(14,'Rahul More','rahul14@gmail.com','Pune','2025-06-03'),
(15,'Shweta Patil','shweta15@gmail.com','Mumbai','2025-06-10'),
(16,'Ankit Joshi','ankit16@gmail.com','Ahmednagar','2025-06-20'),
(17,'Rutuja Kale','rutuja17@gmail.com','Nashik','2025-07-02'),
(18,'Om Chavan','om18@gmail.com','Chandrapur','2025-07-08'),
(19,'Tejas Shinde','tejas19@gmail.com','Latur','2025-07-18'),
(20,'Sakshi Patil','sakshi20@gmail.com','Pune','2025-08-01'),
(21,'Yash Kulkarni','yash21@gmail.com','Mumbai','2025-08-10'),
(22,'Isha Pawar','isha22@gmail.com','Nagpur','2025-08-22'),
(23,'Harsh More','harsh23@gmail.com','Jalgaon','2025-09-05'),
(24,'Riya Jadhav','riya24@gmail.com','Ratnagiri','2025-09-15'),
(25,'Aditya Patil','aditya25@gmail.com','Kolhapur','2025-10-01'),
(26,'Anuja Desai','anuja26@gmail.com','Satara','2025-10-14'),
(27,'Parth Shah','parth27@gmail.com','Thane','2025-10-25'),
(28,'Kriti Naik','kriti28@gmail.com','Pune','2025-11-08'),
(29,'Manav Joshi','manav29@gmail.com','Navi Mumbai','2025-11-20'),
(30,'Simran More','simran30@gmail.com','Aurangabad','2025-12-01');
select * from users;
INSERT INTO Reviews(ReviewID,DestinationID,UserID,Rating,Comment,ReviewDate) VALUES
(1,1,1,5,'Amazing landmark','2025-02-01'),
(2,2,2,5,'Beautiful caves','2025-02-18'),
(3,3,3,4,'Worth visiting','2025-03-05'),
(4,4,4,5,'Loved the weather','2025-03-20'),
(5,5,5,4,'Great weekend','2025-04-02'),
(6,6,6,5,'Fantastic safari','2025-04-18'),
(7,7,7,5,'Peaceful temple','2025-05-01'),
(8,8,8,4,'Clean beach','2025-05-12'),
(9,9,9,5,'Rich history','2025-05-25'),
(10,10,10,5,'Beautiful waterfalls','2025-06-05'),
(11,11,11,5,'Lovely beach','2025-06-18'),
(12,12,12,5,'Divine experience','2025-07-01'),
(13,13,13,5,'Spiritual journey','2025-07-15'),
(14,14,14,4,'Historic fort','2025-08-01'),
(15,15,15,5,'Very peaceful','2025-08-10'),
(16,16,16,4,'Relaxing place','2025-08-22'),
(17,17,17,5,'Unique lake','2025-09-02'),
(18,18,18,4,'Scenic views','2025-09-18'),
(19,19,19,5,'Colorful flowers','2025-09-30'),
(20,20,20,5,'Great fort','2025-10-08'),
(21,21,21,4,'Nice lake','2025-10-18'),
(22,22,22,5,'Amazing fort','2025-11-01'),
(23,23,23,5,'Lovely monsoon','2025-11-15'),
(24,24,24,5,'Sacred temple','2025-11-28'),
(25,25,25,4,'Great trek','2025-12-05'),
(26,26,26,5,'Peaceful hill','2025-12-12'),
(27,27,27,5,'Best safari','2025-12-18'),
(28,28,28,4,'Historic pass','2025-12-22'),
(29,8,29,5,'Excellent beach','2025-12-26'),
(30,4,30,5,'Will visit again','2025-12-30');

select * from reviews;
use tourismdb;

SELECT d.destinationname,
       h.hotelname,
       h.starrating,
       h.pricepernight
FROM Destinations d
RIGHT JOIN Hotels h
ON d.DestinationID = h.DestinationID;

SELECT d.DestinationName,
       d.City,
       a.AttractionName,
       a.AttractionType
FROM Destinations d
INNER JOIN Attractions a
ON d.DestinationID = a.DestinationID;

SELECT d.destinationname,
       h.hotelname,
       h.starrating,
       h.pricepernight
FROM destinations d
JOIN hotels h
ON d.destinationid = h.destinationid
WHERE h.pricepernight < 3000
ORDER BY h.pricepernight;

CREATE VIEW TopRatedDestinations AS
SELECT
    d.destinationname AS Destination,
    r.rating AS Rating,
    r.comment AS Review,
    r.reviewdate AS ReviewDate
FROM destinations d
JOIN reviews r
ON d.destinationid = r.destinationid
WHERE r.rating >= 3;

select * from toprateddestinations;

SELECT d.DestinationName,
       f.FestivalName,
       f.Month
FROM Destinations d
LEFT JOIN Festivals f
ON d.DestinationID = f.DestinationID;

SELECT
    d.destinationname,
    h.hotelname,
    h.starrating,
    h.pricepernight
FROM destinations d
RIGHT JOIN hotels h
ON d.destinationid = h.destinationid
WHERE h.pricepernight < 3000
ORDER BY h.pricepernight;



SELECT
    d.destinationname,
    r.rating,
    r.comment
FROM destinations d
LEFT JOIN reviews r
ON d.destinationid = r.destinationid
ORDER BY d.destinationname;

INSERT INTO blogposts (blogid, destinationid, title, publishdate, summary, author)
VALUES(1,1,'Explore Gateway of India','2025-01-10','Iconic landmark guide','Aditi'),
(2,1,'Marine Drive Evening Walk','2025-02-14','Nearby attractions','Rahul'),
(3,1,'Colaba Travel Guide','2025-03-08','Local markets and cafes','Sneha'),
(4,1,'One Day in South Mumbai','2025-04-18','Complete itinerary','Karan'),
(5,2,'Ajanta Caves Travel Guide','2025-01-20','Ancient Buddhist caves','Priya'),
(6,2,'Ajanta Paintings Explained','2025-02-28','Historic wall art','Neha'),
(7,2,'Best Time to Visit Ajanta','2025-04-12','Travel tips','Rohan'),
(8,3,'Ellora Caves Guide','2025-01-30','Explore cave complex','Amit'),
(9,3,'Kailasa Temple Marvel','2025-03-11','Rock-cut architecture','Sneha'),
(10,3,'Ajanta vs Ellora','2025-05-15','Which to visit first','Rahul'),
(11,4,'Mahabaleshwar Weekend Trip','2025-02-05','Perfect getaway','Neha'),
(12,4,'Top Viewpoints','2025-06-18','Scenic locations','Aditi'),
(13,4,'Strawberry Season Guide','2025-07-02','Best time to visit','Karan'),
(14,5,'Lonavala in Monsoon','2025-02-22','Rainy season guide','Sneha'),
(15,5,'Bhushi Dam Visit','2025-03-30','Popular attraction','Priya'),
(16,5,'Tiger Point Guide','2025-05-27','Sunrise viewpoint','Rohan'),
(17,6,'Tadoba Safari Guide','2025-01-17','Wildlife adventure','Rahul'),
(18,6,'Tiger Spotting Tips','2025-04-05','Safari planning','Neha'),
(19,7,'Shirdi Temple Guide','2025-02-09','Pilgrimage tips','Aditi'),
(20,7,'Sai Baba Darshan','2025-03-21','Visitor information','Sneha'),
(21,8,'Alibaug Beach Guide','2025-01-25','Beach activities','Rohan'),
(22,8,'Weekend in Alibaug','2025-05-08','Travel itinerary','Rahul'),
(23,9,'Raigad Fort Trek','2025-03-16','Fort exploration','Karan'),
(24,9,'History of Raigad','2025-06-22','Maratha heritage','Neha'),
(25,11,'Ganpatipule Beach Guide','2025-04-15','Beach and temple','Priya'),
(26,11,'Things to Do in Ganpatipule','2025-06-10','Travel tips','Amit'),
(27,13,'Pandharpur Pilgrimage','2025-07-05','Temple visit guide','Sneha'),
(28,14,'Sindhudurg Fort Guide','2025-07-20','Sea fort history','Rahul');


SELECT
    d.destinationname,
    d.city,
    h.hotelname,
    h.starrating,
    h.pricepernight
FROM destinations d
LEFT JOIN hotels h
ON d.destinationid = h.destinationid
ORDER BY d.destinationname;


SELECT
    d.destinationname,
    b.title AS BlogPost,
    r.rating,
    r.comment
FROM destinations d
LEFT JOIN blogposts b
ON d.destinationid = b.destinationid
LEFT JOIN reviews r
ON d.destinationid = r.destinationid

UNION

SELECT
    d.destinationname,
    b.title AS BlogPost,
    r.rating,
    r.comment
FROM destinations d
RIGHT JOIN blogposts b
ON d.destinationid = b.destinationid
LEFT JOIN reviews r
ON d.destinationid = r.destinationid;

SELECT
    f1.festivalname AS Festival1,
    f2.festivalname AS Festival2,
    f1.month
FROM festivals f1
JOIN festivals f2
ON f1.month = f2.month
AND f1.festivalname != f2.festivalname; 

select * from festivals;

SELECT hotelname, pricepernight,destinationid
FROM hotels h
WHERE pricepernight < (
    SELECT AVG(pricepernight)
    FROM hotels);


select avg(pricepernight) from hotels;
select * from hotels;
SELECT attractionname, attractiontype
FROM attractions
WHERE destinationid IN (
    SELECT destinationid
    FROM festivals
);

select * from attractions;
select * from festivals;

SELECT festivalid, destinationid, festivalname, month
FROM festivals
WHERE month = (
    SELECT month
    FROM festivals
    WHERE festivalname = 'Ashadhi Ekadashi'
);

SELECT destinationid,hotelname, pricepernight
FROM hotels
WHERE destinationid IN (
    SELECT DISTINCT destinationid
    FROM reviews
    WHERE rating = 5
);

SELECT destinationid,blogid,summary 
FROM blogposts 
WHERE publishdate = (SELECT MAX(publishdate) FROM blogposts) ;


truncate blogposts;

SELECT destinationname,city
FROM destinations
WHERE destinationid IN (
    SELECT destinationid
    FROM blogposts
    GROUP BY destinationid
    HAVING COUNT(*) > 1
);

 SELECT destinationid
    FROM blogposts
    GROUP BY destinationid
    HAVING COUNT(*) > 1;

CREATE VIEW PopularDestinationBlogPosts AS
SELECT
    d.destinationname,
    b.title,
    b.author,
    b.publishdate
FROM destinations d
JOIN blogposts b
ON d.destinationid = b.destinationid
ORDER BY d.destinationname, b.publishdate;

select * from PopularDestinationBlogposts;

SELECT
d.DestinationName,
r.Rating,
r.Comment,
r.ReviewDate
FROM Destinations d
RIGHT JOIN Reviews r
ON d.DestinationID=r.DestinationID;

select * from destinations;

SELECT
d1.DestinationName AS Destination1,
d2.DestinationName AS Destination2,
d1.Region
FROM Destinations d1
JOIN Destinations d2
ON d1.Region=d2.Region
AND d1.DestinationID<d2.DestinationID;

CREATE VIEW TravelPlanner AS
SELECT
d.DestinationName,
d.City,
a.AttractionName,
f.FestivalName,
f.Month
FROM Destinations d
LEFT JOIN Attractions a
ON d.DestinationID=a.DestinationID
LEFT JOIN Festivals f
ON d.DestinationID=f.DestinationID;

select * from travelplanner;

use tourismdb;

select destinationname,city,region from destinations where region="konkan";

select * from hotels;

select * from hotels where pricepernight<2500;

select * from festivals where month="january";

select * from attractions;

select * from attractions where attractiontype in ("historical fort","historical site","historical cave");

select * from blogposts where publishdate>"2025-01-01";

select destinationname from destinations where destinationname like "m%";

select * from hotels where starrating>4;

select * from reviews where rating<3;

select * from destinations order by destinationname asc;

select * from hotels order by pricepernight desc limit 5;

select count(destinationname) from destinations;

select count(distinct(destinationid))  from hotels;

select min(pricepernight) from hotels;

select max(pricepernight) from hotels order by region;

select max(pricepernight) from hotels;
select destinationid,count(*) as n0_of_hotels_for_that_destination from hotels group by destinationid;
select * from festivals;
select destinationid,avg(pricepernight) from hotels group by destinationid;
-- count festivals in each month
select count(festivalid),month from festivals group by month;

select avg(pricepernight),hotelname from hotels group by hotelname;

select count(blogid),destinationid from blogposts group by destinationid;

select max(h.pricepernight) as highest_price,d.region ,h.hotelname
from hotels h 
join destinations d 
on h.destinationid=d.destinationid 
group by d.region ;

select count(destinationid),region 
from destinations 
group by region
having count(destinationid)>5;

-- hotels whose avg room price is above 4000

select count(blogid),destinationid from blogposts group by destinationid having count(blogid)>2;
-- Show every destination along with its hotel
select d.destinationname,d.destinationid,h.hotelname 
FROM destinations d 
LEFT JOIN hotels h
on d.destinationid=h.destinationid;

SELECT d.destinationid,d.destinationname,a.attractionname,a.attractiontype 
FROM attractions a
RIGHT JOIN destinations d
ON a.destinationid=d.destinationid;

select d.destinationname,r.reviewid,r.comment,r.reviewdate from destinations d join reviews r on d.destinationid=r.destinationid;

select d1.destinationname,d2.destinationname,d1.region from destinations d1 join destinations d2 on d1.region=d2.region and d1.destinationid<d2.destinationid; 

select hotelname,pricepernight from hotels where pricepernight>(select avg(pricepernight) from hotels);