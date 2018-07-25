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
