-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-09-2013 a las 02:48:58
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `jdelivery_db`
--
CREATE DATABASE IF NOT EXISTS `jdelivery_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jdelivery_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `cliente_id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nombre`, `apellido`, `telefono`, `direccion`, `usuario`, `password`, `email`) VALUES
(1, 'Pablo', 'Patarca', '03401-15416842', 'Zeballos 1475 3ro A', 'pablopatarca', 'patarca', 'pablopatarca@gmail.com'),
(2, 'Matias', 'Boselli', '12345678', 'Dirección 1', 'matiasboselli', '12345', 'matias.boselli@gmail.com'),
(3, 'administrador', 'administrador', '03401414141', 'Zeballos 1341', 'administrador', 'admin', 'ppatarca@frro.utn.edu.ar'),
(4, 'Pablo', 'Nari', '0341-4123456', 'Zeballos 1475 3ro A', 'pablonari', '12345', 'pablonari@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `detalle_pedido_id` int(255) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`detalle_pedido_id`,`pedido_id`,`producto_id`),
  KEY `detalle_pedido_fk` (`producto_id`),
  KEY `detalle_pedido_pedidos_fk` (`pedido_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`detalle_pedido_id`, `pedido_id`, `producto_id`, `cantidad`) VALUES
(1, 1, 2, 3),
(2, 1, 1, 3),
(3, 2, 1, 1),
(4, 3, 2, 1),
(5, 3, 1, 1),
(6, 3, 3, 6),
(7, 4, 1, 2),
(8, 4, 2, 8),
(9, 4, 3, 6),
(10, 5, 2, 1),
(11, 5, 1, 10),
(12, 7, 1, 5),
(13, 7, 2, 9),
(14, 7, 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `pedido_id` int(255) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(255) NOT NULL,
  `total` double(9,3) NOT NULL,
  `fecha_pedido` date NOT NULL,
  PRIMARY KEY (`pedido_id`,`cliente_id`),
  KEY `cliente_id` (`cliente_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`pedido_id`, `cliente_id`, `total`, `fecha_pedido`) VALUES
(1, 1, 48.050, '2013-08-29'),
(2, 1, 11.500, '2013-08-29'),
(3, 1, 84.600, '2013-08-29'),
(4, 1, 84.600, '2013-08-29'),
(5, 1, 48.050, '2013-08-29'),
(6, 1, 11.500, '2013-08-29'),
(7, 1, 569.200, '2013-08-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `producto_id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `presentacion` varchar(50) DEFAULT NULL,
  `en_oferta` tinyint(1) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `precio` float(9,3) NOT NULL,
  PRIMARY KEY (`producto_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `nombre`, `descripcion`, `presentacion`, `en_oferta`, `imagen`, `precio`) VALUES
(1, 'Producto11', 'DescripciÃ³n de producto 11', 'presentacion11', 0, '02997620.jpg', 11.500),
(2, 'producto 2', 'Descripción 2', 'Presentación 2', 1, '', 36.550),
(3, 'producto 2', 'Descripción 2', 'Presentación 2', 1, '', 36.550),
(4, 'Pablo', 'asd', '8 porciones', 0, NULL, 9.000);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_pedidos_fk` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_productos_fk` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_clientes_fk` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
