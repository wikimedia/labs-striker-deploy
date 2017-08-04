-- T149458: Manage shared tool accounts
-- Generated with mysqldump and hand edited by bd808
--
-- NOTE: requires a server with innodb_large_prefix enabled to support UNIQUE
-- indexes on varchar(255) columns with a utf8mb4. If innodb_large_prefix is
-- not enabled you will receive errors mentioning "Specified key was too long;
-- max key length is 767 bytes"

-- New software license table
CREATE TABLE `tools_softwarelicense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(32) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `url` varchar(2047) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `family` varchar(32) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `osi_approved` tinyint(1) NOT NULL,
  `recommended` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `tools_softwarelicense_0d3fda0b` (`family`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


-- Add OSI-approved licenses
LOCK TABLES `tools_softwarelicense` WRITE;
INSERT INTO `tools_softwarelicense` VALUES
(1,'GPL-3.0','GNU General Public License 3.0','https://www.gnu.org/licenses/gpl-3.0.html','GPL',1,1),
(2,'GPL-2.0','GNU General Public License 2.0','https://www.gnu.org/licenses/gpl-2.0.html','GPL',1,1),
(3,'AGPL-3.0','GNU Affero General Public License 3.0','https://www.gnu.org/licenses/agpl-3.0.html','AGPL',1,0),
(4,'LGPL-2.1','GNU Lesser General Public License 2.1','https://www.gnu.org/licenses/lgpl-2.1.html','LGPL',1,0),
(5,'LGPL-3.0','GNU Lesser General Public License 3.0','https://www.gnu.org/licenses/lgpl-3.0.html','LGPL',1,0),
(6,'MIT','MIT License','https://opensource.org/licenses/mit-license.php','MIT',1,1),
(7,'ISC','ISC License','https://opensource.org/licenses/ISC','ISC',1,0),
(8,'BSD-2-Clause','BSD 2-clause \"Simplified\" License','https://opensource.org/licenses/BSD-2-Clause','BSD',1,0),
(9,'BSD-3-Clause','BSD 3-clause \"Modified\" License','https://opensource.org/licenses/BSD-3-Clause','BSD',1,0),
(10,'Apache-2.0','Apache License 2.0','https://www.apache.org/licenses/LICENSE-2.0','Apache',1,1),
(11,'MPL-2.0','Mozilla Public License 2.0','https://www.mozilla.org/MPL/2.0/','MPL',1,0),
(12,'CDDL-1.0','Common Development and Distribution License','https://opensource.org/licenses/CDDL-1.0','CDDL',1,0),
(13,'EPL-1.0','Eclipse Public License 1.0','https://opensource.org/licenses/EPL-1.0','EPL',1,0),
(14,'LiLiQ-P-1.1','Licence Libre du Québec – Permissive (LiLiQ-P) version 1.1','https://opensource.org/licenses/LiLiQ-P-1.1','LiLiQ',1,0),
(15,'LiLiQ-R-1.1','Licence Libre du Québec – Réciprocité (LiLiQ-R) version 1.1','https://opensource.org/licenses/LiLiQ-R-1.1','LiLiQ',1,0),
(16,'LiLiQ-R+-1.1','Licence Libre du Québec – Réciprocité forte (LiLiQ-R+) version 1.1','https://opensource.org/licenses/LiLiQ-Rplus-1.1','LiLiQ',1,0),
(17,'ECL-2.0','Educational Community License, Version 2.0','https://opensource.org/licenses/ECL-2.0','ECL',1,0),
(18,'APL-1.0','Adaptive Public License 1.0','https://opensource.org/licenses/APL-1.0','APL',1,0),
(19,'Artistic-2.0','Artistic License 2.0','https://opensource.org/licenses/Artistic-2.0','Artistic',1,0),
(20,'FPL-1.0.0','Free Public License 1.0.0','https://opensource.org/licenses/FPL-1.0.0','FPL',1,0),
(21,'OSL-3.0','The Open Software License 3.0','https://opensource.org/licenses/OSL-3.0','OSL',1,0),
(22,'QPL-1.0','The Q Public License Version','https://opensource.org/licenses/QPL-1.0','QPL',1,0),
(23,'UPL-1.0','The Universal Permissive License (UPL), Version 1.0','https://opensource.org/licenses/UPL','UPL',1,0),
(24,'Zlib','The zlib/libpng License','https://opensource.org/licenses/Zlib','Zlib',1,0),
(25,'Fair','Fair License','https://opensource.org/licenses/Fair','Fair',1,0);
UNLOCK TABLES;

CREATE TABLE `tools_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci  NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

