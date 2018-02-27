USE `bpmspace_coms_v3`;

ALTER TABLE `state` 
ADD COLUMN `entrypoint` TINYINT NULL DEFAULT 0 AFTER `tablename`,
ADD COLUMN `statemachine_id` BIGINT(20) NOT NULL AFTER `entrypoint`;

-- ------------------------------------------------------------------------------ DIFF DATA

-- FK StateMachines
UPDATE `state` SET `statemachine_id`='1' WHERE `state_id`='55';
UPDATE `state` SET `statemachine_id`='1' WHERE `state_id`='56';
UPDATE `state` SET `statemachine_id`='1' WHERE `state_id`='57';
UPDATE `state` SET `statemachine_id`='2' WHERE `state_id`='73';
UPDATE `state` SET `statemachine_id`='2' WHERE `state_id`='74';
UPDATE `state` SET `statemachine_id`='2' WHERE `state_id`='75';
UPDATE `state` SET `statemachine_id`='3' WHERE `state_id`='76';
UPDATE `state` SET `statemachine_id`='3' WHERE `state_id`='77';
UPDATE `state` SET `statemachine_id`='3' WHERE `state_id`='78';
UPDATE `state` SET `statemachine_id`='5' WHERE `state_id`='27';
UPDATE `state` SET `statemachine_id`='5' WHERE `state_id`='28';
UPDATE `state` SET `statemachine_id`='5' WHERE `state_id`='29';
UPDATE `state` SET `statemachine_id`='5' WHERE `state_id`='30';
UPDATE `state` SET `statemachine_id`='5' WHERE `state_id`='31';
UPDATE `state` SET `statemachine_id`='5' WHERE `state_id`='32';
UPDATE `state` SET `statemachine_id`='6' WHERE `state_id`='49';
UPDATE `state` SET `statemachine_id`='6' WHERE `state_id`='50';
UPDATE `state` SET `statemachine_id`='6' WHERE `state_id`='51';
UPDATE `state` SET `statemachine_id`='7' WHERE `state_id`='40';
UPDATE `state` SET `statemachine_id`='7' WHERE `state_id`='41';
UPDATE `state` SET `statemachine_id`='7' WHERE `state_id`='42';
UPDATE `state` SET `statemachine_id`='8' WHERE `state_id`='43';
UPDATE `state` SET `statemachine_id`='8' WHERE `state_id`='44';
UPDATE `state` SET `statemachine_id`='8' WHERE `state_id`='45';
UPDATE `state` SET `statemachine_id`='9' WHERE `state_id`='58';
UPDATE `state` SET `statemachine_id`='9' WHERE `state_id`='59';
UPDATE `state` SET `statemachine_id`='9' WHERE `state_id`='60';
UPDATE `state` SET `statemachine_id`='9' WHERE `state_id`='61';
UPDATE `state` SET `statemachine_id`='9' WHERE `state_id`='62';
UPDATE `state` SET `statemachine_id`='9' WHERE `state_id`='63';
UPDATE `state` SET `statemachine_id`='9' WHERE `state_id`='64';
UPDATE `state` SET `statemachine_id`='9' WHERE `state_id`='65';
UPDATE `state` SET `statemachine_id`='9' WHERE `state_id`='66';
UPDATE `state` SET `statemachine_id`='9' WHERE `state_id`='67';
UPDATE `state` SET `statemachine_id`='9' WHERE `state_id`='68';
UPDATE `state` SET `statemachine_id`='9' WHERE `state_id`='69';
UPDATE `state` SET `statemachine_id`='10' WHERE `state_id`='46';
UPDATE `state` SET `statemachine_id`='10' WHERE `state_id`='47';
UPDATE `state` SET `statemachine_id`='10' WHERE `state_id`='48';
UPDATE `state` SET `statemachine_id`='11' WHERE `state_id`='70';
UPDATE `state` SET `statemachine_id`='11' WHERE `state_id`='71';
UPDATE `state` SET `statemachine_id`='11' WHERE `state_id`='72';
UPDATE `state` SET `tablename`='coms_exam_event', `statemachine_id`='4' WHERE `state_id`='33';
UPDATE `state` SET `statemachine_id`='4' WHERE `state_id`='34';
UPDATE `state` SET `statemachine_id`='4' WHERE `state_id`='35';
UPDATE `state` SET `statemachine_id`='4' WHERE `state_id`='36';
UPDATE `state` SET `statemachine_id`='4' WHERE `state_id`='37';
UPDATE `state` SET `statemachine_id`='4' WHERE `state_id`='38';
UPDATE `state` SET `statemachine_id`='4' WHERE `state_id`='39';

