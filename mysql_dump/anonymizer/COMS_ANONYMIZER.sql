use bpmspace_coms_v1;
DELIMITER //
DROP FUNCTION IF EXISTS str_random_lipsum;
//

CREATE FUNCTION str_random_lipsum(p_max_words SMALLINT
                                 ,p_min_words SMALLINT
                                 ,p_start_with_lipsum TINYINT(1)
                                 )
    RETURNS VARCHAR(10000)
    NO SQL
    BEGIN
    /**
    * String function. Returns a random Lorum Ipsum string of nn words
    * <br>
    * %author Ronald Speelman
    * %version 1.0
    * Example usage:
    * SELECT str_random_lipsum(5,NULL,NULL) AS fiveWordsExactly;
    * SELECT str_random_lipsum(10,5,0) AS five-tenWords;
    * SELECT str_random_lipsum(50,10,1) AS startWithLorumIpsum;
    * See more complex examples and a description on www.moinne.com/blog/ronald
    *
    * %param p_max_words         Number: the maximum amount of words, if no
    *                                    min_words are provided this will be the
    *                                    exaxt amount of words in the result
    *                                    Default = 50
    * %param p_min_words         Number: the minimum amount of words in the
    *                                    result, By providing the parameter, you provide a range
    *                                    Default = 0
    * %param p_start_with_lipsum Boolean:if "1" the string will start with
    *                                    'Lorum ipsum dolor sit amet.', Default = 0
    * %return String
    */

        DECLARE v_max_words SMALLINT DEFAULT 50;
        DECLARE v_random_item SMALLINT DEFAULT 0;
        DECLARE v_random_word VARCHAR(25) DEFAULT '';
        DECLARE v_start_with_lipsum TINYINT DEFAULT 0;
        DECLARE v_result VARCHAR(10000) DEFAULT '';
        DECLARE v_iter INT DEFAULT 1;
        DECLARE v_text_lipsum VARCHAR(1500) DEFAULT 'a ac accumsan ad adipiscing aenean aliquam aliquet amet ante aptent arcu at auctor augue bibendum blandit class commodo condimentum congue consectetuer consequat conubia convallis cras cubilia cum curabitur curae; cursus dapibus diam dictum dignissim dis dolor donec dui duis egestas eget eleifend elementum elit enim erat eros est et etiam eu euismod facilisi facilisis fames faucibus felis fermentum feugiat fringilla fusce gravida habitant hendrerit hymenaeos iaculis id imperdiet in inceptos integer interdum ipsum justo lacinia lacus laoreet lectus leo libero ligula litora lobortis lorem luctus maecenas magna magnis malesuada massa mattis mauris metus mi molestie mollis montes morbi mus nam nascetur natoque nec neque netus nibh nisi nisl non nonummy nostra nulla nullam nunc odio orci ornare parturient pede pellentesque penatibus per pharetra phasellus placerat porta porttitor posuere praesent pretium primis proin pulvinar purus quam quis quisque rhoncus ridiculus risus rutrum sagittis sapien scelerisque sed sem semper senectus sit sociis sociosqu sodales sollicitudin suscipit suspendisse taciti tellus tempor tempus tincidunt torquent tortor tristique turpis ullamcorper ultrices ultricies urna ut varius vehicula vel velit venenatis vestibulum vitae vivamus viverra volutpat vulputate';
        DECLARE v_text_lipsum_wordcount INT DEFAULT 180;
        DECLARE v_sentence_wordcount INT DEFAULT 0;
        DECLARE v_sentence_start BOOLEAN DEFAULT 1;
        DECLARE v_sentence_end BOOLEAN DEFAULT 0;
        DECLARE v_sentence_lenght TINYINT DEFAULT 9;

        SET v_max_words := COALESCE(p_max_words, v_max_words);
        SET v_start_with_lipsum := COALESCE(p_start_with_lipsum , v_start_with_lipsum);

        IF p_min_words IS NOT NULL THEN
            SET v_max_words := FLOOR(p_min_words + (RAND() * (v_max_words - p_min_words)));
        END IF;

        IF v_max_words < v_sentence_lenght THEN
            SET v_sentence_lenght := v_max_words;
        END IF;

        IF p_start_with_lipsum = 1 THEN
            SET v_result := CONCAT(v_result,'Lorem ipsum dolor sit amet.');
            SET v_max_words := v_max_words - 5;
        END IF;

        WHILE v_iter <= v_max_words DO
            SET v_random_item := FLOOR(1 + (RAND() * v_text_lipsum_wordcount));
            SET v_random_word := REPLACE(SUBSTRING(SUBSTRING_INDEX(v_text_lipsum, ' ' ,v_random_item),
                                           CHAR_LENGTH(SUBSTRING_INDEX(v_text_lipsum,' ', v_random_item -1)) + 1),
                                           ' ', '');

            SET v_sentence_wordcount := v_sentence_wordcount + 1;
            IF v_sentence_wordcount = v_sentence_lenght THEN
                SET v_sentence_end := 1 ;
            END IF;

            IF v_sentence_start = 1 THEN
                SET v_random_word := CONCAT(UPPER(SUBSTRING(v_random_word, 1, 1))
                                            ,LOWER(SUBSTRING(v_random_word FROM 2)));
                SET v_sentence_start := 0 ;
            END IF;

            IF v_sentence_end = 1 THEN
                IF v_iter <> v_max_words THEN
                    SET v_random_word := CONCAT(v_random_word, '.');
                END IF;
                SET v_sentence_lenght := FLOOR(9 + (RAND() * 7));
                SET v_sentence_end := 0 ;
                SET v_sentence_start := 1 ;
                SET v_sentence_wordcount := 0 ;
            END IF;

            SET v_result := CONCAT(v_result,' ', v_random_word);
            SET v_iter := v_iter + 1;
        END WHILE;

        RETURN TRIM(CONCAT(v_result,'.'));
