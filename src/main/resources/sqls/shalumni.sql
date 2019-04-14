--CREATE DATABASE shalumni; 

USE shalumni;


CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `year_passed` varchar(20) DEFAULT 'NOT AVAILABLE',
  `address_street` varchar(70) DEFAULT 'NOT APPLICABLE',
  `family_name` varchar(70) DEFAULT 'NOT APPLICABLE',
  `address_line_two` varchar(70) DEFAULT 'NOT APPLICABLE',
  `city` varchar(30) DEFAULT 'NOT APPLICABLE',
  `country` varchar(30) DEFAULT 'NOT APPLICABLE',
  `state_or_province` varchar(50) DEFAULT 'NOT APPLICABLE',
  `zip_or_pin_code` varchar(20) DEFAULT 'NOT APPLICABLE',
  `phone_number` varchar(15) DEFAULT 'NOT APPLICABLE',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;



﻿USE shalumni;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


insert into `role`(`id`,`role`) values (1,'USER');
insert into `role`(`id`,`role`) values (2,'ADMIN');
﻿USE shalumni;




insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (1,'user',1,'user@email.com','user_LirstName','user_FirstName','we7RkuoMXJDqPYS42yTfty+bWwbffIh8pw27il1urNzRRBBIOHEZJIXhpiziSVm3','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:15');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (2,'admin',1,'admin@email.com','admin_LirstName','admin_FirstName','ykMyBXplsD0V48tZufpu34nwvU4LIn1Rlde8EU+49adHZdBqZWtyFsvHHSGp5aM6','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:15');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (4,'user2',0,'user2@hotmail.com','user2','user2','MrJPIHZZ9LQfUBmXtw2BlKBfRFi8mP0HNqMgNabBwx6hSLjeZYFs0/1E4AzE74o0','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:15');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (10,'user1',0,'user1@hotmail.com','user1','user1','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:15');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (11,'user100',0,'user1@hotmail.com','user1','user1','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:15');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (12,'user101',0,'user1@hotmail.com','user1','user1','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:15');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (13,'user102',0,'user1@hotmail.com','user1','user1','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:15');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (14,'user103',0,'user1@hotmail.com','user1','user1','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:15');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (15,'user104',0,'user1@hotmail.com','user1','user1','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:15');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (16,'user105',0,'user1@hotmail.com','user1','user1','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:15');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (17,'user106',0,'user1@hotmail.com','user1','user1','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:15');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (18,'user107',0,'user1@hotmail.com','user1','user12','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:15');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (19,'user108',0,'user1@hotmail.com','user1','user13','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:16');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (20,'user109',0,'user1@hotmail.com','user1','user14','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:16');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (21,'user110',0,'user1@hotmail.com','user1','user15','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:16');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (22,'user111',0,'user1@hotmail.com','user1','user1ggg','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:16');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (23,'user112',0,'user1@hotmail.com','user1','user1ggg','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:16');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (24,'user113',0,'user1@hotmail.com','user1','user1frfr','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:16');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (25,'user114',0,'user1@hotmail.com','user1','user1frrf','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:16');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (26,'user115',0,'user1@hotmail.com','user1','user1nhh','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:16');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (27,'user116',0,'user1@hotmail.com','user1','user1jjj','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:16');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (28,'user117',0,'user1@hotmail.com','user1','user1yuyt','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:16');
insert into `user`(`id`,`user_name`,`active`,`email`,`last_name`,`first_name`,`password`,`year_passed`,`address_street`,`family_name`,`address_line_two`,`city`,`country`,`state_or_province`,`zip_or_pin_code`,`phone_number`,`created_date`) values (29,'user118',0,'user1@hotmail.com','user1','user1ssdde','X5yDODBqvwTNUFVzVHTNGNdIug36mbeKABcFCMjhPwfkusEqs1K5vYYwey02KTYU','NOT AVAILABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','NOT APPLICABLE','2019-03-31 18:42:16');
﻿USE shalumni;

CREATE TABLE `user_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_picture` longblob,
  `user_picture_content_type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


﻿USE shalumni;

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into `user_role`(`user_id`,`role_id`) values (1,1);
insert into `user_role`(`user_id`,`role_id`) values (2,1);
insert into `user_role`(`user_id`,`role_id`) values (1,2);
insert into `user_role`(`user_id`,`role_id`) values (2,2);


CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
