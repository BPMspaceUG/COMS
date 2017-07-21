-- 20170517_dump_coms_diff_structure_after_v1.sql

-- Add missing fk constraint

ALTER TABLE `coms_certificate_participant` 
ADD INDEX `fk_1_certificate_id_idx` (`coms_certificate_id` ASC);
ALTER TABLE `coms_certificate_participant` 
ADD CONSTRAINT `fk_1_certificate_id`
  FOREIGN KEY (`coms_certificate_id`)
  REFERENCES `coms_certificate` (`coms_certificate_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
