INSERT INTO `bpmspace_coms_v3`.`state` (state_id, `name`, `entrypoint`, `statemachine_id`) VALUES ('79', 'new', '0', '12');
INSERT INTO `bpmspace_coms_v3`.`state` (state_id, `name`, `entrypoint`, `statemachine_id`) VALUES ('80', 'active', '0', '12');
INSERT INTO `bpmspace_coms_v3`.`state` (state_id, `name`, `entrypoint`, `statemachine_id`) VALUES ('81', 'inactive', '0', '12');
INSERT INTO `bpmspace_coms_v3`.`state` (state_id, `name`, `entrypoint`, `statemachine_id`) VALUES ('82', 'not verified', '0', '2');
INSERT INTO `bpmspace_coms_v3`.`state` (state_id, `name`, `entrypoint`, `statemachine_id`) VALUES ('83', 'verified', '0', '2');

	
INSERT INTO `bpmspace_coms_v1`.`state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('105', '79', '79');
INSERT INTO `bpmspace_coms_v1`.`state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('106', '80', '80');
INSERT INTO `bpmspace_coms_v1`.`state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('107', '81', '81');
INSERT INTO `bpmspace_coms_v1`.`state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('108', '79', '80');
INSERT INTO `bpmspace_coms_v1`.`state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('109', '80', '81');
INSERT INTO `bpmspace_coms_v1`.`state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('110', '82', '82');
INSERT INTO `bpmspace_coms_v1`.`state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('111', '73', '82');
INSERT INTO `bpmspace_coms_v1`.`state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('112', '82', '83');
INSERT INTO `bpmspace_coms_v1`.`state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`) VALUES ('113', '83', '83');


CREATE PROCEDURE `book_part_event`(IN PART_ID CHAR(255), IN EVEMT_ID CHAR(255))
BEGIN
set @EXAM_EVENT_ID = EVEMT_ID;
SET @PARTICIPANTID = PART_ID;
INSERT INTO coms_participant_exam_event (coms_participant_id, coms_exam_event_id, state_id) VALUES (@PARTICIPANTID, @EXAM_EVENT_ID, '27');
END


