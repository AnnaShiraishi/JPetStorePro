/*
Navicat MySQL Data Transfer

Source Server         : 1
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : jpetstore

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2021-01-06 20:09:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `userid` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `firstname` varchar(80) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `status` varchar(2) DEFAULT NULL,
  `addr1` varchar(80) NOT NULL,
  `addr2` varchar(40) DEFAULT NULL,
  `city` varchar(80) NOT NULL,
  `state` varchar(80) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `phone` varchar(80) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('a', 'acid@yourdomain.com', 'ABC', 'XYX', null, '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('j2ee', 'yourname@yourdomain.com', 'ABC', 'XYX', 'OK', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');

-- ----------------------------
-- Table structure for bannerdata
-- ----------------------------
DROP TABLE IF EXISTS `bannerdata`;
CREATE TABLE `bannerdata` (
  `favcategory` varchar(80) NOT NULL,
  `bannername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`favcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bannerdata
-- ----------------------------
INSERT INTO `bannerdata` VALUES ('BIRDS', '<image src=\"../images/banner_birds.gif\">');
INSERT INTO `bannerdata` VALUES ('CATS', '<image src=\"../images/banner_cats.gif\">');
INSERT INTO `bannerdata` VALUES ('DOGS', '<image src=\"../images/banner_dogs.gif\">');
INSERT INTO `bannerdata` VALUES ('FISH', '<image src=\"../images/banner_fish.gif\">');
INSERT INTO `bannerdata` VALUES ('REPTILES', '<image src=\"../images/banner_reptiles.gif\">');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `userid` varchar(80) NOT NULL,
  `itemid` varchar(10) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `catid` varchar(10) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `descn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('BIRDS', 'Birds', '<image src=\"../images/birds_icon.gif\"><font size=\"5\" color=\"blue\"> Birds</font>');
INSERT INTO `category` VALUES ('CATS', 'Cats', '<image src=\"../images/cats_icon.gif\"><font size=\"5\" color=\"blue\"> Cats</font>');
INSERT INTO `category` VALUES ('DOGS', 'Dogs', '<image src=\"../images/dogs_icon.gif\"><font size=\"5\" color=\"blue\"> Dogs</font>');
INSERT INTO `category` VALUES ('FISH', 'Fish', '<image src=\"../images/fish_icon.gif\"><font size=\"5\" color=\"blue\"> Fish</font>');
INSERT INTO `category` VALUES ('REPTILES', 'Reptiles', '<image src=\"../images/reptiles_icon.gif\"><font size=\"5\" color=\"blue\"> Reptiles</font>');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `itemid` varchar(10) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('EST-1', '9995');
INSERT INTO `inventory` VALUES ('EST-10', '9985');
INSERT INTO `inventory` VALUES ('EST-11', '9976');
INSERT INTO `inventory` VALUES ('EST-12', '10000');
INSERT INTO `inventory` VALUES ('EST-13', '9978');
INSERT INTO `inventory` VALUES ('EST-14', '9990');
INSERT INTO `inventory` VALUES ('EST-15', '10000');
INSERT INTO `inventory` VALUES ('EST-16', '9946');
INSERT INTO `inventory` VALUES ('EST-17', '10000');
INSERT INTO `inventory` VALUES ('EST-18', '9989');
INSERT INTO `inventory` VALUES ('EST-19', '9960');
INSERT INTO `inventory` VALUES ('EST-2', '10000');
INSERT INTO `inventory` VALUES ('EST-20', '9974');
INSERT INTO `inventory` VALUES ('EST-21', '10000');
INSERT INTO `inventory` VALUES ('EST-22', '10000');
INSERT INTO `inventory` VALUES ('EST-23', '10000');
INSERT INTO `inventory` VALUES ('EST-24', '10000');
INSERT INTO `inventory` VALUES ('EST-25', '10000');
INSERT INTO `inventory` VALUES ('EST-26', '9978');
INSERT INTO `inventory` VALUES ('EST-27', '10000');
INSERT INTO `inventory` VALUES ('EST-28', '10000');
INSERT INTO `inventory` VALUES ('EST-3', '10000');
INSERT INTO `inventory` VALUES ('EST-4', '9990');
INSERT INTO `inventory` VALUES ('EST-5', '10000');
INSERT INTO `inventory` VALUES ('EST-6', '9992');
INSERT INTO `inventory` VALUES ('EST-7', '10000');
INSERT INTO `inventory` VALUES ('EST-8', '10000');
INSERT INTO `inventory` VALUES ('EST-9', '9998');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `itemid` varchar(10) NOT NULL,
  `productid` varchar(10) NOT NULL,
  `listprice` decimal(10,2) DEFAULT NULL,
  `unitcost` decimal(10,2) DEFAULT NULL,
  `supplier` int(11) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `attr1` varchar(80) DEFAULT NULL,
  `attr2` varchar(80) DEFAULT NULL,
  `attr3` varchar(80) DEFAULT NULL,
  `attr4` varchar(80) DEFAULT NULL,
  `attr5` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `fk_item_2` (`supplier`),
  KEY `itemProd` (`productid`),
  CONSTRAINT `fk_item_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`),
  CONSTRAINT `fk_item_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`suppid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('EST-1', 'FI-SW-01', '16.50', '10.00', '1', 'P', 'Large', null, null, null, null);
INSERT INTO `item` VALUES ('EST-10', 'K9-DL-01', '18.50', '12.00', '1', 'P', 'Spotted Adult Female', null, null, null, null);
INSERT INTO `item` VALUES ('EST-11', 'RP-SN-01', '18.50', '12.00', '1', 'P', 'Venomless', null, null, null, null);
INSERT INTO `item` VALUES ('EST-12', 'RP-SN-01', '18.50', '12.00', '1', 'P', 'Rattleless', null, null, null, null);
INSERT INTO `item` VALUES ('EST-13', 'RP-LI-02', '18.50', '12.00', '1', 'P', 'Green Adult', null, null, null, null);
INSERT INTO `item` VALUES ('EST-14', 'FL-DSH-01', '58.50', '12.00', '1', 'P', 'Tailless', null, null, null, null);
INSERT INTO `item` VALUES ('EST-15', 'FL-DSH-01', '23.50', '12.00', '1', 'P', 'With tail', null, null, null, null);
INSERT INTO `item` VALUES ('EST-16', 'FL-DLH-02', '93.50', '12.00', '1', 'P', 'Adult Female', null, null, null, null);
INSERT INTO `item` VALUES ('EST-17', 'FL-DLH-02', '93.50', '12.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `item` VALUES ('EST-18', 'AV-CB-01', '193.50', '92.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `item` VALUES ('EST-19', 'AV-SB-02', '15.50', '2.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `item` VALUES ('EST-2', 'FI-SW-01', '16.50', '10.00', '1', 'P', 'Small', null, null, null, null);
INSERT INTO `item` VALUES ('EST-20', 'FI-FW-02', '5.50', '2.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `item` VALUES ('EST-21', 'FI-FW-02', '5.29', '1.00', '1', 'P', 'Adult Female', null, null, null, null);
INSERT INTO `item` VALUES ('EST-22', 'K9-RT-02', '135.50', '100.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `item` VALUES ('EST-23', 'K9-RT-02', '145.49', '100.00', '1', 'P', 'Adult Female', null, null, null, null);
INSERT INTO `item` VALUES ('EST-24', 'K9-RT-02', '255.50', '92.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `item` VALUES ('EST-25', 'K9-RT-02', '325.29', '90.00', '1', 'P', 'Adult Female', null, null, null, null);
INSERT INTO `item` VALUES ('EST-26', 'K9-CW-01', '125.50', '92.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `item` VALUES ('EST-27', 'K9-CW-01', '155.29', '90.00', '1', 'P', 'Adult Female', null, null, null, null);
INSERT INTO `item` VALUES ('EST-28', 'K9-RT-01', '155.29', '90.00', '1', 'P', 'Adult Female', null, null, null, null);
INSERT INTO `item` VALUES ('EST-3', 'FI-SW-02', '18.50', '12.00', '1', 'P', 'Toothless', null, null, null, null);
INSERT INTO `item` VALUES ('EST-4', 'FI-FW-01', '18.50', '12.00', '1', 'P', 'Spotted', null, null, null, null);
INSERT INTO `item` VALUES ('EST-5', 'FI-FW-01', '18.50', '12.00', '1', 'P', 'Spotless', null, null, null, null);
INSERT INTO `item` VALUES ('EST-6', 'K9-BD-01', '18.50', '12.00', '1', 'P', 'Male Adult', null, null, null, null);
INSERT INTO `item` VALUES ('EST-7', 'K9-BD-01', '18.50', '12.00', '1', 'P', 'Female Puppy', null, null, null, null);
INSERT INTO `item` VALUES ('EST-8', 'K9-PO-02', '18.50', '12.00', '1', 'P', 'Male Puppy', null, null, null, null);
INSERT INTO `item` VALUES ('EST-9', 'K9-DL-01', '18.50', '12.00', '1', 'P', 'Spotless Male Puppy', null, null, null, null);

-- ----------------------------
-- Table structure for lineitem
-- ----------------------------
DROP TABLE IF EXISTS `lineitem`;
CREATE TABLE `lineitem` (
  `orderid` int(11) NOT NULL,
  `linenum` int(11) NOT NULL,
  `itemid` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitprice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`orderid`,`linenum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lineitem
-- ----------------------------
INSERT INTO `lineitem` VALUES ('1000', '1', 'EST-8', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1001', '1', 'EST-13', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1001', '2', 'EST-11', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1002', '1', 'EST-13', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1002', '2', 'EST-19', '1', '15.50');
INSERT INTO `lineitem` VALUES ('1003', '1', 'EST-19', '1', '15.50');
INSERT INTO `lineitem` VALUES ('1004', '1', 'EST-19', '1', '15.50');
INSERT INTO `lineitem` VALUES ('1005', '1', 'EST-19', '1', '15.50');
INSERT INTO `lineitem` VALUES ('1006', '1', 'EST-26', '1', '125.50');
INSERT INTO `lineitem` VALUES ('1007', '1', 'EST-26', '1', '125.50');
INSERT INTO `lineitem` VALUES ('1011', '1', 'EST-18', '1', '193.50');
INSERT INTO `lineitem` VALUES ('1011', '2', 'EST-1', '1', '16.50');
INSERT INTO `lineitem` VALUES ('1012', '1', 'EST-4', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1013', '1', 'EST-6', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1014', '1', 'EST-6', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1015', '1', 'EST-18', '1', '193.50');
INSERT INTO `lineitem` VALUES ('1016', '1', 'EST-11', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1017', '1', 'EST-18', '2', '193.50');
INSERT INTO `lineitem` VALUES ('1018', '1', 'EST-6', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1019', '1', 'EST-19', '15', '15.50');
INSERT INTO `lineitem` VALUES ('1020', '1', 'EST-19', '1', '15.50');
INSERT INTO `lineitem` VALUES ('1021', '1', 'EST-10', '6', '18.50');
INSERT INTO `lineitem` VALUES ('1021', '2', 'EST-16', '12', '93.50');
INSERT INTO `lineitem` VALUES ('1022', '1', 'EST-10', '6', '18.50');
INSERT INTO `lineitem` VALUES ('1022', '2', 'EST-16', '27', '93.50');
INSERT INTO `lineitem` VALUES ('1023', '1', 'EST-18', '4', '193.50');
INSERT INTO `lineitem` VALUES ('1024', '1', 'EST-19', '7', '15.50');
INSERT INTO `lineitem` VALUES ('1025', '1', 'EST-20', '5', '5.50');
INSERT INTO `lineitem` VALUES ('1025', '2', 'EST-13', '8', '18.50');
INSERT INTO `lineitem` VALUES ('1026', '1', 'EST-13', '6', '18.50');
INSERT INTO `lineitem` VALUES ('1026', '2', 'EST-9', '2', '18.50');
INSERT INTO `lineitem` VALUES ('1026', '3', 'EST-16', '1', '93.50');
INSERT INTO `lineitem` VALUES ('1027', '1', 'EST-11', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1028', '1', 'EST-11', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1029', '1', 'EST-11', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1030', '1', 'EST-19', '1', '15.50');
INSERT INTO `lineitem` VALUES ('1031', '1', 'EST-19', '1', '15.50');
INSERT INTO `lineitem` VALUES ('1032', '1', 'EST-19', '1', '15.50');
INSERT INTO `lineitem` VALUES ('1033', '1', 'EST-19', '1', '15.50');
INSERT INTO `lineitem` VALUES ('1034', '1', 'EST-13', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1034', '2', 'EST-19', '1', '15.50');
INSERT INTO `lineitem` VALUES ('1035', '1', 'EST-19', '6', '15.50');
INSERT INTO `lineitem` VALUES ('1036', '1', 'EST-19', '4', '15.50');
INSERT INTO `lineitem` VALUES ('1036', '2', 'EST-26', '4', '125.50');
INSERT INTO `lineitem` VALUES ('1040', '1', 'EST-18', '1', '193.50');
INSERT INTO `lineitem` VALUES ('1040', '2', 'EST-11', '5', '18.50');
INSERT INTO `lineitem` VALUES ('1041', '1', 'EST-11', '5', '18.50');
INSERT INTO `lineitem` VALUES ('1041', '2', 'EST-20', '3', '5.50');
INSERT INTO `lineitem` VALUES ('1042', '1', 'EST-11', '5', '18.50');
INSERT INTO `lineitem` VALUES ('1042', '2', 'EST-20', '3', '5.50');
INSERT INTO `lineitem` VALUES ('1043', '1', 'EST-11', '5', '18.50');
INSERT INTO `lineitem` VALUES ('1043', '2', 'EST-20', '3', '5.50');
INSERT INTO `lineitem` VALUES ('1044', '1', 'EST-19', '2', '15.50');
INSERT INTO `lineitem` VALUES ('1044', '2', 'EST-26', '1', '125.50');
INSERT INTO `lineitem` VALUES ('1045', '1', 'EST-19', '2', '15.50');
INSERT INTO `lineitem` VALUES ('1045', '2', 'EST-26', '1', '125.50');
INSERT INTO `lineitem` VALUES ('1046', '1', 'EST-19', '2', '15.50');
INSERT INTO `lineitem` VALUES ('1046', '2', 'EST-26', '1', '125.50');
INSERT INTO `lineitem` VALUES ('1047', '1', 'EST-19', '2', '15.50');
INSERT INTO `lineitem` VALUES ('1047', '2', 'EST-26', '1', '125.50');
INSERT INTO `lineitem` VALUES ('1048', '1', 'EST-19', '2', '15.50');
INSERT INTO `lineitem` VALUES ('1048', '2', 'EST-26', '1', '125.50');
INSERT INTO `lineitem` VALUES ('1049', '1', 'EST-10', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1050', '1', 'EST-14', '5', '58.50');
INSERT INTO `lineitem` VALUES ('1050', '2', 'EST-18', '3', '193.50');
INSERT INTO `lineitem` VALUES ('1050', '3', 'EST-4', '3', '18.50');
INSERT INTO `lineitem` VALUES ('1051', '1', 'EST-13', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1052', '1', 'EST-14', '1', '58.50');
INSERT INTO `lineitem` VALUES ('1053', '1', 'EST-26', '5', '125.50');
INSERT INTO `lineitem` VALUES ('1054', '1', 'EST-6', '8', '18.50');
INSERT INTO `lineitem` VALUES ('1054', '2', 'EST-11', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1055', '1', 'EST-18', '3', '193.50');
INSERT INTO `lineitem` VALUES ('1056', '1', 'EST-1', '5', '16.50');
INSERT INTO `lineitem` VALUES ('1056', '2', 'EST-10', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1057', '1', 'EST-16', '8', '93.50');
INSERT INTO `lineitem` VALUES ('1057', '2', 'EST-14', '3', '58.50');
INSERT INTO `lineitem` VALUES ('1058', '1', 'EST-4', '7', '18.50');
INSERT INTO `lineitem` VALUES ('1058', '2', 'EST-10', '1', '18.50');
INSERT INTO `lineitem` VALUES ('1059', '1', 'EST-13', '6', '18.50');
INSERT INTO `lineitem` VALUES ('1060', '1', 'EST-16', '1', '93.50');
INSERT INTO `lineitem` VALUES ('1061', '1', 'EST-16', '1', '93.50');
INSERT INTO `lineitem` VALUES ('1062', '1', 'EST-20', '12', '5.50');
INSERT INTO `lineitem` VALUES ('1062', '2', 'EST-16', '4', '93.50');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL,
  `userid` varchar(80) NOT NULL,
  `orderdate` datetime NOT NULL,
  `shipaddr1` varchar(80) NOT NULL,
  `shipaddr2` varchar(80) DEFAULT NULL,
  `shipcity` varchar(80) NOT NULL,
  `shipstate` varchar(80) NOT NULL,
  `shipzip` varchar(20) NOT NULL,
  `shipcountry` varchar(20) NOT NULL,
  `billaddr1` varchar(80) NOT NULL,
  `billaddr2` varchar(80) DEFAULT NULL,
  `billcity` varchar(80) NOT NULL,
  `billstate` varchar(80) NOT NULL,
  `billzip` varchar(20) NOT NULL,
  `billcountry` varchar(20) NOT NULL,
  `courier` varchar(80) NOT NULL,
  `totalprice` decimal(10,2) NOT NULL,
  `billtofirstname` varchar(80) NOT NULL,
  `billtolastname` varchar(80) NOT NULL,
  `shiptofirstname` varchar(80) NOT NULL,
  `shiptolastname` varchar(80) NOT NULL,
  `creditcard` varchar(80) NOT NULL,
  `exprdate` varchar(7) NOT NULL,
  `cardtype` varchar(80) NOT NULL,
  `locale` varchar(80) NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1035', 'a', '2020-11-13 16:30:38', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '93.00', 'ABC', 'XYX', 'BBB', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1036', 'a', '2020-11-13 16:36:52', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '564.00', 'ABC', 'XYX', 'QQQ', 'QQQ', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1040', 'a', '2020-11-13 16:47:15', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '286.00', 'QQQ', 'XYX', 'ABC', 'XYX', 'ASFAS', '12/03', 'MasterCard', 'CA');
INSERT INTO `orders` VALUES ('1041', 'a', '2020-11-13 16:48:09', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '109.00', 'B', 'XYX', 'ABC', 'XYX', '999 9999 9999 99A99', '12/03', 'American Express', 'CA');
INSERT INTO `orders` VALUES ('1042', 'a', '2020-11-13 16:48:09', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '109.00', 'B', 'XYX', 'ABC', 'XYX', '999 9999 9999 99A99', '12/03', 'American Express', 'CA');
INSERT INTO `orders` VALUES ('1043', 'a', '2020-11-13 16:48:09', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '109.00', 'B', 'XYX', 'ABC', 'XYX', '999 9999 9999 99A99', '12/03', 'American Express', 'CA');
INSERT INTO `orders` VALUES ('1044', 'a', '2020-11-13 17:06:42', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '156.50', 'VVV', 'XYX', 'WWW', 'XYX', '999 9999 9999 9AV999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1045', 'a', '2020-11-13 17:06:42', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '156.50', 'VVV', 'XYX', 'WWW', 'XYX', '999 9999 9999 9AV999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1046', 'a', '2020-11-13 17:06:42', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '156.50', 'VVV', 'XYX', 'WWW', 'XYX', '999 9999 9999 9AV999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1047', 'a', '2020-11-13 17:06:42', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '156.50', 'VVV', 'XYX', 'WWW', 'XYX', '999 9999 9999 9AV999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1048', 'a', '2020-11-13 17:06:42', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '156.50', 'VVV', 'XYX', 'WWW', 'XYX', '999 9999 9999 9AV999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1049', 'a', '2020-11-13 17:07:36', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '18.50', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1050', 'a', '2020-11-13 17:08:02', '901 SAddress an Antonio Road', 'MAddress S UCUP02-206', 'Palo AltoCity', 'CAState', '94303Zip', 'Palo AltoCity', '901 San AnAddress tonio Road', 'MS UCUPAddress 02-206', 'Palo AltoCity', 'CAState', '94303Zip', 'USACountry: 	', 'UPS', '928.50', 'First ', 'Last ', 'ABCFirst ', 'XYXLast ', 'Card ', 'Expiry ', 'MasterCard', 'CA');
INSERT INTO `orders` VALUES ('1051', 'a', '2020-11-13 22:02:59', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '18.50', 'BBB', 'XYX', 'BBB', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1052', 'a', '2020-11-13 23:22:02', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '58.50', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1053', 'a', '2020-11-17 08:20:47', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'EE', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'TT', '94303', 'USA', 'UPS', '627.50', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1054', 'b', '2020-11-17 08:38:28', '123', '123', '123', '123', '123', '123', '123', '123', '123', '123', '123', '123', 'UPS', '166.50', '123', '123', '123', 'SSSS', 'BBBBBBB', '12/0302', 'MasterCard', 'CA');
INSERT INTO `orders` VALUES ('1055', 'a', '2020-11-24 16:20:07', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '580.50', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1056', 'a', '2020-11-24 16:25:40', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '101.00', 'GGG', 'XYX', 'ABC', 'E', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1057', 'a', '2021-01-06 01:08:03', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '923.50', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1058', 'a', '2021-01-06 01:11:00', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '943033252', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '148.00', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1059', 'a', '2021-01-06 13:02:13', 'd', 'd', 'd', 'd', 'd', 'd', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Altote', 'CA', '94303', 'USA', 'UPS', '111.00', 'ABCergds', 'XYX', 'a', 'dregsesrg', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1060', 'a', '2021-01-06 16:49:41', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '93.50', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1061', 'a', '2021-01-06 16:49:41', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'Palo Alto', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '93.50', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES ('1062', '210106', '2021-01-06 17:06:18', '210106', '210106', '210106', '210106', '210106', '210106', '210106', '210106', '210106', '210106', '210106', '210106', 'UPS', '440.00', '210106', '210106', '210106', '210106', '999 9999 9999 9999', '12/03', 'Visa', 'CA');

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus` (
  `orderid` int(11) NOT NULL,
  `linenum` int(11) NOT NULL,
  `timestamp` date NOT NULL,
  `status` varchar(2) NOT NULL,
  PRIMARY KEY (`orderid`,`linenum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderstatus
-- ----------------------------
INSERT INTO `orderstatus` VALUES ('1011', '1011', '2020-11-10', 'P');
INSERT INTO `orderstatus` VALUES ('1012', '1012', '2020-11-11', 'P');
INSERT INTO `orderstatus` VALUES ('1013', '1013', '2020-11-11', 'P');
INSERT INTO `orderstatus` VALUES ('1014', '1014', '2020-11-11', 'P');
INSERT INTO `orderstatus` VALUES ('1015', '1015', '2020-11-11', 'P');
INSERT INTO `orderstatus` VALUES ('1016', '1016', '2020-11-11', 'P');
INSERT INTO `orderstatus` VALUES ('1017', '1017', '2020-11-11', 'P');
INSERT INTO `orderstatus` VALUES ('1018', '1018', '2020-11-11', 'P');
INSERT INTO `orderstatus` VALUES ('1019', '1019', '2020-11-11', 'P');
INSERT INTO `orderstatus` VALUES ('1020', '1020', '2020-11-11', 'P');
INSERT INTO `orderstatus` VALUES ('1021', '1021', '2020-11-11', 'P');
INSERT INTO `orderstatus` VALUES ('1022', '1022', '2020-11-11', 'P');
INSERT INTO `orderstatus` VALUES ('1023', '1023', '2020-11-12', 'P');
INSERT INTO `orderstatus` VALUES ('1024', '1024', '2020-11-12', 'P');
INSERT INTO `orderstatus` VALUES ('1025', '1025', '2020-11-12', 'P');
INSERT INTO `orderstatus` VALUES ('1026', '1026', '2020-11-12', 'P');
INSERT INTO `orderstatus` VALUES ('1027', '1027', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1028', '1028', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1029', '1029', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1030', '1030', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1031', '1031', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1032', '1032', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1033', '1033', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1034', '1034', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1035', '1035', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1036', '1036', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1040', '1040', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1041', '1041', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1042', '1042', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1043', '1043', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1044', '1044', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1045', '1045', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1046', '1046', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1047', '1047', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1048', '1048', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1049', '1049', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1050', '1050', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1051', '1051', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1052', '1052', '2020-11-13', 'P');
INSERT INTO `orderstatus` VALUES ('1053', '1053', '2020-11-17', 'P');
INSERT INTO `orderstatus` VALUES ('1054', '1054', '2020-11-17', 'P');
INSERT INTO `orderstatus` VALUES ('1055', '1055', '2020-11-24', 'P');
INSERT INTO `orderstatus` VALUES ('1056', '1056', '2020-11-24', 'P');
INSERT INTO `orderstatus` VALUES ('1057', '1057', '2021-01-06', 'P');
INSERT INTO `orderstatus` VALUES ('1058', '1058', '2021-01-06', 'P');
INSERT INTO `orderstatus` VALUES ('1059', '1059', '2021-01-06', 'P');
INSERT INTO `orderstatus` VALUES ('1060', '1060', '2021-01-06', 'P');
INSERT INTO `orderstatus` VALUES ('1061', '1061', '2021-01-06', 'P');
INSERT INTO `orderstatus` VALUES ('1062', '1062', '2021-01-06', 'P');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productid` varchar(10) NOT NULL,
  `category` varchar(10) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `descn` varchar(255) DEFAULT NULL,
  `picture` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`productid`),
  KEY `productCat` (`category`),
  KEY `productName` (`name`),
  CONSTRAINT `fk_product_1` FOREIGN KEY (`category`) REFERENCES `category` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('AV-CB-01', 'BIRDS', 'Amazon Parrot', 'Great companion for up to 75 years', 'bird2.gif');
INSERT INTO `product` VALUES ('AV-SB-02', 'BIRDS', 'Finch', 'Great stress reliever', 'bird1.gif');
INSERT INTO `product` VALUES ('FI-FW-01', 'FISH', 'Koi', 'Fresh Water fish from Japan', 'fish3.gif');
INSERT INTO `product` VALUES ('FI-FW-02', 'FISH', 'Goldfish', 'Fresh Water fish from China', 'fish2.gif');
INSERT INTO `product` VALUES ('FI-SW-01', 'FISH', 'Angelfish', 'Salt Water fish from Australia', 'fish1.gif');
INSERT INTO `product` VALUES ('FI-SW-02', 'FISH', 'Tiger Shark', 'Salt Water fish from Australia', 'fish4.gif');
INSERT INTO `product` VALUES ('FL-DLH-02', 'CATS', 'Persian', 'Friendly house cat, doubles as a princess', 'cat1.gif');
INSERT INTO `product` VALUES ('FL-DSH-01', 'CATS', 'Manx', 'Great for reducing mouse populations', 'cat2.gif');
INSERT INTO `product` VALUES ('K9-BD-01', 'DOGS', 'Bulldog', 'Friendly dog from England', 'dog2.gif');
INSERT INTO `product` VALUES ('K9-CW-01', 'DOGS', 'Chihuahua', 'Great companion dog', 'dog4.gif');
INSERT INTO `product` VALUES ('K9-DL-01', 'DOGS', 'Dalmation', 'Great dog for a Fire Station', 'dog5.gif');
INSERT INTO `product` VALUES ('K9-PO-02', 'DOGS', 'Poodle', 'Cute dog from France', 'dog6.gif');
INSERT INTO `product` VALUES ('K9-RT-01', 'DOGS', 'Golden Retriever', 'Great family dog', 'dog1.gif');
INSERT INTO `product` VALUES ('K9-RT-02', 'DOGS', 'Labrador Retriever', 'Great hunting dog', 'dog5.gif');
INSERT INTO `product` VALUES ('RP-LI-02', 'REPTILES', 'Iguana', 'Friendly green friend', 'lizard1.gif');
INSERT INTO `product` VALUES ('RP-SN-01', 'REPTILES', 'Rattlesnake', 'Doubles as a watch dog', 'snake1.gif');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `userid` varchar(80) NOT NULL,
  `langpref` varchar(80) NOT NULL,
  `favcategory` varchar(30) DEFAULT NULL,
  `mylistopt` int(11) DEFAULT NULL,
  `banneropt` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('a', 'japanese', 'FISH', '1', '1');
INSERT INTO `profile` VALUES ('j2ee', 'english', 'DOGS', '1', '1');

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence` (
  `name` varchar(30) NOT NULL,
  `nextid` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('ordernum', '1063');

-- ----------------------------
-- Table structure for signon
-- ----------------------------
DROP TABLE IF EXISTS `signon`;
CREATE TABLE `signon` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of signon
-- ----------------------------
INSERT INTO `signon` VALUES ('a', 'a');
INSERT INTO `signon` VALUES ('j2ee', 'j2ee');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `suppid` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  `addr1` varchar(80) DEFAULT NULL,
  `addr2` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `state` varchar(80) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `phone` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`suppid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'XYZ Pets', 'AC', '600 Avon Way', '', 'Los Angeles', 'CA', '94024', '212-947-0797');
INSERT INTO `supplier` VALUES ('2', 'ABC Pets', 'AC', '700 Abalone Way', '', 'San Francisco ', 'CA', '94024', '415-947-0797');

-- ----------------------------
-- Table structure for userlogs
-- ----------------------------
DROP TABLE IF EXISTS `userlogs`;
CREATE TABLE `userlogs` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=617 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlogs
-- ----------------------------
INSERT INTO `userlogs` VALUES ('35', '2020-11-12 11:47:32', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('36', '2020-11-12 11:47:37', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('37', '2020-11-12 11:47:37', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('38', '2020-11-12 11:47:43', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('39', '2020-11-12 11:47:43', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('40', '2020-11-12 11:49:06', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('41', '2020-11-12 11:49:12', 'User (a) Reomve Item (EST-19).');
INSERT INTO `userlogs` VALUES ('42', '2020-11-12 11:49:15', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('43', '2020-11-12 11:50:36', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('44', '2020-11-12 11:50:40', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('45', '2020-11-12 11:50:50', 'User (a) Add a New Item (EST-20).');
INSERT INTO `userlogs` VALUES ('46', '2020-11-12 11:50:52', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('47', '2020-11-12 11:50:52', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('48', '2020-11-12 11:50:52', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('49', '2020-11-12 11:50:52', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('50', '2020-11-12 11:50:55', 'User (a) Add a New Item (EST-13).');
INSERT INTO `userlogs` VALUES ('51', '2020-11-12 11:50:57', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('52', '2020-11-12 11:50:58', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('53', '2020-11-12 11:50:58', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('54', '2020-11-12 11:50:58', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('55', '2020-11-12 11:50:59', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('56', '2020-11-12 11:50:59', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('57', '2020-11-12 11:51:00', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('58', '2020-11-12 11:51:15', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('59', '2020-11-12 11:51:21', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('60', '2020-11-12 11:51:21', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('61', '2020-11-12 11:51:54', 'User (a) Add a New Item (EST-9).');
INSERT INTO `userlogs` VALUES ('62', '2020-11-12 11:51:55', 'User (a) Add One More Item (EST-9).');
INSERT INTO `userlogs` VALUES ('63', '2020-11-12 11:51:58', 'User (a) Add a New Item (EST-13).');
INSERT INTO `userlogs` VALUES ('64', '2020-11-12 11:52:03', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('65', '2020-11-12 11:52:03', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('66', '2020-11-12 11:52:03', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('67', '2020-11-12 11:52:04', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('68', '2020-11-12 11:52:04', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('69', '2020-11-12 12:26:51', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('70', '2020-11-12 12:27:51', 'User (a) Add a New Item (EST-16).');
INSERT INTO `userlogs` VALUES ('71', '2020-11-12 12:28:40', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('72', '2020-11-12 12:28:41', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('73', '2020-11-12 12:28:41', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('74', '2020-11-13 12:33:13', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('75', '2020-11-13 12:33:15', 'User (a) Add a New Item (EST-11).');
INSERT INTO `userlogs` VALUES ('76', '2020-11-13 12:34:17', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('77', '2020-11-13 12:34:31', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('78', '2020-11-13 12:34:31', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('79', '2020-11-13 12:36:12', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('80', '2020-11-13 12:36:12', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('81', '2020-11-13 12:36:37', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('82', '2020-11-13 12:36:37', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('83', '2020-11-13 03:56:27', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('84', '2020-11-13 03:56:32', 'User (a) Add a New Item (EST-19).');
INSERT INTO `userlogs` VALUES ('85', '2020-11-13 03:56:35', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('86', '2020-11-13 03:58:27', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('87', '2020-11-13 03:58:31', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('88', '2020-11-13 03:58:43', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('89', '2020-11-13 03:58:43', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('90', '2020-11-13 03:59:11', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('91', '2020-11-13 03:59:11', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('92', '2020-11-13 04:02:53', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('93', '2020-11-13 04:02:53', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('94', '2020-11-13 04:02:58', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('95', '2020-11-13 04:02:58', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('96', '2020-11-13 04:03:21', 'User (a) Add a New Item (EST-13).');
INSERT INTO `userlogs` VALUES ('97', '2020-11-13 04:14:21', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('98', '2020-11-13 04:14:24', 'User (a) Add a New Item (EST-19).');
INSERT INTO `userlogs` VALUES ('99', '2020-11-13 04:14:28', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('100', '2020-11-13 04:15:11', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('101', '2020-11-13 04:15:53', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('102', '2020-11-13 04:15:53', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('103', '2020-11-13 04:27:28', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('104', '2020-11-13 04:27:47', 'User (a) Add a New Item (EST-19).');
INSERT INTO `userlogs` VALUES ('105', '2020-11-13 04:27:48', 'User (a) Add One More Item (EST-19).');
INSERT INTO `userlogs` VALUES ('106', '2020-11-13 04:27:48', 'User (a) Add One More Item (EST-19).');
INSERT INTO `userlogs` VALUES ('107', '2020-11-13 04:27:49', 'User (a) Add One More Item (EST-19).');
INSERT INTO `userlogs` VALUES ('108', '2020-11-13 04:27:49', 'User (a) Add One More Item (EST-19).');
INSERT INTO `userlogs` VALUES ('109', '2020-11-13 04:27:49', 'User (a) Add One More Item (EST-19).');
INSERT INTO `userlogs` VALUES ('110', '2020-11-13 04:27:52', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('111', '2020-11-13 04:28:22', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('112', '2020-11-13 04:28:28', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('113', '2020-11-13 04:28:34', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('114', '2020-11-13 04:28:41', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('115', '2020-11-13 04:30:30', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('116', '2020-11-13 04:30:30', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('117', '2020-11-13 04:30:33', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('118', '2020-11-13 04:30:37', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('119', '2020-11-13 04:30:44', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('120', '2020-11-13 04:30:44', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('121', '2020-11-13 04:34:30', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('122', '2020-11-13 04:34:35', 'User (a) Add a New Item (EST-19).');
INSERT INTO `userlogs` VALUES ('123', '2020-11-13 04:34:41', 'User (a) Add a New Item (EST-26).');
INSERT INTO `userlogs` VALUES ('124', '2020-11-13 04:34:42', 'User (a) Add One More Item (EST-26).');
INSERT INTO `userlogs` VALUES ('125', '2020-11-13 04:34:42', 'User (a) Add One More Item (EST-26).');
INSERT INTO `userlogs` VALUES ('126', '2020-11-13 04:34:42', 'User (a) Add One More Item (EST-26).');
INSERT INTO `userlogs` VALUES ('127', '2020-11-13 04:34:43', 'User (a) Add One More Item (EST-19).');
INSERT INTO `userlogs` VALUES ('128', '2020-11-13 04:34:43', 'User (a) Add One More Item (EST-19).');
INSERT INTO `userlogs` VALUES ('129', '2020-11-13 04:34:43', 'User (a) Add One More Item (EST-19).');
INSERT INTO `userlogs` VALUES ('130', '2020-11-13 04:36:51', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('131', '2020-11-13 04:37:24', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('132', '2020-11-13 04:37:24', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('133', '2020-11-13 04:37:50', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('134', '2020-11-13 04:37:50', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('135', '2020-11-13 04:37:55', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('136', '2020-11-13 04:37:55', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('137', '2020-11-13 04:38:05', 'User (a) Add a New Item (EST-14).');
INSERT INTO `userlogs` VALUES ('138', '2020-11-13 04:38:07', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('139', '2020-11-13 04:38:15', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('140', '2020-11-13 04:38:15', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('141', '2020-11-13 04:45:18', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('142', '2020-11-13 04:45:25', 'User (a) Add a New Item (EST-18).');
INSERT INTO `userlogs` VALUES ('143', '2020-11-13 04:45:28', 'User (a) Add a New Item (EST-11).');
INSERT INTO `userlogs` VALUES ('144', '2020-11-13 04:47:09', 'User (a) Add One More Item (EST-11).');
INSERT INTO `userlogs` VALUES ('145', '2020-11-13 04:47:09', 'User (a) Add One More Item (EST-11).');
INSERT INTO `userlogs` VALUES ('146', '2020-11-13 04:47:10', 'User (a) Add One More Item (EST-11).');
INSERT INTO `userlogs` VALUES ('147', '2020-11-13 04:47:10', 'User (a) Add One More Item (EST-11).');
INSERT INTO `userlogs` VALUES ('148', '2020-11-13 04:47:14', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('149', '2020-11-13 04:47:51', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('150', '2020-11-13 04:47:51', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('151', '2020-11-13 04:48:00', 'User (a) Add a New Item (EST-11).');
INSERT INTO `userlogs` VALUES ('152', '2020-11-13 04:48:01', 'User (a) Add One More Item (EST-11).');
INSERT INTO `userlogs` VALUES ('153', '2020-11-13 04:48:01', 'User (a) Add One More Item (EST-11).');
INSERT INTO `userlogs` VALUES ('154', '2020-11-13 04:48:01', 'User (a) Add One More Item (EST-11).');
INSERT INTO `userlogs` VALUES ('155', '2020-11-13 04:48:04', 'User (a) Add a New Item (EST-20).');
INSERT INTO `userlogs` VALUES ('156', '2020-11-13 04:48:05', 'User (a) Add One More Item (EST-11).');
INSERT INTO `userlogs` VALUES ('157', '2020-11-13 04:48:05', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('158', '2020-11-13 04:48:05', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('159', '2020-11-13 04:48:09', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('160', '2020-11-13 04:48:22', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('161', '2020-11-13 04:48:22', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('162', '2020-11-13 04:48:28', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('163', '2020-11-13 04:48:28', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('164', '2020-11-13 04:49:44', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('165', '2020-11-13 04:49:44', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('166', '2020-11-13 04:49:50', 'User (a) Add a New Item (EST-26).');
INSERT INTO `userlogs` VALUES ('167', '2020-11-13 04:52:26', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('168', '2020-11-13 04:52:30', 'User (a) Add a New Item (EST-19).');
INSERT INTO `userlogs` VALUES ('169', '2020-11-13 04:52:33', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('170', '2020-11-13 04:54:30', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('171', '2020-11-13 04:54:36', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('172', '2020-11-13 04:56:51', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('173', '2020-11-13 04:56:54', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('174', '2020-11-13 04:57:31', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('175', '2020-11-13 04:57:36', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('176', '2020-11-13 04:59:48', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('177', '2020-11-13 04:59:52', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('178', '2020-11-13 05:04:23', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('179', '2020-11-13 05:04:26', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('180', '2020-11-13 05:06:38', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('181', '2020-11-13 05:06:42', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('182', '2020-11-13 05:06:58', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('183', '2020-11-13 05:06:58', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('184', '2020-11-13 05:07:01', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('185', '2020-11-13 05:07:01', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('186', '2020-11-13 05:07:03', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('187', '2020-11-13 05:07:03', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('188', '2020-11-13 05:07:08', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('189', '2020-11-13 05:07:08', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('190', '2020-11-13 05:07:10', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('191', '2020-11-13 05:07:10', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('192', '2020-11-13 05:07:25', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('193', '2020-11-13 05:07:28', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('194', '2020-11-13 05:07:34', 'User (a) Add a New Item (EST-10).');
INSERT INTO `userlogs` VALUES ('195', '2020-11-13 05:07:36', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('196', '2020-11-13 05:07:42', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('197', '2020-11-13 05:07:42', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('198', '2020-11-13 05:07:50', 'User (a) Add a New Item (EST-14).');
INSERT INTO `userlogs` VALUES ('199', '2020-11-13 05:07:51', 'User (a) Add One More Item (EST-14).');
INSERT INTO `userlogs` VALUES ('200', '2020-11-13 05:07:51', 'User (a) Add One More Item (EST-14).');
INSERT INTO `userlogs` VALUES ('201', '2020-11-13 05:07:51', 'User (a) Add One More Item (EST-14).');
INSERT INTO `userlogs` VALUES ('202', '2020-11-13 05:07:52', 'User (a) Add One More Item (EST-14).');
INSERT INTO `userlogs` VALUES ('203', '2020-11-13 05:07:55', 'User (a) Add a New Item (EST-18).');
INSERT INTO `userlogs` VALUES ('204', '2020-11-13 05:07:56', 'User (a) Add One More Item (EST-18).');
INSERT INTO `userlogs` VALUES ('205', '2020-11-13 05:07:56', 'User (a) Add One More Item (EST-18).');
INSERT INTO `userlogs` VALUES ('206', '2020-11-13 05:07:58', 'User (a) Add a New Item (EST-4).');
INSERT INTO `userlogs` VALUES ('207', '2020-11-13 05:08:00', 'User (a) Add One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('208', '2020-11-13 05:08:00', 'User (a) Add One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('209', '2020-11-13 05:08:02', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('210', '2020-11-13 05:08:46', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('211', '2020-11-13 05:08:46', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('212', '2020-11-13 09:52:56', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('213', '2020-11-13 09:54:33', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('214', '2020-11-13 09:54:39', 'User (a) Add a New Item (EST-13).');
INSERT INTO `userlogs` VALUES ('215', '2020-11-13 09:56:19', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('216', '2020-11-13 09:58:22', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('217', '2020-11-13 09:58:27', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('218', '2020-11-13 09:59:37', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('219', '2020-11-13 09:59:41', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('220', '2020-11-13 10:02:55', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('221', '2020-11-13 10:02:58', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('222', '2020-11-13 10:03:08', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('223', '2020-11-13 10:03:08', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('224', '2020-11-13 11:18:18', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('225', '2020-11-13 11:18:23', 'User (a) Add a New Item (EST-14).');
INSERT INTO `userlogs` VALUES ('226', '2020-11-13 11:19:20', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('227', '2020-11-13 11:21:42', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('228', '2020-11-13 11:22:02', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('229', '2020-11-13 11:22:09', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('230', '2020-11-13 11:22:09', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('231', '2020-11-14 12:01:31', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('232', '2020-11-14 12:01:34', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('233', '2020-11-14 12:23:32', 'New Account () Created.');
INSERT INTO `userlogs` VALUES ('234', '2020-11-14 12:25:02', 'New Account () Created.');
INSERT INTO `userlogs` VALUES ('235', '2020-11-14 12:28:36', 'New Account () Created.');
INSERT INTO `userlogs` VALUES ('236', '2020-11-14 12:58:04', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('237', '2020-11-14 02:10:10', 'New Account (QQQQ22) Created.');
INSERT INTO `userlogs` VALUES ('238', '2020-11-17 08:14:43', 'New Account (Y6342) Created.');
INSERT INTO `userlogs` VALUES ('239', '2020-11-17 08:16:21', 'New Account (5dgeF) Created.');
INSERT INTO `userlogs` VALUES ('240', '2020-11-17 08:19:51', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('241', '2020-11-17 08:19:58', 'User (a) View the Product (Chihuahua).');
INSERT INTO `userlogs` VALUES ('242', '2020-11-17 08:20:07', 'User (a) Add a New Item (EST-26).');
INSERT INTO `userlogs` VALUES ('243', '2020-11-17 08:20:09', 'User (a) View the Item ((EST-26-K9-CW-01)).');
INSERT INTO `userlogs` VALUES ('244', '2020-11-17 08:20:39', 'User (a) Add One More Item (EST-26).');
INSERT INTO `userlogs` VALUES ('245', '2020-11-17 08:20:39', 'User (a) Add One More Item (EST-26).');
INSERT INTO `userlogs` VALUES ('246', '2020-11-17 08:20:39', 'User (a) Add One More Item (EST-26).');
INSERT INTO `userlogs` VALUES ('247', '2020-11-17 08:20:46', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('248', '2020-11-17 08:21:00', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('249', '2020-11-17 08:21:00', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('250', '2020-11-17 08:34:00', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('251', '2020-11-17 08:34:05', 'User (a) View the Product (Rattlesnake).');
INSERT INTO `userlogs` VALUES ('252', '2020-11-17 08:34:07', 'User (a) Add a New Item (EST-11).');
INSERT INTO `userlogs` VALUES ('253', '2020-11-17 08:34:09', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('254', '2020-11-17 08:34:12', 'User (a) View the Product (Manx).');
INSERT INTO `userlogs` VALUES ('255', '2020-11-17 08:34:13', 'User (a) Add a New Item (EST-14).');
INSERT INTO `userlogs` VALUES ('256', '2020-11-17 08:34:15', 'User (a) View the Product (Chihuahua).');
INSERT INTO `userlogs` VALUES ('257', '2020-11-17 08:34:17', 'User (a) View the Product (Angelfish).');
INSERT INTO `userlogs` VALUES ('258', '2020-11-17 08:34:18', 'User (a) View the Product (Amazon Parrot).');
INSERT INTO `userlogs` VALUES ('259', '2020-11-17 08:34:19', 'User (a) View the Item ((EST-18-AV-CB-01)).');
INSERT INTO `userlogs` VALUES ('260', '2020-11-17 08:34:21', 'User (a) View the Product (Persian).');
INSERT INTO `userlogs` VALUES ('261', '2020-11-17 08:34:25', 'User (a) View the Product (Rattlesnake).');
INSERT INTO `userlogs` VALUES ('262', '2020-11-17 08:34:26', 'User (a) Add a New Item (EST-11).');
INSERT INTO `userlogs` VALUES ('263', '2020-11-17 08:34:27', 'User (a) Add One More Item (EST-11).');
INSERT INTO `userlogs` VALUES ('264', '2020-11-17 08:34:29', 'User (a) View the Product (Amazon Parrot).');
INSERT INTO `userlogs` VALUES ('265', '2020-11-17 08:34:30', 'User (a) Add a New Item (EST-18).');
INSERT INTO `userlogs` VALUES ('266', '2020-11-17 08:35:59', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('267', '2020-11-17 08:36:02', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('268', '2020-11-17 08:36:06', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('269', '2020-11-17 08:37:14', 'New Account (b) Created.');
INSERT INTO `userlogs` VALUES ('270', '2020-11-17 08:37:32', 'User (b) Sign In.');
INSERT INTO `userlogs` VALUES ('271', '2020-11-17 08:37:37', 'User (b) View the Product (Bulldog).');
INSERT INTO `userlogs` VALUES ('272', '2020-11-17 08:38:00', 'User (b) Add a New Item (EST-6).');
INSERT INTO `userlogs` VALUES ('273', '2020-11-17 08:38:08', 'User (b) Add One More Item (EST-6).');
INSERT INTO `userlogs` VALUES ('274', '2020-11-17 08:38:09', 'User (b) Add One More Item (EST-6).');
INSERT INTO `userlogs` VALUES ('275', '2020-11-17 08:38:10', 'User (b) Add One More Item (EST-6).');
INSERT INTO `userlogs` VALUES ('276', '2020-11-17 08:38:10', 'User (b) Add One More Item (EST-6).');
INSERT INTO `userlogs` VALUES ('277', '2020-11-17 08:38:10', 'User (b) Add One More Item (EST-6).');
INSERT INTO `userlogs` VALUES ('278', '2020-11-17 08:38:10', 'User (b) Add One More Item (EST-6).');
INSERT INTO `userlogs` VALUES ('279', '2020-11-17 08:38:10', 'User (b) Add One More Item (EST-6).');
INSERT INTO `userlogs` VALUES ('280', '2020-11-17 08:38:12', 'User (b) View the Product (Rattlesnake).');
INSERT INTO `userlogs` VALUES ('281', '2020-11-17 08:38:13', 'User (b) Add a New Item (EST-11).');
INSERT INTO `userlogs` VALUES ('282', '2020-11-17 08:38:27', 'User (b) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('283', '2020-11-17 08:39:02', 'User (b) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('284', '2020-11-17 08:39:02', 'User (b) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('285', '2020-11-17 08:39:32', 'User (b) Sign Out.');
INSERT INTO `userlogs` VALUES ('286', '2020-11-17 08:39:59', 'User (b) Sign In.');
INSERT INTO `userlogs` VALUES ('287', '2020-11-17 08:40:05', 'User (b) Sign Out.');
INSERT INTO `userlogs` VALUES ('288', '2020-11-17 08:40:13', 'User (b) Sign In.');
INSERT INTO `userlogs` VALUES ('289', '2020-11-17 08:40:21', 'User (b) Sign Out.');
INSERT INTO `userlogs` VALUES ('290', '2020-11-17 09:27:49', 'New Account (Test0ss) Created.');
INSERT INTO `userlogs` VALUES ('291', '2020-11-24 04:12:21', 'User (null) Sign In.');
INSERT INTO `userlogs` VALUES ('292', '2020-11-24 04:13:14', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('293', '2020-11-24 04:17:54', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('294', '2020-11-24 04:19:39', 'User (a) View the Product (Amazon Parrot).');
INSERT INTO `userlogs` VALUES ('295', '2020-11-24 04:19:40', 'User (a) Add a New Item (EST-18).');
INSERT INTO `userlogs` VALUES ('296', '2020-11-24 04:19:41', 'User (a) Add One More Item (EST-18).');
INSERT INTO `userlogs` VALUES ('297', '2020-11-24 04:19:42', 'User (a) Add One More Item (EST-18).');
INSERT INTO `userlogs` VALUES ('298', '2020-11-24 04:20:06', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('299', '2020-11-24 04:20:09', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('300', '2020-11-24 04:20:09', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('301', '2020-11-24 04:20:18', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('302', '2020-11-24 04:20:43', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('303', '2020-11-24 04:25:17', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('304', '2020-11-24 04:25:24', 'User (a) View the Product (Manx).');
INSERT INTO `userlogs` VALUES ('305', '2020-11-24 04:25:25', 'User (a) Add a New Item (EST-14).');
INSERT INTO `userlogs` VALUES ('306', '2020-11-24 04:25:27', 'User (a) Add One More Item (EST-14).');
INSERT INTO `userlogs` VALUES ('307', '2020-11-24 04:25:27', 'User (a) Add One More Item (EST-14).');
INSERT INTO `userlogs` VALUES ('308', '2020-11-24 04:25:27', 'User (a) Add One More Item (EST-14).');
INSERT INTO `userlogs` VALUES ('309', '2020-11-24 04:25:28', 'User (a) Add One More Item (EST-14).');
INSERT INTO `userlogs` VALUES ('310', '2020-11-24 04:25:28', 'User (a) Add One More Item (EST-14).');
INSERT INTO `userlogs` VALUES ('311', '2020-11-24 04:25:28', 'User (a) Add One More Item (EST-14).');
INSERT INTO `userlogs` VALUES ('312', '2020-11-24 04:25:30', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('313', '2020-11-24 04:25:31', 'User (a) View the Product (Angelfish).');
INSERT INTO `userlogs` VALUES ('314', '2020-11-24 04:25:32', 'User (a) Add a New Item (EST-1).');
INSERT INTO `userlogs` VALUES ('315', '2020-11-24 04:25:33', 'User (a) Add One More Item (EST-1).');
INSERT INTO `userlogs` VALUES ('316', '2020-11-24 04:25:33', 'User (a) Add One More Item (EST-1).');
INSERT INTO `userlogs` VALUES ('317', '2020-11-24 04:25:34', 'User (a) Add One More Item (EST-1).');
INSERT INTO `userlogs` VALUES ('318', '2020-11-24 04:25:34', 'User (a) Add One More Item (EST-1).');
INSERT INTO `userlogs` VALUES ('319', '2020-11-24 04:25:36', 'User (a) View the Product (Dalmation).');
INSERT INTO `userlogs` VALUES ('320', '2020-11-24 04:25:37', 'User (a) Add a New Item (EST-10).');
INSERT INTO `userlogs` VALUES ('321', '2020-11-24 04:25:39', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('322', '2020-11-24 04:25:48', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('323', '2020-11-24 04:25:48', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('324', '2020-11-24 04:25:57', 'User (a) View the Item ((EST-10-K9-DL-01)).');
INSERT INTO `userlogs` VALUES ('325', '2021-01-04 01:47:04', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('326', '2021-01-04 01:47:19', 'User (a) View the Product (Koi).');
INSERT INTO `userlogs` VALUES ('327', '2021-01-04 01:47:21', 'User (a) View the Item ((EST-4-FI-FW-01)).');
INSERT INTO `userlogs` VALUES ('328', '2021-01-04 01:47:23', 'User (a) Add a New Item (EST-4).');
INSERT INTO `userlogs` VALUES ('329', '2021-01-04 01:47:25', 'User (a) Add One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('330', '2021-01-04 01:47:25', 'User (a) Add One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('331', '2021-01-04 01:47:26', 'User (a) Add One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('332', '2021-01-04 01:47:26', 'User (a) Add One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('333', '2021-01-04 01:47:27', 'User (a) Add One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('334', '2021-01-04 01:47:28', 'User (a) Remove One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('335', '2021-01-04 01:47:28', 'User (a) Remove One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('336', '2021-01-04 01:47:30', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('337', '2021-01-04 01:47:34', 'User (a) View the Product (Persian).');
INSERT INTO `userlogs` VALUES ('338', '2021-01-04 01:47:35', 'User (a) Add a New Item (EST-16).');
INSERT INTO `userlogs` VALUES ('339', '2021-01-04 01:47:36', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('340', '2021-01-04 01:47:37', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('341', '2021-01-04 01:47:37', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('342', '2021-01-04 01:47:38', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('343', '2021-01-04 01:47:38', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('344', '2021-01-04 01:47:39', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('345', '2021-01-04 01:47:40', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('346', '2021-01-04 01:47:40', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('347', '2021-01-04 01:47:41', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('348', '2021-01-04 01:47:41', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('349', '2021-01-04 01:47:42', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('350', '2021-01-04 01:47:43', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('351', '2021-01-04 01:47:43', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('352', '2021-01-04 01:47:45', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('353', '2021-01-04 01:47:46', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('354', '2021-01-04 01:47:51', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('355', '2021-01-05 11:52:45', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('356', '2021-01-05 11:59:37', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('357', '2021-01-05 11:59:53', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('358', '2021-01-06 12:00:19', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('359', '2021-01-06 12:00:20', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('360', '2021-01-06 12:00:58', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('361', '2021-01-06 12:00:59', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('362', '2021-01-06 12:00:59', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('363', '2021-01-06 12:01:00', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('364', '2021-01-06 12:01:00', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('365', '2021-01-06 12:01:01', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('366', '2021-01-06 12:02:44', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('367', '2021-01-06 12:02:45', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('368', '2021-01-06 12:02:46', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('369', '2021-01-06 12:02:47', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('370', '2021-01-06 12:02:48', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('371', '2021-01-06 12:03:31', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('372', '2021-01-06 12:03:32', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('373', '2021-01-06 12:04:59', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('374', '2021-01-06 12:05:00', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('375', '2021-01-06 12:05:00', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('376', '2021-01-06 12:05:01', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('377', '2021-01-06 12:05:01', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('378', '2021-01-06 12:05:02', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('379', '2021-01-06 12:05:02', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('380', '2021-01-06 12:05:03', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('381', '2021-01-06 12:05:03', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('382', '2021-01-06 12:05:04', 'User (a) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('383', '2021-01-06 12:17:09', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('384', '2021-01-06 12:17:11', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('385', '2021-01-06 12:31:44', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('386', '2021-01-06 12:31:48', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('387', '2021-01-06 12:31:49', 'User (a) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('388', '2021-01-06 01:04:33', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('389', '2021-01-06 01:06:24', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('390', '2021-01-06 01:07:02', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('391', '2021-01-06 01:08:02', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('392', '2021-01-06 01:08:59', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('393', '2021-01-06 01:08:59', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('394', '2021-01-06 01:09:31', 'User (a) View the Product (Koi).');
INSERT INTO `userlogs` VALUES ('395', '2021-01-06 01:09:33', 'User (a) Add a New Item (EST-4).');
INSERT INTO `userlogs` VALUES ('396', '2021-01-06 01:09:53', 'User (a) View the Product (Koi).');
INSERT INTO `userlogs` VALUES ('397', '2021-01-06 01:09:57', 'User (a) View the Item ((EST-4-FI-FW-01)).');
INSERT INTO `userlogs` VALUES ('398', '2021-01-06 01:10:03', 'User (a) View the Product (Goldfish).');
INSERT INTO `userlogs` VALUES ('399', '2021-01-06 01:10:06', 'User (a) View the Item ((EST-20-FI-FW-02)).');
INSERT INTO `userlogs` VALUES ('400', '2021-01-06 01:10:30', 'User (a) Add a New Item (EST-20).');
INSERT INTO `userlogs` VALUES ('401', '2021-01-06 01:10:32', 'User (a) View the Item ((EST-20-FI-FW-02)).');
INSERT INTO `userlogs` VALUES ('402', '2021-01-06 01:10:39', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('403', '2021-01-06 01:10:39', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('404', '2021-01-06 01:10:39', 'User (a) Remove One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('405', '2021-01-06 01:10:39', 'User (a) Remove One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('406', '2021-01-06 01:10:40', 'User (a) Remove One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('407', '2021-01-06 01:10:40', 'User (a) Add One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('408', '2021-01-06 01:10:40', 'User (a) Add One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('409', '2021-01-06 01:10:41', 'User (a) Add One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('410', '2021-01-06 01:10:41', 'User (a) Add One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('411', '2021-01-06 01:10:41', 'User (a) Add One More Item (EST-4).');
INSERT INTO `userlogs` VALUES ('412', '2021-01-06 01:10:41', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('413', '2021-01-06 01:10:41', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('414', '2021-01-06 01:10:41', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('415', '2021-01-06 01:10:42', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('416', '2021-01-06 01:10:42', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('417', '2021-01-06 01:10:42', 'User (a) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('418', '2021-01-06 01:10:42', 'User (a) Remove One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('419', '2021-01-06 01:10:43', 'User (a) Remove One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('420', '2021-01-06 01:10:43', 'User (a) Remove One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('421', '2021-01-06 01:10:43', 'User (a) Reomve Item (EST-20).');
INSERT INTO `userlogs` VALUES ('422', '2021-01-06 01:10:46', 'User (a) View the Item ((EST-4-FI-FW-01)).');
INSERT INTO `userlogs` VALUES ('423', '2021-01-06 01:10:50', 'User (a) View the Product (Dalmation).');
INSERT INTO `userlogs` VALUES ('424', '2021-01-06 01:10:51', 'User (a) Add a New Item (EST-10).');
INSERT INTO `userlogs` VALUES ('425', '2021-01-06 01:10:57', 'User (a) View the Item ((EST-4-FI-FW-01)).');
INSERT INTO `userlogs` VALUES ('426', '2021-01-06 01:10:59', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('427', '2021-01-06 01:11:17', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('428', '2021-01-06 01:11:17', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('429', '2021-01-06 01:11:27', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('430', '2021-01-06 09:04:32', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('431', '2021-01-06 09:13:36', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('432', '2021-01-06 09:16:50', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('433', '2021-01-06 09:17:04', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('434', '2021-01-06 09:18:01', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('435', '2021-01-06 09:31:01', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('436', '2021-01-06 09:31:20', 'Account (a) Profile Changed.');
INSERT INTO `userlogs` VALUES ('437', '2021-01-06 09:31:46', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('438', '2021-01-06 12:14:29', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('439', '2021-01-06 12:14:53', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('440', '2021-01-06 12:15:53', 'User (a) View the Product (Bulldog).');
INSERT INTO `userlogs` VALUES ('441', '2021-01-06 12:15:54', 'User (a) Add a New Item (EST-6).');
INSERT INTO `userlogs` VALUES ('442', '2021-01-06 12:15:55', 'User (a) Reomve Item (EST-6).');
INSERT INTO `userlogs` VALUES ('443', '2021-01-06 12:16:05', 'User (a) View the Product (Iguana).');
INSERT INTO `userlogs` VALUES ('444', '2021-01-06 12:16:07', 'User (a) Add a New Item (EST-13).');
INSERT INTO `userlogs` VALUES ('445', '2021-01-06 12:16:08', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('446', '2021-01-06 12:16:08', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('447', '2021-01-06 12:16:09', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('448', '2021-01-06 12:16:09', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('449', '2021-01-06 12:16:09', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('450', '2021-01-06 12:16:09', 'User (a) Add One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('451', '2021-01-06 12:19:14', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('452', '2021-01-06 12:20:39', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('453', '2021-01-06 12:22:33', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('454', '2021-01-06 12:23:23', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('455', '2021-01-06 12:23:40', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('456', '2021-01-06 12:24:06', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('457', '2021-01-06 12:28:39', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('458', '2021-01-06 12:28:47', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('459', '2021-01-06 12:28:49', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('460', '2021-01-06 12:28:50', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('461', '2021-01-06 12:28:50', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('462', '2021-01-06 12:30:37', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('463', '2021-01-06 12:31:27', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('464', '2021-01-06 12:32:34', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('465', '2021-01-06 12:33:09', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('466', '2021-01-06 12:33:24', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('467', '2021-01-06 12:34:41', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('468', '2021-01-06 12:34:48', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('469', '2021-01-06 12:35:11', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('470', '2021-01-06 12:35:51', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('471', '2021-01-06 12:36:01', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('472', '2021-01-06 12:36:36', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('473', '2021-01-06 12:36:45', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('474', '2021-01-06 12:36:46', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('475', '2021-01-06 12:37:25', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('476', '2021-01-06 12:37:44', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('477', '2021-01-06 12:39:10', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('478', '2021-01-06 12:40:05', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('479', '2021-01-06 12:40:07', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('480', '2021-01-06 12:40:07', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('481', '2021-01-06 12:40:07', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('482', '2021-01-06 12:40:08', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('483', '2021-01-06 12:40:08', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('484', '2021-01-06 12:40:46', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('485', '2021-01-06 12:40:48', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('486', '2021-01-06 12:40:48', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('487', '2021-01-06 12:40:49', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('488', '2021-01-06 12:40:49', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('489', '2021-01-06 12:40:56', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('490', '2021-01-06 12:41:07', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('491', '2021-01-06 12:41:11', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('492', '2021-01-06 12:42:00', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('493', '2021-01-06 12:42:01', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('494', '2021-01-06 12:42:29', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('495', '2021-01-06 12:44:42', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('496', '2021-01-06 12:44:44', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('497', '2021-01-06 12:44:45', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('498', '2021-01-06 12:45:07', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('499', '2021-01-06 12:46:01', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('500', '2021-01-06 12:46:07', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('501', '2021-01-06 12:46:10', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('502', '2021-01-06 12:46:44', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('503', '2021-01-06 12:46:46', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('504', '2021-01-06 12:46:56', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('505', '2021-01-06 12:46:58', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('506', '2021-01-06 12:47:25', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('507', '2021-01-06 12:47:29', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('508', '2021-01-06 12:47:31', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('509', '2021-01-06 12:47:33', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('510', '2021-01-06 12:47:34', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('511', '2021-01-06 12:47:36', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('512', '2021-01-06 12:47:37', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('513', '2021-01-06 12:47:38', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('514', '2021-01-06 12:47:43', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('515', '2021-01-06 12:47:44', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('516', '2021-01-06 12:47:55', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('517', '2021-01-06 12:47:56', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('518', '2021-01-06 12:48:22', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('519', '2021-01-06 12:48:25', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('520', '2021-01-06 12:48:35', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('521', '2021-01-06 12:48:38', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('522', '2021-01-06 12:48:40', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('523', '2021-01-06 12:48:42', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('524', '2021-01-06 12:48:44', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('525', '2021-01-06 12:49:10', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('526', '2021-01-06 12:49:13', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('527', '2021-01-06 12:49:14', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('528', '2021-01-06 12:49:55', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('529', '2021-01-06 12:50:02', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('530', '2021-01-06 12:50:05', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('531', '2021-01-06 12:50:06', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('532', '2021-01-06 12:51:59', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('533', '2021-01-06 12:52:01', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('534', '2021-01-06 12:52:17', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('535', '2021-01-06 12:52:19', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('536', '2021-01-06 12:52:21', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('537', '2021-01-06 12:52:21', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('538', '2021-01-06 12:52:22', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('539', '2021-01-06 12:52:22', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('540', '2021-01-06 12:52:22', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('541', '2021-01-06 12:52:23', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('542', '2021-01-06 12:53:23', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('543', '2021-01-06 12:54:44', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('544', '2021-01-06 12:54:49', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('545', '2021-01-06 12:54:51', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('546', '2021-01-06 12:55:00', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('547', '2021-01-06 12:55:03', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('548', '2021-01-06 12:55:05', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('549', '2021-01-06 12:55:06', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('550', '2021-01-06 12:55:14', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('551', '2021-01-06 12:55:17', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('552', '2021-01-06 12:55:19', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('553', '2021-01-06 12:55:24', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('554', '2021-01-06 12:55:27', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('555', '2021-01-06 12:57:12', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('556', '2021-01-06 12:57:26', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('557', '2021-01-06 01:00:11', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('558', '2021-01-06 01:01:11', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('559', '2021-01-06 01:01:25', 'User (a) Remove One More Item (EST-13).');
INSERT INTO `userlogs` VALUES ('560', '2021-01-06 01:01:31', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('561', '2021-01-06 01:02:12', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('562', '2021-01-06 01:02:41', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('563', '2021-01-06 01:02:41', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('564', '2021-01-06 04:44:29', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('565', '2021-01-06 04:45:14', 'User (a) View the Product (Bulldog).');
INSERT INTO `userlogs` VALUES ('566', '2021-01-06 04:45:16', 'User (a) View the Item ((EST-6-K9-BD-01)).');
INSERT INTO `userlogs` VALUES ('567', '2021-01-06 04:45:18', 'User (a) View the Item ((EST-7-K9-BD-01)).');
INSERT INTO `userlogs` VALUES ('568', '2021-01-06 04:45:27', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('569', '2021-01-06 04:46:34', 'User (a) Sign In.');
INSERT INTO `userlogs` VALUES ('570', '2021-01-06 04:48:10', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('571', '2021-01-06 04:48:57', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('572', '2021-01-06 04:49:41', 'User (a) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('573', '2021-01-06 04:50:32', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('574', '2021-01-06 04:50:32', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('575', '2021-01-06 04:51:27', 'User (a) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('576', '2021-01-06 04:51:27', 'User (a) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('577', '2021-01-06 04:57:27', 'User (a) Sign Out.');
INSERT INTO `userlogs` VALUES ('578', '2021-01-06 05:04:34', 'User (210106) Sign In.');
INSERT INTO `userlogs` VALUES ('579', '2021-01-06 05:05:41', 'User (210106) View the Product (Goldfish).');
INSERT INTO `userlogs` VALUES ('580', '2021-01-06 05:05:42', 'User (210106) Add a New Item (EST-20).');
INSERT INTO `userlogs` VALUES ('581', '2021-01-06 05:05:44', 'User (210106) View the Item ((EST-20-FI-FW-02)).');
INSERT INTO `userlogs` VALUES ('582', '2021-01-06 05:05:47', 'User (210106) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('583', '2021-01-06 05:05:47', 'User (210106) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('584', '2021-01-06 05:05:47', 'User (210106) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('585', '2021-01-06 05:05:48', 'User (210106) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('586', '2021-01-06 05:05:48', 'User (210106) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('587', '2021-01-06 05:05:48', 'User (210106) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('588', '2021-01-06 05:05:48', 'User (210106) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('589', '2021-01-06 05:05:49', 'User (210106) Remove One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('590', '2021-01-06 05:05:49', 'User (210106) Remove One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('591', '2021-01-06 05:05:49', 'User (210106) Remove One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('592', '2021-01-06 05:05:55', 'User (210106) View the Product (Persian).');
INSERT INTO `userlogs` VALUES ('593', '2021-01-06 05:05:56', 'User (210106) Add a New Item (EST-16).');
INSERT INTO `userlogs` VALUES ('594', '2021-01-06 05:05:57', 'User (210106) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('595', '2021-01-06 05:05:58', 'User (210106) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('596', '2021-01-06 05:05:58', 'User (210106) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('597', '2021-01-06 05:05:58', 'User (210106) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('598', '2021-01-06 05:05:58', 'User (210106) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('599', '2021-01-06 05:06:06', 'User (210106) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('600', '2021-01-06 05:06:06', 'User (210106) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('601', '2021-01-06 05:06:07', 'User (210106) Add One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('602', '2021-01-06 05:06:07', 'User (210106) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('603', '2021-01-06 05:06:07', 'User (210106) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('604', '2021-01-06 05:06:08', 'User (210106) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('605', '2021-01-06 05:06:08', 'User (210106) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('606', '2021-01-06 05:06:08', 'User (210106) Remove One More Item (EST-16).');
INSERT INTO `userlogs` VALUES ('607', '2021-01-06 05:06:09', 'User (210106) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('608', '2021-01-06 05:06:09', 'User (210106) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('609', '2021-01-06 05:06:09', 'User (210106) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('610', '2021-01-06 05:06:09', 'User (210106) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('611', '2021-01-06 05:06:09', 'User (210106) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('612', '2021-01-06 05:06:09', 'User (210106) Add One More Item (EST-20).');
INSERT INTO `userlogs` VALUES ('613', '2021-01-06 05:06:18', 'User (210106) Creat a New Form.');
INSERT INTO `userlogs` VALUES ('614', '2021-01-06 05:07:00', 'User (210106) Confirm a New Form.');
INSERT INTO `userlogs` VALUES ('615', '2021-01-06 05:07:00', 'User (210106) Clear His Cart.');
INSERT INTO `userlogs` VALUES ('616', '2021-01-06 05:08:12', 'Account (210106) Profile Changed.');

-- ----------------------------
-- View structure for a
-- ----------------------------
DROP VIEW IF EXISTS `a`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `a` AS SELECT
          SIGNON.USERNAME,
          ACCOUNT.EMAIL,
          ACCOUNT.FIRSTNAME,
          ACCOUNT.LASTNAME,
          ACCOUNT.STATUS,
          ACCOUNT.ADDR1 AS address1,
          ACCOUNT.ADDR2 AS address2,
          ACCOUNT.CITY,
          ACCOUNT.STATE,
          ACCOUNT.ZIP,
          ACCOUNT.COUNTRY,
          ACCOUNT.PHONE,
          PROFILE.LANGPREF AS languagePreference,
          PROFILE.FAVCATEGORY AS favouriteCategoryId,
          PROFILE.MYLISTOPT AS listOption,
          PROFILE.BANNEROPT AS bannerOption,
          BANNERDATA.BANNERNAME
    FROM ACCOUNT, PROFILE, SIGNON, BANNERDATA
    WHERE ACCOUNT.USERID = 'a'
      AND SIGNON.USERNAME = ACCOUNT.USERID
      AND PROFILE.USERID = ACCOUNT.USERID
      AND PROFILE.FAVCATEGORY = BANNERDATA.FAVCATEGORY ;
