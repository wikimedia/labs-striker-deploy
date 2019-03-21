-- Apply migrations:
-- * admin.0002_logentry_remove_auto_add
-- * admin.0003_logentry_add_action_flag_choices
-- * auth.0007_alter_validators_add_error_messages
-- * auth.0008_alter_user_username_max_length
-- * auth.0009_alter_user_last_name_max_length
-- * notifications.0006_indexes
-- * tools.0011_auto_20190102_0319

BEGIN;
--
-- Alter field deleted on notification
--
CREATE INDEX `notifications_notification_deleted_b32b69e6` ON `notifications_notification` (`deleted`);
--
-- Alter field emailed on notification
--
CREATE INDEX `notifications_notification_emailed_23a5ad81` ON `notifications_notification` (`emailed`);
--
-- Alter field public on notification
--
CREATE INDEX `notifications_notification_public_1bc30b1c` ON `notifications_notification` (`public`);
--
-- Alter field unread on notification
--
CREATE INDEX `notifications_notification_unread_cce4be30` ON `notifications_notification` (`unread`);
COMMIT;

BEGIN;
--
-- Alter field license on toolinfo
--
ALTER TABLE `tools_toolinfo` DROP FOREIGN KEY `tools_to_license_id_1806093183a32787_fk_tools_softwarelicense_id`;
ALTER TABLE `tools_toolinfo` ADD CONSTRAINT `tools_toolinfo_license_id_704de7c5_fk_tools_softwarelicense_id` FOREIGN KEY (`license_id`) REFERENCES `tools_softwarelicense` (`id`);
COMMIT;

BEGIN;
INSERT INTO `auth_permission` VALUES
(79,'Can view log entry',1,'view_logentry'),
(80,'Can view group',3,'view_group'),
(81,'Can view permission',2,'view_permission'),
(82,'Can view content type',4,'view_contenttype'),
(83,'Can view session',5,'view_session'),
(84,'Can view notification',15,'view_notification'),
(85,'Can view revision',18,'view_revision'),
(86,'Can view version',19,'view_version'),
(87,'Can view milestone',10,'view_milestone'),
(88,'Can view user',6,'view_labsuser'),
(89,'Can view posix account',12,'view_posixaccount'),
(90,'Can view ldap user',13,'view_ldapuser'),
(91,'Can view posix group',11,'view_posixgroup'),
(92,'Can view tool',8,'view_tool'),
(93,'Can view access request comment',26,'view_accessrequestcomment'),
(94,'Can view author',25,'view_author'),
(95,'Can view diffusion repo',9,'view_diffusionrepo'),
(96,'Can view maintainer',7,'view_maintainer'),
(97,'Can view tool info tag',22,'view_toolinfotag'),
(98,'Can view tool user',23,'view_tooluser'),
(99,'Can view Toolinfo',17,'view_toolinfo'),
(100,'Can view software license',16,'view_softwarelicense'),
(101,'Can view access request',14,'view_accessrequest'),
(102,'Can view sudo role',24,'view_sudorole');

LOCK TABLES `django_migrations` WRITE;
INSERT INTO `django_migrations` VALUES
(49,'admin','0002_logentry_remove_auto_add','2019-03-21 22:32:15'),
(50,'admin','0003_logentry_add_action_flag_choices','2019-03-21 22:32:15'),
(51,'auth','0007_alter_validators_add_error_messages','2019-03-21 22:32:15'),
(52,'auth','0008_alter_user_username_max_length','2019-03-21 22:32:15'),
(53,'auth','0009_alter_user_last_name_max_length','2019-03-21 22:32:15'),
(54,'notifications','0006_indexes','2019-03-21 22:32:15'),
(55,'tools','0011_auto_20190102_0319','2019-03-21 22:32:16');
UNLOCK TABLES;
COMMIT;
