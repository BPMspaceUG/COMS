CREATE USER 'bpmspace_coms'@'localhost' IDENTIFIED BY 'PASSWORTinLASTPASS';
CREATE USER 'bpmspace_coms_RO'@'localhost' IDENTIFIED BY 'PASSWORTinLASTPASS';
GRANT SELECT, INSERT, UPDATE ON `bpmspace_coms_v1`.* TO 'bpmspace_coms'@'localhost';
GRANT SELECT ON `bpmspace_coms_v1`.* TO 'bpmspace_coms_RO'@'localhost';