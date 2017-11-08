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


