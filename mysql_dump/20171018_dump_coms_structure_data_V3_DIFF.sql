

CREATE PROCEDURE `book_part_event`(IN PART_ID CHAR(255), IN EVEMT_ID CHAR(255))
BEGIN
set @EXAM_EVENT_ID = EVEMT_ID;
SET @PARTICIPANTID = PART_ID;
INSERT INTO coms_participant_exam_event (coms_participant_id, coms_exam_event_id, state_id) VALUES (@PARTICIPANTID, @EXAM_EVENT_ID, '27');
END