CREATE TABLE `tools_toolinfotag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci  NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

-- new toolinfo table
CREATE TABLE `tools_toolinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `tool` varchar(64) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci  NOT NULL,
  `suburl` varchar(2047) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `repository` varchar(2047) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `issues` varchar(2047) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `docs` varchar(2047) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
  `license_id` int(11) NOT NULL,
  `is_webservice` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `tools_to_license_id_1806093183a32787_fk_tools_softwarelicense_id` (`license_id`),
  KEY `tools_toolinfo_39ab32c5` (`tool`),
  CONSTRAINT `tools_to_license_id_1806093183a32787_fk_tools_softwarelicense_id` FOREIGN KEY (`license_id`) REFERENCES `tools_softwarelicense` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  ROW_FORMAT=DYNAMIC;

-- new many-to-many relation table for toolinfo authors
CREATE TABLE `tools_toolinfo_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `toolinfo_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `toolinfo_id` (`toolinfo_id`,`author_id`),
  KEY `tools_toolinfo_author_id_4ffe8617f18838da_fk_tools_author_id` (`author_id`),
  CONSTRAINT `tools_toolinfo_author_id_4ffe8617f18838da_fk_tools_author_id` FOREIGN KEY (`author_id`) REFERENCES `tools_author` (`id`),
  CONSTRAINT `tools_toolinfo_toolinfo_id_4ffe8617f18838da_fk_tools_toolinfo_id` FOREIGN KEY (`toolinfo_id`) REFERENCES `tools_toolinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

-- new many-to-many relation table for toolinfo tags
CREATE TABLE `tools_toolinfo_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `toolinfo_id` int(11) NOT NULL,
  `toolinfotag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `toolinfo_id` (`toolinfo_id`,`toolinfotag_id`),
  KEY `tools_to_toolinfotag_id_44c5e0c5b4f56504_fk_tools_toolinfotag_id` (`toolinfotag_id`),
  CONSTRAINT `tools_toolinfo_toolinfo_id_1c284a3ede98506c_fk_tools_toolinfo_id` FOREIGN KEY (`toolinfo_id`) REFERENCES `tools_toolinfo` (`id`),
  CONSTRAINT `tools_to_toolinfotag_id_44c5e0c5b4f56504_fk_tools_toolinfotag_id` FOREIGN KEY (`toolinfotag_id`) REFERENCES `tools_toolinfotag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

-- Revision storage
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci  NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revis_user_id_6bad4f456f449386_fk_labsauth_labsuser_id` (`user_id`),
  KEY `reversion_revision_c69e55a4` (`date_created`),
  CONSTRAINT `reversion_revis_user_id_6bad4f456f449386_fk_labsauth_labsuser_id` FOREIGN KEY (`user_id`) REFERENCES `labsauth_labsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;


CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `format` varchar(255) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `serialized_data` longtext COLLATE utf8mb4_unicode_ci  NOT NULL,
  `object_repr` longtext COLLATE utf8mb4_unicode_ci  NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `suppressed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_66a3d7c6ce148aa6_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `rever_content_type_id_3ad82cfc3a3d86bc_fk_django_content_type_id` (`content_type_id`),
  KEY `reversion__revision_id_35cf0df5d611c65e_fk_reversion_revision_id` (`revision_id`),
  KEY `reversion_version_4f431d97` (`suppressed`),
  CONSTRAINT `reversion__revision_id_35cf0df5d611c65e_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`),
  CONSTRAINT `rever_content_type_id_3ad82cfc3a3d86bc_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

