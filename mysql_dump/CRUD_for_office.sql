-- Rights for the office phpmyadmin account: Replace 'email' with the respective email address for the current office.

GRANT SELECT, UPDATE ON `bpmspace_coms_v1`.* TO email;

GRANT EXECUTE ON PROCEDURE `bpmspace_coms_v1`.`add_part_event` TO email;
GRANT EXECUTE ON PROCEDURE `bpmspace_coms_v1`.`create_trainer` TO email;
GRANT EXECUTE ON PROCEDURE `bpmspace_coms_v1`.`add_trainer_ato` TO email;
GRANT EXECUTE ON PROCEDURE `bpmspace_coms_v1`.`add_trainer_exam` TO email;
GRANT EXECUTE ON PROCEDURE `bpmspace_coms_v1`.`add_trainerorg_exam` TO email;
GRANT EXECUTE ON PROCEDURE `bpmspace_coms_v1`.`create_proctor` TO email;
GRANT EXECUTE ON PROCEDURE `bpmspace_coms_v1`.`add_proctor_ato` TO email;
GRANT EXECUTE ON PROCEDURE `bpmspace_coms_v1`.`create_part_event` TO email;
GRANT EXECUTE ON PROCEDURE `bpmspace_coms_v1`.`create_event` TO email;
GRANT EXECUTE ON PROCEDURE `bpmspace_coms_v1`.`create_cert_part` TO email;
GRANT EXECUTE ON PROCEDURE `bpmspace_coms_v1`.`create_cert_part_2` TO email;
GRANT EXECUTE ON PROCEDURE `bpmspace_coms_v1`.`create_event` TO email;
FLUSH PRIVILEGES;
