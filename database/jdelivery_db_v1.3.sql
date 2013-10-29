-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-10-2013 a las 21:00:19
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `jdelivery`
--
CREATE DATABASE IF NOT EXISTS `jdelivery` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jdelivery`;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

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
(14, 7, 3, 5),
(15, 8, 1, 3),
(16, 8, 3, 2),
(17, 9, 2, 3),
(18, 9, 1, 4);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

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
(7, 1, 569.200, '2013-08-29'),
(8, 1, 107.600, '2013-09-02'),
(9, 1, 331.650, '2013-09-02');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `nombre`, `descripcion`, `presentacion`, `en_oferta`, `imagen`, `precio`) VALUES
(1, 'Pizza Especial', 'Muzzarella, Jamon, Huevo, Aceitunas, Morrones...', '8 porciones', 0, '1.jpg', 55.500),
(2, 'producto 2', 'Descripción 2', 'Presentación 2', 1, '2.jpg', 36.550),
(3, 'producto 2', 'Descripción 2', 'Presentación 2', 1, '3.jpg', 36.550),
(4, 'Pablo', 'asd', '8 porciones', 0, '4.jpg', 9.000),
(5, 'Producto de Prueba', 'producto de prueba', 'Presentación 2', 0, '5.jpg', 20.000),
(6, 'Producto de Prueba 2', 'Otro Producto', '20 kg', 1, '6.jpg', 250.000);

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
