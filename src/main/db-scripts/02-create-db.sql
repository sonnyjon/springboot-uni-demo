DROP SCHEMA IF EXISTS `university-demo`;
CREATE SCHEMA `university-demo`;
USE `university-demo`;

SET FOREIGN_KEY_CHECKS = 0;
--
-- Drop tables first.
--
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `authorities`;
-- DROP TABLE IF EXISTS `profile`;
DROP TABLE IF EXISTS `college`;
DROP TABLE IF EXISTS `major`;
DROP TABLE IF EXISTS `teacher`;
DROP TABLE IF EXISTS `student`;
DROP TABLE IF EXISTS `course`;
DROP TABLE IF EXISTS `course_student`;
--
-- These two tables 'users' and 'authorities' are needed for Spring Security.
--
CREATE TABLE `users`
(
  `username` varchar(80) NOT NULL,
  `password` char(80) NOT NULL,
  `enabled` tinyint(1) NOT NULL,

  PRIMARY KEY (`username`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `authorities`
(
  `username` varchar(80) NOT NULL,
  `authority` varchar(50) NOT NULL,

  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Seed one admin user and role
--
INSERT INTO `users` VALUES ('admin@sju.edu','$2a$10$GCJZft7/wMzJGQs3GRVJAeSzd0h.d3yivB6/C.n0OHF37nqYsHgsy',1);
INSERT INTO `authorities` VALUES ('admin@sju.edu','ROLE_ADMIN');
--
-- Demo app tables
--
CREATE TABLE `college`
(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(80) DEFAULT NULL,

    PRIMARY KEY (`id`),
    UNIQUE KEY `TITLE_UNIQUE` (`title`)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `major`
(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(80) DEFAULT NULL,
    `college_id` int(11) DEFAULT NULL,

    PRIMARY KEY (`id`),
    UNIQUE KEY `TITLE_UNIQUE` (`title`),

    KEY `FK_COLLEGE_idx` (`college_id`),
    CONSTRAINT `FK_COLLEGE_1` FOREIGN KEY (`college_id`)
    REFERENCES `college` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `teacher`
(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `first_name` varchar(45) DEFAULT NULL,
    `last_name` varchar(45) DEFAULT NULL,
    `email` varchar(80) DEFAULT NULL,
    `url` varchar(128) DEFAULT NULL,
    `college_id` int(11) DEFAULT NULL,

    PRIMARY KEY (`id`),

    KEY `FK_EMAIL` (`email`),
    CONSTRAINT `FK_EMAIL_1` FOREIGN KEY (`email`)
    REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,

    KEY `FK_COLLEGE_idx` (`college_id`),
    CONSTRAINT `FK_COLLEGE_2` FOREIGN KEY (`college_id`)
    REFERENCES `college` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `student`
(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `grade_level` int(1) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,

  PRIMARY KEY (`id`),

  KEY `FK_EMAIL` (`email`),
  CONSTRAINT `FK_EMAIL_2` FOREIGN KEY (`email`)
  REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,

  KEY `FK_MAJOR_idx` (`major_id`),
  CONSTRAINT `FK_MAJOR_1` FOREIGN KEY (`major_id`)
  REFERENCES `major` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `course`
(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY `TITLE_UNIQUE` (`title`),

  KEY `FK_MAJOR_idx` (`major_id`),
  CONSTRAINT `FK_MAJOR_2` FOREIGN KEY (`major_id`)
  REFERENCES `major` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,

  KEY `FK_TEACHER_idx` (`teacher_id`),
  CONSTRAINT `FK_TEACHER_1` FOREIGN KEY (`teacher_id`)
  REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `course_student`
(
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,

  PRIMARY KEY (`course_id`,`student_id`),

  KEY `FK_STUDENT_idx` (`student_id`),
  CONSTRAINT `FK_COURSE_1` FOREIGN KEY (`course_id`)
  REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,

  CONSTRAINT `FK_STUDENT_1` FOREIGN KEY (`student_id`)
  REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
