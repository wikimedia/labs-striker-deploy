-- T162508: Tool Labs membership application and processing
-- Generated with mysqldump and hand edited by bd808
--
-- NOTE: requires a server with innodb_large_prefix enabled to support UNIQUE
-- indexes on varchar(255) columns with a utf8mb4. If innodb_large_prefix is
-- not enabled you will receive errors mentioning "Specified key was too long;
-- max key length is 767 bytes"

-- Add new tools_accessrequest table
CREATE TABLE `tools_accessrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` longtext COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime NOT NULL,
  `admin_notes` longtext COLLATE utf8mb4_bin,
  `status` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `resolved_date` datetime DEFAULT NULL,
  `resolved_by_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `suppressed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tools_ac_resolved_by_id_4bc2bcd3f7ab8550_fk_labsauth_labsuser_id` (`resolved_by_id`),
  KEY `tools_accessreq_user_id_4e853060c8b140f2_fk_labsauth_labsuser_id` (`user_id`),
  KEY `tools_accessrequest_d5240003` (`created_date`),
  KEY `tools_accessrequest_9acb4454` (`status`),
  KEY `tools_accessrequest_4f431d97` (`suppressed`),
  CONSTRAINT `tools_accessreq_user_id_4e853060c8b140f2_fk_labsauth_labsuser_id` FOREIGN KEY (`user_id`) REFERENCES `labsauth_labsuser` (`id`),
  CONSTRAINT `tools_ac_resolved_by_id_4bc2bcd3f7ab8550_fk_labsauth_labsuser_id` FOREIGN KEY (`resolved_by_id`) REFERENCES `labsauth_labsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Add new notifications_notification table
CREATE TABLE `notifications_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `unread` tinyint(1) NOT NULL,
  `actor_object_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `verb` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `target_object_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `action_object_object_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `public` tinyint(1) NOT NULL,
  `action_object_content_type_id` int(11) DEFAULT NULL,
  `actor_content_type_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `target_content_type_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `emailed` tinyint(1) NOT NULL,
  `data` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `D51ab495b7f5bcab62c88325df2be900` (`action_object_content_type_id`),
  KEY `f48a17791e09ec102d1b34d38e3a0474` (`actor_content_type_id`),
  KEY `notificatio_recipient_id_6df06746b2eeab5_fk_labsauth_labsuser_id` (`recipient_id`),
  KEY `D67b40cca018bb8b6a44239c7accec1d` (`target_content_type_id`),
  CONSTRAINT `D51ab495b7f5bcab62c88325df2be900` FOREIGN KEY (`action_object_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `D67b40cca018bb8b6a44239c7accec1d` FOREIGN KEY (`target_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `f48a17791e09ec102d1b34d38e3a0474` FOREIGN KEY (`actor_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `notificatio_recipient_id_6df06746b2eeab5_fk_labsauth_labsuser_id` FOREIGN KEY (`recipient_id`) REFERENCES `labsauth_labsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;


-- Drop bogus tables for LDAP models created before the LDAP model backend was
-- patched to keep them out of migrations.
DROP TABLE `tools_maintainer`;
DROP TABLE `tools_tool`;

-- Update content type table for new models
LOCK TABLES `django_content_type` WRITE;
INSERT INTO `django_content_type` VALUES
    (11,'labsauth','posixgroup'),
    (12,'labsauth','posixaccount'),
    (13,'labsauth','ldapuser'),
    (14,'tools','accessrequest'),
    (15,'notifications','notification');
UNLOCK TABLES;

-- Update migrations tracking table
LOCK TABLES `django_migrations` WRITE;
INSERT INTO `django_migrations` VALUES
    (21,'labsauth','0002_ldapuser_posixaccount_posixgroup','2017-03-21 23:33:47'),
    (25,'tools','0003_accessrequest','2017-03-27 04:59:23'),
    (26,'tools','0004_accessrequest_suppress','2017-04-13 04:16:57'),
    (27,'notifications','0001_initial','2017-04-13 04:52:57'),
    (28,'notifications','0002_auto_20150224_1134','2017-04-13 04:52:57'),
    (29,'notifications','0003_notification_data','2017-04-13 04:52:57'),
    (30,'notifications','0004_auto_20150826_1508','2017-04-13 04:52:57'),
    (31,'notifications','0005_auto_20160504_1520','2017-04-13 04:52:57');
UNLOCK TABLES;
