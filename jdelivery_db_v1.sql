# SQL Manager 2005 Lite for MySQL 3.7.0.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : jdelivery_db


SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `jdelivery_db`;

CREATE DATABASE `jdelivery_db`
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

USE `jdelivery_db`;

#
# Structure for the `clientes` table : 
#

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `cliente_id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(50) default NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) default NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY  (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

#
# Structure for the `productos` table : 
#

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `producto_id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) default NULL,
  `presentacion` varchar(50) default NULL,
  `en_oferta` boolean NULL,
  `precio` float(9,3) NOT NULL,
--  `tiempo_preparacion` int(11) default NULL,
  PRIMARY KEY  (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

#
# Structure for the `detalle_pedido` table : 
#

DROP TABLE IF EXISTS `detalle_pedido`;

CREATE TABLE `detalle_pedido` (
  `detalle_pedido_id` int(255) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  -- `observacion_detalle` varchar(50) default NULL,
  -- `hora_pedido` time NOT NULL,
  -- `hora_preparacion` time default NULL,
  -- `hora_entrega` time default NULL,
  PRIMARY KEY  (`detalle_pedido_id`,`pedido_id`,`producto_id`),
  KEY `detalle_pedido_fk` (`producto_id`),
  CONSTRAINT `detalle_productos_fk` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`) ON UPDATE CASCADE,
  CONSTRAINT `detalle_pedido_pedidos_fk` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

#
# Structure for the `pedidos` table : 
#

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `pedido_id` int(255) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(255) NOT NULL,
--  `estado_pedido` varchar(20) NOT NULL,
  `total` float(9,3) NOT NULL,
  `fecha_pedido` date NOT NULL,
  PRIMARY KEY  (`pedido_id`,`cliente_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `pedidos_clientes_fk` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;
