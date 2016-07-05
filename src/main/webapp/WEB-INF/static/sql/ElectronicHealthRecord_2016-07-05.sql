# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.27)
# Database: ElectronicHealthRecord
# Generation Time: 2016-07-05 04:47:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table diagnosis
# ------------------------------------------------------------

DROP TABLE IF EXISTS `diagnosis`;

CREATE TABLE `diagnosis` (
  `iddiagnosis` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosisName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddiagnosis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;

INSERT INTO `diagnosis` (`iddiagnosis`, `diagnosisName`)
VALUES
	(1,'高血压'),
	(2,'糖尿病'),
	(3,'感冒'),
	(4,'上呼吸道感染'),
	(5,'胆结石');

/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table doctor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `iddoctor` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddoctor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;

INSERT INTO `doctor` (`iddoctor`, `username`, `password`)
VALUES
	(1,'bindingdai','123'),
	(2,'姜云凡','456');

/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table drug
# ------------------------------------------------------------

DROP TABLE IF EXISTS `drug`;

CREATE TABLE `drug` (
  `iddrug` int(11) NOT NULL AUTO_INCREMENT,
  `drugname` varchar(45) DEFAULT NULL,
  `drugspec` varchar(45) DEFAULT NULL,
  `drugProduceCompany` varchar(45) DEFAULT NULL,
  `drugPerPrize` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddrug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;

INSERT INTO `drug` (`iddrug`, `drugname`, `drugspec`, `drugProduceCompany`, `drugPerPrize`)
VALUES
	(1,'维生素B','500mg 2支','哈药六厂','5.0'),
	(2,'维生素C','100mg 2g/瓶','成药三场','21.0'),
	(3,'氯化钠','50ml/瓶',NULL,'1.60'),
	(4,'葡萄糖','250ml/瓶',NULL,'7.40');

/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table instrumentExam
# ------------------------------------------------------------

DROP TABLE IF EXISTS `instrumentExam`;

CREATE TABLE `instrumentExam` (
  `idinstrumentExam` int(11) NOT NULL AUTO_INCREMENT,
  `instrumentExamContent` varchar(45) DEFAULT NULL,
  `instrumentExamValue` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idinstrumentExam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `instrumentExam` WRITE;
/*!40000 ALTER TABLE `instrumentExam` DISABLE KEYS */;

INSERT INTO `instrumentExam` (`idinstrumentExam`, `instrumentExamContent`, `instrumentExamValue`)
VALUES
	(1,'X光','支气管扩张'),
	(2,'X光','肺部炎症'),
	(3,'血检','血细胞数不足'),
	(4,'血检',NULL);

/*!40000 ALTER TABLE `instrumentExam` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table patient
# ------------------------------------------------------------

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
  `idpatient` int(11) NOT NULL AUTO_INCREMENT,
  `patientName` varchar(45) DEFAULT NULL,
  `patientGender` varchar(45) DEFAULT NULL,
  `patientBirthday` varchar(45) DEFAULT NULL,
  `patientTelNumber` varchar(45) DEFAULT NULL,
  `patientHeight` varchar(45) DEFAULT NULL,
  `patientWeight` varchar(45) DEFAULT NULL,
  `patientAddress` varchar(45) DEFAULT NULL,
  `patientAge` varchar(45) DEFAULT NULL,
  `patientJob` varchar(45) DEFAULT NULL,
  `patientMarriage` varchar(45) DEFAULT NULL,
  `patientNation` varchar(45) DEFAULT NULL,
  `patientClinicState` varchar(45) DEFAULT NULL,
  `patientPersonId` varchar(45) DEFAULT NULL,
  `patientClinicId` varchar(45) DEFAULT NULL,
  `patientPaytype` varchar(45) DEFAULT NULL,
  `patientPaycardId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpatient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;

INSERT INTO `patient` (`idpatient`, `patientName`, `patientGender`, `patientBirthday`, `patientTelNumber`, `patientHeight`, `patientWeight`, `patientAddress`, `patientAge`, `patientJob`, `patientMarriage`, `patientNation`, `patientClinicState`, `patientPersonId`, `patientClinicId`, `patientPaytype`, `patientPaycardId`)
VALUES
	(1,' 张三','男',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3','500235199211260030','20160704002',NULL,NULL),
	(2,'龙幽','男','',NULL,NULL,NULL,NULL,'18',NULL,NULL,NULL,'3','500235199111260030','20160704001','公费',NULL),
	(3,'姜云凡','男','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'1','500235199111260030','20160705001','公费',NULL),
	(4,'唐雨柔','女','',NULL,NULL,NULL,NULL,'22',NULL,NULL,NULL,'1','500235199111300026','20160501002','公费',NULL),
	(5,'李四','男','',NULL,NULL,NULL,NULL,'21',NULL,NULL,NULL,'1','500235199111260040','20160705001','公费',NULL);

/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table patientRecord
# ------------------------------------------------------------

DROP TABLE IF EXISTS `patientRecord`;

CREATE TABLE `patientRecord` (
  `idpatientRecord` int(11) NOT NULL AUTO_INCREMENT,
  `clinicid` varchar(45) DEFAULT NULL,
  `patientRecordHeight` varchar(45) DEFAULT NULL,
  `patientRecordWeight` varchar(45) DEFAULT NULL,
  `patientRecordWidth` varchar(45) DEFAULT NULL,
  `patientRecordTemperature` varchar(45) DEFAULT NULL,
  `patientRecordPulse` varchar(45) DEFAULT NULL,
  `patientRecordBreath` varchar(45) DEFAULT NULL,
  `patientRecordBloodPUp` varchar(45) DEFAULT NULL,
  `patientRecordBloodPDown` varchar(45) DEFAULT NULL,
  `patientRecordSymptom` varchar(45) DEFAULT NULL,
  `patientRecordExam` varchar(45) DEFAULT NULL,
  `patientRecordDiagnosis` varchar(45) DEFAULT NULL,
  `patientRecordTime` varchar(45) DEFAULT NULL,
  `patientRecordState` int(11) DEFAULT NULL,
  `patientRecordDrug` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpatientRecord`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `patientRecord` WRITE;
/*!40000 ALTER TABLE `patientRecord` DISABLE KEYS */;

INSERT INTO `patientRecord` (`idpatientRecord`, `clinicid`, `patientRecordHeight`, `patientRecordWeight`, `patientRecordWidth`, `patientRecordTemperature`, `patientRecordPulse`, `patientRecordBreath`, `patientRecordBloodPUp`, `patientRecordBloodPDown`, `patientRecordSymptom`, `patientRecordExam`, `patientRecordDiagnosis`, `patientRecordTime`, `patientRecordState`, `patientRecordDrug`)
VALUES
	(1,' 20160704002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' 恶心 , 头晕 ',NULL,' 高血压 ',NULL,1,''),
	(2,' 20160704002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'',NULL,1,''),
	(3,' 20160704002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'',NULL,1,''),
	(4,' 20160705001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,' 头晕 ',NULL,' 上呼吸道感染 ','2016-07-05 11:04:40',1,'');

/*!40000 ALTER TABLE `patientRecord` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table physicalExam
# ------------------------------------------------------------

DROP TABLE IF EXISTS `physicalExam`;

CREATE TABLE `physicalExam` (
  `idphysicalExam` int(11) NOT NULL AUTO_INCREMENT,
  `physicalExamContent` varchar(45) DEFAULT NULL,
  `physicalExamValue` varchar(45) DEFAULT NULL,
  `physicalExamOrgan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idphysicalExam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `physicalExam` WRITE;
/*!40000 ALTER TABLE `physicalExam` DISABLE KEYS */;

INSERT INTO `physicalExam` (`idphysicalExam`, `physicalExamContent`, `physicalExamValue`, `physicalExamOrgan`)
VALUES
	(1,'视诊','呼吸过缓','肺'),
	(2,'视诊','呼吸过快','肺'),
	(3,'触诊','皮下血肿','肺'),
	(4,'视诊','平坦','腹部');

/*!40000 ALTER TABLE `physicalExam` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Symptom
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Symptom`;

CREATE TABLE `Symptom` (
  `idSymptom` int(11) NOT NULL AUTO_INCREMENT,
  `SymptomName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSymptom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Symptom` WRITE;
/*!40000 ALTER TABLE `Symptom` DISABLE KEYS */;

INSERT INTO `Symptom` (`idSymptom`, `SymptomName`)
VALUES
	(1,'发热'),
	(2,'头晕'),
	(3,'呕吐'),
	(4,'恶心'),
	(5,'鼻赛'),
	(6,'流涕');

/*!40000 ALTER TABLE `Symptom` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
