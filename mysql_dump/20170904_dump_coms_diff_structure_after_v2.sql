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
            AND (`ExEv`.`coms_proctor_id` = `Pr`.`coms_proctor_id`));
	        
ALTER TABLE `coms_exam_event` 
CHANGE COLUMN `coms_exam_event_location` `coms_exam_event_location` VARCHAR(256) NULL DEFAULT NULL ;
   
CREATE VIEW `v_coms_participant__Exam_Event` AS
    SELECT DISTINCT
        `EE`.`coms_exam_event_id` AS `coms_exam_event_id`,
        `EE`.`coms_exam_event_name` AS `coms_exam_event_name`,
        `EE`.`state_id` AS `event_state_id`,
        `ST2`.`name` AS `event_state_name`,
        `EE`.`coms_exam_event_start_date` AS `coms_exam_event_start_date`,
        `EE`.`coms_exam_event_finish_date` AS `coms_exam_event_finish_date`,
        `EE`.`coms_exam_event_location` AS `coms_exam_event_location`,
        `EE`.`coms_exam_id` AS `coms_exam_id`,
        `EE`.`coms_delivery_type_id` AS `coms_delivery_type_id`,
        `DT`.`coms_delivery_description` AS `coms_delivery_description`,
        `EE`.`coms_training_org_id` AS `coms_training_org_id`,
        `TRO`.`coms_training_organisation_name` AS `coms_training_organisation_name`,
        `EE`.`coms_trainer_id` AS `coms_trainer_id`,
        `TR`.`coms_trainer_lastname` AS `coms_trainer_lastname`,
        `TR`.`coms_trainer_firstname` AS `coms_trainer_firstname`,
        `P`.`coms_participant_id` AS `coms_participant_id`,
        `P`.`coms_participant_gender` AS `coms_participant_gender`,
        `P`.`coms_participant_lastname` AS `coms_participant_lastname`,
        `P`.`coms_participant_firstname` AS `coms_participant_firstname`,
        `PEE`.`state_id` AS `participant_state`,
        `ST1`.`name` AS `participant_state_name`,
        `P`.`coms_participant_public` AS `coms_participant_public`,
        `P`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,
        `P`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,
        `P`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,
        `P`.`coms_participant_LIAM_id` AS `coms_participant_LIAM_id`
    FROM
        (((((((`coms_participant` `P`
        JOIN `coms_participant_exam_event` `PEE`)
        JOIN `coms_exam_event` `EE`)
        JOIN `state` `ST1`)
        JOIN `state` `ST2`)
        JOIN `coms_delivery_type` `DT`)
        JOIN `coms_training_organisation` `TRO`)
        JOIN `coms_trainer` `TR`)
    WHERE
        ((`P`.`coms_participant_id` = `PEE`.`coms_participant_id`)
            AND (`PEE`.`coms_exam_event_id` = `EE`.`coms_exam_event_id`)
            AND (`ST1`.`state_id` = `PEE`.`state_id`)
            AND (`ST2`.`state_id` = `EE`.`state_id`)
            AND (`DT`.`coms_delivery_type_id` = `EE`.`coms_delivery_type_id`)
            AND (`TRO`.`coms_training_organisation_id` = `EE`.`coms_training_org_id`)
            AND (`TR`.`coms_trainer_id` = `EE`.`coms_trainer_id`))
	    
