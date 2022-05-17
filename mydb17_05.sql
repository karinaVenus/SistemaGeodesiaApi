-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-05-2022 a las 07:55:22
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accion`
--

CREATE TABLE `accion` (
  `cod_accion` int(11) NOT NULL,
  `cod_opcion` int(11) NOT NULL,
  `nom_accion` varchar(45) DEFAULT NULL,
  `condicion_accion` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `cod_almacen` int(11) NOT NULL,
  `des_almacen` varchar(45) DEFAULT NULL,
  `cod_estado_almacen` int(11) DEFAULT NULL,
  `ubic_almacen` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`cod_almacen`, `des_almacen`, `cod_estado_almacen`, `ubic_almacen`) VALUES
(1, 'Almacen Central-Lima', 1, 'Lima'),
(2, 'Almacen Puno', 1, 'Puno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `cod_art` varchar(12) NOT NULL,
  `des_art` varchar(50) DEFAULT NULL,
  `cod_cat` int(11) DEFAULT NULL,
  `cod_pres` int(11) DEFAULT NULL,
  `cod_unid_med` int(11) DEFAULT NULL,
  `stock_art` int(11) DEFAULT 0,
  `imagen_art` varchar(200) DEFAULT NULL,
  `cod_estado_art` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`cod_art`, `des_art`, `cod_cat`, `cod_pres`, `cod_unid_med`, `stock_art`, `imagen_art`, `cod_estado_art`) VALUES
('ART01', 'cinta de tela', 2, 1, 1, 0, 'img.jpg', 1),
('ART02', 'cinta metrica', 2, 1, 1, 0, 'img1.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `cod_cat` int(11) NOT NULL,
  `des_cat` varchar(45) DEFAULT NULL,
  `estado_cat` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`cod_cat`, `des_cat`, `estado_cat`) VALUES
(1, 'cartulinas', 'Activo'),
(2, 'cintas de medir', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `cod_dpt` int(11) NOT NULL,
  `des_dpt` varchar(15) DEFAULT NULL,
  `cod_postal` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`cod_dpt`, `des_dpt`, `cod_postal`) VALUES
(1, 'Amazonas', '01'),
(2, 'Ancash', '02'),
(3, 'Apurimac', '03'),
(4, 'Arequipa', '04'),
(5, 'Ayacucho', '05'),
(6, 'Cajamarca', '06'),
(7, 'Cusco', '08'),
(8, 'Huancavelica', '09'),
(9, 'Huanuco', '10'),
(10, 'Ica', '11'),
(11, 'Junin', '12'),
(12, 'La Libertad', '13'),
(13, 'Lambayeque', '14'),
(14, 'Lima', '15'),
(15, 'Loreto', '16'),
(16, 'Madre de Dios', '17'),
(17, 'Moquegua', '18'),
(18, 'Pasco', '19'),
(19, 'Piura', '20'),
(20, 'Puno', '21'),
(21, 'San Martin', '22'),
(22, 'Tacna', '23'),
(23, 'Tumbes', '24'),
(24, 'Ucayali', '25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `cod_dist` int(11) NOT NULL,
  `des_distrito` varchar(35) DEFAULT NULL,
  `cod_postal` varchar(5) DEFAULT NULL,
  `cod_provi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`cod_dist`, `des_distrito`, `cod_postal`, `cod_provi`) VALUES
