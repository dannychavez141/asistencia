-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-09-2021 a las 20:51:56
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

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
CREATE TABLE `alumno` (
  `codAlu` varchar(10) NOT NULL,
  `nomAlu` varchar(45) DEFAULT NULL,
  `apepaAlu` varchar(45) DEFAULT NULL,
  `apemaAlu` varchar(45) DEFAULT NULL,
  `idhuella` int(11) DEFAULT NULL,
  `est` varchar(11) DEFAULT '1',
  `huella1` longtext DEFAULT NULL,
  `huella2` longtext DEFAULT NULL,
  `imghuella1` longtext DEFAULT NULL,
  `imghuella2` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`codAlu`, `nomAlu`, `apepaAlu`, `apemaAlu`, `idhuella`, `est`, `huella1`, `huella2`, `imghuella1`, `imghuella2`) VALUES
('0002040105', 'GINO ANDERSON', 'GARCIA', 'ACOSTA', 19, '1', NULL, NULL, NULL, NULL),
('0002060199', 'WALTER', 'VASQUEZ', 'RIOS', 57, '1', NULL, NULL, NULL, NULL),
('0002070240', 'IVAN', 'HUAMANTICO', 'ALARCON', 26, '1', NULL, NULL, NULL, NULL),
('0002070287', 'LUIGGI PIERRE', 'SAUCEDO', 'LOPEZ', 48, '1', NULL, NULL, NULL, NULL),
('0002080632', 'CARLOS IGNACIO', 'CHAVEZ', 'RAMIREZ', 6, '1', NULL, NULL, NULL, NULL),
('0002090806', 'JOSE LENIN', 'LOZADA', 'FLORES', 32, '1', NULL, NULL, NULL, NULL),
('0002100924', 'HECTOR VILLASON', 'HUAPULA', 'VILLAFANA', 27, '1', NULL, NULL, NULL, NULL),
('0002100941', 'ANDY', 'PAREDES', 'CRIOLLO', 37, '1', NULL, NULL, NULL, NULL),
('0002100955', 'MANUEL ALEXANDER', 'SILVA', 'LURITA', 49, '1', NULL, NULL, NULL, NULL),
('0002100960', 'JACK JUNIOR', 'TORRES', 'REATEGUI', 51, '1', NULL, NULL, NULL, NULL),
('0002110644', 'RENZO ANDRE', 'ALVARADO', 'LA TORRE', 1, '1', NULL, NULL, NULL, NULL),
('0002110651', 'LUBER DANIEL', 'BASILIO', 'DA SILVA', 3, '1', NULL, NULL, NULL, NULL),
('0002110662', 'KEVIN ARNOL', 'FERNANDEZ', 'MALCA', 13, '1', NULL, NULL, NULL, NULL),
('0002110670', 'ZENKI', 'KATAYAMA', 'MORAN', 29, '1', NULL, NULL, NULL, NULL),
('0002110711', 'JOHN ANDRES', 'WAGNER', 'MENDOZA', 60, '1', NULL, NULL, NULL, NULL),
('0002120803', 'GIL MELVIS', 'CONDORCAHUANA', 'TEXEIRA', 8, '1', NULL, NULL, NULL, NULL),
('0002120810', 'SERGIO ORLANDO ', 'FUNG', 'VARGAS', 16, '1', NULL, NULL, NULL, NULL),
('0002120854', 'LUISIN WANDERLEY', 'ZUMAETA', 'TORRES', 62, '1', NULL, NULL, NULL, NULL),
('0002130313', 'VICTOR ANTHONY', 'CASTRO', 'LA TORRE', 5, '1', NULL, NULL, NULL, NULL),
('0002130314', 'DANNY MANUEL', 'CHAVEZ', 'HERRERA', 63, '1', NULL, NULL, NULL, NULL),
('0002130324', 'GARLLI', 'GARCIA', 'ROCHA', 18, '1', NULL, NULL, NULL, NULL),
('0002130332', 'JUAN JEAN PIERRE', 'HIDALGO', 'MANCILLA', 22, '1', NULL, NULL, NULL, NULL),
('0002130333', 'JOSE JAIRO ', 'HUAMAN', 'MACHUCA', 25, '1', NULL, NULL, NULL, NULL),
('0002130340', 'JOSUE DANIEL', 'MAS', 'DELGADO', 34, '1', NULL, NULL, NULL, NULL),
('0002130351', 'CHRISTIAN KENY', 'PINEDO', 'ACHO', 40, '1', NULL, NULL, NULL, NULL),
('0002130369', 'MAYKOL', 'SANTOS', 'LUYCHO', 47, '1', NULL, NULL, NULL, NULL),
('0002130380', 'GIANFRANCO', 'VASQUEZ', 'CORDOVA', 55, '1', NULL, NULL, NULL, NULL),
('0002130383', 'TONY JORMAN', 'VELA', 'MONSALVE', 58, '1', NULL, NULL, NULL, NULL),
('0002131004', 'JHON FRANK', 'MORENO', 'PEREZ', 35, '1', NULL, NULL, NULL, NULL),
('0002140325', 'MARCELINO JUNIOR', 'CARTAGENA', 'FARFAN', 4, '1', NULL, NULL, NULL, NULL),
('0002140328', 'FRANCO JONAIKER', 'CORTEZ', 'VALVERDE', 9, '1', NULL, NULL, NULL, NULL),
('0002140329', 'ABNER JUAN', 'DAZA', 'MORALES', 10, '1', NULL, NULL, NULL, NULL),
('0002140332', 'CESAR LUIS', 'ESTRELLA', 'ABANTO', 12, '1', NULL, NULL, NULL, NULL),
('0002140334', 'MONICA', 'FERNANDEZ', 'NAVARRO', 14, '1', NULL, NULL, NULL, NULL),
('0002140339', 'NERIO MAVERING', 'GOMEZ', 'PEREYRA', 20, '1', NULL, NULL, NULL, NULL),
('0002140343', 'ELIO DAVID', 'HOYOS', 'BARBA', 23, '1', NULL, NULL, NULL, NULL),
('0002140344', 'EMILY MELISSA', 'LOPEZ', 'IBERICO', 31, '1', NULL, NULL, NULL, NULL),
('0002140352', 'LUIS ARTURO', 'MAQUERA', 'RIVAS', 33, '1', NULL, NULL, NULL, NULL),
('0002140362', 'AUGUSTO JUNIOR', 'PASQUEL', 'DEL AGUILA', 38, '1', NULL, NULL, NULL, NULL),
('0002140364', 'PIERO BRAYAN', 'PEZO', 'MARIN', 39, '1', NULL, NULL, NULL, NULL),
('0002140368', 'PABLO FELIPE', 'RAMIREZ', 'NAVARRO', 41, '1', NULL, NULL, NULL, NULL),
('0002140370', 'FRANK ANTONIO', 'RAMOS', 'DEL AGUILA', 42, '1', NULL, NULL, NULL, NULL),
('0002140394', 'ARNALDO', 'VASQUEZ', 'RUIZ', 56, '1', NULL, NULL, NULL, NULL),
('0002140397', 'RICARDO', 'VILLACORTA', 'DIAZ', 59, '1', NULL, NULL, NULL, NULL),
('0002150315', 'EDWIN LUIS', 'BARBOZA', 'PINEDO', 2, '1', NULL, NULL, NULL, NULL),
('0002150322', 'LUIS OSWALDO', 'COLLADO', 'TORRES', 7, '1', NULL, NULL, NULL, NULL),
('0002150323', 'DANIEL ITALO ROMANO', 'DEGREGORI', 'DONAYRE', 11, '1', NULL, NULL, NULL, NULL),
('0002150329', 'JEAN RICKY', 'FLORES', 'ALVAREZ', 15, '1', NULL, NULL, NULL, NULL),
('0002150330', 'JUMPIER CESAR', 'GARCIA', 'CHAVEZ', 17, '1', NULL, NULL, NULL, NULL),
('0002150336', 'ERICA CLAUDIA', 'HERRERA', 'HUARAC', 21, '1', NULL, NULL, NULL, NULL),
('0002150339', 'HERLIN', 'HUAMAN', 'GUZMAN', 24, '1', NULL, NULL, NULL, NULL),
('0002150340', 'ISAIAS', 'IBARRA', 'ONOFRE', 28, '1', NULL, NULL, NULL, NULL),
('0002150342', 'KEVIN LINDSEY', 'LEON', 'TIPTO', 30, '1', NULL, NULL, NULL, NULL),
('0002150350', 'EDWAR ENRIQUE', 'NU?EZ', 'MERMAO', 36, '1', NULL, NULL, NULL, NULL),
('0002150358', 'PATRICK JEREMY', 'RODRIGUEZ', 'SANDOVAL', 43, '1', NULL, NULL, NULL, NULL),
('0002150360', 'NICOLAS FABRICIO', 'ROMERO', 'MORALES', 44, '1', NULL, NULL, NULL, NULL),
('0002150362', 'LEIDY DIANA', 'SANCHEZ', 'QUINCHUBIA', 45, '1', NULL, NULL, NULL, NULL),
('0002150363', 'ROMMEL JARED', 'SANGAMA', 'DAVILA', 46, '1', NULL, NULL, NULL, NULL),
('0002150365', 'ISAAC', 'SORIANO', 'AQUISE', 50, '1', NULL, NULL, NULL, NULL),
('0002150366', 'LUIS ALFREDO', 'VALENZUELA', 'D?VILA', 52, '1', NULL, NULL, NULL, NULL),
('0002150367', 'HUGO JUNIOR', 'VALVERDE', 'CHUMBE', 53, '1', NULL, NULL, NULL, NULL),
('0002150368', 'PERLA ESPERANZA ', 'VARGAS', 'ROMAINA', 54, '1', NULL, NULL, NULL, NULL),
('0002150373', 'CARLO ANDONI', 'ZARZOSA', 'GARC?A', 61, '1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anioacademico`
--

DROP TABLE IF EXISTS `anioacademico`;
CREATE TABLE `anioacademico` (
  `idAnioAcademico` int(11) NOT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `est` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `anioacademico`
--

INSERT INTO `anioacademico` (`idAnioAcademico`, `descr`, `est`) VALUES
(1, '2018-I', 2),
(2, '2018-II', 2),
(3, '2019-0', 2),
(4, '2019-I', 1),
(5, '2020 - I', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionalu`
--

DROP TABLE IF EXISTS `asignacionalu`;
CREATE TABLE `asignacionalu` (
  `idasig` int(11) NOT NULL,
  `codAlu` varchar(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `idAnioAcademico` int(11) NOT NULL,
  `est` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignacionalu`
--

INSERT INTO `asignacionalu` (`idasig`, `codAlu`, `idcurso`, `idAnioAcademico`, `est`) VALUES
(1, '0002090806', 4, 4, 1),
(2, '0002090806', 1, 4, 1),
(3, '0002110644', 13, 4, 1),
(4, '0002110644', 4, 4, 1),
(5, '0002040105', 4, 4, 1),
(6, '0002060199', 4, 4, 1),
(7, '0002080632', 4, 4, 1),
(8, '0002110651', 4, 4, 1),
(9, '0002140325', 4, 4, 1),
(10, '0002130313', 4, 4, 1),
(11, '0002140329', 4, 4, 1),
(12, '0002090806', 7, 4, 1),
(13, '0002130314', 14, 5, 1),
(14, '0002130314', 1, 5, 1),
(15, '0002130314', 5, 5, 1),
(16, '0002130314', 4, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciondoc`
--

DROP TABLE IF EXISTS `asignaciondoc`;
CREATE TABLE `asignaciondoc` (
  `idAsignacionDoc` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `idDocente` int(11) NOT NULL,
  `idAnioAcademico` int(11) NOT NULL,
  `est` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaciondoc`
--

INSERT INTO `asignaciondoc` (`idAsignacionDoc`, `idCurso`, `idDocente`, `idAnioAcademico`, `est`) VALUES
(1, 2, 2, 4, 1),
(2, 4, 1, 4, 1),
(3, 1, 1, 4, 1),
(4, 5, 2, 4, 1),
(5, 6, 4, 4, 1),
(6, 7, 4, 4, 1),
(7, 10, 3, 4, 1),
(8, 11, 1, 4, 1),
(9, 12, 2, 4, 1),
(10, 3, 5, 4, 1),
(11, 12, 2, 2, 1),
(12, 2, 2, 2, 1),
(13, 14, 6, 5, 1),
(14, 8, 6, 5, 2),
(15, 4, 1, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE `asistencia` (
  `idClase` int(11) NOT NULL,
  `codAlu` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`idClase`, `codAlu`) VALUES
(1, '0002040105'),
(1, '0002110644'),
(1, '0002110651'),
(1, '0002150315'),
(1, '0002140325'),
(2, '0002110644'),
(2, '0002110651'),
(2, '0002040105'),
(2, '0002140325'),
(2, '0002150315'),
(2, '0002130313'),
(7, '0002130313'),
(7, '0002140325'),
(7, '0002110644'),
(7, '0002110651'),
(7, '0002150322'),
(7, '0002060199'),
(7, '0002140329'),
(9, '0002150330'),
(9, '0002140397'),
(10, '0002130314'),
(10, '0002150330'),
(10, '0002140397');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

DROP TABLE IF EXISTS `clase`;
CREATE TABLE `clase` (
  `idClase` int(11) NOT NULL,
  `idAsignacionDoc` int(11) NOT NULL,
  `fechaClas` date DEFAULT NULL,
  `horClas` time DEFAULT NULL,
  `est` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(8, 2, '2019-06-27', '11:46:00', 1),
(9, 13, '2021-01-03', '11:23:00', 1),
(10, 13, '2021-01-03', '11:28:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE `curso` (
  `idCurso` int(11) NOT NULL,
  `descr` varchar(100) DEFAULT NULL,
  `est` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idCurso`, `descr`, `est`) VALUES
(1, 'NEGOCIOS ELECTRONICOS', 2),
(2, 'INGENIERIA DE SOFTWARE', 1),
(3, 'METODOS NUMERICOS', 1),
(4, 'COMPUTACION MOVIL', 1),
(5, 'GESTION DE PROYECTOS', 1),
(6, 'DISEÃ‘O DE SISTEMAS', 1),
(7, 'PRACTICAS PRE PROFECIONALES I', 1),
(8, 'LOGISTICA', 1),
(9, 'DESARROLLO DE SOFTWARE LIBRE', 1),
(10, 'Sistemas Distribuidos', 1),
(11, 'Inteligencia Artificial', 1),
(12, 'TALLER DE DESARROLLO', 1),
(13, 'MATEMATICA  I', 1),
(14, 'TESIS I', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

DROP TABLE IF EXISTS `docente`;
CREATE TABLE `docente` (
  `idDocente` int(11) NOT NULL,
  `nomDoc` varchar(45) DEFAULT NULL,
  `apepaDoc` varchar(45) DEFAULT NULL,
  `apemaDoc` varchar(45) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `est` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`idDocente`, `nomDoc`, `apepaDoc`, `apemaDoc`, `dni`, `pass`, `est`) VALUES
(1, 'Cesar', ' Ayra ', 'Apac', '1234', '1234', 1),
(2, 'Freddy  ', 'Ferrari', 'Fernandez', '4321', '4321', 1),
(3, 'Euclides', 'Panduro', 'Padilla', '1212', '1212', 1),
(4, 'Diana Margarita', 'Diaz ', 'Estrada', '1231', '4321', 1),
(5, 'OSCAR AMADO', 'RUIZ', 'TORRES', '123456', '1234', 1),
(6, 'CESAR AUGUSTO', 'AGURTO', 'CHERRE', '4321', '4444', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
  `idestados` int(11) NOT NULL,
  `descr` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `NombreUsu` varchar(45) DEFAULT NULL,
  `ApepaUsu` varchar(45) DEFAULT NULL,
  `ApemaUsu` varchar(45) DEFAULT NULL,
  `Login` varchar(45) DEFAULT NULL,
  `Pass` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indices de la tabla `asignacionalu`
--
ALTER TABLE `asignacionalu`
  ADD PRIMARY KEY (`idasig`);

--
-- Indices de la tabla `asignaciondoc`
--
ALTER TABLE `asignaciondoc`
  ADD PRIMARY KEY (`idAsignacionDoc`),
  ADD KEY `fk_Curso_has_Docente_Docente1_idx` (`idDocente`),
  ADD KEY `fk_Curso_has_Docente_Curso_idx` (`idCurso`),
  ADD KEY `fk_Curso_has_Docente_AnioAcademico1_idx` (`idAnioAcademico`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD KEY `fk_Asistencia_Clase1_idx` (`idClase`),
  ADD KEY `fk_Asistencia_Alumno1_idx` (`codAlu`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`idClase`),
  ADD KEY `fk_Clase_Curso_has_Docente1_idx` (`idAsignacionDoc`);

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
  MODIFY `idAnioAcademico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `asignacionalu`
--
ALTER TABLE `asignacionalu`
  MODIFY `idasig` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `asignaciondoc`
--
ALTER TABLE `asignaciondoc`
  MODIFY `idAsignacionDoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `idClase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `idCurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `idDocente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idestados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
