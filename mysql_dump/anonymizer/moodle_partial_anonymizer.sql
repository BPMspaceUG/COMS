-- anonymize names
Update

  moodle.mdl_offlinequiz

JOIN coms_exam_event on moodle.mdl_offlinequiz.name like concat( '%',coms_exam_event.coms_exam_event_id_base32,'%' )

SET   moodle.mdl_offlinequiz.name = coms_exam_event.coms_exam_event_name;

-- anonymize users
Update `moodle`.`mdl_user`

JOIN `bpmspace_coms_v1_A`.`coms_participant` on LEFT(moodle.mdl_user.idnumber,length(moodle.mdl_user.idnumber)-3) = coms_participant_id

SET   moodle.mdl_user.lastname = coms_participant.coms_participant_lastname, moodle.mdl_user.firstname = coms_participant.coms_participant_firstname;

