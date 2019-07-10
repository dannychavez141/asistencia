-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2019 a las 17:28:00
-- Versión del servidor: 5.5.40
-- Versión de PHP: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `asistencia`
--
CREATE DATABASE IF NOT EXISTS `asistencia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `asistencia`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

DROP TABLE IF EXISTS `alumno`;
CREATE TABLE IF NOT EXISTS `alumno` (
  `codAlu` varchar(10) NOT NULL,
  `nomAlu` varchar(45) DEFAULT NULL,
  `apepaAlu` varchar(45) DEFAULT NULL,
  `apemaAlu` varchar(45) DEFAULT NULL,
  `idhuella` varchar(45) DEFAULT NULL,
  `est` varchar(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`codAlu`, `nomAlu`, `apepaAlu`, `apemaAlu`, `idhuella`, `est`) VALUES
('2040105', 'GINO ANDERSON', 'GARCIA', 'ACOSTA', '19', '1'),
('2060199', 'WALTER', 'VASQUEZ', 'RIOS', '57', '1'),
('2070240', 'IVAN', 'HUAMANTICO', 'ALARCON', '26', '1'),
('2070287', 'LUIGGI PIERRE', 'SAUCEDO', 'LOPEZ', '48', '1'),
('2080632', 'CARLOS IGNACIO', 'CHAVEZ', 'RAMIREZ', '6', '1'),
('2090806', 'JOSE LENIN', 'LOZADA', 'FLORES', '32', '1'),
('2100924', 'HECTOR VILLASON', 'HUAPULA', 'VILLAFANA', '27', '1'),
('2100941', 'ANDY', 'PAREDES', 'CRIOLLO', '37', '1'),
('2100955', 'MANUEL ALEXANDER', 'SILVA', 'LURITA', '49', '1'),
('2100960', 'JACK JUNIOR', 'TORRES', 'REATEGUI', '51', '1'),
('2110644', 'RENZO ANDRE', 'ALVARADO', 'LA TORRE', '1', '1'),
('2110651', 'LUBER DANIEL', 'BASILIO', 'DA SILVA', '3', '1'),
('2110662', 'KEVIN ARNOL', 'FERNANDEZ', 'MALCA', '13', '1'),
('2110670', 'ZENKI', 'KATAYAMA', 'MORAN', '29', '1'),
('2110711', 'JOHN ANDRES', 'WAGNER', 'MENDOZA', '60', '1'),
('2120803', 'GIL MELVIS', 'CONDORCAHUANA', 'TEXEIRA', '8', '1'),
('2120810', 'SERGIO ORLANDO ', 'FUNG', 'VARGAS', '16', '1'),
('2120854', 'LUISIN WANDERLEY', 'ZUMAETA', 'TORRES', '62', '1'),
('2130313', 'VICTOR ANTHONY', 'CASTRO', 'LA TORRE', '5', '1'),
('2130324', 'GARLLI', 'GARCIA', 'ROCHA', '18', '1'),
('2130332', 'JUAN JEAN PIERRE', 'HIDALGO', 'MANCILLA', '22', '1'),
('2130333', 'JOSE JAIRO ', 'HUAMAN', 'MACHUCA', '25', '1'),
('2130340', 'JOSUE DANIEL', 'MAS', 'DELGADO', '34', '1'),
('2130351', 'CHRISTIAN KENY', 'PINEDO', 'ACHO', '40', '1'),
('2130369', 'MAYKOL', 'SANTOS', 'LUYCHO', '47', '1'),
('2130380', 'GIANFRANCO', 'VASQUEZ', 'CORDOVA', '55', '1'),
('2130383', 'TONY JORMAN', 'VELA', 'MONSALVE', '58', '1'),
('2131004', 'JHON FRANK', 'MORENO', 'PEREZ', '35', '1'),
('2140325', 'MARCELINO JUNIOR', 'CARTAGENA', 'FARFAN', '4', '1'),
('2140328', 'FRANCO JONAIKER', 'CORTEZ', 'VALVERDE', '9', '1'),
('2140329', 'ABNER JUAN', 'DAZA', 'MORALES', '10', '1'),
('2140332', 'CESAR LUIS', 'ESTRELLA', 'ABANTO', '12', '1'),
('2140334', 'MONICA', 'FERNANDEZ', 'NAVARRO', '14', '1'),
('2140339', 'NERIO MAVERING', 'GOMEZ', 'PEREYRA', '20', '1'),
('2140343', 'ELIO DAVID', 'HOYOS', 'BARBA', '23', '1'),
('2140344', 'EMILY MELISSA', 'LOPEZ', 'IBERICO', '31', '1'),
('2140352', 'LUIS ARTURO', 'MAQUERA', 'RIVAS', '33', '1'),
('2140362', 'AUGUSTO JUNIOR', 'PASQUEL', 'DEL AGUILA', '38', '1'),
('2140364', 'PIERO BRAYAN', 'PEZO', 'MARIN', '39', '1'),
('2140368', 'PABLO FELIPE', 'RAMIREZ', 'NAVARRO', '41', '1'),
('2140370', 'FRANK ANTONIO', 'RAMOS', 'DEL AGUILA', '42', '1'),
('2140394', 'ARNALDO', 'VASQUEZ', 'RUIZ', '56', '1'),
('2140397', 'RICARDO', 'VILLACORTA', 'DIAZ', '59', '1'),
('2150315', 'EDWIN LUIS', 'BARBOZA', 'PINEDO', '2', '1'),
('2150322', 'LUIS OSWALDO', 'COLLADO', 'TORRES', '7', '1'),
('2150323', 'DANIEL ITALO ROMANO', 'DEGREGORI', 'DONAYRE', '11', '1'),
('2150329', 'JEAN RICKY', 'FLORES', 'ALVAREZ', '15', '1'),
('2150330', 'JUMPIER C?SAR', 'GARC?A', 'CH?VEZ', '17', '1'),
('2150336', 'ERICA CLAUDIA', 'HERRERA', 'HUARAC', '21', '1'),
('2150339', 'HERLIN', 'HUAMAN', 'GUZMAN', '24', '1'),
('2150340', 'ISAIAS', 'IBARRA', 'ONOFRE', '28', '1'),
('2150342', 'KEVIN LINDSEY', 'LEON', 'TIPTO', '30', '1'),
('2150350', 'EDWAR ENRIQUE', 'NU?EZ', 'MERMAO', '36', '1'),
('2150358', 'PATRICK JEREMY', 'RODRIGUEZ', 'SANDOVAL', '43', '1'),
('2150360', 'NICOLAS FABRICIO', 'ROMERO', 'MORALES', '44', '1'),
('2150362', 'LEIDY DIANA', 'SANCHEZ', 'QUINCHUBIA', '45', '1'),
('2150363', 'ROMMEL JARED', 'SANGAMA', 'DAVILA', '46', '1'),
('2150365', 'ISAAC', 'SORIANO', 'AQUISE', '50', '1'),
('2150366', 'LUIS ALFREDO', 'VALENZUELA', 'D?VILA', '52', '1'),
('2150367', 'HUGO JUNIOR', 'VALVERDE', 'CHUMBE', '53', '1'),
('2150368', 'PERLA ESPERANZA ', 'VARGAS', 'ROMAINA', '54', '1'),
('2150373', 'CARLO ANDONI', 'ZARZOSA', 'GARC?A', '61', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anioacademico`
--

