/*
SQLyog - Free MySQL GUI v5.02
Host - 5.0.19-nt : Database - collegebook
*********************************************************************
Server version : 5.0.19-nt
*/


create database if not exists `collegebook`;

USE `collegebook`;

/*Table structure for table `careers` */

DROP TABLE IF EXISTS `careers`;

CREATE TABLE `careers` (
  `id` mediumint(9) NOT NULL auto_increment,
  `Username` varchar(50) default NULL,
  `Name` varchar(50) default NULL,
  `Degree` varchar(100) default NULL,
  `College` varchar(100) default NULL,
  `Location` varchar(500) default NULL,
  `Company` varchar(100) default NULL,
  `Desgination` varchar(100) default NULL,
  `CurrentAddress` varchar(300) default NULL,
  `CurrentState` varchar(50) default NULL,
  `CareerCompletedDate` date default NULL,
  `CareerCompletedTime` time default NULL,
  `CareerUpdatedDate` date default NULL,
  `CareerUpdatedTime` time default NULL,
  `CareerCompletedSystem_IP` varchar(20) default NULL,
  `CareerUpdatedSystem_IP` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `memoriessnapdetails` */

DROP TABLE IF EXISTS `memoriessnapdetails`;

CREATE TABLE `memoriessnapdetails` (
  `snapId` mediumint(9) NOT NULL auto_increment,
  `snapName` varchar(30) default NULL,
  `uploadedUserName` varchar(30) default NULL,
  `uploadedFriendName` varchar(30) default NULL,
  `uploadedDate` date default NULL,
  `uploadedTime` time default NULL,
  `uploadedSys_IpAddress` varchar(20) default NULL,
  `uploadedStatus` varchar(20) default NULL,
  PRIMARY KEY  (`snapId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `messagedb` */

DROP TABLE IF EXISTS `messagedb`;

CREATE TABLE `messagedb` (
  `id` mediumint(9) NOT NULL auto_increment,
  `ReceiverUsername` varchar(30) NOT NULL,
  `ReceiverName` varchar(30) default NULL,
  `ReceiverMobileno` decimal(20,0) default NULL,
  `SenderUsername` varchar(30) default NULL,
  `SenderName` varchar(30) default NULL,
  `SenderMobileno` decimal(20,0) default NULL,
  `SenderMessage` varchar(500) default NULL,
  `SendDate` date default NULL,
  `SendTime` time default NULL,
  `System_IP` varchar(20) default NULL,
  PRIMARY KEY  (`id`,`ReceiverUsername`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `postsdb` */

DROP TABLE IF EXISTS `postsdb`;

CREATE TABLE `postsdb` (
  `id` mediumint(9) NOT NULL auto_increment,
  `Username` varchar(50) default NULL,
  `Name` varchar(20) default NULL,
  `Post` varchar(500) default NULL,
  `Time` time default NULL,
  `Date` date default NULL,
  `Likecount` decimal(5,0) default NULL,
  `Likeuser` varchar(30) default NULL,
  `Sharedfromfusername` varchar(20) default NULL,
  `Sharedfromfname` varchar(20) default NULL,
  `System_IP` varchar(20) default NULL,
  `Status` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `userdetails` */

DROP TABLE IF EXISTS `userdetails`;

CREATE TABLE `userdetails` (
  `Username` varchar(50) NOT NULL default '',
  `Password` varchar(20) default NULL,
  `Gender` varchar(10) default NULL,
  `DOB` date default NULL,
  `Address` varchar(50) default NULL,
  `City` varchar(30) default NULL,
  `State` varchar(20) default NULL,
  `Mobileno` decimal(10,0) default NULL,
  `Marital` varchar(10) default NULL,
  `Email` varchar(30) NOT NULL default '',
  `Name` varchar(20) default NULL,
  `AccCreatedDate` date default NULL,
  `AccCreatedTime` time default NULL,
  `ProfileCompletedDate` date default NULL,
  `ProfileCompletedTime` time default NULL,
  `ProfileUpdatedDate` date default NULL,
  `ProfileUpdatedTime` time default NULL,
  `AccCreatedSystem_IP` varchar(20) default NULL,
  `ProfileCompletedSystem_IP` varchar(20) default NULL,
  `ProfileUpdatedSystem_IP` varchar(20) default NULL,
  `AccountVerificationCode` varchar(50) default NULL,
  `IsNewUser` varchar(10) default NULL,
  `IsProfileCompleted` varchar(20) default NULL,
  PRIMARY KEY  (`Username`,`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