CREATE VIEW `v_coms_datasheet_exam_event` AS
    SELECT 
        `v_coms_participant__id__email`.`coms_participant_id` AS `coms_participant_id`,
        `v_coms_participant__id__email`.`coms_participant_matriculation` AS `coms_participant_matriculation`,
        `v_coms_participant__id__email`.`coms_participant_md5` AS `coms_participant_md5`,
        `v_coms_participant__id__email`.`coms_participant_base32` AS `coms_participant_base32`,
        `v_coms_participant__id__email`.`coms_participant_gender` AS `coms_participant_gender`,
        `v_coms_participant__id__email`.`coms_participant_lastname` AS `coms_participant_lastname`,
        `v_coms_participant__id__email`.`coms_participant_firstname` AS `coms_participant_firstname`,
        `v_coms_participant__id__email`.`coms_participant_public` AS `coms_participant_public`,
        `v_coms_participant__id__email`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,
        `v_coms_participant__id__email`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,
        `v_coms_participant__id__email`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,
        `v_coms_participant__id__email`.`coms_participant_LIAM_id` AS `coms_participant_LIAM_id`,
        `v_coms_participant__id__email`.`coms_participant_emailadresss` AS `coms_participant_emailadresss`,
        `v_coms_participant__id__email`.`url_form_participant` AS `url_form_participant`,
        `coms_participant_exam_event`.`coms_participant_exam_event_id` AS `coms_participant_exam_event_id`,
        `coms_participant_exam_event`.`coms_exam_event_id` AS `coms_exam_event_id`,
        `coms_participant_exam_event`.`state_id` AS `state_id`,
        `coms_participant_exam_event`.`coms_participant_exam_event_percent` AS `coms_participant_exam_event_percent`,
        `coms_participant_exam_event`.`coms_participant_info` AS `coms_participant_info`
    FROM
        (`v_coms_participant__id__email`
        JOIN `coms_participant_exam_event` ON ((`v_coms_participant__id__email`.`coms_participant_id` = `coms_participant_exam_event`.`coms_participant_id`)))



ALTER TABLE `coms_training_organisation` 
ADD COLUMN `coms_training_organisation_passwd_hash` VARCHAR(512) NULL AFTER `coms_training_organisation_id_md5`;
ADD COLUMN `coms_training_organisation_e-mail` VARCHAR(100) NULL ;

CREATE DEFINER=`root`@`localhost` PROCEDURE `csvexport`(IN table_s CHAR(255), IN table_n CHAR(255), IN outfile_path CHAR(255))
BEGIN
SET @table_schema = table_s;
SET @table_n = table_n;
SET @outfile_path = outfile_path;

SET @col_names = (
SELECT GROUP_CONCAT(QUOTE(column_name)) AS columns
FROM information_schema.columns
WHERE table_schema = @table_schema
AND table_name = @table_n);

SET @cols = CONCAT('(SELECT ', @col_names, ')');

SET @query = CONCAT('(SELECT * FROM ', @table_schema, '.', @table_n,
' INTO OUTFILE \'',@outfile_path,'/',@table_n,'.csv\'
FIELDS ENCLOSED BY \'\\\'\' TERMINATED BY \'\t\' ESCAPED BY \'\'
LINES TERMINATED BY \'\n\')');

/* Concatenates column names to query */
SET @sql = CONCAT(@cols, ' UNION ALL ', @query);


PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END

-----------------------------

CREATE 
VIEW `v_csvexport_trainingorg_exam` AS
    SELECT 
        `coms_training_organisation`.`coms_training_organisation_id` AS `coms_training_organisation_id`,
        `coms_exam`.`coms_exam_id` AS `coms_exam_id`,
        `coms_exam`.`coms_exam_name` AS `coms_exam_name`
    FROM
        ((`coms_training_organisation`
        JOIN `coms_trainingsorganisation_exam` ON ((`coms_trainingsorganisation_exam`.`coms_trainingsorganisation_id` = `coms_training_organisation`.`coms_training_organisation_id`)))
        JOIN `coms_exam` ON ((`coms_trainingsorganisation_exam`.`coms_exam_id` = `coms_exam`.`coms_exam_id`)))


------------------------------------

CREATE 
VIEW `v_csvexport_trainingorg_trainer` AS
    SELECT 
        `coms_training_organisation`.`coms_training_organisation_id` AS `coms_training_organisation_id`,
        `coms_trainer`.`coms_trainer_id` AS `coms_trainer_id`,
        `coms_trainer`.`coms_trainer_firstname` AS `coms_trainer_firstname`,
        `coms_trainer`.`coms_trainer_lastname` AS `coms_trainer_lastname`
    FROM
        ((`coms_training_organisation`
        JOIN `coms_training_organisation_trainer` ON ((`coms_training_organisation_trainer`.`coms_training_organisation_id` = `coms_training_organisation`.`coms_training_organisation_id`)))
        JOIN `coms_trainer` ON ((`coms_training_organisation_trainer`.`coms_trainer_id` = `coms_trainer`.`coms_trainer_id`)))
	
	
---------------
	
	CREATE 
