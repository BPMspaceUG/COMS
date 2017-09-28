-- 20170517_dump_coms_diff_minimumdata_after_v1.sql

INSERT INTO `coms_certificate_type` (`coms_certificate_type_id`,`coms_certificate_type_description`) VALUES (1,'role');
INSERT INTO `coms_certificate_type` (`coms_certificate_type_id`,`coms_certificate_type_description`) VALUES (2,'exam');
INSERT INTO `coms_certificate_type` (`coms_certificate_type_id`,`coms_certificate_type_description`) VALUES (3,'training');
INSERT INTO `coms_certificate_type` (`coms_certificate_type_id`,`coms_certificate_type_description`) VALUES (4,'trainer');
INSERT INTO `coms_certificate_type` (`coms_certificate_type_id`,`coms_certificate_type_description`) VALUES (5,'training organisation');


INSERT INTO `coms_delivery_type` (`coms_delivery_type_id`,`coms_delivery_description`) VALUES (4,'ATO_BULK_PAPERBASED');
INSERT INTO `coms_delivery_type` (`coms_delivery_type_id`,`coms_delivery_description`) VALUES (5,'ATO_SINGLE_ONLINE');
INSERT INTO `coms_delivery_type` (`coms_delivery_type_id`,`coms_delivery_description`) VALUES (6,'SELF_SINGLE_ONLINE');

INSERT INTO `coms_language` (`coms_language_id`,`language`,`language_short`) VALUES (5,'deutsch','DE');
INSERT INTO `coms_language` (`coms_language_id`,`language`,`language_short`) VALUES (6,'english','EN');
INSERT INTO `coms_language` (`coms_language_id`,`language`,`language_short`) VALUES (7,'francais','FR');
INSERT INTO `coms_language` (`coms_language_id`,`language`,`language_short`) VALUES (8,'espanol','ES');

INSERT INTO `state` (`state_id`,`name`,`form_data`,`tablename`) VALUES (27,'new',NULL,'coms_participant_exam_event');
INSERT INTO `state` (`state_id`,`name`,`form_data`,`tablename`) VALUES (28,'prepared',NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`tablename`) VALUES (29,'participated ',NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`tablename`) VALUES (30,'not participated',NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`tablename`) VALUES (31,'succeeded',NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`tablename`) VALUES (32,'failed',NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`tablename`) VALUES (33,'new',NULL,'coms_training_organisation_exam_event');
INSERT INTO `state` (`state_id`,`name`,`form_data`,`tablename`) VALUES (34,'bookable',NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`tablename`) VALUES (35,'prepared',NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`tablename`) VALUES (36,'ready',NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`tablename`) VALUES (37,'upheld',NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`tablename`) VALUES (38,'closed',NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`tablename`) VALUES (39,'canceled',NULL,NULL);

INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (1,27,27,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (2,27,28,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (3,28,28,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4,28,29,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (5,29,29,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (6,28,30,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (7,30,30,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (8,29,31,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (9,31,31,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (10,29,32,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (11,32,32,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (12,33,33,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (13,33,34,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (14,34,34,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (15,34,35,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (16,35,35,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (17,35,36,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (18,36,36,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (19,36,37,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (20,37,37,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (21,37,38,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (22,38,38,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (23,34,39,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (24,35,39,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (25,36,39,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (26,39,39,NULL);

------------- new state and state crossing

SET @table_n = "coms_trainer";

INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('new',NULL,@table_n);
SET @STATE_NEW = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('active',NULL,NULL);
SET @STATE_ACT = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('inactive',NULL,NULL);
SET @STATE_INA = LAST_INSERT_ID();

INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_NEW,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_INA,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_INA,@STATE_INA,NULL);


SET @table_n = "coms_trainer_exam";

INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('new',NULL,@table_n);
SET @STATE_NEW = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('active',NULL,NULL);
SET @STATE_ACT = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('inactive',NULL,NULL);
SET @STATE_INA = LAST_INSERT_ID();

INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_NEW,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_INA,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_INA,@STATE_INA,NULL);

SET @table_n = "coms_training_organisation_trainer";

INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('new',NULL,@table_n);
SET @STATE_NEW = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('active',NULL,NULL);
SET @STATE_ACT = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('inactive',NULL,NULL);
SET @STATE_INA = LAST_INSERT_ID();


INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_NEW,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_INA,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_INA,@STATE_INA,NULL);


SET @table_n = "coms_proctor";

INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('new',NULL,@table_n);
SET @STATE_NEW = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('active',NULL,NULL);
SET @STATE_ACT = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('inactive',NULL,NULL);
SET @STATE_INA = LAST_INSERT_ID();


INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_NEW,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_INA,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_INA,@STATE_INA,NULL);

SET @table_n = "coms_training_organisation_proctor";

INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('new',NULL,@table_n);
SET @STATE_NEW = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('active',NULL,NULL);
SET @STATE_ACT = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('inactive',NULL,NULL);
SET @STATE_INA = LAST_INSERT_ID();


INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_NEW,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_INA,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_INA,@STATE_INA,NULL);

SET @table_n = "coms_certificate";

INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('new',NULL,@table_n);
SET @STATE_NEW = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('active',NULL,NULL);
SET @STATE_ACT = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('inactive',NULL,NULL);
SET @STATE_INA = LAST_INSERT_ID();


INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_NEW,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_INA,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_INA,@STATE_INA,NULL);


SET @table_n = "`coms_training_organisation`";

INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('registered (new)',NULL,@table_n);
SET @STATE_01 = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('classified',NULL,NULL);
SET @STATE_02 = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('offer accepted',NULL,NULL);
SET @STATE_03 = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('offer declined',NULL,NULL);
SET @STATE_04 = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('temp. accredited',NULL,NULL);
SET @STATE_05 = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('document audit succesfull',NULL,NULL);
SET @STATE_06 = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('init audit succesfull',NULL,NULL);
SET @STATE_07 = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('audit succesfull',NULL,NULL);
SET @STATE_08 = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('accredited',NULL,NULL);
SET @STATE_09 = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('accredited withdrawn',NULL,NULL);
SET @STATE_10 = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('tmp accredited withdrawn',NULL,NULL);
SET @STATE_11 = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('canceled',NULL,NULL);
SET @STATE_12 = LAST_INSERT_ID();

INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_01,@STATE_01,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_01,@STATE_02,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_01,@STATE_12,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_02,@STATE_02,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_02,@STATE_12,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_02,@STATE_03,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_02,@STATE_04,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_03,@STATE_03,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_03,@STATE_05,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_03,@STATE_06,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_03,@STATE_12,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_04,@STATE_04,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_05,@STATE_05,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_05,@STATE_08,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_05,@STATE_11,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_06,@STATE_06,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_06,@STATE_07,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_06,@STATE_12,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_07,@STATE_07,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_07,@STATE_09,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_07,@STATE_12,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_08,@STATE_08,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_08,@STATE_09,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_09,@STATE_09,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_09,@STATE_08,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_09,@STATE_11,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_09,@STATE_10,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_10,@STATE_10,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_11,@STATE_11,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_11,@STATE_10,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_11,@STATE_09,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_11,@STATE_08,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_12,@STATE_12,NULL);


SET @table_n = "coms_trainingsorganisation_exam";

INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('new',NULL,@table_n);
SET @STATE_NEW = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('active',NULL,NULL);
SET @STATE_ACT = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('inactive',NULL,NULL);
SET @STATE_INA = LAST_INSERT_ID();


INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_NEW,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_INA,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_INA,@STATE_INA,NULL);

SET @table_n = "coms_certificate_participant";

INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('new',NULL,@table_n);
SET @STATE_NEW = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('active',NULL,NULL);
SET @STATE_ACT = LAST_INSERT_ID();
INSERT INTO `state` (`name`,`form_data`,`tablename`) VALUES ('inactive',NULL,NULL);
SET @STATE_INA = LAST_INSERT_ID();


INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_NEW,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_NEW,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_ACT,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_ACT,@STATE_INA,NULL);
INSERT INTO `state_rules` (`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (@STATE_INA,@STATE_INA,NULL);

