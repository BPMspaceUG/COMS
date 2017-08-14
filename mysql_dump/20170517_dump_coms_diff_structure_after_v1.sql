-- 20170517_dump_coms_diff_structure_after_v1.sql

-- Add missing fk constraint

ALTER TABLE `coms_certificate_participant` 
ADD INDEX `fk_1_certificate_id_idx` (`coms_certificate_id` ASC);
ALTER TABLE `coms_certificate_participant` 
ADD CONSTRAINT `fk_1_certificate_id`
  FOREIGN KEY (`coms_certificate_id`)
  REFERENCES `coms_certificate` (`coms_certificate_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


-- Add missing new view
DROP VIEW  IF EXISTS `v_coms_trainer_exam_org`;
CREATE 
VIEW `v_coms_trainer_exam_org` AS
    SELECT 
        `training_organisation`.`coms_training_organisation_id` AS `coms_training_organisation_id`,
        `training_organisation`.`coms_training_organisation_name` AS `coms_training_organisation_name`,
        `trainer`.`coms_trainer_id` AS `coms_trainer_id`,
        `trainer`.`coms_trainer_id_base32` AS `coms_trainer_id_base32`,
        `trainer`.`coms_trainer_firstname` AS `coms_trainer_firstname`,
        `trainer`.`coms_trainer_lastname` AS `coms_trainer_lastname`,
        `exam`.`coms_exam_id` AS `coms_exam_id`,
		    `exam`.`coms_exam_name` AS `coms_exam_name`
    FROM
        ((((`coms_trainer` `trainer`
        JOIN `coms_trainer_exam` `trainer_exam`)
        JOIN `coms_exam` `exam`)
        JOIN `coms_training_organisation_trainer` `training_organisation_trainer`)
        JOIN `coms_training_organisation` `training_organisation`)
    WHERE
        ((`trainer`.`coms_trainer_id` = `trainer_exam`.`coms_trainer_id`)
            AND (`trainer_exam`.`coms_exam_id` = `exam`.`coms_exam_id`)
            AND (`trainer`.`coms_trainer_id` = `training_organisation_trainer`.`coms_trainer_id`)
            AND (`training_organisation`.`coms_training_organisation_id` = `training_organisation_trainer`.`coms_training_organisation_id`));
