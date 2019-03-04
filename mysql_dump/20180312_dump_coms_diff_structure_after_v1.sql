-- New create with expiration date: create_cert_part is now depricated


/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_cert_part_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_cert_part_2`(IN PART_ID CHAR(255), IN CERT_ID CHAR(255), IN EVENT_ID bigint(20))
BEGIN

-- Select date from exam date

Select coms_exam_event_start_date into @Date from coms_participant_exam_event join coms_exam_event on coms_exam_event.coms_exam_event_id = coms_participant_exam_event.coms_exam_event_id where coms_exam_event.coms_exam_event_id = EVENT_ID and coms_participant_exam_event.coms_participant_id = PART_ID;

set @Cert_ID = CERT_ID;
set @Participant_ID = PART_ID;
-- set @revocation = 
-- SELECT coms_certificate_valid_months from coms_certificate where coms_certificate_id = @Cert_ID;
set @expdate = DATE_SUB(DATE_ADD(@Date, INTERVAL (SELECT coms_certificate_valid_months from coms_certificate where coms_certificate_id = @Cert_ID) MONTH), INTERVAL 1 DAY);

INSERT INTO `coms_certificate_participant` (`coms_certificate_participant_date`, `coms_certificate_id`, `coms_participant_id`, `coms_certificate_participant_expiration_date`, `state_id`) VALUES (@Date, @Cert_ID, @Participant_ID, @expdate, 73);

set @coms_certificate_participant_ID = LAST_INSERT_ID();

UPDATE coms_certificate_participant set coms_certificate_participant_id_md5 = md5(coms_certificate_participant_id) where coms_certificate_participant_id = @coms_certificate_participant_ID;

UPDATE `coms_certificate_participant` set coms_certificate_participant_3digit = SUBSTRING(CONV(SUBSTRING(coms_certificate_participant_id_md5,1,5),16,10),1,3) where coms_certificate_participant_id = @coms_certificate_participant_ID;

UPDATE `coms_certificate_participant` set coms_certificate_participant_id_base32 = LPAD(CONV(concat(coms_certificate_participant_id,coms_certificate_participant_3digit),10,32),8,'0') where coms_certificate_participant_id = @coms_certificate_participant_ID;

END ;;

DELIMITER ;
                                                                                                                                
                                                                                                                                ALTER TABLE `bpmspace_coms_v1`.`coms_exam_event` 
ADD CONSTRAINT `coms_exam_version_id_fk1`
  FOREIGN KEY (`coms_exam_version_id`)
  REFERENCES `bpmspace_coms_v1`.`coms_exam_version` (`coms_exam_version_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
                                                                                                                               

CREATE VIEW 
		`v_coms_trainingorg_exam_events` AS
     SELECT 
        `coms_exam_event`.`coms_exam_event_id` AS `coms_exam_event_id`,
        `coms_exam`.`coms_exam_name` AS `coms_exam_name`,
        `coms_exam_event`.`coms_exam_event_start_date` AS `coms_exam_event_start_date`,
        `coms_trainer`.`coms_trainer_firstname` AS `coms_trainer_firstname`,
        `coms_trainer`.`coms_trainer_lastname` AS `coms_trainer_lastname`,
        `coms_proctor`.`coms_proctor_firstname` AS `coms_proctor_firstname`,
        `coms_proctor`.`coms_proctor_lastname` AS `coms_proctor_lastname`,
        `state`.`name` AS `state`,
        `coms_exam_event`.`coms_training_org_id` AS `coms_training_org_id`
    FROM
        ((((`coms_exam`
        JOIN `coms_exam_event` ON ((`coms_exam_event`.`coms_exam_id` = `coms_exam`.`coms_exam_id`)))
        JOIN `coms_proctor` ON ((`coms_exam_event`.`coms_proctor_id` = `coms_proctor`.`coms_proctor_id`)))
        JOIN `coms_trainer` ON ((`coms_exam_event`.`coms_trainer_id` = `coms_trainer`.`coms_trainer_id`)))
        JOIN `state` ON ((`coms_exam_event`.`state_id` = `state`.`state_id`)));

																
																USE `bpmspace_coms_v1_TEST`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_coms_participant__exam_event` AS
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
        `P`.`coms_participant_LIAM_id` AS `coms_participant_LIAM_id`,
        `P`.`coms_participant_language_id` AS `coms_participant_language_id`,
        `PEE`.`coms_participant_exam_event_id` AS `coms_participant_exam_event_id`
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
            AND (`TR`.`coms_trainer_id` = `EE`.`coms_trainer_id`));
		 

CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_csvexport_trainingorg_exam` AS
    SELECT 
        `coms_training_organisation`.`coms_training_organisation_id` AS `coms_training_organisation_id`,
        `coms_exam`.`coms_exam_id` AS `coms_exam_id`,
        `coms_exam`.`coms_exam_name` AS `coms_exam_name`,
        `state`.`name` AS `state`,
        `coms_language`.`language_short` AS `language`
    FROM
        ((((`coms_training_organisation`
        JOIN `coms_training_organisation_exam` ON ((`coms_training_organisation_exam`.`coms_trainingsorganisation_id` = `coms_training_organisation`.`coms_training_organisation_id`)))
        JOIN `coms_exam` ON ((`coms_training_organisation_exam`.`coms_exam_id` = `coms_exam`.`coms_exam_id`)))
        JOIN `state` ON ((`coms_training_organisation_exam`.`state_id` = `state`.`state_id`)))
        JOIN `coms_language` ON ((`coms_exam`.`coms_exam_language_id` = `coms_language`.`coms_language_id`)));
		 

CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_coms_trainingorg_exam_events` AS
    SELECT 
        `coms_exam_event`.`coms_exam_event_id` AS `coms_exam_event_id`,
        CONCAT(`coms_exam`.`coms_exam_name`,
                ' - ',
                `coms_language`.`language_short`) AS `coms_exam_name`,
        `coms_exam_event`.`coms_exam_event_start_date` AS `coms_exam_event_start_date`,
        `coms_trainer`.`coms_trainer_firstname` AS `coms_trainer_firstname`,
        `coms_trainer`.`coms_trainer_lastname` AS `coms_trainer_lastname`,
        `coms_proctor`.`coms_proctor_firstname` AS `coms_proctor_firstname`,
        `coms_proctor`.`coms_proctor_lastname` AS `coms_proctor_lastname`,
        `state`.`name` AS `state`,
        `coms_exam_event`.`coms_training_org_id` AS `coms_training_org_id`
    FROM
        (((((`coms_exam`
        JOIN `coms_exam_event` ON ((`coms_exam_event`.`coms_exam_id` = `coms_exam`.`coms_exam_id`)))
        JOIN `coms_proctor` ON ((`coms_exam_event`.`coms_proctor_id` = `coms_proctor`.`coms_proctor_id`)))
        JOIN `coms_trainer` ON ((`coms_exam_event`.`coms_trainer_id` = `coms_trainer`.`coms_trainer_id`)))
        JOIN `state` ON ((`coms_exam_event`.`state_id` = `state`.`state_id`)))
        JOIN `coms_language` ON ((`coms_exam`.`coms_exam_language_id` = `coms_language`.`coms_language_id`)));
		 
		 
ALTER TABLE `coms_certificate_participant` 
CHANGE COLUMN `coms_certificate` `coms_certificate` VARCHAR(150) NULL DEFAULT NULL ;
		 
		 
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_coms_participant__Exam_Event` AS
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
        `P`.`coms_participant_language_id` AS `coms_participant_language_id`,
        `PEE`.`coms_participant_exam_event_id` AS `coms_participant_exam_event_id`,
        `PEE`.`state_id` AS `participant_state`,
        `ST1`.`name` AS `participant_state_name`,
        `P`.`coms_participant_public` AS `coms_participant_public`,
        `P`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,
        `P`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,
        `P`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,
        `P`.`coms_participant_LIAM_id` AS `coms_participant_LIAM_id`,
        `PEE`.`coms_participant_info` AS `coms_participant_info`
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
            AND (`TR`.`coms_trainer_id` = `EE`.`coms_trainer_id`));
			