END;
//
DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;


SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES';

DELIMITER //
DROP FUNCTION IF EXISTS str_random_character;
//

CREATE FUNCTION str_random_character(p_char VARCHAR(1))
    RETURNS VARCHAR(1)
    NO SQL
    BEGIN
    /**
    * String function. Returns random character based on a mask
    * <br>
    * %author Ronald Speelman
    * %version 1.5
    * Example usage:
    * SELECT str_random_character('d') AS digit;
    * SELECT str_random_character('C') AS UPPER;
    * See more examples and a description on www.moinne.com/blog/ronald
    *
    * %param p_pattern String: the pattern describing the random values
    *                          c returns lower-case character [a-z]
    *                          C returns upper-case character [A-Z]
    *                          A returns either upper or lower-case character [a-z A-Z]
    *                          d returns a digit [0-9]
    *                          D returns a digit without a zero [1-9]
    *                          b returns a bit [0-1]
    *                          X returns hexedecimal character [0-F]
    *                          * returns characters, decimals and special characters [a-z A-Z 0-9 !?-_@$#]
    *                          All other characters are taken literally
    * %return VARCHAR(1)
    */

    DECLARE v_result   VARCHAR(1) DEFAULT '';

        CASE p_char
            WHEN BINARY '*' THEN SET v_result := ELT(1 + FLOOR(RAND() * 69),'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                                                                                 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
                                                                                 '!','?','-','_','@','$','#',
                                                                                 0,1,2,3,4,5,6,7,8,9);
            WHEN BINARY 'A' THEN SET v_result := ELT(1 + FLOOR(RAND() * 52),'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                                                                                 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
            WHEN BINARY 'c' THEN SET v_result := ELT(1 + FLOOR(RAND() * 26),'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
            WHEN BINARY 'C' THEN SET v_result := ELT(1 + FLOOR(RAND() * 26),'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
            WHEN BINARY 'd' THEN SET v_result := ELT(1 + FLOOR(RAND() * 10), 0,1,2,3,4,5,6,7,8,9);
            WHEN BINARY 'D' THEN SET v_result := ELT(1 + FLOOR(RAND() * 9), 1,2,3,4,5,6,7,8,9);
            WHEN BINARY 'X' THEN SET v_result := ELT(1 + FLOOR(RAND() * 16), 0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F');
            WHEN BINARY 'b' THEN SET v_result := ELT(1 + FLOOR(RAND() * 2), 0,1);
            ELSE
                SET v_result := p_char;
        END CASE;

   RETURN v_result;
END;
//
DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;

SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES';

DELIMITER //
DROP FUNCTION IF EXISTS str_random;
//

CREATE FUNCTION str_random(p_pattern VARCHAR(200))
    RETURNS VARCHAR(2000)
    NO SQL
    BEGIN
    /**
    * String function. Returns a random string based on a mask
    * <br>
    * %author Ronald Speelman
    * %version 2.3
    * Example usage:
    * SELECT str_random('dddd CC') AS DutchZipCode;
    * SELECT str_random('d{4} C{2}') AS DutchZipCode;
    * SELECT str_random('*{5}*(4)') AS password;
    * select str_random('Cccc(4)') as name;
    * SELECT str_random('#X{6}') AS htmlColorCode;
    * See more complex examples and a description on www.moinne.com/blog/ronald
    *
    * %param p_pattern String: the pattern describing the random values
    *                          MASKS:
    *                          c returns lower-case character [a-z]
    *                          C returns upper-case character [A-Z]
    *                          A returns either upper or lower-case character [a-z A-Z]
    *                          d returns a digit [0-9]
    *                          D returns a digit without a zero [1-9]
    *                          b returns a bit [0-1]
    *                          X returns hexadecimal character [0-F]
    *                          * returns characters, decimals and special characters [a-z A-Z 0-9 !?-_@$#]
    *                          DIRECTIVES
    *                          "text"      : text is taken literally
    *                          {nn}        : repeat the last mask nn times
    *                          (nn)        : repeat random, but max nn times
    *                          [item|item] : pick a random item from this list, items are separated by a pipe symbol
    *                          All other characters are taken literally
    * %return String
    */

    DECLARE v_iter              SMALLINT DEFAULT 1;
    DECLARE v_char              VARCHAR(1) DEFAULT '';
    DECLARE v_next_char         VARCHAR(1) DEFAULT '';
    DECLARE v_list              VARCHAR(200) DEFAULT '';
    DECLARE v_text              VARCHAR(200) DEFAULT '';
    DECLARE v_result            VARCHAR(2000) DEFAULT '';
    DECLARE v_count             SMALLINT DEFAULT 0;
    DECLARE v_jump_characters   TINYINT DEFAULT 0;
    DECLARE v_end_position      SMALLINT DEFAULT 0;
    DECLARE v_list_count        TINYINT DEFAULT 0;
    DECLARE v_random_item       TINYINT DEFAULT 0;

    WHILE v_iter <= CHAR_LENGTH(p_pattern) DO

        SET v_char := BINARY SUBSTRING(p_pattern,v_iter,1);
        SET v_next_char := BINARY SUBSTRING(p_pattern,(v_iter + 1),1);

        -- check if text is a fixed text
        IF (v_char = '"') THEN
            -- get the text
            SET v_end_position := LOCATE('"', p_pattern, v_iter + 1);
            SET v_text := SUBSTRING(p_pattern,v_iter + 1,(v_end_position - v_iter) - 1);
            -- add the text to the result
            SET v_result := CONCAT(v_result, v_text);
            SET v_iter := v_iter + CHAR_LENGTH(v_text) + 2;
        -- if character has a count specified: repeat it
        ELSEIF (v_next_char = '{') OR (v_next_char = '(') THEN
            -- find out what the count is (max 999)...
            IF (SUBSTRING(p_pattern,(v_iter + 3),1) = '}') OR
               (SUBSTRING(p_pattern,(v_iter + 3),1) = ')') THEN
                SET v_count := SUBSTRING(p_pattern,(v_iter + 2),1);
                SET v_jump_characters := 4;
            ELSEIF (SUBSTRING(p_pattern,(v_iter + 4),1) = '}') OR
                   (SUBSTRING(p_pattern,(v_iter + 4),1) = ')')THEN
                SET v_count := SUBSTRING(p_pattern,(v_iter + 2),2);
                SET v_jump_characters := 5;
            ELSEIF (SUBSTRING(p_pattern,(v_iter + 5),1) = '}') OR
                   (SUBSTRING(p_pattern,(v_iter + 5),1) = ')')THEN
                SET v_count := SUBSTRING(p_pattern,(v_iter + 2),3);
                SET v_jump_characters := 6;
            ELSE
                SET v_count := 0;
                SET v_jump_characters := 3;
            END IF;
            -- if random count: make it random with a max of count
            IF (v_next_char = '(') THEN
                SET v_count := FLOOR((RAND() * v_count));
            END IF;
            -- repeat the characters
            WHILE v_count > 0 DO
                SET v_result := CONCAT(v_result,str_random_character(v_char));
                SET v_count := v_count - 1;
            END WHILE;
            SET v_iter := v_iter + v_jump_characters;
        -- check if there is a list in the pattern
        ELSEIF (v_char = '[') THEN
            -- get the list
            SET v_end_position := LOCATE(']', p_pattern, v_iter + 1);
            SET v_list := SUBSTRING(p_pattern,v_iter + 1,(v_end_position - v_iter) - 1);
            -- find out how many items are in the list, items are seperated by a pipe
            SET v_list_count := (LENGTH(v_list) - LENGTH(REPLACE(v_list, '|', '')) + 1);
            -- pick a random item from the list
            SET v_random_item := FLOOR(1 + (RAND() * v_list_count));
            -- add the item from the list
            SET v_result := CONCAT(v_result,
                                   REPLACE(SUBSTRING(SUBSTRING_INDEX(v_list, '|' ,v_random_item),
                                           CHAR_LENGTH(SUBSTRING_INDEX(v_list,'|', v_random_item -1)) + 1),
                                           '|', '')
                                  );
            SET v_iter := v_iter + CHAR_LENGTH(v_list) + 2;
        -- no directives: just get a random character
        ELSE
            SET v_result := CONCAT(v_result, str_random_character(v_char));
            SET v_iter := v_iter + 1;
        END IF;

   END WHILE;

   RETURN v_result;
END;
//
DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;

DROP function if exists generate_fname;
DELIMITER $$
CREATE FUNCTION generate_fname () RETURNS varchar(255)
BEGIN
	RETURN ELT(FLOOR(1 + (RAND() * (100-1))), "James","Mary","John","Patricia","Robert","Linda","Michael","Barbara","William","Elizabeth","David","Jennifer","Richard","Maria","Charles","Susan","Joseph","Margaret","Thomas","Dorothy","Christopher","Lisa","Daniel","Nancy","Paul","Karen","Mark","Betty","Donald","Helen","George","Sandra","Kenneth","Donna","Steven","Carol","Edward","Ruth","Brian","Sharon","Ronald","Michelle","Anthony","Laura","Kevin","Sarah","Jason","Kimberly","Matthew","Deborah","Gary","Jessica","Timothy","Shirley","Jose","Cynthia","Larry","Angela","Jeffrey","Melissa","Frank","Brenda","Scott","Amy","Eric","Anna","Stephen","Rebecca","Andrew","Virginia","Raymond","Kathleen","Gregory","Pamela","Joshua","Martha","Jerry","Debra","Dennis","Amanda","Walter","Stephanie","Patrick","Carolyn","Peter","Christine","Harold","Marie","Douglas","Janet","Henry","Catherine","Carl","Frances","Arthur","Ann","Ryan","Joyce","Roger","Diane");
END$$

DELIMITER ;

DROP function if exists generate_lname;
DELIMITER $$
CREATE FUNCTION generate_lname () RETURNS varchar(255)
BEGIN
	RETURN ELT(FLOOR(1 + (RAND() * (100-1))), "Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes");
END$$
DELIMITER ;

select generate_fname() as FirstName, generate_fname() as LastName;


SET SQL_SAFE_UPDATES = 0;


UPDATE `coms_certificate` SET `coms_certificate_name`= concat('BPMspace ',concat(122387,FLOOR(RAND( )*1000000))), `coms_certificate_description`=str_random_lipsum(10,5,0), `coms_certificate_intro`=str_random_lipsum(50,20,0) WHERE TRUE;


UPDATE `coms_certificate_participant` SET `coms_certificate_participant_date`=DATE(FROM_UNIXTIME(UNIX_TIMESTAMP('2010-04-30 14:53:27') + FLOOR(0 + (RAND() * 63072000)))) WHERE TRUE;
UPDATE `coms_certificate_participant` SET `coms_certificate_participant_id`= FLOOR(RAND( )*1000000000) WHERE TRUE;
UPDATE coms_certificate_participant set coms_certificate_participant_id_md5 = md5(coms_certificate_participant_id) where TRUE;
UPDATE `coms_certificate_participant` set coms_certificate_participant_3digit = SUBSTRING(CONV(SUBSTRING(coms_certificate_participant_id_md5,1,5),16,10),1,3) where TRUE;
UPDATE `coms_certificate_participant` set coms_certificate_participant_id_base32 = LPAD(CONV(concat(coms_certificate_participant_id,coms_certificate_participant_3digit),10,32),8,'0') where TRUE;

UPDATE `coms_certificate_type` SET `coms_certificate_type_description`='CUSTOMER 1 role' WHERE `coms_certificate_type_id`='7';
UPDATE `coms_certificate_type` SET `coms_certificate_type_description`='CUSTOMER 2 Exam' WHERE `coms_certificate_type_id`='8';

UPDATE `coms_exam` SET `coms_exam_name`=concat('BPMspace EXAM ',coms_exam_id) WHERE TRUE ;




UPDATE `coms_exam_version` SET `coms_exam_version_name`=concat('SET ',coms_exam_version_id) WHERE TRUE;




UPDATE `coms_participant` SET `coms_participant_lastname`=generate_lname(), `coms_participant_firstname`=generate_fname(), `coms_participant_placeofbirth`=REPLACE(str_random_lipsum(2,1,0),'.',''), `coms_participant_birthcountry`=REPLACE(str_random_lipsum(2,1,0),'.',''), `coms_participant_dateofbirth`=DATE(FROM_UNIXTIME(UNIX_TIMESTAMP('1975-04-30 14:53:27') + FLOOR(0 + (RAND() * 630720000)))) WHERE TRUE;

UPDATE `coms_participant_email` SET `coms_participant_emailadresss`=str_random('c{3}c(5)[.|_]c{8}c(8)@[google|yahoo|live|mail]".com"') WHERE TRUE;

UPDATE `coms_participant_exam_event` SET `coms_participant_info`=str_random_lipsum(10,5,0) WHERE TRUE;

UPDATE `coms_proctor` SET `coms_proctor_firstname`=generate_fname(), `coms_proctor_lastname`=generate_lname() WHERE TRUE;

UPDATE `coms_proctor_email` SET `coms_proctor_emailadresss`=str_random('c{3}c(5)[.|_]c{8}c(8)@[google|yahoo|live|mail]".com"') WHERE TRUE;

UPDATE `coms_trainer` SET `coms_trainer_firstname`=generate_fname(), `coms_trainer_lastname`=generate_lname() WHERE TRUE;

UPDATE `coms_trainer_email` SET `coms_trainer_emailadresss`=str_random('c{3}c(5)[.|_]c{8}c(8)@[google|yahoo|live|mail]".com"') WHERE TRUE;

UPDATE `coms_training_organisation` SET `coms_training_organisation_name`=concat('Organsation', generate_lname()), `coms_training_organisation_short_namel`=generate_lname(), coms_training_organisation_email=str_random('c{3}c(5)[.|_]c{8}c(8)@[google|yahoo|live|mail]".com"') WHERE TRUE;

UPDATE `coms_exam_event` SET `coms_exam_event_start_date`=DATE(FROM_UNIXTIME(UNIX_TIMESTAMP('2010-04-30 14:53:27') + FLOOR(0 + (RAND() * 63072000)))), `coms_exam_event_finish_date`=NULL, `coms_exam_event_location`=str_random_lipsum(50,20,0) WHERE TRUE;

UPDATE coms_exam_event AS ExEv	SET 	ExEv.coms_exam_event_name = (SELECT 	CONCAT(DATE(ExEv.coms_exam_event_start_date),	' - [',	ExEv.coms_exam_event_id_base32,	'] - ', 	Lg.language_short,	' - ',	Ex.coms_exam_name,	' - ',	TrOr.coms_training_organisation_short_namel)	FROM	((((((`coms_exam` `Ex`)	JOIN `state`)	JOIN `coms_delivery_type` `DeTy`)	JOIN `coms_training_organisation` `TrOr`)	JOIN `coms_trainer` `Tr`)	JOIN `coms_language` `Lg`)	WHERE	((`ExEv`.`coms_exam_id` = `Ex`.`coms_exam_id`)	AND (`ExEv`.`state_id` = `state`.`state_id`)	AND (`ExEv`.`coms_delivery_type_id` = `DeTy`.`coms_delivery_type_id`)	AND (`ExEv`.`coms_training_org_id` = `TrOr`.`coms_training_organisation_id`)	AND (`ExEv`.`coms_trainer_id` = `Tr`.`coms_trainer_id`)	AND (`Ex`.`coms_exam_language_id` = `Lg`.`coms_language_id`))	) WHERE TRUE;

UPDATE `bpmspace_coms_v1`.`coms_certificate_participant` SET `coms_certificate`=NULL WHERE TRUE;
UPDATE `bpmspace_coms_v1`.`coms_participant` SET `coms_participant_EXTERNAL_id`= FLOOR(0 + (RAND() * 94875)) WHERE TRUE;

UPDATE `bpmspace_coms_v1`.`coms_training_organisation` SET `coms_training_organisation_passwd_hash`='' WHERE TRUE;

-- Moodle DB needed: mdl_user , mdl_offlinequiz and mdl_offlinequiz_results. coms has to be selected as main DB

-- Update all that have no equivalent in coms and set to id value
UPDATE `moodle`.`mdl_offlinequiz` 
SET 
    `moodle`.`mdl_offlinequiz`.`name` = CONCAT('Id: ', `moodle`.`mdl_offlinequiz`.`id`)
WHERE
    `moodle`.`mdl_offlinequiz`.`id` IN (SELECT 
            `moodle`.`mdl_offlinequiz`.`id`
        FROM
            `moodle`.`mdl_offlinequiz`
                LEFT JOIN
            `coms_exam_event` ON `moodle`.`mdl_offlinequiz`.name LIKE CONCAT('%',
                    `coms_exam_event`.`coms_exam_event_id_base32`,
                    '%')
        WHERE
            `coms_exam_event`.`coms_exam_event_id_base32` IS NULL);

-- Update all with equivalent in coms. Anonymize data to BPMSpace
Update

  moodle.mdl_offlinequiz

JOIN coms_exam_event on moodle.mdl_offlinequiz.name like concat( '%',coms_exam_event.coms_exam_event_id_base32,'%' )

SET   moodle.mdl_offlinequiz.name = coms_exam_event.coms_exam_event_name;

-- Anonymize Moodle names	
											    
Update `moodle`.`mdl_user`

JOIN `bpmspace_coms_v1_A`.`coms_participant` on LEFT(moodle.mdl_user.idnumber,length(moodle.mdl_user.idnumber)-3) = coms_participant_id

SET   moodle.mdl_user.lastname = coms_participant.coms_participant_lastname, moodle.mdl_user.firstname = coms_participant.coms_participant_firstname;
	
											    
-- check  coms_certificate_type manual

SET SQL_SAFE_UPDATES = 1;
