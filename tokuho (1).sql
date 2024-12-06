-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2024 a las 19:24:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tokuho`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo`
--

CREATE TABLE `archivo` (
  `idArchivo` int(10) UNSIGNED ZEROFILL NOT NULL,
  `idUsuario` int(11) UNSIGNED ZEROFILL NOT NULL,
  `idCateg` int(11) UNSIGNED ZEROFILL NOT NULL,
  `urlArchivo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha` date NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCateg` int(10) UNSIGNED ZEROFILL NOT NULL,
  `tipoCategoria` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarioarchivo`
--

CREATE TABLE `comentarioarchivo` (
  `idComeArch` int(10) UNSIGNED ZEROFILL NOT NULL,
  `idUsuario` int(11) UNSIGNED ZEROFILL NOT NULL,
  `idArchivo` int(11) UNSIGNED ZEROFILL NOT NULL,
  `comentario` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `valorizacion` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentariopublicacion`
--

CREATE TABLE `comentariopublicacion` (
  `idComePubli` int(10) UNSIGNED ZEROFILL NOT NULL,
  `idUsuario` int(11) UNSIGNED ZEROFILL NOT NULL,
  `idPublicacion` int(11) UNSIGNED ZEROFILL NOT NULL,
  `comentario` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `valorizacion` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentariotienda`
--

CREATE TABLE `comentariotienda` (
  `idComeTien` int(11) NOT NULL,
  `idUsuario` int(10) UNSIGNED ZEROFILL NOT NULL,
  `idTienda` int(10) UNSIGNED ZEROFILL NOT NULL,
  `comentario` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `valorizacion` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentariovideo`
--

CREATE TABLE `comentariovideo` (
  `idComeVide` int(10) UNSIGNED ZEROFILL NOT NULL,
  `idUsuario` int(11) UNSIGNED ZEROFILL NOT NULL,
  `idVideo` int(11) UNSIGNED ZEROFILL NOT NULL,
  `comentario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `valorizacion` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dojo`
--

CREATE TABLE `dojo` (
  `idDojo` int(10) UNSIGNED ZEROFILL NOT NULL,
  `nombreDojo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `horario` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dojo`
--

INSERT INTO `dojo` (`idDojo`, `nombreDojo`, `direccion`, `horario`, `estado`) VALUES
(0000000001, 'Tokuho', 'NU SE', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `idMensaje` int(11) UNSIGNED ZEROFILL NOT NULL,
  `idUsuario` int(11) UNSIGNED ZEROFILL NOT NULL,
  `receptor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `contenido` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion`
--

CREATE TABLE `publicacion` (
  `idPublicacion` int(10) UNSIGNED ZEROFILL NOT NULL,
  `idUsuario` int(11) UNSIGNED ZEROFILL NOT NULL,
  `idCateg` int(11) UNSIGNED ZEROFILL NOT NULL,
  `nombrePublicacion` varchar(30) NOT NULL,
  `contenido` text CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `idTienda` int(10) UNSIGNED ZEROFILL NOT NULL,
  `idUsuario` int(11) UNSIGNED ZEROFILL NOT NULL,
  `nombreTienda` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `contacto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idTipo` int(10) UNSIGNED ZEROFILL NOT NULL,
  `tipoUsuario` varchar(14) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idTipo`, `tipoUsuario`, `estado`) VALUES
(0000000001, 'ADMIN', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(10) UNSIGNED ZEROFILL NOT NULL,
  `idDojo` int(10) UNSIGNED ZEROFILL NOT NULL,
  `idTipo` int(11) UNSIGNED ZEROFILL NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `apellido` varchar(15) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `nivelUsuario` varchar(6) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `idDojo`, `idTipo`, `nombre`, `apellido`, `email`, `contrasena`, `nivelUsuario`, `estado`) VALUES
(0000000004, 0000000001, 00000000001, 'Francisco', 'Ahumada', 'franciscotahumada@gmail.com', '123123', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `idVideo` int(10) UNSIGNED ZEROFILL NOT NULL,
  `idUsuario` int(11) UNSIGNED ZEROFILL NOT NULL,
  `idCateg` int(11) UNSIGNED ZEROFILL NOT NULL,
  `nombreVideo` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nivelVideo` varchar(6) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fechaPublicacion` datetime NOT NULL,
  `urlVideo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivo`
--
ALTER TABLE `archivo`
  ADD PRIMARY KEY (`idArchivo`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idCateg` (`idCateg`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCateg`);

--
-- Indices de la tabla `comentarioarchivo`
--
ALTER TABLE `comentarioarchivo`
  ADD PRIMARY KEY (`idComeArch`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idArchivo` (`idArchivo`);

--
-- Indices de la tabla `comentariopublicacion`
--
ALTER TABLE `comentariopublicacion`
  ADD PRIMARY KEY (`idComePubli`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idPublicacion` (`idPublicacion`);

--
-- Indices de la tabla `comentariotienda`
--
ALTER TABLE `comentariotienda`
  ADD PRIMARY KEY (`idComeTien`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idTienda` (`idTienda`);

--
-- Indices de la tabla `comentariovideo`
--
ALTER TABLE `comentariovideo`
  ADD PRIMARY KEY (`idComeVide`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idVideo` (`idVideo`);

--
-- Indices de la tabla `dojo`
--
ALTER TABLE `dojo`
  ADD PRIMARY KEY (`idDojo`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`idMensaje`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD PRIMARY KEY (`idPublicacion`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idCateg` (`idCateg`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`idTienda`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idDojo` (`idDojo`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`idVideo`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idCateg` (`idCateg`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivo`
--
ALTER TABLE `archivo`
  MODIFY `idArchivo` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCateg` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarioarchivo`
--
ALTER TABLE `comentarioarchivo`
  MODIFY `idComeArch` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentariopublicacion`
--
ALTER TABLE `comentariopublicacion`
  MODIFY `idComePubli` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentariotienda`
--
ALTER TABLE `comentariotienda`
  MODIFY `idComeTien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentariovideo`
--
ALTER TABLE `comentariovideo`
  MODIFY `idComeVide` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dojo`
--
ALTER TABLE `dojo`
  MODIFY `idDojo` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `idMensaje` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  MODIFY `idPublicacion` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `idTienda` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `idTipo` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `video`
--
ALTER TABLE `video`
  MODIFY `idVideo` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivo`
--
ALTER TABLE `archivo`
  ADD CONSTRAINT `archivo_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `archivo_ibfk_2` FOREIGN KEY (`idCateg`) REFERENCES `categoria` (`idCateg`);

--
-- Filtros para la tabla `comentarioarchivo`
--
ALTER TABLE `comentarioarchivo`
  ADD CONSTRAINT `comentarioarchivo_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `comentarioarchivo_ibfk_2` FOREIGN KEY (`idArchivo`) REFERENCES `archivo` (`idArchivo`);

--
-- Filtros para la tabla `comentariopublicacion`
--
ALTER TABLE `comentariopublicacion`
  ADD CONSTRAINT `comentariopublicacion_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `comentariopublicacion_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `comentariopublicacion_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `comentariopublicacion_ibfk_4` FOREIGN KEY (`idPublicacion`) REFERENCES `publicacion` (`idPublicacion`);

--
-- Filtros para la tabla `comentariotienda`
--
ALTER TABLE `comentariotienda`
  ADD CONSTRAINT `comentariotienda_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `comentariotienda_ibfk_2` FOREIGN KEY (`idTienda`) REFERENCES `tienda` (`idTienda`);

--
-- Filtros para la tabla `comentariovideo`
--
ALTER TABLE `comentariovideo`
  ADD CONSTRAINT `comentariovideo_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `comentariovideo_ibfk_2` FOREIGN KEY (`idVideo`) REFERENCES `video` (`idVideo`);

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `mensaje_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD CONSTRAINT `publicacion_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `publicacion_ibfk_2` FOREIGN KEY (`idCateg`) REFERENCES `categoria` (`idCateg`);

--
-- Filtros para la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD CONSTRAINT `tienda_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idDojo`) REFERENCES `dojo` (`idDojo`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipousuario` (`idTipo`);

--
-- Filtros para la tabla `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `video_ibfk_2` FOREIGN KEY (`idCateg`) REFERENCES `categoria` (`idCateg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
