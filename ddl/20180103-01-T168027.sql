-- T168027: Enhance workflow for tool labs membership requests
-- Generated with mysqldump and hand edited by bd808
--
-- NOTE: requires a server with innodb_large_prefix enabled to support UNIQUE
-- indexes on varchar(255) columns with a utf8mb4. If innodb_large_prefix is
-- not enabled you will receive errors mentioning "Specified key was too long;
-- max key length is 767 bytes"

CREATE TABLE `tools_accessrequestcomment` (                                       `id` int(11) NOT NULL AUTO_INCREMENT,                                           `created_date` datetime NOT NULL,                                               `comment` longtext COLLATE utf8mb4_bin NOT NULL,                                `request_id` int(11) NOT NULL,                                                  `user_id` int(11) NOT NULL,                                                     PRIMARY KEY (`id`),                                                             KEY `tools_accessrequestcomment_d5240003` (`created_date`),                     KEY `tools_accessrequestcomment_f68d2c36` (`request_id`),                       KEY `tools_accessrequestcomment_e8701ad4` (`user_id`),                          CONSTRAINT `tools_accessreq_user_id_11c3c61e2a34db92_fk_labsauth_labsuser_id` FOREIGN KEY (`user_id`) REFERENCES `labsauth_labsuser` (`id`),                    CONSTRAINT `tools_acces_request_id_c7857228c268e3f_fk_tools_accessrequest_id` FOREIGN KEY (`request_id`) REFERENCES `tools_accessrequest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

LOCK TABLES `django_content_type` WRITE;
INSERT INTO `django_content_type` VALUES
(26,'tools','accessrequestcomment');
UNLOCK TABLES;

LOCK TABLES `auth_permission` WRITE;
INSERT INTO `auth_permission` VALUES
(76,'Can add access request comment',26,'add_accessrequestcomment'),
(77,'Can change access request comment',26,'change_accessrequestcomment'),
(78,'Can delete access request comment',26,'delete_accessrequestcomment');
UNLOCK TABLES;

LOCK TABLES `django_migrations` WRITE;
INSERT INTO `django_migrations` VALUES
(48,'tools','0010_T168027','2017-08-27 21:30:17');
UNLOCK TABLES;