(1, 'Ancon', '02', 9),
(2, 'Ate', '03', 9),
(3, 'Barranco', '04', 9),
(4, 'Breña', '05', 9),
(5, 'Carabayllo', '06', 9),
(6, 'Cercado de Lima', '01', 9),
(7, 'Chaclacayo', '07', 9),
(8, 'Chorrillos', '08', 9),
(9, 'Cieneguilla', '09', 9),
(10, 'Comas', '10', 9),
(11, 'El Agustino', '11', 9),
(12, 'Independencia', '12', 9),
(13, 'Jesus Maria', '13', 9),
(14, 'La Molina', '14', 9),
(15, 'La Victoria', '15', 9),
(16, 'Lince', '16', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `cod_emp` int(11) NOT NULL,
  `logo` varchar(300) DEFAULT NULL,
  `estado_emp` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_almacen`
--

CREATE TABLE `estado_almacen` (
  `cod_estado_almacen` int(11) NOT NULL,
  `des_estado_almacen` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado_almacen`
--

INSERT INTO `estado_almacen` (`cod_estado_almacen`, `des_estado_almacen`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_articulo`
--

CREATE TABLE `estado_articulo` (
  `cod_estado_art` int(11) NOT NULL,
  `des_estado_art` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado_articulo`
--

INSERT INTO `estado_articulo` (`cod_estado_art`, `des_estado_art`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_inventario`
--

CREATE TABLE `estado_inventario` (
  `cod_estado_inv` int(11) NOT NULL,
  `des_estado_inv` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado_inventario`
--

INSERT INTO `estado_inventario` (`cod_estado_inv`, `des_estado_inv`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_opcion`
--

CREATE TABLE `estado_opcion` (
  `cod_estado_opcion` int(11) NOT NULL,
  `des_estado_opcion` varchar(45) DEFAULT NULL,
  `condicion_estado_opcion` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_registro`
--

CREATE TABLE `estado_registro` (
  `cod_estado_reg` int(11) NOT NULL,
  `des_estado_reg` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado_registro`
--

INSERT INTO `estado_registro` (`cod_estado_reg`, `des_estado_reg`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_usuario`
--

CREATE TABLE `estado_usuario` (
  `cod_estado_usu` int(11) NOT NULL,
  `des_estado_usu` varchar(10) DEFAULT NULL,
  `condicion_estado_usu` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado_usuario`
--

INSERT INTO `estado_usuario` (`cod_estado_usu`, `des_estado_usu`, `condicion_estado_usu`) VALUES
(1, 'Activo', b'1'),
(2, 'Inactivo', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_cab`
--

CREATE TABLE `inventario_cab` (
  `cod_inv` int(11) NOT NULL,
  `cod_trabajador` int(11) DEFAULT NULL,
  `cod_almacen` int(11) DEFAULT NULL,
  `des_inv` varchar(45) DEFAULT NULL,
  `cod_t_doc` int(11) DEFAULT NULL,
  `fec_inv` datetime DEFAULT NULL,
  `cod_estado_inv` int(11) DEFAULT NULL,
  `tot_inv` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_det`
--

CREATE TABLE `inventario_det` (
  `cod_inv` int(11) NOT NULL,
  `cod_art` varchar(12) NOT NULL,
  `cant_art` int(11) DEFAULT NULL,
  `obs_inv` varchar(350) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion`
--

CREATE TABLE `opcion` (
  `cod_opcion` int(11) NOT NULL,
  `nom_opcion` varchar(45) DEFAULT NULL,
  `url_opcion` varchar(350) DEFAULT NULL,
  `cod_estado_opcion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `cod_persona` int(11) NOT NULL,
  `cod_t_per` int(11) DEFAULT NULL,
  `razon_social` varchar(45) DEFAULT NULL,
  `nom_per` varchar(45) DEFAULT NULL,
  `ape_pat_per` varchar(45) DEFAULT NULL,
  `ape_mat_per` varchar(45) DEFAULT NULL,
  `cod_t_doc` int(11) DEFAULT NULL,
  `nro_doc` varchar(15) DEFAULT NULL,
  `correo_per` varchar(45) DEFAULT NULL,
  `cod_dist` int(11) DEFAULT NULL,
  `dir_per` varchar(450) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`cod_persona`, `cod_t_per`, `razon_social`, `nom_per`, `ape_pat_per`, `ape_mat_per`, `cod_t_doc`, `nro_doc`, `correo_per`, `cod_dist`, `dir_per`) VALUES
(1, 1, '', 'Roberto', 'Gomez', 'Lujan', 1, '12345678', 'Roberto@hotmail.com', 2, 'Jr.Unidos 1241'),
(2, 1, '', 'Rosa', 'Ramirez', 'Paucar', 1, '12345679', 'Rosa@hotmail.com', 3, 'Jr.Izaquirre Mz 3 1241'),
(3, 2, 'Asociacion Vendor', '', '', '', 2, '1012345678', 'vendor@hotmail.com', 6, 'Jr.Palmeras 1241');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `cod_pres` int(11) NOT NULL,
  `des_pres` varchar(45) DEFAULT NULL,
  `estado_pres` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `presentacion`
--

INSERT INTO `presentacion` (`cod_pres`, `des_pres`, `estado_pres`) VALUES
(1, 'Caja', 'Activo'),
(2, 'Bolsa', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `cod_prov` int(11) NOT NULL,
  `estado_prov` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`cod_prov`, `estado_prov`) VALUES
(3, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `cod_provi` int(11) NOT NULL,
  `des_provi` varchar(35) DEFAULT NULL,
  `cod_postal` varchar(5) DEFAULT NULL,
  `cod_dep` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`cod_provi`, `des_provi`, `cod_postal`, `cod_dep`) VALUES
(1, 'Barranca', '02', 14),
(2, 'Cajatambo', '03', 14),
(3, 'Callao', '01', 14),
(4, 'Cañete', '05', 14),
(5, 'Canta', '04', 14),
(6, 'Huaral', '06', 14),
(7, 'Huarochiri', '07', 14),
(8, 'Huaura', '08', 14),
(9, 'Lima', '01', 14),
(10, 'Oyon', '09', 14),
(11, 'Yauyos', '10', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg_ing_cab`
--

CREATE TABLE `reg_ing_cab` (
  `cod_reg_in` int(11) NOT NULL,
  `cod_prov` int(11) DEFAULT NULL,
  `cod_trabajador` int(11) DEFAULT NULL,
  `cod_almacen` int(11) DEFAULT NULL,
  `cod_t_transf` int(11) DEFAULT NULL,
  `cod_t_doc` int(11) DEFAULT NULL,
  `nro_doc` varchar(15) DEFAULT NULL,
  `fec_doc` date DEFAULT NULL,
  `fec_ing` datetime DEFAULT current_timestamp(),
  `cod_estado_reg` int(11) DEFAULT NULL,
  `tot_pagar` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reg_ing_cab`
--

INSERT INTO `reg_ing_cab` (`cod_reg_in`, `cod_prov`, `cod_trabajador`, `cod_almacen`, `cod_t_transf`, `cod_t_doc`, `nro_doc`, `fec_doc`, `fec_ing`, `cod_estado_reg`, `tot_pagar`) VALUES
(14, 3, 2, 1, 2, 1, '3535252556', '2022-10-25', '2022-05-16 01:11:06', 1, '534.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg_ing_det`
--

CREATE TABLE `reg_ing_det` (
  `cod_reg_ing` int(11) NOT NULL,
  `cod_art` varchar(12) NOT NULL,
  `prec_unit` decimal(7,2) DEFAULT NULL,
  `cant_art` int(11) DEFAULT NULL,
  `prec_compr` decimal(7,2) DEFAULT NULL,
  `obs_ing` varchar(350) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reg_ing_det`
--

INSERT INTO `reg_ing_det` (`cod_reg_ing`, `cod_art`, `prec_unit`, `cant_art`, `prec_compr`, `obs_ing`) VALUES
(14, 'ART01', '23.00', 2, '46.00', 'jgjj'),
(14, 'ART02', '244.00', 2, '488.00', 'hgfhf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg_sal_cab`
--

CREATE TABLE `reg_sal_cab` (
  `cod_reg_sal` int(11) NOT NULL,
  `cod_solicitador` int(11) DEFAULT NULL,
  `cod_autorizador` int(11) DEFAULT NULL,
  `cod_almacen` int(11) DEFAULT NULL,
  `cod_t_transf` int(11) DEFAULT NULL,
  `cod_t_doc` int(11) DEFAULT NULL,
  `nro_doc` varchar(15) DEFAULT NULL,
  `fec_doc` datetime DEFAULT NULL,
  `fec_sal` datetime DEFAULT NULL,
  `cod_estado_reg` int(11) DEFAULT NULL,
  `tot_pagar` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg_sal_det`
--

CREATE TABLE `reg_sal_det` (
  `cod_reg_sal` int(11) NOT NULL,
  `cod_art` varchar(12) NOT NULL,
  `cant_art` int(11) DEFAULT NULL,
  `prec_sal` decimal(7,2) DEFAULT NULL,
  `obs_sal` varchar(350) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `cod_rol` int(11) NOT NULL,
  `des_rol` varchar(45) DEFAULT NULL,
  `condicion_rol` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_accion`
--

CREATE TABLE `rol_accion` (
  `cod_rol` int(11) NOT NULL,
  `cod_accion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tdoc_ide`
--

CREATE TABLE `tdoc_ide` (
  `cod_t_doc` int(11) NOT NULL,
  `dest_doc` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tdoc_ide`
--

INSERT INTO `tdoc_ide` (`cod_t_doc`, `dest_doc`) VALUES
(1, 'DNI'),
(2, 'RUC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `cod_telf` int(11) NOT NULL,
  `nro_telf` varchar(11) DEFAULT NULL,
  `cod_persona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_doc_inv`
--

CREATE TABLE `tipo_doc_inv` (
  `cod_t_doc` int(11) NOT NULL,
  `des_t_doc` varchar(45) DEFAULT NULL,
  `estado_t_doc` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_doc_reg`
--

CREATE TABLE `tipo_doc_reg` (
  `cod_t_doc` int(11) NOT NULL,
  `tipo_reg_doc` varchar(10) DEFAULT NULL,
  `des_t_doc` varchar(45) DEFAULT NULL,
  `estado_t_doc` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_doc_reg`
--

INSERT INTO `tipo_doc_reg` (`cod_t_doc`, `tipo_reg_doc`, `des_t_doc`, `estado_t_doc`) VALUES
(1, 'Ingreso', 'Guia de Remisión', 1),
(2, 'Ingreso', 'Cotización', 1),
(3, 'Ingreso', 'Factura', 1),
(4, 'Salida', 'Orden de Requerimiento', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_persona`
--

CREATE TABLE `tipo_persona` (
  `cod_t_per` int(11) NOT NULL,
  `des_t_per` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_persona`
--

INSERT INTO `tipo_persona` (`cod_t_per`, `des_t_per`) VALUES
(1, 'Natural'),
(2, 'Jurídica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_transf`
--

CREATE TABLE `tipo_transf` (
  `cod_t_transf` int(11) NOT NULL,
  `des_transf` varchar(45) DEFAULT NULL,
  `estado_transf` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_transf`
--

INSERT INTO `tipo_transf` (`cod_t_transf`, `des_transf`, `estado_transf`) VALUES
(1, 'Ingreso por donacion', 'Activo'),
(2, 'Ingreso por compra', 'Activo'),
(3, 'Salida por utilidad', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `cod_trabajador` int(11) NOT NULL,
  `estado_trab` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`cod_trabajador`, `estado_trab`) VALUES
(1, b'1'),
(2, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unid_med`
--

CREATE TABLE `unid_med` (
  `cod_unid_med` int(11) NOT NULL,
  `des_unid_med` varchar(45) DEFAULT NULL,
  `prefijo_unid_med` varchar(10) DEFAULT NULL,
  `estado_unid_med` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unid_med`
--

INSERT INTO `unid_med` (`cod_unid_med`, `des_unid_med`, `prefijo_unid_med`, `estado_unid_med`) VALUES
(1, 'unidad', 'und', 'Activo'),
(2, 'Kilogramos', 'kg', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cod_usuario` int(11) NOT NULL,
  `log_usu` varchar(25) DEFAULT NULL,
  `contra_usu` varchar(25) DEFAULT NULL,
  `cod_estado_usu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_opcion`
--

CREATE TABLE `usuario_opcion` (
  `cod_usuario` int(11) NOT NULL,
  `cod_opcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE `usuario_rol` (
  `cod_usuario` int(11) NOT NULL,
  `cod_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accion`
--
ALTER TABLE `accion`
  ADD PRIMARY KEY (`cod_accion`,`cod_opcion`),
  ADD KEY `fk_accion_opcion` (`cod_opcion`);

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`cod_almacen`),
  ADD KEY `fk_alm_estado_idx` (`cod_estado_almacen`);

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`cod_art`),
  ADD KEY `fk_art_pres_idx` (`cod_pres`),
  ADD KEY `fk_art_unid_med_idx` (`cod_unid_med`),
  ADD KEY `fk_art_cat_idx` (`cod_cat`),
  ADD KEY `fk_art_est_idx` (`cod_estado_art`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cod_cat`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`cod_dpt`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`cod_dist`),
  ADD KEY `fk_dist_provi_idx` (`cod_provi`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`cod_emp`);

--
-- Indices de la tabla `estado_almacen`
--
ALTER TABLE `estado_almacen`
  ADD PRIMARY KEY (`cod_estado_almacen`);

--
-- Indices de la tabla `estado_articulo`
--
ALTER TABLE `estado_articulo`
  ADD PRIMARY KEY (`cod_estado_art`);

--
-- Indices de la tabla `estado_inventario`
--
ALTER TABLE `estado_inventario`
  ADD PRIMARY KEY (`cod_estado_inv`);

--
-- Indices de la tabla `estado_opcion`
--
ALTER TABLE `estado_opcion`
  ADD PRIMARY KEY (`cod_estado_opcion`);

--
-- Indices de la tabla `estado_registro`
--
ALTER TABLE `estado_registro`
  ADD PRIMARY KEY (`cod_estado_reg`);

--
-- Indices de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  ADD PRIMARY KEY (`cod_estado_usu`);

--
-- Indices de la tabla `inventario_cab`
--
ALTER TABLE `inventario_cab`
  ADD PRIMARY KEY (`cod_inv`),
  ADD KEY `fk_inv_alm_idx` (`cod_almacen`),
  ADD KEY `fk_inv_trab_idx` (`cod_trabajador`),
  ADD KEY `fk_inv_est_idx` (`cod_estado_inv`),
  ADD KEY `fk_inv_t_doc_idx` (`cod_t_doc`);

--
-- Indices de la tabla `inventario_det`
--
ALTER TABLE `inventario_det`
  ADD PRIMARY KEY (`cod_inv`,`cod_art`),
  ADD KEY `fk_det_art_idx` (`cod_art`);

--
-- Indices de la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD PRIMARY KEY (`cod_opcion`),
  ADD KEY `fk_opcion_estado_idx` (`cod_estado_opcion`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`cod_persona`),
  ADD KEY `fk_per_t_docide_idx` (`cod_t_doc`),
  ADD KEY `fk_per_dist_idx` (`cod_dist`),
  ADD KEY `fk_per_tipo_idx` (`cod_t_per`);

--
-- Indices de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  ADD PRIMARY KEY (`cod_pres`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`cod_prov`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`cod_provi`),
  ADD KEY `fk_provi_dpt_idx` (`cod_dep`);

--
-- Indices de la tabla `reg_ing_cab`
--
ALTER TABLE `reg_ing_cab`
  ADD PRIMARY KEY (`cod_reg_in`),
  ADD KEY `fk_ing_trans_idx` (`cod_t_transf`),
  ADD KEY `fk_ing_alm_idx` (`cod_almacen`),
  ADD KEY `fk_ing_est_idx` (`cod_estado_reg`),
  ADD KEY `fk_ing_prov_idx` (`cod_prov`),
  ADD KEY `fk_ing_trab_idx` (`cod_trabajador`),
  ADD KEY `fk_ing_tdoc_idx` (`cod_t_doc`);

--
-- Indices de la tabla `reg_ing_det`
--
ALTER TABLE `reg_ing_det`
  ADD PRIMARY KEY (`cod_reg_ing`,`cod_art`),
  ADD KEY `fk_ing_det_art_idx` (`cod_art`),
  ADD KEY `fk_ing_det_cab_idx` (`cod_reg_ing`);

--
-- Indices de la tabla `reg_sal_cab`
--
ALTER TABLE `reg_sal_cab`
  ADD PRIMARY KEY (`cod_reg_sal`),
  ADD KEY `fk_sal_transf_idx` (`cod_t_transf`),
  ADD KEY `fk_sal_est_idx` (`cod_estado_reg`),
  ADD KEY `fk_sal_t_doc_idx` (`cod_t_doc`),
  ADD KEY `fk_sal_alm_idx` (`cod_almacen`),
  ADD KEY `fk_sal_trab_soli_idx` (`cod_solicitador`) USING BTREE,
  ADD KEY `fk_sal_trab_auto_idx` (`cod_autorizador`);

--
-- Indices de la tabla `reg_sal_det`
--
ALTER TABLE `reg_sal_det`
  ADD PRIMARY KEY (`cod_reg_sal`,`cod_art`),
  ADD KEY `fk_sal_det_art_idx` (`cod_art`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`cod_rol`);

--
-- Indices de la tabla `rol_accion`
--
ALTER TABLE `rol_accion`
  ADD PRIMARY KEY (`cod_rol`,`cod_accion`),
  ADD KEY `fk__idx` (`cod_rol`),
  ADD KEY `fk_accion_rol_idx` (`cod_accion`);

--
-- Indices de la tabla `tdoc_ide`
--
ALTER TABLE `tdoc_ide`
  ADD PRIMARY KEY (`cod_t_doc`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`cod_telf`),
  ADD KEY `fk_telf_per_idx` (`cod_persona`);

--
-- Indices de la tabla `tipo_doc_inv`
--
ALTER TABLE `tipo_doc_inv`
  ADD PRIMARY KEY (`cod_t_doc`);

--
-- Indices de la tabla `tipo_doc_reg`
--
ALTER TABLE `tipo_doc_reg`
  ADD PRIMARY KEY (`cod_t_doc`);

--
-- Indices de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  ADD PRIMARY KEY (`cod_t_per`);

--
-- Indices de la tabla `tipo_transf`
--
ALTER TABLE `tipo_transf`
  ADD PRIMARY KEY (`cod_t_transf`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`cod_trabajador`);

--
-- Indices de la tabla `unid_med`
--
ALTER TABLE `unid_med`
  ADD PRIMARY KEY (`cod_unid_med`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cod_usuario`),
  ADD KEY `fk_usu_est_idx` (`cod_estado_usu`);

--
-- Indices de la tabla `usuario_opcion`
--
ALTER TABLE `usuario_opcion`
  ADD PRIMARY KEY (`cod_usuario`,`cod_opcion`),
  ADD KEY `fk_opcion_usu_idx` (`cod_opcion`);

--
-- Indices de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD PRIMARY KEY (`cod_usuario`,`cod_rol`),
  ADD KEY `fk_rol_usu_idx` (`cod_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accion`
--
ALTER TABLE `accion`
  MODIFY `cod_accion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `cod_almacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `cod_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `cod_dpt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `cod_dist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `estado_almacen`
--
ALTER TABLE `estado_almacen`
  MODIFY `cod_estado_almacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_articulo`
--
ALTER TABLE `estado_articulo`
  MODIFY `cod_estado_art` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_inventario`
--
ALTER TABLE `estado_inventario`
  MODIFY `cod_estado_inv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_opcion`
--
ALTER TABLE `estado_opcion`
  MODIFY `cod_estado_opcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_registro`
--
ALTER TABLE `estado_registro`
  MODIFY `cod_estado_reg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  MODIFY `cod_estado_usu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inventario_cab`
--
ALTER TABLE `inventario_cab`
  MODIFY `cod_inv` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `opcion`
--
ALTER TABLE `opcion`
  MODIFY `cod_opcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `cod_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  MODIFY `cod_pres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `cod_provi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `reg_ing_cab`
--
ALTER TABLE `reg_ing_cab`
  MODIFY `cod_reg_in` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `reg_sal_cab`
--
ALTER TABLE `reg_sal_cab`
  MODIFY `cod_reg_sal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `cod_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tdoc_ide`
--
ALTER TABLE `tdoc_ide`
  MODIFY `cod_t_doc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `telefono`
--
ALTER TABLE `telefono`
  MODIFY `cod_telf` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_doc_inv`
--
ALTER TABLE `tipo_doc_inv`
  MODIFY `cod_t_doc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_doc_reg`
--
ALTER TABLE `tipo_doc_reg`
  MODIFY `cod_t_doc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  MODIFY `cod_t_per` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_transf`
--
ALTER TABLE `tipo_transf`
  MODIFY `cod_t_transf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `unid_med`
--
ALTER TABLE `unid_med`
  MODIFY `cod_unid_med` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accion`
--
ALTER TABLE `accion`
  ADD CONSTRAINT `fk_accion_opcion` FOREIGN KEY (`cod_opcion`) REFERENCES `opcion` (`cod_opcion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD CONSTRAINT `fk_alm_estado` FOREIGN KEY (`cod_estado_almacen`) REFERENCES `estado_almacen` (`cod_estado_almacen`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_art_cat` FOREIGN KEY (`cod_cat`) REFERENCES `categoria` (`cod_cat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_art_est` FOREIGN KEY (`cod_estado_art`) REFERENCES `estado_articulo` (`cod_estado_art`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_art_pres` FOREIGN KEY (`cod_pres`) REFERENCES `presentacion` (`cod_pres`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_art_unid_med` FOREIGN KEY (`cod_unid_med`) REFERENCES `unid_med` (`cod_unid_med`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD CONSTRAINT `fk_dist_provi` FOREIGN KEY (`cod_provi`) REFERENCES `provincia` (`cod_provi`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_emp_per` FOREIGN KEY (`cod_emp`) REFERENCES `persona` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inventario_cab`
--
ALTER TABLE `inventario_cab`
  ADD CONSTRAINT `fk_inv_alm` FOREIGN KEY (`cod_almacen`) REFERENCES `almacen` (`cod_almacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inv_est` FOREIGN KEY (`cod_estado_inv`) REFERENCES `estado_inventario` (`cod_estado_inv`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inv_t_doc` FOREIGN KEY (`cod_t_doc`) REFERENCES `tipo_doc_inv` (`cod_t_doc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inv_trab` FOREIGN KEY (`cod_trabajador`) REFERENCES `trabajador` (`cod_trabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inventario_det`
--
ALTER TABLE `inventario_det`
  ADD CONSTRAINT `fk_det_art` FOREIGN KEY (`cod_art`) REFERENCES `articulo` (`cod_art`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_det_inv` FOREIGN KEY (`cod_inv`) REFERENCES `inventario_cab` (`cod_inv`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD CONSTRAINT `fk_opcion_estado` FOREIGN KEY (`cod_estado_opcion`) REFERENCES `estado_opcion` (`cod_estado_opcion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_per_dist` FOREIGN KEY (`cod_dist`) REFERENCES `distrito` (`cod_dist`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_per_t_docide` FOREIGN KEY (`cod_t_doc`) REFERENCES `tdoc_ide` (`cod_t_doc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_per_tipo` FOREIGN KEY (`cod_t_per`) REFERENCES `tipo_persona` (`cod_t_per`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_prov_per` FOREIGN KEY (`cod_prov`) REFERENCES `persona` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `fk_provi_dpt` FOREIGN KEY (`cod_dep`) REFERENCES `departamento` (`cod_dpt`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reg_ing_cab`
--
ALTER TABLE `reg_ing_cab`
  ADD CONSTRAINT `fk_ing_alm` FOREIGN KEY (`cod_almacen`) REFERENCES `almacen` (`cod_almacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ing_est` FOREIGN KEY (`cod_estado_reg`) REFERENCES `estado_registro` (`cod_estado_reg`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ing_prov` FOREIGN KEY (`cod_prov`) REFERENCES `proveedor` (`cod_prov`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ing_tdoc` FOREIGN KEY (`cod_t_doc`) REFERENCES `tipo_doc_reg` (`cod_t_doc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ing_trab` FOREIGN KEY (`cod_trabajador`) REFERENCES `trabajador` (`cod_trabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ing_trans` FOREIGN KEY (`cod_t_transf`) REFERENCES `tipo_transf` (`cod_t_transf`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reg_ing_det`
--
ALTER TABLE `reg_ing_det`
  ADD CONSTRAINT `fk_ing_det_art` FOREIGN KEY (`cod_art`) REFERENCES `articulo` (`cod_art`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ing_det_cab` FOREIGN KEY (`cod_reg_ing`) REFERENCES `reg_ing_cab` (`cod_reg_in`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reg_sal_cab`
--
ALTER TABLE `reg_sal_cab`
  ADD CONSTRAINT `fk_sal_alm` FOREIGN KEY (`cod_almacen`) REFERENCES `almacen` (`cod_almacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sal_est` FOREIGN KEY (`cod_estado_reg`) REFERENCES `estado_registro` (`cod_estado_reg`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sal_t_doc` FOREIGN KEY (`cod_t_doc`) REFERENCES `tipo_doc_reg` (`cod_t_doc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sal_trab` FOREIGN KEY (`cod_solicitador`) REFERENCES `trabajador` (`cod_trabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sal_transf` FOREIGN KEY (`cod_t_transf`) REFERENCES `tipo_transf` (`cod_t_transf`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reg_sal_det`
--
ALTER TABLE `reg_sal_det`
  ADD CONSTRAINT `fk_sal_det_art` FOREIGN KEY (`cod_art`) REFERENCES `articulo` (`cod_art`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sal_det_cab` FOREIGN KEY (`cod_reg_sal`) REFERENCES `reg_sal_cab` (`cod_reg_sal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rol_accion`
--
ALTER TABLE `rol_accion`
  ADD CONSTRAINT `fk_accion_rol` FOREIGN KEY (`cod_accion`) REFERENCES `accion` (`cod_accion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rol_accion` FOREIGN KEY (`cod_rol`) REFERENCES `rol` (`cod_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `fk_telf_per` FOREIGN KEY (`cod_persona`) REFERENCES `persona` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD CONSTRAINT `fk_trab_per_` FOREIGN KEY (`cod_trabajador`) REFERENCES `persona` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usu_est` FOREIGN KEY (`cod_estado_usu`) REFERENCES `estado_usuario` (`cod_estado_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usu_trab` FOREIGN KEY (`cod_usuario`) REFERENCES `trabajador` (`cod_trabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_opcion`
--
ALTER TABLE `usuario_opcion`
  ADD CONSTRAINT `fk_opcion_usu` FOREIGN KEY (`cod_opcion`) REFERENCES `opcion` (`cod_opcion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usu_opcion` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `fk_rol_usu` FOREIGN KEY (`cod_rol`) REFERENCES `rol` (`cod_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usu_rol` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
