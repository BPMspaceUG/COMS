-- anonymize names
SET SQL_SAFE_UPDATES = 0;

Update

  moodle.mdl_offlinequiz

JOIN `bpmspace_coms_v2_TEST`.`coms_exam_event` on moodle.mdl_offlinequiz.name like concat( '%',bpmspace_coms_v2_TEST.coms_exam_event.coms_exam_event_id_base32,'%' )

SET   moodle.mdl_offlinequiz.name = `bpmspace_coms_v2_TEST`.coms_exam_event.coms_exam_event_name;

-- anonymize users
Update `moodle`.`mdl_user`

JOIN `bpmspace_coms_v2_TEST`.`coms_participant` on LEFT(moodle.mdl_user.idnumber,length(moodle.mdl_user.idnumber)-3) = coms_participant_id

SET   moodle.mdl_user.lastname = coms_participant.coms_participant_lastname, moodle.mdl_user.firstname = coms_participant.coms_participant_firstname;

UPDATE `moodle`.`mdl_offlinequiz` SET `pdfintro`='<b></b><b>In order to optain ......</b><b></b><br>';
SET SQL_SAFE_UPDATES = 1;