DROP TABLE IF EXISTS `anioacademico`;
CREATE TABLE IF NOT EXISTS `anioacademico` (
`idAnioAcademico` int(11) NOT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `est` int(11) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `anioacademico`
--

INSERT INTO `anioacademico` (`idAnioAcademico`, `descr`, `est`) VALUES
(1, '2018-I', 2),
(2, '2018-II', 2),
(3, '2019-0', 2),
(4, '2019-I', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciondoc`
--

DROP TABLE IF EXISTS `asignaciondoc`;
CREATE TABLE IF NOT EXISTS `asignaciondoc` (
`idAsignacionDoc` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `idDocente` int(11) NOT NULL,
  `idAnioAcademico` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaciondoc`
--

INSERT INTO `asignaciondoc` (`idAsignacionDoc`, `idCurso`, `idDocente`, `idAnioAcademico`) VALUES
(1, 2, 2, 4),
(2, 4, 1, 4),
(3, 1, 1, 4),
(4, 5, 2, 4),
(5, 6, 4, 4),
(6, 7, 4, 4),
(7, 10, 3, 4),
(8, 11, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE IF NOT EXISTS `asistencia` (
  `idClase` int(11) NOT NULL,
  `codAlu` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`idClase`, `codAlu`) VALUES
(1, '2040105'),
(1, '2110644'),
(1, '2110651'),
(1, '2150315'),
(1, '2140325'),
(2, '2110644'),
(2, '2110651'),
(2, '2040105'),
(2, '2140325'),
(2, '2150315'),
(2, '2130313'),
(7, '2130313'),
(7, '2140325'),
(7, '2110644'),
(7, '2110651'),
(7, '2150322'),
(7, '2060199'),
(7, '2140329');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

DROP TABLE IF EXISTS `clase`;
CREATE TABLE IF NOT EXISTS `clase` (
`idClase` int(11) NOT NULL,
  `idAsignacionDoc` int(11) NOT NULL,
  `fechaClas` date DEFAULT NULL,
  `horClas` time DEFAULT NULL,
  `est` int(11) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`idClase`, `idAsignacionDoc`, `fechaClas`, `horClas`, `est`) VALUES
(1, 8, '2019-06-05', '13:41:00', 1),
(2, 1, '2019-06-10', '14:50:00', 1),
(3, 3, '2019-06-27', '11:20:00', 1),
(4, 3, '2019-06-27', '11:37:00', 1),
(5, 3, '2019-06-27', '11:41:00', 1),
(6, 3, '2019-06-27', '11:41:00', 1),
(7, 2, '2019-06-27', '11:46:00', 1),
(8, 2, '2019-06-27', '11:46:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
`idCurso` int(11) NOT NULL,
  `descr` varchar(100) DEFAULT NULL,
  `est` int(11) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idCurso`, `descr`, `est`) VALUES
(1, 'NEGOCIOS ELECTRONICOS', 1),
(2, 'INGENIERIA DE SOFTWARE', 1),
(3, 'METODOS NUMERICOS', 1),
(4, 'COMPUTACION MOVIL', 1),
(5, 'GESTION DE PROYECTOS', 1),
(6, 'DISEÑO DE SISTEMAS', 1),
(7, 'PRACTICAS PRE PROFECIONALES I', 1),
(8, 'LOGISTICA', 1),
(9, 'DESARROLLO DE SOFTWARE LIBRE', 1),
(10, 'Sistemas Distribuidos', 1),
(11, 'Inteligencia Artificial', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_alumno`
--

DROP TABLE IF EXISTS `curso_alumno`;
CREATE TABLE IF NOT EXISTS `curso_alumno` (
`idasig` int(11) NOT NULL,
  `codAlu` varchar(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `idAnioAcademico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

DROP TABLE IF EXISTS `docente`;
CREATE TABLE IF NOT EXISTS `docente` (
`idDocente` int(11) NOT NULL,
  `nomDoc` varchar(45) DEFAULT NULL,
  `apepaDoc` varchar(45) DEFAULT NULL,
  `apemaDoc` varchar(45) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `est` int(11) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`idDocente`, `nomDoc`, `apepaDoc`, `apemaDoc`, `dni`, `pass`, `est`) VALUES
(1, ' TomatO ', '', '', '', '', 0),
(2, 'Freddy  ', 'Ferrari', 'Fernandez', '4321', '4321', 1),
(3, 'Euclides', 'Panduro', 'Padilla', '1212', '1234', 1),
(4, 'Diana Margarita', 'Diaz ', 'Estrada', '1231', '4321', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
`idestados` int(11) NOT NULL,
  `descr` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idestados`, `descr`) VALUES
(1, 'ACTIVO'),
(2, 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
`idUsuario` int(11) NOT NULL,
  `NombreUsu` varchar(45) DEFAULT NULL,
  `ApepaUsu` varchar(45) DEFAULT NULL,
  `ApemaUsu` varchar(45) DEFAULT NULL,
  `Login` varchar(45) DEFAULT NULL,
  `Pass` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `NombreUsu`, `ApepaUsu`, `ApemaUsu`, `Login`, `Pass`) VALUES
(1, 'freddy', 'ferrary', 'Fernandez', 'admin', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
 ADD PRIMARY KEY (`codAlu`);

--
-- Indices de la tabla `anioacademico`
--
ALTER TABLE `anioacademico`
 ADD PRIMARY KEY (`idAnioAcademico`);

--
-- Indices de la tabla `asignaciondoc`
--
ALTER TABLE `asignaciondoc`
 ADD PRIMARY KEY (`idAsignacionDoc`), ADD KEY `fk_Curso_has_Docente_Docente1_idx` (`idDocente`), ADD KEY `fk_Curso_has_Docente_Curso_idx` (`idCurso`), ADD KEY `fk_Curso_has_Docente_AnioAcademico1_idx` (`idAnioAcademico`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
 ADD KEY `fk_Asistencia_Clase1_idx` (`idClase`), ADD KEY `fk_Asistencia_Alumno1_idx` (`codAlu`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
 ADD PRIMARY KEY (`idClase`), ADD KEY `fk_Clase_Curso_has_Docente1_idx` (`idAsignacionDoc`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
 ADD PRIMARY KEY (`idCurso`);

--
-- Indices de la tabla `curso_alumno`
--
ALTER TABLE `curso_alumno`
 ADD PRIMARY KEY (`idasig`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
 ADD PRIMARY KEY (`idDocente`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
 ADD PRIMARY KEY (`idestados`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anioacademico`
--
ALTER TABLE `anioacademico`
MODIFY `idAnioAcademico` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `asignaciondoc`
--
ALTER TABLE `asignaciondoc`
MODIFY `idAsignacionDoc` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
MODIFY `idClase` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
MODIFY `idCurso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `curso_alumno`
--
ALTER TABLE `curso_alumno`
MODIFY `idasig` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
MODIFY `idDocente` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
MODIFY `idestados` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaciondoc`
--
ALTER TABLE `asignaciondoc`
ADD CONSTRAINT `fk_Curso_has_Docente_AnioAcademico1` FOREIGN KEY (`idAnioAcademico`) REFERENCES `anioacademico` (`idAnioAcademico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Curso_has_Docente_Curso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Curso_has_Docente_Docente1` FOREIGN KEY (`idDocente`) REFERENCES `docente` (`idDocente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
ADD CONSTRAINT `fk_Asistencia_Alumno1` FOREIGN KEY (`codAlu`) REFERENCES `alumno` (`codAlu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Asistencia_Clase1` FOREIGN KEY (`idClase`) REFERENCES `clase` (`idClase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
ADD CONSTRAINT `fk_Clase_Curso_has_Docente1` FOREIGN KEY (`idAsignacionDoc`) REFERENCES `asignaciondoc` (`idAsignacionDoc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
