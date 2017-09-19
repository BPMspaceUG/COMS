ALTER TABLE `bpmspace_coms_v2`.`coms_certificate_participant` 
ADD INDEX `fk_2_participant_id_idx` (`coms_participant_id` ASC);
ALTER TABLE `bpmspace_coms_v2`.`coms_certificate_participant` 
ADD CONSTRAINT `fk_2_participant_id`
  FOREIGN KEY (`coms_participant_id`)
  REFERENCES `bpmspace_coms_v2`.`coms_participant` (`coms_participant_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE 
VIEW `v_exam_event__exam__trainingorg__trainer` AS
    SELECT 
        `ExEv`.`coms_exam_event_id` AS `coms_exam_event_id`,
        `ExEv`.`coms_exam_event_name` AS `coms_exam_event_name`,
        `ExEv`.`coms_exam_id` AS `coms_exam_id`,
        `ExEv`.`coms_exam_event_id_md5` AS `coms_exam_event_id_md5`,
        `ExEv`.`coms_exam_event_3digit` AS `coms_exam_event_3digit`,
        `ExEv`.`coms_exam_event_id_base32` AS `coms_exam_event_id_base32`,
        `Ex`.`coms_exam_name` AS `coms_exam_name`,
        `Lg`.`language` AS `exam_language`,
        `ExEv`.`state_id` AS `event_state_id`,
        `state`.`name` AS `event_state_name`,
        `ExEv`.`coms_exam_event_start_date` AS `coms_exam_event_start_date`,
        `ExEv`.`coms_exam_event_finish_date` AS `coms_exam_event_finish_date`,
        `ExEv`.`coms_delivery_type_id` AS `coms_delivery_type_id`,
        `DeTy`.`coms_delivery_description` AS `coms_delivery_description`,
        `ExEv`.`coms_exam_event_location` AS `coms_exam_event_location`,
        `ExEv`.`coms_training_org_id` AS `coms_training_org_id`,
        `TrOr`.`coms_training_organisation_name` AS `coms_training_organisation_name`,
        `ExEv`.`coms_trainer_id` AS `coms_trainer_id`,
        `Tr`.`coms_trainer_firstname` AS `coms_trainer_firstname`,
        `Tr`.`coms_trainer_lastname` AS `coms_trainer_lastname`,
		`ExEv`.`coms_proctor_id` AS `coms_proctor_id`,
        `Pr`.`coms_proctor_firstname` AS `coms_proctor_firstname`,
        `Pr`.`coms_proctor_lastname` AS `coms_proctor_lastname`
    FROM
        (((((((`coms_exam_event` `ExEv`
        JOIN `coms_exam` `Ex`)
        JOIN `state`)
        JOIN `coms_delivery_type` `DeTy`)
        JOIN `coms_training_organisation` `TrOr`)
        JOIN `coms_trainer` `Tr`)
        JOIN `coms_language` `Lg`)
        JOIN `coms_proctor` `Pr`)
    WHERE
        ((`ExEv`.`coms_exam_id` = `Ex`.`coms_exam_id`)
            AND (`ExEv`.`state_id` = `state`.`state_id`)
            AND (`ExEv`.`coms_delivery_type_id` = `DeTy`.`coms_delivery_type_id`)
            AND (`ExEv`.`coms_training_org_id` = `TrOr`.`coms_training_organisation_id`)
            AND (`ExEv`.`coms_trainer_id` = `Tr`.`coms_trainer_id`)
            AND (`Ex`.`coms_exam_language_id` = `Lg`.`coms_language_id`)
            AND (`ExEv`.`coms_proctor_id` = `Pr`.`coms_proctor_id`))
	        
ALTER TABLE `bpmspace_coms_v1`.`coms_exam_event` 
CHANGE COLUMN `coms_exam_event_location` `coms_exam_event_location` VARCHAR(256) NULL DEFAULT NULL ;
   