-- Entrypoints
UPDATE `state` SET `entrypoint`='1' WHERE `state_id`='27';
UPDATE `state` SET `entrypoint`='1' WHERE `state_id`='33';
UPDATE `state` SET `entrypoint`='1' WHERE `state_id`='40';
UPDATE `state` SET `entrypoint`='1' WHERE `state_id`='43';
UPDATE `state` SET `entrypoint`='1' WHERE `state_id`='46';
UPDATE `state` SET `entrypoint`='1' WHERE `state_id`='49';
UPDATE `state` SET `entrypoint`='1' WHERE `state_id`='58';
UPDATE `state` SET `entrypoint`='1' WHERE `state_id`='55';
UPDATE `state` SET `entrypoint`='1' WHERE `state_id`='70';
UPDATE `state` SET `entrypoint`='1' WHERE `state_id`='73';
UPDATE `state` SET `entrypoint`='1' WHERE `state_id`='76';

ALTER TABLE `state_rules` 
CHANGE COLUMN `transition_script` `transition_script` LONGTEXT NULL DEFAULT NULL ;



INSERT INTO `state` (state_id, `name`, `entrypoint`, `statemachine_id`) VALUES ('79', 'new', '0', '12');
INSERT INTO `state` (state_id, `name`, `entrypoint`, `statemachine_id`) VALUES ('80', 'active', '0', '12');
INSERT INTO `state` (state_id, `name`, `entrypoint`, `statemachine_id`) VALUES ('81', 'inactive', '0', '12');
INSERT INTO `state` (state_id, `name`, `entrypoint`, `statemachine_id`) VALUES ('82', 'not verified', '0', '2');
INSERT INTO `state` (state_id, `name`, `entrypoint`, `statemachine_id`) VALUES ('83', 'verified', '0', '2');

	
INSERT INTO `state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('105', '79', '79');
INSERT INTO `state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('106', '80', '80');
INSERT INTO `state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('107', '81', '81');
INSERT INTO `state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('108', '79', '80');
INSERT INTO `state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('109', '80', '81');
INSERT INTO `state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('110', '82', '82');
INSERT INTO `state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('111', '73', '82');
INSERT INTO `state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('112', '82', '83');
INSERT INTO `state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('113', '83', '83');

UPDATE `state` SET `name`='issued' WHERE `state_id`='74';
UPDATE `state` SET `name`='revoked' WHERE `state_id`='75';

CREATE PROCEDURE `book_part_event`(IN PART_ID CHAR(255), IN EVEMT_ID CHAR(255))
BEGIN
set @EXAM_EVENT_ID = EVEMT_ID;
SET @PARTICIPANTID = PART_ID;
INSERT INTO coms_participant_exam_event (coms_participant_id, coms_exam_event_id, state_id) VALUES (@PARTICIPANTID, @EXAM_EVENT_ID, '27');
END

-- Add location for the background images of each certificate.
ALTER TABLE `bpmspace_coms_v3`.`coms_certificate_type` 
ADD COLUMN `coms_certificate_file` TINYTEXT NULL DEFAULT NULL AFTER `coms_certificate_type_description`;

-- rename state
SELECT * FROM state where statemachine_id = '2';

-- upadet view and minimum date
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
VIEW `v_certificate_participant` AS
    SELECT DISTINCT
        `CePa`.`coms_certificate_participant_id` AS `coms_certificate_participant_id`,
        `CePa`.`coms_certificate_participant_date` AS `coms_certificate_participant_date`,
        `CePa`.`coms_certificate_participant_id_base32` AS `coms_certificate_participant_id_base32`,
        `ST`.`name` AS `state`,
        `CePa`.`coms_certificate_id` AS `coms_certificate_id`,
        `Ce`.`coms_certificate_name` AS `coms_certificate_name`,
        `Ce`.`coms_certificate_description` AS `coms_certificate_description`,
        `Ce`.`coms_certificate_intro` AS `coms_certificate_intro`,
        `Ce`.`coms_certificate_type_id` AS `coms_certificate_type_id`,
        `CT`.`coms_certificate_type_description` AS `coms_certificate_type_description`,
        `Pa`.`coms_participant_id` AS `coms_participant_id`,
        `PaId`.`coms_participant_base32` AS `coms_participant_base32`,
        `PaId`.`coms_participant_matriculation` AS `coms_participant_matriculation`,
        `Pa`.`coms_participant_gender` AS `coms_participant_gender`,
        `Pa`.`coms_participant_firstname` AS `coms_participant_firstname`,
        `Pa`.`coms_participant_lastname` AS `coms_participant_lastname`,
        `Pa`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,
        `Pa`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,
        `Pa`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,
        `CePa`.`coms_certificate` AS `Certificate`
    FROM
        (((((`coms_certificate` `Ce`
        JOIN `coms_certificate_participant` `CePa`)
        JOIN `coms_participant` `Pa`)
        JOIN `coms_participant_identifier` `PaId`)
        JOIN `coms_certificate_type` `CT`)
        JOIN `state` `ST`)
    WHERE
        ((`Ce`.`coms_certificate_id` = `CePa`.`coms_certificate_id`)
            AND (`CePa`.`coms_participant_id` = `Pa`.`coms_participant_id`)
            AND (`PaId`.`coms_participant_id` = `Pa`.`coms_participant_id`)
            AND (`CT`.`coms_certificate_type_id` = `Ce`.`coms_certificate_type_id`)
            AND (`PaId`.`coms_participant_id` = `Pa`.`coms_participant_id`)
			AND (`CePa`.`state_id` = `ST`.`state_id`));

			
UPDATE `coms_certificate_participant` SET `state_id`='73' WHERE state_id IS NULL OR state_id = '';

DELIMITER $$
CREATE  PROCEDURE `create_trainer`(IN ATO_ID CHAR(255), IN Lastname CHAR(255), IN firstname CHAR(255),  IN Email CHAR(255))
BEGIN
set @ATO_ID= ATO_ID;
set @LASTNAME = Lastname;
set @FIRSTNAME = firstname;
set @EMAIL = Email;

INSERT INTO `coms_trainer` (`coms_trainer_firstname`, `coms_trainer_lastname`) VALUES (@FIRSTNAME, @LASTNAME);

set @TRAINER_ID = LAST_INSERT_ID();

INSERT INTO `coms_trainer_email` (`coms_trainer_emailadresss`, `coms_trainer_id`) VALUES (@EMAIL, @TRAINER_ID);

INSERT INTO `coms_training_organisation_trainer` (`coms_training_organisation_id`, `coms_trainer_id`) VALUES (@ATO_ID, @TRAINER_ID);

UPDATE coms_trainer set coms_trainer_id_md5 = md5(coms_trainer_id) where coms_trainer_id = @TRAINER_ID;

UPDATE coms_trainer set coms_trainer_3digit = SUBSTRING(CONV(SUBSTRING(coms_trainer_id_md5,1,5),16,10),1,3) where coms_trainer_id = @TRAINER_ID;

UPDATE coms_trainer set coms_trainer_id_base32 = LPAD(CONV(concat(coms_trainer_id,coms_trainer_3digit),10,32),8,'0') where coms_trainer_id = @TRAINER_ID;

END

DROP procedure IF EXISTS `add_part_event`;


CREATE  PROCEDURE `add_part_event`(IN PART_ID CHAR(255), IN EVENT_ID CHAR(255))
BEGIN
set @EXAM_EVENT_ID = EVENT_ID;
SET @PARTICIPANTID = PART_ID;
INSERT INTO coms_participant_exam_event (coms_participant_id, coms_exam_event_id, state_id) VALUES (@PARTICIPANTID, @EXAM_EVENT_ID, '27');
END

CREATE PROCEDURE `add_trainer_ato`(IN TRAINER_ID CHAR(255), IN ATO_ID CHAR(255))
BEGIN
set @TRAINER_ID = TRAINER_ID;
SET @ATO_ID = ATO_ID;
INSERT INTO `coms_training_organisation_trainer` (`coms_training_organisation_id`, `coms_trainer_id`, `state_id`) VALUES (@ATO_ID, @TRAINER_ID, '43');

END

CREATE PROCEDURE `add_proctor_ato`(IN PROCTOR_ID CHAR(255), IN ATO_ID CHAR(255))
BEGIN
set @PROCTOR_ID = PROCTOR_ID;
SET @ATO_ID = ATO_ID;
INSERT INTO `coms_training_organisation_proctor` (`coms_training_organisation_id`, `coms_proctor_id`, `state_id`) VALUES (@ATO_ID, @TRAINER_ID, '52');

END

CREATE PROCEDURE `add_trainerorg_exam`(IN TRAINERORG_ID CHAR(255), IN EXAM_ID CHAR(255))
BEGIN
set @TRAINERORG_ID = TRAINERORG_ID;
SET @EXAM_ID = EXAM_ID;

INSERT INTO `coms_trainingsorganisation_exam` (`coms_trainingsorganisation_id`, `coms_exam_id`) VALUES (@TRAINERORG_ID, @TRAINER_ID);

END

CREATE PROCEDURE `add_trainer_exam`(IN TRAINER_ID CHAR(255), IN EXAM_ID CHAR(255))
BEGIN
set @TRAINER_ID = TRAINER_ID;
SET @EXAM_ID = EXAM_ID;

INSERT INTO `coms_trainer_exam` (`coms_trainer_id`, `coms_exam_id`) VALUES (@TRAINER_ID, @EXAM_ID);

END

DELIMITER ;

DROP procedure IF EXISTS `book_part_event`;

-- State changes

--State
INSERT INTO `bpmspace_coms_v3`.`state` (`name`, `entrypoint`, `statemachine_id`) VALUES ('canceled', '0', '2');
INSERT INTO `bpmspace_coms_v3`.`state` (`name`, `entrypoint`, `statemachine_id`) VALUES ('canceled', '0', '5');
--State rules
INSERT INTO `bpmspace_coms_v3`.`state_rules` (`state_id_FROM`, `state_id_TO`) VALUES ('73', '84');
INSERT INTO `bpmspace_coms_v3`.`state_rules` (`state_id_FROM`, `state_id_TO`) VALUES ('82', '84');
INSERT INTO `bpmspace_coms_v3`.`state_rules` (`state_id_FROM`, `state_id_TO`) VALUES ('27', '85');
INSERT INTO `bpmspace_coms_v3`.`state_rules` (`state_id_FROM`, `state_id_TO`) VALUES ('28', '85');
INSERT INTO `bpmspace_coms_v3`.`state_rules` (`state_id_FROM`, `state_id_TO`) VALUES ('30', '85');

SET foreign_key_checks = 0;
ALTER TABLE `coms_exam` 
CHANGE COLUMN `coms_exam_id` `coms_exam_id` BIGINT(20) NOT NULL AUTO_INCREMENT ;
SET foreign_key_checks = 1;

CREATE PROCEDURE `create_trainerorg`(IN ATO_NAME CHAR(255), IN ATO_NAME_SHORT CHAR(255), IN ATO_PASSWORD CHAR(255), IN ATO_MAIL CHAR(255))
BEGIN
set @ATO_NAME = ATO_NAME;
set @ATO_NAME_SHORT = ATO_NAME_SHORT;
SET @ATO_PASSWORD = ATO_PASSWORD;
SET @ATO_MAIL = ATO_MAIL;

 
INSERT INTO coms_training_organisation(`coms_training_organisation_name`, `coms_training_organisation_short_namel`, `coms_training_organisation_email`,`state_id`) VALUES (@ATO_NAME, @ATO_NAME_SHORT, @ATO_MAIL, "58");

set @ATO_ID = LAST_INSERT_ID();
	
    UPDATE coms_training_organisation set coms_training_organisation_id_md5 = md5(coms_training_organisation_id) where coms_training_organisation_id = @ATO_ID ;
    UPDATE coms_training_organisation set coms_training_organisation_3digit = SUBSTRING(CONV(SUBSTRING(coms_training_organisation_id_md5,1,5),16,10),1,3) where coms_training_organisation_id = @ATO_ID ;
    UPDATE coms_training_organisation set coms_training_organisation_id_base32 = LPAD(CONV(concat(coms_training_organisation_id,coms_training_organisation_3digit),10,32),8,'0') where coms_training_organisation_id = @ATO_ID ;

UPDATE coms_training_organisation set coms_training_organisation_passwd_hash= SHA2(concat(@ATO_PASSWORD,coms_training_organisation_id_md5), 512)where  coms_training_organisation_id = @ATO_ID;

END

ALTER TABLE `coms_participant` 
ADD COLUMN `coms_participant_EXTERNAL_id` VARCHAR(265) NULL AFTER `coms_participant_LIAM_id`;

USE `bpmspace_coms_v1`;
DROP procedure IF EXISTS `create_cert_part`;

DELIMITER $$
CREATE PROCEDURE `create_cert_part`(IN PART_ID CHAR(255), IN CERT_ID CHAR(255),IN CERTDATE CHAR(255))
BEGIN

set @Date = CERTDATE; 
set @Cert_ID = CERT_ID;
set @Participant_ID = PART_ID;


INSERT INTO `coms_certificate_participant` (`coms_certificate_participant_date`, `coms_certificate_id`, `coms_participant_id`, `state_id`) VALUES (@Date, @Cert_ID, @Participant_ID, "73");

set @coms_certificate_participant_ID = LAST_INSERT_ID();

UPDATE coms_certificate_participant set coms_certificate_participant_id_md5 = md5(coms_certificate_participant_id) where coms_certificate_participant_id = @coms_certificate_participant_ID;

UPDATE `coms_certificate_participant` set coms_certificate_participant_3digit = SUBSTRING(CONV(SUBSTRING(coms_certificate_participant_id_md5,1,5),16,10),1,3) where coms_certificate_participant_id = @coms_certificate_participant_ID;

UPDATE `coms_certificate_participant` set coms_certificate_participant_id_base32 = LPAD(CONV(concat(coms_certificate_participant_id,coms_certificate_participant_3digit),10,32),8,'0') where coms_certificate_participant_id = @coms_certificate_participant_ID;

END$$

DELIMITER ;

