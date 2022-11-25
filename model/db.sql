UNLOCK TABLES;

CREATE DATABASE IF NOT EXISTS `mpdb`;
USE `mpdb`;

DROP TABLE IF EXISTS `Likes`;
DROP TABLE IF EXISTS `Comments`;
DROP TABLE IF EXISTS `User_Bookmarks`;
DROP TABLE IF EXISTS `User_Posts`;
DROP TABLE IF EXISTS `Users`;

-- users table ------
CREATE TABLE `Users` (
  `Username` varchar(20) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Email` varchar(50) NOT NULL, 
  `ProfilePic`  BLOB NOT NULL,
  `DisplayName` varchar(20) NOT NULL, 
  `Bio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Note: All sample passwords are "password" in md5 hash*/
INSERT INTO `users` VALUES ('brylil','5f4dcc3b5aa765d61d8327deb882cf99','brylil@gmail.com','/images/user3.jpeg', 'Bryan', 'Asian traveller'),
('elliamae','5f4dcc3b5aa765d61d8327deb882cf99','ellia@yahoo.com','/images/user1.jpg','Ellia','Hello world! This is my bio'),
('emman','5f4dcc3b5aa765d61d8327deb882cf99','emman@gmail.com','/images/user4.jpg','Emman','Bon voyage!'),
('alexis','5f4dcc3b5aa765d61d8327deb882cf99','alex23@hotmail.com','/images/user2.jpeg','Alexis','I like photography'),
('ccapdev','5f4dcc3b5aa765d61d8327deb882cf99','apdev@gmail.com','/images/user5.jpg','Apdev','This is MP Phase 2.');

LOCK TABLES `users` WRITE;

-- user_posts table ------
UNLOCK TABLES;
CREATE TABLE `User_Posts` (
  `PostID` int NOT NULL AUTO_INCREMENT,   
  `Title` varchar(30) NOT NULL,  
  `Username` varchar(20) NOT NULL,   
  `Photo` BLOB NOT NULL,   
  `Date` DATE NOT NULL,
  `Tags` varchar(50) DEFAULT NULL,
  `Caption` varchar(280) DEFAULT NULL,   
  `LikeCount` int NOT NULL,   
  `BookmarkCount` int NOT NULL,  
  `CommentCount` int NOT NULL,
  PRIMARY KEY (`PostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE User_Posts
	ADD FOREIGN KEY (Username) REFERENCES Users (Username);

INSERT INTO `User_Posts` (`Title`, `Username`, `Photo`, `Date`, `Tags`, `Caption`, `LikeCount`, `BookmarkCount`, `CommentCount`)
VALUES ('Maldives','brylil','/images/myPost1.jpg','2022-11-23','travel, photography, beach','Picture I took!','1','2','1'),
('Philippines','elliamae','/images/myPost2.jpg','2022-11-23','photography, beach','Look at this place!','1','2','2'),
('Sweden','emman','/images/myPost3.jpg','2022-11-23','travel','What a dazzling view','1','1','1'),
('NYC','alexis','/images/myPost4.jpeg','2022-11-23','photo, travel, city','New York City','1','0','0'),
('Toronto','ccapdev','/images/myPost5.jpeg','2022-11-23','city','I am now in Canada wow','1','0','1');

LOCK TABLES `User_Posts` WRITE;

-- Testing Purposes
-- SELECT * FROM User_Posts;
-- SELECT * FROM Users;



-- user_bookmarks table ------
UNLOCK TABLES;
CREATE TABLE `User_Bookmarks` (
  `Username` varchar(20) NOT NULL,
  `PostID` int NOT NULL,   
  PRIMARY KEY (`Username`, `PostID`),
  FOREIGN KEY (`Username`) REFERENCES Users (`Username`),
  FOREIGN KEY (`PostID`) REFERENCES User_Posts (`PostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- UNLOCK TABLES;
/*ALTER TABLE User_Bookmarks
	ADD FOREIGN KEY (Username) REFERENCES Users (Username),
  ADD FOREIGN KEY (PostID) REFERENCES User_Posts (PostID);*/

INSERT INTO `User_Bookmarks` VALUES ('brylil',2),
('elliamae',1),
('emman',3),
('alexis',2),
('alexis',1);

LOCK TABLES `User_Bookmarks` WRITE;


-- Testing Purposes
-- SELECT * FROM User_Bookmarks;
-- SELECT * FROM Users;
-- SELECT * FROM User_Posts;



-- comments table ------
UNLOCK TABLES;
CREATE TABLE `Comments` (
  `CommentID` int NOT NULL AUTO_INCREMENT,   
  `PostID` int NOT NULL,  
  `Username` varchar(20) NOT NULL,   
  `Comment` varchar(280) NOT NULL,   
  `Date` DATE NOT NULL,
  PRIMARY KEY (`CommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE Comments
	ADD FOREIGN KEY (Username) REFERENCES Users (Username),
  ADD FOREIGN KEY (PostID) REFERENCES User_Posts(PostID);

LOCK TABLES `comments` WRITE;

INSERT INTO `comments` (`PostID`, `Username`, `Comment`, `Date`) 
VALUES (1,'emman','This looks good!','2022-11-23'),
(2,'alexis','go girl!','2022-11-23'),
(3,'elliamae','What a nice photo','2022-11-23'),
(2,'ccapdev','I love this!!!','2022-11-23'),
(5,'brylil','First comment','2022-11-23');

-- testing purposes
-- SELECT * FROM comments;
-- SELECT * FROM User_Bookmarks;
-- SELECT * FROM Users;
-- SELECT * FROM User_Posts;

-- likes table ------
UNLOCK TABLES;
CREATE TABLE `Likes` (
  `Username` varchar(20) NOT NULL,
  `PostID` int NOT NULL,   
  PRIMARY KEY (`Username`, `PostID`),
  FOREIGN KEY (`Username`) REFERENCES Users (`Username`),
  FOREIGN KEY (`PostID`) REFERENCES User_Posts (`PostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- UNLOCK TABLES;
/*ALTER TABLE User_Bookmarks
	ADD FOREIGN KEY (Username) REFERENCES Users (Username),
  ADD FOREIGN KEY (PostID) REFERENCES User_Posts (PostID);*/

INSERT INTO `Likes` VALUES ('brylil',5),
('elliamae',4),
('emman',3),
('alexis',2),
('alexis',1);

LOCK TABLES `User_Bookmarks` WRITE;


-- User_Notifications Table --
UNLOCK TABLES;
/*DROP TABLE IF EXISTS `User_Notifications`;
CREATE TABLE `User_Notifications` (
`NotifID` int NOT NULL,    
`Username` varchar(20) NOT NULL,   
`PostID` int NOT NULL, 
`LikeCount` int NOT NULL,
`BookmarkCount` int NOT NULL,
`Photo` BLOB DEFAULT NULL,   
PRIMARY KEY (`NotifID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE User_Notifications 
ADD FOREIGN KEY (Username) REFERENCES Users (Username);

ALTER TABLE User_Notifications 
  ADD FOREIGN KEY (PostID) REFERENCES User_Posts (PostID);
  
INSERT INTO `User_Notifications` VALUES (1,'brylil',1,2,5,''),
(2,'elliamae',2,100,2,''); */

-- testing purposes
 -- sELECT * FROM comments;
-- SELECT * FROM User_Bookmarks;
 -- SELECT * FROM Users;
-- SELECT * FROM User_Posts;
-- SELECT * FROM User_Notifications;

-- table end ----



-- testing purposes
-- SELECT * FROM Users;
-- DELETE FROM Users where Username='brylil';