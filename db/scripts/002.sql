ALTER TABLE `sg_sinister` ADD COLUMN `si_address_street` VARCHAR(255) NULL DEFAULT NULL AFTER `si_document`;
ALTER TABLE `sg_sinister` ADD COLUMN `si_address_number` VARCHAR(255) NULL DEFAULT NULL AFTER `si_document`;
ALTER TABLE `sg_sinister` ADD COLUMN `si_address_dpto` VARCHAR(255) NULL DEFAULT NULL AFTER `si_document`;
ALTER TABLE `sg_sinister` ADD COLUMN `si_address_floor` VARCHAR(255) NULL DEFAULT NULL AFTER `si_document`;
ALTER TABLE `sg_sinister` ADD COLUMN `si_address_postal` VARCHAR(255) NULL DEFAULT NULL AFTER `si_document`;
ALTER TABLE `sg_provider` ADD COLUMN `pr_email` VARCHAR(255) NOT NULL AFTER `pr_deleted`;