CREATE OR REPLACE 
VIEW `v_certificate_participant`  AS
select distinct `CePa`.`coms_certificate_participant_id` AS `coms_certificate_participant_id`,`CePa`.`coms_certificate_participant_date` AS `coms_certificate_participant_date`,`CePa`.`coms_certificate_participant_id_base32` AS `coms_certificate_participant_id_base32`,`CePa`.`state_id` AS `state_id`,`ST`.`name` AS `state`,`CePa`.`coms_certificate_id` AS `coms_certificate_id`,`Ce`.`coms_certificate_name` AS `coms_certificate_name`,`Ce`.`coms_certificate_description` AS `coms_certificate_description`,`Ce`.`coms_certificate_intro` AS `coms_certificate_intro`,`Ce`.`coms_certificate_type_id` AS `coms_certificate_type_id`,`CT`.`coms_certificate_type_description` AS `coms_certificate_type_description`,`Pa`.`coms_participant_id` AS `coms_participant_id`,`PaId`.`coms_participant_base32` AS `coms_participant_base32`,`PaId`.`coms_participant_matriculation` AS `coms_participant_matriculation`,`Pa`.`coms_participant_gender` AS `coms_participant_gender`,`Pa`.`coms_participant_firstname` AS `coms_participant_firstname`,`Pa`.`coms_participant_lastname` AS `coms_participant_lastname`,`Pa`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`Pa`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`Pa`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,`CePa`.`coms_certificate` AS `Certificate`,`CePa`.`coms_certificate_participant_expiration_date` AS `Expiration_date`,`EX`.`coms_exam_name` AS `exam_name` from (((((((`bpmspace_coms_v1_TEST`.`coms_certificate` `Ce` join `bpmspace_coms_v1_TEST`.`coms_certificate_participant` `CePa`) join `bpmspace_coms_v1_TEST`.`coms_participant` `Pa`) join `bpmspace_coms_v1_TEST`.`coms_participant_identifier` `PaId`) join `bpmspace_coms_v1_TEST`.`coms_certificate_type` `CT`) join `bpmspace_coms_v1_TEST`.`state` `ST`) join `bpmspace_coms_v1_TEST`.`coms_exam_cert` `EC`) join `bpmspace_coms_v1_TEST`.`coms_exam` `EX`) where `Ce`.`coms_certificate_id` = `CePa`.`coms_certificate_id` and `CePa`.`coms_participant_id` = `Pa`.`coms_participant_id` and `PaId`.`coms_participant_id` = `Pa`.`coms_participant_id` and `CT`.`coms_certificate_type_id` = `Ce`.`coms_certificate_type_id` and `PaId`.`coms_participant_id` = `Pa`.`coms_participant_id` and `CePa`.`state_id` = `ST`.`state_id` and `EC`.`coms_cert_id` = `CePa`.`coms_certificate_id` and `EX`.`coms_exam_id` = `EC`.`coms_exam_id`;

CREATE OR REPLACE 
VIEW `v_coms_participant__id__email`  AS
select `bpmspace_coms_v1_TEST`.`coms_participant`.`coms_participant_id` AS `coms_participant_id`,`bpmspace_coms_v1_TEST`.`coms_participant_identifier`.`coms_participant_matriculation` AS `coms_participant_matriculation`,`bpmspace_coms_v1_TEST`.`coms_participant_identifier`.`coms_participant_md5` AS `coms_participant_md5`,`bpmspace_coms_v1_TEST`.`coms_participant_identifier`.`coms_participant_base32` AS `coms_participant_base32`,`bpmspace_coms_v1_TEST`.`coms_participant`.`coms_participant_gender` AS `coms_participant_gender`,`bpmspace_coms_v1_TEST`.`coms_participant`.`coms_participant_lastname` AS `coms_participant_lastname`,`bpmspace_coms_v1_TEST`.`coms_participant`.`coms_participant_firstname` AS `coms_participant_firstname`,`bpmspace_coms_v1_TEST`.`coms_participant`.`coms_participant_public` AS `coms_participant_public`,`bpmspace_coms_v1_TEST`.`coms_participant`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`bpmspace_coms_v1_TEST`.`coms_participant`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,`bpmspace_coms_v1_TEST`.`coms_participant`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`bpmspace_coms_v1_TEST`.`coms_participant`.`coms_participant_LIAM_id` AS `coms_participant_LIAM_id`,`bpmspace_coms_v1_TEST`.`coms_participant_email`.`coms_participant_emailadresss` AS `coms_participant_emailadresss`,`bpmspace_coms_v1_TEST`.`coms_participant`.`state_id` AS `state_id`,concat('https://domain.com/de/formular-teilnehmer/',`bpmspace_coms_v1_TEST`.`coms_participant_identifier`.`coms_participant_md5`,'/',`bpmspace_coms_v1_TEST`.`coms_participant_identifier`.`coms_participant_id`) AS `url_form_participant`,`bpmspace_coms_v1_TEST`.`coms_participant`.`coms_participant_language_id` AS `coms_participant_language_id` from ((`bpmspace_coms_v1_TEST`.`coms_participant` join `bpmspace_coms_v1_TEST`.`coms_participant_identifier` on(`bpmspace_coms_v1_TEST`.`coms_participant`.`coms_participant_id` = `bpmspace_coms_v1_TEST`.`coms_participant_identifier`.`coms_participant_id`)) join `bpmspace_coms_v1_TEST`.`coms_participant_email` on(`bpmspace_coms_v1_TEST`.`coms_participant`.`coms_participant_id` = `bpmspace_coms_v1_TEST`.`coms_participant_email`.`coms_participant_id`));

