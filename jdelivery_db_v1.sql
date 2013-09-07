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
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) default NULL,
  `direccion` varchar(50) default NULL,
  PRIMARY KEY  (`telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `productos` table : 
#

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id_item` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `presentacion` varchar(50) NOT NULL,
  `en_oferta` boolean NULL,
  `precio` float(9,3) NOT NULL,
  `tiempo_preparacion` int(11) default NULL,
  PRIMARY KEY  (`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `pedidos` table : 
#

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `estado_pedido` varchar(20) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `nro_factura` int(11) default NULL,
  `nro_mesa` int(11) default NULL,
  `cuil` varchar(20) default NULL,
  `nro_tel` varchar(20) default NULL,
  `cuil_encargado` varchar(20) default NULL,
  PRIMARY KEY  (`fecha_pedido`,`id_pedido`),
  KEY `nro_tel` (`nro_tel`),
  KEY `pedidos_encargados_fk` (`cuil_encargado`),
  KEY `pedidos_mozorep_fk` (`cuil`),
  CONSTRAINT `pedidos_clientes_fk` FOREIGN KEY (`nro_tel`) REFERENCES `clientes` (`nro_tel`) ON UPDATE CASCADE,
  CONSTRAINT `pedidos_encargados_fk` FOREIGN KEY (`cuil_encargado`) REFERENCES `empleados` (`cuil`) ON UPDATE CASCADE,
  CONSTRAINT `pedidos_mozorep_fk` FOREIGN KEY (`cuil`) REFERENCES `empleados` (`cuil`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `detalle_pedido` table : 
#

DROP TABLE IF EXISTS `detalle_pedido`;

CREATE TABLE `detalle_pedido` (
  `fecha_pedido` date NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `cantidad_detalle` int(11) NOT NULL,
  `observacion_detalle` varchar(50) default NULL,
  `estado_detalle` varchar(20) NOT NULL,
  `hora_pedido` time NOT NULL,
  `hora_preparacion` time default NULL,
  `hora_entrega` time default NULL,
  PRIMARY KEY  (`fecha_pedido`,`id_pedido`,`id_item`),
  KEY `detalle_pedido_fk` (`id_item`),
  CONSTRAINT `detalle_pedido_fk` FOREIGN KEY (`id_item`) REFERENCES `productos` (`id_item`) ON UPDATE CASCADE,
  CONSTRAINT `detalle_pedido_pedidos_fk` FOREIGN KEY (`fecha_pedido`, `id_pedido`) REFERENCES `pedidos` (`fecha_pedido`, `id_pedido`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


#
# Data for the `clientes` table  (LIMIT 0,500)
#

INSERT INTO `clientes` (`nro_tel`, `apeynom`, `mes_nac`, `dia_nac`, `password_web`, `direccion`) VALUES 
  ('4552007 ','Marya Saloméa Sktodowska Boguska',11,7,'radioactividad','Pellegrini 7214'),
  ('4652311','Helen Keller',6,27,NULL,'San Martín 6107'),
  ('4874962','Edmund Hillary',7,20,'Everest','Pasaje de los patos 652'),
  ('4885264','Tenzing Norgay',5,9,'Chomolungma','Uriburu 5284'),
  ('4956321','Mohandas Karamchand \"Mahatma\" Gandhi',10,2,NULL,'Buenos Aires 239 4º C');

COMMIT;

#
# Data for the `productos` table  (LIMIT 0,500)
#

INSERT INTO `productos` (`id_item`, `descripcion`, `tiempo_preparacion`) VALUES 
  (1,'Fanta',NULL),
  (2,'Pepsi',NULL),
  (3,'Cerveza',NULL),
  (4,'Tarta de Carne',15),
  (5,'Panecillos de Carne',25),
  (6,'Pizza',20),
  (7,'Carlitos',12),
  (8,'Ñoquis',20);

COMMIT;

#
# Data for the `pedidos` table  (LIMIT 0,500)
#

INSERT INTO `pedidos` (`fecha_pedido`, `id_pedido`, `estado_pedido`, `nro_factura`, `nro_mesa`, `cuil`, `nro_tel`, `cuil_encargado`) VALUES 
  ('2007-07-05',1,'cerrado',1,NULL,'20-23574452-9','4552007 ','20-21569874-5'),
  ('2007-07-05',2,'cerrado',2,NULL,'20-23574452-9','4956321','20-21569874-5'),
  ('2007-07-05',3,'cerrado',3,2,'20-30584632-5',NULL,'20-21569874-5'),
  ('2007-07-05',4,'cerrado',4,5,'20-31254671-4',NULL,'20-21569874-5'),
  ('2007-07-06',1,'cerrado',6,NULL,'20-24652369-8','4874962','20-21569874-5'),
  ('2007-07-06',2,'cerrado',7,NULL,'20-24652369-8','4652311','20-21569874-5'),
  ('2007-07-06',3,'vigente',8,NULL,'20-23574452-9','4885264','20-21569874-5'),
  ('2007-07-06',4,'vigente',9,NULL,'20-24652369-8','4652311','20-21569874-5'),
  ('2007-07-06',5,'vigente',11,3,'20-30584632-5',NULL,'20-21569874-5');

COMMIT;

#
# Data for the `detalle_pedido` table  (LIMIT 0,500)
#

INSERT INTO `detalle_pedido` (`fecha_pedido`, `id_pedido`, `id_item`, `cantidad_detalle`, `observacion_detalle`, `estado_detalle`, `hora_pedido`, `hora_preparacion`, `hora_entrega`) VALUES 
  ('2007-07-05',1,3,2,NULL,'entregado','19:41:06','19:41:06','20:30:11'),
  ('2007-07-05',1,6,3,NULL,'entregado','19:41:06','19:53:06','20:30:11'),
  ('2007-07-05',2,1,3,NULL,'entregado','19:41:06','19:41:06','20:30:11'),
  ('2007-07-05',2,4,2,NULL,'entregado','19:41:06','19:50:06','20:30:11'),
  ('2007-07-05',3,1,1,NULL,'entregado','19:41:06','19:41:06','20:30:11'),
  ('2007-07-05',3,4,1,NULL,'entregado','19:41:06','19:50:06','20:30:11'),
  ('2007-07-05',4,3,3,NULL,'entregado','19:41:06','19:41:06','20:30:11'),
  ('2007-07-05',4,6,1,NULL,'entregado','19:41:06','19:50:06','20:30:11'),
  ('2007-07-05',4,7,2,NULL,'entregado','19:41:06','19:48:26','20:30:11'),
  ('2007-07-06',1,3,4,NULL,'entregado','19:41:06','19:41:06','20:30:11'),
  ('2007-07-06',1,4,2,NULL,'entregado','19:41:06','19:48:26','20:30:11'),
  ('2007-07-06',1,8,3,NULL,'entregado','19:41:06','19:53:06','20:30:11'),
  ('2007-07-06',2,6,1,NULL,'entregado','19:41:06','19:53:06','20:30:11'),
  ('2007-07-06',2,7,2,NULL,'entregado','19:41:06','19:56:06','20:30:11'),
  ('2007-07-06',3,2,10,NULL,'listo','19:41:06','19:41:06','20:30:11'),
  ('2007-07-06',3,4,5,NULL,'listo','19:41:06','19:50:06','20:30:11'),
  ('2007-07-06',3,8,3,NULL,'listo','19:41:06','19:53:06','20:30:11'),
  ('2007-07-06',4,6,1,NULL,'solicitado','19:41:06','19:53:06','20:30:11'),
  ('2007-07-06',4,8,2,NULL,'solicitado','19:41:06','19:53:06','20:30:11'),
  ('2007-07-06',5,2,2,NULL,'listo','19:41:06','19:41:06','20:30:11'),
  ('2007-07-06',5,4,3,NULL,'listo','19:41:06','19:50:06','20:30:11');

COMMIT;