VIEW `v_csvexport_trainer_exam` AS
    SELECT 
        `coms_trainer`.`coms_trainer_id` AS `coms_trainer_id`,
        `coms_trainer`.`coms_trainer_firstname` AS `coms_trainer_firstname`,
        `coms_trainer`.`coms_trainer_lastname` AS `coms_trainer_lastname`,
        `coms_exam`.`coms_exam_language_id` AS `coms_exam_language_id`,
        `coms_exam`.`coms_exam_id` AS `coms_exam_id`,
        `coms_exam`.`coms_exam_name` AS `coms_exam_name`
    FROM
        ((`coms_trainer`
        JOIN `coms_trainer_exam` ON ((`coms_trainer_exam`.`coms_trainer_id` = `coms_trainer`.`coms_trainer_id`)))
        JOIN `coms_exam` ON ((`coms_trainer_exam`.`coms_exam_id` = `coms_exam`.`coms_exam_id`)))
	
-----------------------

CREATE 
VIEW `v_csvexport_trainingorg_proctor` AS
    SELECT 
        `coms_training_organisation`.`coms_training_organisation_id` AS `coms_training_organisation_id`,
        `coms_proctor`.`coms_proctor_id` AS `coms_proctor_id`,
        `coms_proctor`.`coms_proctor_firstname` AS `coms_proctor_firstname`,
        `coms_proctor`.`coms_proctor_lastname` AS `coms_proctor_lastname`
    FROM
        ((`coms_training_organisation`
        JOIN `coms_training_organisation_proctor` ON ((`coms_training_organisation_proctor`.`coms_training_organisation_id` = `coms_training_organisation`.`coms_training_organisation_id`)))
        JOIN `coms_proctor` ON ((`coms_training_organisation_proctor`.`coms_proctor_id` = `coms_proctor`.`coms_proctor_id`)))

------------------- Create new row in certificates
ALTER TABLE `coms_certificate` 
ADD COLUMN `coms_certificate_intro` LONGTEXT NULL DEFAULT NULL AFTER `coms_certificate_intro`;

  
--------------- modify table with coloumn state_id - Bigint(20) and create Foreign KEY

ALTER TABLE `coms_certificate` 
ADD COLUMN `state_id` BIGINT(20) NULL ;

ALTER TABLE `coms_certificate` 
ADD CONSTRAINT `state_id_fk01`
  FOREIGN KEY (`state_id`)
  REFERENCES `state` (`state_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

  
ALTER TABLE `coms_trainer` 
ADD COLUMN `state_id` BIGINT(20) NULL ;

ALTER TABLE `coms_trainer` 
ADD CONSTRAINT `state_id_fk02`
  FOREIGN KEY (`state_id`)
  REFERENCES `state` (`state_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `coms_trainer_exam` 
ADD COLUMN `state_id` BIGINT(20) NULL ;

ALTER TABLE `coms_trainer_exam` 
ADD CONSTRAINT `state_id_fk03`
  FOREIGN KEY (`state_id`)
  REFERENCES `state` (`state_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

  ALTER TABLE `coms_training_organisation_trainer` 
ADD COLUMN `state_id` BIGINT(20) NULL ;

ALTER TABLE `coms_training_organisation_trainer` 
ADD CONSTRAINT `state_id_fk04`
  FOREIGN KEY (`state_id`)
  REFERENCES `state` (`state_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

  ALTER TABLE `coms_proctor` 
ADD COLUMN `state_id` BIGINT(20) NULL ;

ALTER TABLE `coms_proctor` 
ADD CONSTRAINT `state_id_fk05`
  FOREIGN KEY (`state_id`)
  REFERENCES `state` (`state_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

   ALTER TABLE `coms_certificate_participant` 
ADD COLUMN `state_id` BIGINT(20) NULL ;

ALTER TABLE `coms_certificate_participant` 
ADD CONSTRAINT `state_id_fk06`
  FOREIGN KEY (`state_id`)
  REFERENCES `state` (`state_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
 
  
ALTER TABLE `coms_training_organisation` 
ADD COLUMN `state_id` BIGINT(20) NULL ;

ALTER TABLE `coms_training_organisation` 
ADD CONSTRAINT `state_id_fk07`
  FOREIGN KEY (`state_id`)
  REFERENCES `state` (`state_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
 ALTER TABLE `coms_trainingsorganisation_exam` 
ADD COLUMN `state_id` BIGINT(20) NULL ;

ALTER TABLE `coms_trainingsorganisation_exam` 
ADD CONSTRAINT `state_id_fk08`
  FOREIGN KEY (`state_id`)
  REFERENCES `state` (`state_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  
