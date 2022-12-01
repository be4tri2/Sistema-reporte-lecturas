-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.22-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para lecturas_suneo
CREATE DATABASE IF NOT EXISTS `lecturas_suneo` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `lecturas_suneo`;

-- Volcando estructura para tabla lecturas_suneo.tbl_asignacion
CREATE TABLE IF NOT EXISTS `tbl_asignacion` (
  `id_asignacion` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_alumno_fk` int(11) NOT NULL COMMENT 'Id del alumno.',
  `id_revisor_fk` int(11) NOT NULL COMMENT 'Id del revidor.',
  `id_semestre_fk` int(11) NOT NULL COMMENT 'Id del semestre.',
  PRIMARY KEY (`id_asignacion`),
  KEY `id_semestre_fk1` (`id_semestre_fk`),
  KEY `id_alumno_fk1` (`id_alumno_fk`),
  KEY `id_revisor_fk1` (`id_revisor_fk`),
  CONSTRAINT `id_alumno_fk1` FOREIGN KEY (`id_alumno_fk`) REFERENCES `tbl_registro_alumnos` (`id_alumnos`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `id_revisor_fk1` FOREIGN KEY (`id_revisor_fk`) REFERENCES `tbl_revisor` (`id_revisor`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `id_semestre_fk1` FOREIGN KEY (`id_semestre_fk`) REFERENCES `tbl_semestres` (`id_semestre`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='En esta tabla se realizarán las asignaciones de alumnos que tendrá a cargo un revisor a lo largo de un semestre.';

-- Volcando datos para la tabla lecturas_suneo.tbl_asignacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_asignacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_asignacion` ENABLE KEYS */;

-- Volcando estructura para tabla lecturas_suneo.tbl_campus
CREATE TABLE IF NOT EXISTS `tbl_campus` (
  `id_campus` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_campus` varchar(50) NOT NULL COMMENT 'Nombre de la universidad y campus.',
  PRIMARY KEY (`id_campus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Catálogo predeterminado de campus.';

-- Volcando datos para la tabla lecturas_suneo.tbl_campus: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_campus` DISABLE KEYS */;
INSERT INTO `tbl_campus` (`id_campus`, `nombre_campus`) VALUES
	(1, 'UMAR, Puerto Escondido'),
	(2, 'UMAR, Puerto Ángel'),
	(3, 'UMAR, Huatulco');
/*!40000 ALTER TABLE `tbl_campus` ENABLE KEYS */;

-- Volcando estructura para tabla lecturas_suneo.tbl_carreras
CREATE TABLE IF NOT EXISTS `tbl_carreras` (
  `id_carrera` int(11) NOT NULL AUTO_INCREMENT,
  `id_campus_fk` int(11) DEFAULT NULL COMMENT 'Id del campus al que pertenece la carrera.',
  `nombre_carrera` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_carrera`),
  KEY `id_campus_fk` (`id_campus_fk`),
  CONSTRAINT `id_campus_fk` FOREIGN KEY (`id_campus_fk`) REFERENCES `tbl_campus` (`id_campus`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catálogo predeterminado de carreras. Cada carrera estar ligada a un campus.';

-- Volcando datos para la tabla lecturas_suneo.tbl_carreras: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_carreras` DISABLE KEYS */;
INSERT INTO `tbl_carreras` (`id_carrera`, `id_campus_fk`, `nombre_carrera`) VALUES
	(1, 1, 'Informárica'),
	(2, 1, 'Ingieneria Forestal'),
	(3, 1, 'Biología'),
	(4, 1, 'Enfermería'),
	(5, 1, 'Zootecnia');
/*!40000 ALTER TABLE `tbl_carreras` ENABLE KEYS */;

-- Volcando estructura para tabla lecturas_suneo.tbl_entrega
CREATE TABLE IF NOT EXISTS `tbl_entrega` (
  `id_asignacion` int(11) DEFAULT NULL,
  `id_tipo_reporte_fk` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL COMMENT 'Guardará las observaciones escritas de un revisor después de evaluar.',
  `estado_reporte` enum('EO','AO','RO','ER') DEFAULT NULL COMMENT 'EO entregado, AO Aceptado, RO rechazado, ER en revisión.',
  `id_reporte_fk` int(11) DEFAULT NULL COMMENT 'Id del reporte.',
  `id_parcial_fk` int(11) DEFAULT NULL COMMENT 'Id del parcial al que pertenece la entrega.',
  KEY `id_asignacion` (`id_asignacion`),
  KEY `id_parcial_fk3` (`id_parcial_fk`),
  KEY `id_reporte_fk` (`id_reporte_fk`),
  KEY `id_tipo_reporte_fk` (`id_tipo_reporte_fk`),
  CONSTRAINT `id_asignacion` FOREIGN KEY (`id_asignacion`) REFERENCES `tbl_asignacion` (`id_semestre_fk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_parcial_fk3` FOREIGN KEY (`id_parcial_fk`) REFERENCES `tbl_parciales` (`id_parcial`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_reporte_fk` FOREIGN KEY (`id_reporte_fk`) REFERENCES `tbl_reporte_lectura` (`id_reporte`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_tipo_reporte_fk` FOREIGN KEY (`id_tipo_reporte_fk`) REFERENCES `tbl_tipo_reporte` (`id_tipo_reporte`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='En esta tabla se registrarán las entregas de los reportes de lectura. Guardará los datos generales de un reporte de lectura.';

-- Volcando datos para la tabla lecturas_suneo.tbl_entrega: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_entrega` ENABLE KEYS */;

-- Volcando estructura para tabla lecturas_suneo.tbl_fechas_revisor
CREATE TABLE IF NOT EXISTS `tbl_fechas_revisor` (
  `id_semestre_fk` int(11) DEFAULT NULL,
  `id_parcial_fk` int(11) NOT NULL,
  `fecha_inicial` date DEFAULT NULL COMMENT 'Guadará el rango inicial de una fecha.',
  `fecha_limite` date DEFAULT NULL COMMENT 'Guardará el rango final de una fecha.',
  KEY `id_parcial_fk1` (`id_parcial_fk`),
  KEY `id_semestre_fk2` (`id_semestre_fk`),
  CONSTRAINT `id_parcial_fk1` FOREIGN KEY (`id_parcial_fk`) REFERENCES `tbl_parciales` (`id_parcial`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_semestre_fk2` FOREIGN KEY (`id_semestre_fk`) REFERENCES `tbl_semestres` (`id_semestre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Fechas para entregas de informes por parcial de todos los revisores.';

-- Volcando datos para la tabla lecturas_suneo.tbl_fechas_revisor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_fechas_revisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fechas_revisor` ENABLE KEYS */;

-- Volcando estructura para tabla lecturas_suneo.tbl_fecha_alumnos
CREATE TABLE IF NOT EXISTS `tbl_fecha_alumnos` (
  `id_fecha` int(11) NOT NULL AUTO_INCREMENT,
  `id_semestre_fk` int(11) NOT NULL,
  `id_revisor_fk` int(11) DEFAULT NULL COMMENT 'Id del revisor que asginará las fechas.',
  `id_parcial_fk` int(11) DEFAULT NULL,
  `fecha_inicial` date NOT NULL COMMENT 'Guadará el rango inicial de una fecha.',
  `fecha_final` date NOT NULL COMMENT 'Guadará el rango final de una fecha.',
  `grupo` varchar(15) DEFAULT NULL COMMENT 'grupo al que le asignará la fecha.',
  PRIMARY KEY (`id_fecha`),
  KEY `id_parcial_fk2` (`id_parcial_fk`),
  KEY `id_revisor_fk2` (`id_revisor_fk`),
  KEY `id_semestre_fk3` (`id_semestre_fk`),
  CONSTRAINT `id_parcial_fk2` FOREIGN KEY (`id_parcial_fk`) REFERENCES `tbl_parciales` (`id_parcial`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_revisor_fk2` FOREIGN KEY (`id_revisor_fk`) REFERENCES `tbl_revisor` (`id_revisor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_semestre_fk3` FOREIGN KEY (`id_semestre_fk`) REFERENCES `tbl_semestres` (`id_semestre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Fechas para entregas de reportes de lectura por parcial para los alumnos.';

-- Volcando datos para la tabla lecturas_suneo.tbl_fecha_alumnos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_fecha_alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fecha_alumnos` ENABLE KEYS */;

-- Volcando estructura para tabla lecturas_suneo.tbl_parciales
CREATE TABLE IF NOT EXISTS `tbl_parciales` (
  `id_parcial` int(11) NOT NULL AUTO_INCREMENT,
  `estado_parcial` enum('AC','DA') NOT NULL COMMENT 'AC activado, DA desactivado.',
  PRIMARY KEY (`id_parcial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contendrá tres registro que corresponden a los tres parciales.';

-- Volcando datos para la tabla lecturas_suneo.tbl_parciales: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_parciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_parciales` ENABLE KEYS */;

-- Volcando estructura para tabla lecturas_suneo.tbl_registro_alumnos
CREATE TABLE IF NOT EXISTS `tbl_registro_alumnos` (
  `id_alumnos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL COMMENT 'Campo obligatorio.',
  `apellido_p` varchar(50) NOT NULL COMMENT 'Campo obligatorio.',
  `apellido_m` varchar(50) DEFAULT NULL COMMENT 'Campo no obligatorio.',
  `curp` varchar(18) DEFAULT NULL COMMENT 'Campo no obligatorio.',
  `matricula` varchar(12) DEFAULT NULL COMMENT 'Campo no obligatorio.',
  `id_carrera_fk` int(11) NOT NULL COMMENT 'Id de la carrera al que pertenece.',
  `semestre` varchar(10) NOT NULL COMMENT 'Campo obligatorio.',
  `correo` varchar(50) NOT NULL DEFAULT '' COMMENT 'Campo obligatorio.',
  `contrasenia` varchar(15) NOT NULL COMMENT 'Campo obligatorio.',
  `estado_cuenta` enum('AC','DA') NOT NULL DEFAULT 'DA' COMMENT 'Campo obligatorio. AC activa, DA desactivar',
  PRIMARY KEY (`id_alumnos`),
  KEY `id_carrera_fk` (`id_carrera_fk`),
  CONSTRAINT `id_carrera_fk` FOREIGN KEY (`id_carrera_fk`) REFERENCES `tbl_carreras` (`id_carrera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Tabla en la que se guardarán los registros de alumnos.';

-- Volcando datos para la tabla lecturas_suneo.tbl_registro_alumnos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_registro_alumnos` DISABLE KEYS */;
INSERT INTO `tbl_registro_alumnos` (`id_alumnos`, `nombre`, `apellido_p`, `apellido_m`, `curp`, `matricula`, `id_carrera_fk`, `semestre`, `correo`, `contrasenia`, `estado_cuenta`) VALUES
	(1, 'Fran', 'R', 'C', '154', '448', 1, '7', 'sa', '789', 'AC');
/*!40000 ALTER TABLE `tbl_registro_alumnos` ENABLE KEYS */;

-- Volcando estructura para tabla lecturas_suneo.tbl_reporte_lectura
CREATE TABLE IF NOT EXISTS `tbl_reporte_lectura` (
  `id_reporte` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_entrega` date DEFAULT NULL COMMENT 'Guardará la fecha en la que se realizo la entrega del reporte.',
  `titulo_obra` varchar(40) DEFAULT NULL COMMENT 'Título de la obra leída.',
  `referencia` varchar(300) DEFAULT NULL COMMENT 'Guarda la referencia de la obra e formato APA.',
  `resenia_autor` text DEFAULT NULL COMMENT 'Guarda reseña del autor leído.',
  `texto_trabajo` text DEFAULT NULL COMMENT 'Guarda el trabajo de lectura del alumno.',
  PRIMARY KEY (`id_reporte`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tabla que guarda el contenido de un reporte de lectura.';

-- Volcando datos para la tabla lecturas_suneo.tbl_reporte_lectura: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_reporte_lectura` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reporte_lectura` ENABLE KEYS */;

-- Volcando estructura para tabla lecturas_suneo.tbl_revisor
CREATE TABLE IF NOT EXISTS `tbl_revisor` (
  `id_revisor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL COMMENT 'Campo obligatorio.',
  `id_campus_fk` int(11) NOT NULL COMMENT 'Id del campus al que pertenece.',
  `correo` varchar(60) NOT NULL COMMENT 'Campo obligatorio.',
  `contrasenia` varchar(15) NOT NULL COMMENT 'Campo obligatorio.',
  `tipo_usuario` enum('AD','RV') NOT NULL COMMENT 'Campo obligatorio.',
  `estado_cuenta` enum('AC','DA') NOT NULL COMMENT 'Campo obligatorio. AC activa, DA desactivar',
  PRIMARY KEY (`id_revisor`),
  KEY `id_campus_fk2` (`id_campus_fk`),
  CONSTRAINT `id_campus_fk2` FOREIGN KEY (`id_campus_fk`) REFERENCES `tbl_campus` (`id_campus`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabla que guarda los registros de maestros revisores.';

-- Volcando datos para la tabla lecturas_suneo.tbl_revisor: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_revisor` DISABLE KEYS */;
INSERT INTO `tbl_revisor` (`id_revisor`, `nombre`, `id_campus_fk`, `correo`, `contrasenia`, `tipo_usuario`, `estado_cuenta`) VALUES
	(1, 'Angel', 1, 'ange@gm', '1234', 'RV', 'AC'),
	(2, 'Edu', 1, 'lalo@', '4321', 'AD', 'AC');
/*!40000 ALTER TABLE `tbl_revisor` ENABLE KEYS */;

-- Volcando estructura para tabla lecturas_suneo.tbl_semestres
CREATE TABLE IF NOT EXISTS `tbl_semestres` (
  `id_semestre` int(11) NOT NULL AUTO_INCREMENT,
  `semestre_periodo` varchar(12) DEFAULT NULL,
  `estado_semestre` enum('AC','DA') DEFAULT NULL,
  PRIMARY KEY (`id_semestre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabla que guarda los semestres.';

-- Volcando datos para la tabla lecturas_suneo.tbl_semestres: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_semestres` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_semestres` ENABLE KEYS */;

-- Volcando estructura para tabla lecturas_suneo.tbl_tipo_reporte
CREATE TABLE IF NOT EXISTS `tbl_tipo_reporte` (
  `id_tipo_reporte` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_reporte` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_reporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catálogo predeterminado de tipos de reportes que se pueden hacer.';

-- Volcando datos para la tabla lecturas_suneo.tbl_tipo_reporte: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_tipo_reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tipo_reporte` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
