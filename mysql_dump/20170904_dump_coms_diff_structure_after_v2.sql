ALTER TABLE `bpmspace_coms_v2`.`coms_certificate_participant` 
ADD INDEX `fk_2_participant_id_idx` (`coms_participant_id` ASC);
ALTER TABLE `bpmspace_coms_v2`.`coms_certificate_participant` 
ADD CONSTRAINT `fk_2_participant_id`
  FOREIGN KEY (`coms_participant_id`)
  REFERENCES `bpmspace_coms_v2`.`coms_participant` (`coms_participant_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