CREATE OR REPLACE VIEW `v_coms_participant__exam_event`  AS
select distinct `EE`.`coms_exam_event_id` AS `coms_exam_event_id`,`EE`.`coms_exam_event_name` AS `coms_exam_event_name`,`EE`.`state_id` AS `event_state_id`,`ST2`.`name` AS `event_state_name`,`EE`.`coms_exam_event_start_date` AS `coms_exam_event_start_date`,`EE`.`coms_exam_event_finish_date` AS `coms_exam_event_finish_date`,`EE`.`coms_exam_event_location` AS `coms_exam_event_location`,`EE`.`coms_exam_id` AS `coms_exam_id`,`EE`.`coms_delivery_type_id` AS `coms_delivery_type_id`,`DT`.`coms_delivery_description` AS `coms_delivery_description`,`EE`.`coms_training_org_id` AS `coms_training_org_id`,`TRO`.`coms_training_organisation_name` AS `coms_training_organisation_name`,`EE`.`coms_trainer_id` AS `coms_trainer_id`,`TR`.`coms_trainer_lastname` AS `coms_trainer_lastname`,`TR`.`coms_trainer_firstname` AS `coms_trainer_firstname`,`P`.`coms_participant_id` AS `coms_participant_id`,`P`.`coms_participant_gender` AS `coms_participant_gender`,`P`.`coms_participant_lastname` AS `coms_participant_lastname`,`P`.`coms_participant_firstname` AS `coms_participant_firstname`,`P`.`coms_participant_language_id` AS `coms_participant_language_id`,`PEE`.`coms_participant_exam_event_id` AS `coms_participant_exam_event_id`,`PEE`.`state_id` AS `participant_state`,`ST1`.`name` AS `participant_state_name`,`P`.`coms_participant_public` AS `coms_participant_public`,`P`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`P`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,`P`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`P`.`coms_participant_LIAM_id` AS `coms_participant_LIAM_id`,`IDT`.`coms_participant_matriculation` AS `coms_participant_matriculation`,`EM`.`coms_participant_emailadresss` AS `coms_participant_emailadresss`,`P`.`state_id` AS `participation_state`,`ST3`.`name` AS `participation_state_name`,`LG`.`language_short` AS `language_short`,`EE`.`coms_exam_event_percent` AS `coms_exam_event_percent` from (((((((((((`bpmspace_coms_v1_TEST`.`coms_participant` `P` join `bpmspace_coms_v1_TEST`.`coms_participant_exam_event` `PEE`) join `bpmspace_coms_v1_TEST`.`coms_exam_event` `EE`) join `bpmspace_coms_v1_TEST`.`state` `ST1`) join `bpmspace_coms_v1_TEST`.`state` `ST2`) join `bpmspace_coms_v1_TEST`.`coms_delivery_type` `DT`) join `bpmspace_coms_v1_TEST`.`coms_training_organisation` `TRO`) join `bpmspace_coms_v1_TEST`.`coms_trainer` `TR`) join `bpmspace_coms_v1_TEST`.`coms_participant_identifier` `IDT`) join `bpmspace_coms_v1_TEST`.`coms_participant_email` `EM`) join `bpmspace_coms_v1_TEST`.`state` `ST3`) join `bpmspace_coms_v1_TEST`.`coms_language` `LG` on(`P`.`coms_participant_language_id` = `LG`.`coms_language_id`)) where `P`.`coms_participant_id` = `PEE`.`coms_participant_id` and `PEE`.`coms_exam_event_id` = `EE`.`coms_exam_event_id` and `ST1`.`state_id` = `PEE`.`state_id` and `ST2`.`state_id` = `EE`.`state_id` and `DT`.`coms_delivery_type_id` = `EE`.`coms_delivery_type_id` and `TRO`.`coms_training_organisation_id` = `EE`.`coms_training_org_id` and `TR`.`coms_trainer_id` = `EE`.`coms_trainer_id` and `P`.`coms_participant_id` = `IDT`.`coms_participant_id` and `P`.`coms_participant_id` = `EM`.`coms_participant_id` and `P`.`state_id` = `ST3`.`state_id`;




