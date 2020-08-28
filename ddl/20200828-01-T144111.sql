-- Apply migrations:
-- * tools.0012_phabricatorproject

CREATE TABLE `tools_phabricatorproject` (
    `id` integer AUTO_INCREMENT NOT NULL,
    `tool` varchar(64) NOT NULL,
    `name` varchar(255) NOT NULL,
    `phid` varchar(64) NOT NULL,
    `created_date` datetime(6) NOT NULL,
    `created_by_id` integer NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `tools_phabricatorpro_created_by_id_bc5c3411_fk_labsauth_` FOREIGN KEY (`created_by_id`) REFERENCES `labsauth_labsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

LOCK TABLES `django_content_type` WRITE;
INSERT INTO `django_content_type` VALUES
(27, 'tools', 'phabricatorproject');
UNLOCK TABLES;

LOCK TABLES `auth_permission` WRITE;
INSERT INTO `auth_permission` VALUES
(103,'Can add phabricator project',27,'add_phabricatorproject'),
(104,'Can change phabricator project',27,'change_phabricatorproject'),
(105,'Can delete phabricator project',27,'delete_phabricatorproject'),
(106,'Can view phabricator project',27,'view_phabricatorproject');
UNLOCK TABLES;

LOCK TABLES `django_migrations` WRITE;
INSERT INTO `django_migrations` VALUES
(56,'tools','0012_phabricatorproject','2020-07-16 04:22:21');
UNLOCK TABLES;
