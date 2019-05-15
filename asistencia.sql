-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-05-2019 a las 21:27:48
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

CREATE TABLE IF NOT EXISTS `alumno` (
  `codAlu` varchar(10) NOT NULL,
  `nomAlu` varchar(45) DEFAULT NULL,
  `apepaAlu` varchar(45) DEFAULT NULL,
  `apemaAlu` varchar(45) DEFAULT NULL,
  `idhuella` varchar(45) DEFAULT NULL,
  `est` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`codAlu`, `nomAlu`, `apepaAlu`, `apemaAlu`, `idhuella`, `est`) VALUES
('0002130314', 'Danny Manuel', 'CHAVEZ', '', '\n1981931799', 1),
('0002132424', 'Ricardo', 'Villacorta ', 'Dias', '\n21711422386', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anioacademico`
--

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

CREATE TABLE IF NOT EXISTS `asignaciondoc` (
`idAsignacionDoc` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `idDocente` int(11) NOT NULL,
  `idAnioAcademico` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaciondoc`
--

INSERT INTO `asignaciondoc` (`idAsignacionDoc`, `idCurso`, `idDocente`, `idAnioAcademico`) VALUES
(1, 2, 2, 4),
(2, 4, 1, 4),
(3, 1, 1, 4),
(4, 5, 2, 4),
(5, 6, 4, 4),
(6, 7, 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE IF NOT EXISTS `asistencia` (
  `idClase` int(11) NOT NULL,
  `codAlu` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE IF NOT EXISTS `clase` (
`idClase` int(11) NOT NULL,
  `idAsignacionDoc` int(11) NOT NULL,
  `fechaClas` date DEFAULT NULL,
  `horClas` time DEFAULT NULL,
  `est` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
`idCurso` int(11) NOT NULL,
  `descr` varchar(100) DEFAULT NULL,
  `est` int(11) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
(9, 'DESARROLLO DE SOFTWARE LIBRE', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

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
(1, 'Cesar ', 'Ayra', 'Apac', '12345678', '1234', 1),
(2, 'Freddy', 'Ferrari', 'Fernandez', '87654321', '4321', 1),
(3, 'Euclides', 'Panduro', 'Padilla', '12341234', '1234', 1),
(4, 'Diana Margarita', 'Diaz ', 'Estrada', '12312345', '4321', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

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
MODIFY `idAsignacionDoc` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
MODIFY `idClase` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
MODIFY `idCurso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
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