-- Update content type table for new models
LOCK TABLES `django_content_type` WRITE;
INSERT INTO `django_content_type` VALUES
(16,'tools','softwarelicense'),
(17,'tools','toolinfo'),
(18,'reversion','revision'),
(19,'reversion','version'),
(20,'taggit','tag'),
(21,'taggit','taggeditem'),
(22,'tools','toolinfotag'),
(23,'tools','tooluser'),
(24,'tools','sudorole'),
(25,'tools','author');
UNLOCK TABLES;

LOCK TABLES `auth_permission` WRITE;
INSERT INTO `auth_permission` VALUES
(31,'Can add posix group',11,'add_posixgroup'),
(32,'Can change posix group',11,'change_posixgroup'),
(33,'Can delete posix group',11,'delete_posixgroup'),
(34,'Can add posix account',12,'add_posixaccount'),
(35,'Can change posix account',12,'change_posixaccount'),
(36,'Can delete posix account',12,'delete_posixaccount'),
(37,'Can add ldap user',13,'add_ldapuser'),
(38,'Can change ldap user',13,'change_ldapuser'),
(39,'Can delete ldap user',13,'delete_ldapuser'),
(40,'Can add access request',14,'add_accessrequest'),
(41,'Can change access request',14,'change_accessrequest'),
(42,'Can delete access request',14,'delete_accessrequest'),
(43,'Can add notification',15,'add_notification'),
(44,'Can change notification',15,'change_notification'),
(45,'Can delete notification',15,'delete_notification'),
(46,'Can add software license',16,'add_softwarelicense'),
(47,'Can change software license',16,'change_softwarelicense'),
(48,'Can delete software license',16,'delete_softwarelicense'),
(49,'Can add tool info',17,'add_toolinfo'),
(50,'Can change tool info',17,'change_toolinfo'),
(51,'Can delete tool info',17,'delete_toolinfo'),
(52,'Can add revision',18,'add_revision'),
(53,'Can change revision',18,'change_revision'),
(54,'Can delete revision',18,'delete_revision'),
(55,'Can add version',19,'add_version'),
(56,'Can change version',19,'change_version'),
(57,'Can delete version',19,'delete_version'),
(58,'Can add Tag',20,'add_tag'),
(59,'Can change Tag',20,'change_tag'),
(60,'Can delete Tag',20,'delete_tag'),
(61,'Can add Tagged Item',21,'add_taggeditem'),
(62,'Can change Tagged Item',21,'change_taggeditem'),
(63,'Can delete Tagged Item',21,'delete_taggeditem'),
(64,'Can add tool info tag',22,'add_toolinfotag'),
(65,'Can change tool info tag',22,'change_toolinfotag'),
(66,'Can delete tool info tag',22,'delete_toolinfotag'),
(67,'Can add tool user',23,'add_tooluser'),
(68,'Can change tool user',23,'change_tooluser'),
(69,'Can delete tool user',23,'delete_tooluser'),
(70,'Can add sudo role',24,'add_sudorole'),
(71,'Can change sudo role',24,'change_sudorole'),
(72,'Can delete sudo role',24,'delete_sudorole'),
(73,'Can add author',25,'add_author'),
(74,'Can change author',25,'change_author'),
(75,'Can delete author',25,'delete_author');
UNLOCK TABLES;

-- Update migrations tracking table
LOCK TABLES `django_migrations` WRITE;
INSERT INTO `django_migrations` VALUES
(33,'tools','0005_toolinfo','2017-04-17 04:10:25'),
(34,'tools','0006_toolinfo2','2017-05-11 03:11:30'),
(35,'reversion','0001_initial','2017-05-12 04:25:43'),
(36,'reversion','0002_auto_20141216_1509','2017-05-12 04:25:43'),
(37,'reversion','0003_auto_20160601_1600','2017-05-12 04:25:43'),
(38,'reversion','0004_auto_20160611_1202','2017-05-12 04:25:43'),
(39,'reversion','0001_squashed_0004_auto_20160611_1202','2017-05-12 04:25:43'),
(42,'tools','0006_monkey_patch_reversion','2017-06-04 21:23:42'),
(45,'tools','0007_toolinfo_tags','2017-06-11 19:36:58'),
(46,'tools','0008_ldap_models','2017-07-09 22:47:40'),
(47,'tools','0009_toolinfo_authors','2017-08-03 21:44:14');
UNLOCK TABLES;
