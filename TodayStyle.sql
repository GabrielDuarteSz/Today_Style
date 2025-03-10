-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-03-2025 a las 00:59:06
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
-- Base de datos: `todaystyle`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_compras`
--

CREATE TABLE `carrito_compras` (
  `idCarrito` int(11) NOT NULL,
  `cantidadProducto` int(11) NOT NULL,
  `detalleCompra` varchar(100) NOT NULL,
  `valorCompra` varchar(100) NOT NULL,
  `fechaCompra` datetime NOT NULL,
  `precioVenta` varchar(45) NOT NULL,
  `estadoCompra` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `Talla` varchar(10) NOT NULL,
  `Color` varchar(60) NOT NULL,
  `tipoPrenda` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_usuario`
--

CREATE TABLE `historial_usuario` (
  `idHistorial` int(11) NOT NULL,
  `fechaCompra` datetime NOT NULL,
  `totalCompra` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` int(11) NOT NULL,
  `fechaInventario` datetime NOT NULL,
  `cantidadProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idPagos` int(11) NOT NULL,
  `metodoPago` varchar(45) NOT NULL,
  `fechaPago` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `estadoPedido` varchar(45) NOT NULL,
  `logisticaPedido` varchar(45) NOT NULL,
  `Factura` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idCarrito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(45) NOT NULL,
  `precioProducto` varchar(45) NOT NULL,
  `descripciónProducto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombreProducto`, `precioProducto`, `descripciónProducto`) VALUES
(2001, 'Chaqueta Casual Negra', '120000', 'Chaqueta ligera, ideal para días frescos'),
(2002, 'Jean Dama Azul Claro', '60000', 'Jean ajustado de corte alto para dama'),
(2003, 'Gorra Deportiva Roja', '35000', 'Gorra cómoda y ajustable para actividades'),
(2004, 'Jean Caballero Slim Fit', '65000', 'Jean moderno de corte slim fit para hombre'),
(2005, 'Chaqueta Formal Gris', '130000', 'Chaqueta elegante para ocasiones formales'),
(2006, 'Jean Dama Negro', '65000', 'Jean elástico y cómodo para dama'),
(2007, 'Gorra Negra Clásica', '35000', 'Gorra de diseño sencillo y clásico'),
(2008, 'Jean Caballero Roto', '55000', 'Jean moderno con diseño de desgaste'),
(2009, 'Chaqueta Impermeable Azul', '150000', 'Chaqueta resistente al agua para exteriores'),
(2010, 'Jean Dama Blanco', '65000', 'Jean elegante de corte recto para dama'),
(2011, 'Gorra Gris Estampada', '40000', 'Gorra casual con estampado único'),
(2012, 'Chaqueta Deportiva Roja', '120000', 'Chaqueta ideal para deportes y actividades'),
(2013, 'Jean Caballero Cargo', '65000', 'Jean con bolsillos adicionales, estilo cargo'),
(2014, 'Gorra Verde Militar', '40000', 'Gorra ajustable con diseño militar'),
(2015, 'Jean Dama Rasgado', '60000', 'Jean de moda con diseño rasgado'),
(2016, 'Chaqueta Puffer Negra', '145000', 'Chaqueta acolchada para climas fríos'),
(2017, 'Gorra Azul Básica', '30000', 'Gorra básica de color sólido'),
(2018, 'Jean Caballero Clásico', '60000', 'Jean de estilo clásico y cómodo para hombre'),
(2019, 'Chaqueta Verde Oliva', '155000', 'Chaqueta resistente con diseño militar'),
(2020, 'Jean Dama Estilo Vintage', '60000', 'Jean de diseño retro para dama'),
(2021, 'Gorra Blanca Minimalista', '35000', 'Gorra blanca con diseño sencillo'),
(2022, 'Chaqueta de Cuero Negra', '150000', 'Chaqueta de cuero auténtico y elegante'),
(2023, 'Jean Caballero Negro', '60000', 'Jean moderno y versátil para hombre'),
(2024, 'Gorra Bordada Negra', '45000', 'Gorra premium con diseño bordado'),
(2025, 'Chaqueta Casual Marrón', '120000', 'Chaqueta de uso diario con diseño moderno'),
(2026, 'Jean Dama Azul Oscuro', '60000', 'Jean cómodo de tonalidad oscura'),
(2027, 'Gorra Roja Básica', '30000', 'Gorra sencilla y liviana de color rojo'),
(2028, 'Jean Caballero Vintage', '60000', 'Jean retro con gran estilo para caballeros'),
(2029, 'Chaqueta Larga Gris', '140000', 'Chaqueta de diseño largo y moderno'),
(2030, 'Jean Dama Boyfriend Fit', '60000', 'Jean amplio de estilo relajado'),
(2031, 'Gorra Negra Deportiva', '35000', 'Gorra ideal para uso deportivo'),
(2032, 'Chaqueta Denim Azul', '120000', 'Chaqueta de mezclilla clásica y versátil'),
(2033, 'Jean Caballero Recto', '60000', 'Jean clásico de corte recto para hombre'),
(2034, 'Gorra Estampado Urbano', '40000', 'Gorra moderna con diseño gráfico urbano'),
(2035, 'Jean Dama Lavado Claro', '60000', 'Jean de diseño moderno y fresco para dama'),
(2036, 'Chaqueta Polar Gris', '150000', 'Chaqueta abrigada para climas fríos'),
(2037, 'Gorra Beige Casual', '40000', 'Gorra cómoda de estilo casual'),
(2038, 'Jean Caballero Strech', '60000', 'Jean con tejido elástico para mayor confort'),
(2039, 'Chaqueta Negra Minimal', '120000', 'Chaqueta de diseño minimalista y elegante'),
(2040, 'Jean Dama Flare', '60000', 'Jean acampanado para un estilo retro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reseña`
--

CREATE TABLE `reseña` (
  `idReseña` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `comentario` varchar(250) NOT NULL,
  `fechaReseña` datetime NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `reseña`
--

INSERT INTO `reseña` (`idReseña`, `calificacion`, `comentario`, `fechaReseña`, `idUsuario`, `idProducto`) VALUES
(41, 5, 'Producto excelente, muy útil', '2025-03-09 08:30:00', 10005, 2001),
(42, 4, 'Buena calidad, entregado a tiempo', '2025-03-09 10:00:00', 10006, 2002),
(43, 3, 'Producto promedio, esperaba más', '2025-03-08 22:20:00', 10007, 2003),
(44, 2, 'Llegó dañado, mala experiencia', '2025-03-09 14:10:00', 10008, 2004),
(45, 4, 'Buen precio y calidad aceptable', '2025-03-08 20:50:00', 10009, 2005),
(46, 5, 'Muy recomendable, excelente compra', '2025-03-09 09:45:00', 10010, 2006),
(47, 1, 'Producto de muy baja calidad', '2025-03-09 08:15:00', 10011, 2007),
(48, 4, 'Producto llegó rápido y funciona', '2025-03-08 23:15:00', 10012, 2008),
(49, 3, 'Es aceptable pero hay mejores', '2025-03-09 11:25:00', 10013, 2009),
(50, 5, 'Cumple su propósito perfectamente', '2025-03-09 15:10:00', 10014, 2010),
(51, 2, 'Recibí otro producto distinto', '2025-03-08 18:55:00', 10015, 2011),
(52, 4, 'Muy funcional, buen servicio', '2025-03-09 12:45:00', 10016, 2012),
(53, 1, 'Horrible calidad, no volvería a comprar', '2025-03-09 09:05:00', 10017, 2013),
(54, 3, 'Producto básico, buena relación costo-beneficio', '2025-03-09 13:35:00', 10018, 2014),
(55, 5, 'Totalmente satisfecho con el producto', '2025-03-09 07:40:00', 10019, 2015),
(56, 2, 'Muy costoso para la calidad ofrecida', '2025-03-08 19:45:00', 10020, 2016),
(57, 4, 'Lo compré como regalo, gustó mucho', '2025-03-09 14:00:00', 10021, 2017),
(58, 5, 'Excelente desde la compra hasta la entrega', '2025-03-09 08:50:00', 10022, 2018),
(59, 3, 'Cumple pero no destaca', '2025-03-09 12:15:00', 10023, 2019),
(60, 1, 'No llegó el producto', '2025-03-08 22:05:00', 10024, 2020),
(61, 5, 'Justo lo que buscaba, perfecto', '2025-03-09 10:50:00', 10025, 2021),
(62, 4, 'Buen producto, entrega rápida', '2025-03-09 09:20:00', 10026, 2022),
(63, 2, 'Calidad inferior a lo esperado', '2025-03-09 14:40:00', 10027, 2023),
(64, 1, 'Producto defectuoso', '2025-03-08 19:25:00', 10028, 2024),
(65, 3, 'Calidad aceptable para su precio', '2025-03-09 11:55:00', 10029, 2025),
(66, 5, 'Muy satisfecho con la compra', '2025-03-09 15:30:00', 10030, 2026),
(67, 4, 'Útil, lo recomiendo', '2025-03-09 08:45:00', 10031, 2027),
(68, 2, 'Demasiado caro para lo ofrecido', '2025-03-08 21:15:00', 10032, 2028),
(69, 5, 'Perfecto, excelente servicio', '2025-03-09 10:30:00', 10033, 2029),
(70, 1, 'Muy mala calidad', '2025-03-09 14:50:00', 10034, 2030),
(71, 4, 'Relación calidad-precio adecuada', '2025-03-09 12:00:00', 10035, 2031),
(72, 3, 'Producto regular, sin sorpresas', '2025-03-08 22:50:00', 10036, 2032),
(73, 5, 'Todo excelente, volveré a comprarlo', '2025-03-09 09:55:00', 10037, 2033),
(74, 2, 'Llegó con retraso', '2025-03-09 07:30:00', 10038, 2034),
(75, 5, 'Maravilloso, supera expectativas', '2025-03-09 13:50:00', 10039, 2035),
(76, 4, 'Muy satisfecho con el producto', '2025-03-09 11:40:00', 10040, 2036),
(77, 3, 'Correcto, nada fuera de lo común', '2025-03-08 23:35:00', 10041, 2037),
(78, 1, 'Muy malo, no lo recomiendo', '2025-03-09 08:10:00', 10042, 2038),
(79, 4, 'Lo recomiendo, muy práctico', '2025-03-08 21:40:00', 10043, 2039),
(80, 5, 'Excelente, lo volvería a comprar', '2025-03-09 12:25:00', 10044, 2040);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombresUsuario` varchar(80) NOT NULL,
  `apellidosUsuario` varchar(80) NOT NULL,
  `correoUsuario` varchar(100) NOT NULL,
  `telefonoUsuario` varchar(15) NOT NULL,
  `direcciónUsuario` varchar(80) NOT NULL,
  `passwordUsuario` varchar(200) NOT NULL,
  `rolUsuario` varchar(45) NOT NULL,
  `loginUsuario` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombresUsuario`, `apellidosUsuario`, `correoUsuario`, `telefonoUsuario`, `direcciónUsuario`, `passwordUsuario`, `rolUsuario`, `loginUsuario`) VALUES
(10000, 'Cristian Andres', 'Alarcon Sogamoso', 'cristian_aalarcon@soy.sena.edu.co', '3102782961', 'Calle 51 # 12 - 49', 'PruebadeCarga2025', 'Administrador', '2025-03-05 22:39:12'),
(10001, 'Sergio Stiven', 'Barrera', 'sergio_sbarrera@soy.sena.edu.co', '3132770815', 'Calle 51 # 12 - 49', 'PruebadeCarga2025', 'Administrador', '2025-03-05 22:47:08'),
(10002, 'Carlos Daniel', 'Martinez', 'cdmartinez5608@soy.sena.edu.co', '3107223298', 'Calle 51 # 12 - 49', 'pruebadeCarga2025', 'Administrador', '2025-03-08 10:04:08'),
(10004, 'Gabriel Esteban', 'Duarte', 'gabriel_eduarte@soy.sena.edu.co', '3013157014', 'Calle 51 # 12 - 49 ', 'PruebadeCarga2025', 'Administrador', '2025-03-08 10:50:10'),
(10005, 'Carlos ', 'Castillo', 'carlos_dcastillo@soy.sena.edu.co', '3112016065', 'Calle 51 # 12 - 49', 'pruebadeCarga2024', 'Administrador', '2025-03-08 10:52:10'),
(10006, 'Juan', 'Pérez', 'juan.perez@email.com', '3001234567', 'Calle 1 #12-34, Bogotá', 'Jperez@2025', 'Usuario', '2025-03-09 14:20:30'),
(10007, 'María', 'López', 'maria.lopez@email.com', '3019876543', 'Carrera 7 #45-67, Medellín', 'Mlopez!123', 'Usuario', '2025-03-09 14:20:30'),
(10008, 'Carlos', 'García', 'carlos.garcia@email.com', '3021112233', 'Avenida 3 #34-56, Cali', 'Carl123$', 'Usuario', '2025-03-09 14:20:30'),
(10009, 'Ana', 'González', 'ana.gonzalez@email.com', '3032223344', 'Calle 9 #76-89, Barranquilla', 'Anagon@45', 'Usuario', '2025-03-09 14:20:30'),
(10010, 'Luis', 'Martínez', 'luis.martinez@email.com', '3043334455', 'Carrera 5 #23-45, Bogotá', 'Martinez#76', 'Usuario', '2025-03-09 14:20:30'),
(10011, 'Laura', 'Ramírez', 'laura.ramirez@email.com', '3054445566', 'Avenida 8 #12-34, Cali', 'LaurR**98', 'Usuario', '2025-03-09 14:20:30'),
(10012, 'Andrés', 'Rodríguez', 'andres.rodriguez@email.com', '3065556677', 'Calle 10 #89-90, Medellín', 'Andre$$21', 'Usuario', '2025-03-09 14:20:30'),
(10013, 'Paula', 'Torres', 'paula.torres@email.com', '3076667788', 'Carrera 4 #56-78, Bogotá', 'PTorres#1', 'Usuario', '2025-03-09 14:20:30'),
(10014, 'Sebastián', 'Morales', 'sebastian.morales@email.com', '3087778899', 'Calle 12 #34-45, Cali', 'SebM&90', 'Usuario', '2025-03-09 14:20:30'),
(10015, 'Camila', 'Ortiz', 'camila.ortiz@email.com', '3098889900', 'Carrera 9 #67-78, Barranquilla', 'Camila!Ort', 'Usuario', '2025-03-09 14:20:30'),
(10016, 'Ricardo', 'Díaz', 'ricardo.diaz@email.com', '3109990011', 'Calle 7 #12-23, Bogotá', 'RD!1234', 'Usuario', '2025-03-09 14:20:30'),
(10017, 'Alejandra', 'Suárez', 'alejandra.suarez@email.com', '3111111222', 'Avenida 6 #56-78, Medellín', 'Alej&98', 'Usuario', '2025-03-09 14:20:30'),
(10018, 'Nicolás', 'Herrera', 'nicolas.herrera@email.com', '3122222333', 'Calle 15 #34-67, Cali', 'NicHerr!!', 'Usuario', '2025-03-09 14:20:30'),
(10019, 'Sara', 'Mendoza', 'sara.mendoza@email.com', '3133333444', 'Carrera 11 #78-90, Bogotá', 'SarMez%1', 'Usuario', '2025-03-09 14:20:30'),
(10020, 'Diego', 'Castro', 'diego.castro@email.com', '3144444555', 'Calle 8 #23-56, Medellín', 'DieCa$21', 'Usuario', '2025-03-09 14:20:30'),
(10021, 'Valeria', 'Vega', 'valeria.vega@email.com', '3155555666', 'Avenida 10 #12-34, Barranquilla', 'ValVeg!43', 'Usuario', '2025-03-09 14:20:30'),
(10022, 'Felipe', 'Rojas', 'felipe.rojas@email.com', '3166666777', 'Carrera 12 #45-78, Cali', 'FelRoj!!2', 'Usuario', '2025-03-09 14:20:30'),
(10023, 'Daniela', 'Cárdenas', 'daniela.cardenas@email.com', '3177777888', 'Calle 20 #34-67, Bogotá', 'DanCard#5', 'Usuario', '2025-03-09 14:20:30'),
(10024, 'Santiago', 'Vargas', 'santiago.vargas@email.com', '3188888999', 'Avenida 15 #78-90, Medellín', 'Santi!!2025', 'Usuario', '2025-03-09 14:20:30'),
(10025, 'Sofía', 'Lara', 'sofia.lara@email.com', '3199999000', 'Carrera 14 #12-34, Barranquilla', 'SofLar@1', 'Usuario', '2025-03-09 14:20:30'),
(10026, 'Andrea', 'Gómez', 'andrea.gomez@email.com', '3009876543', 'Calle 22 #34-78, Bogotá', 'Andrea@123', 'Usuario', '2025-03-09 08:15:00'),
(10027, 'Martín', 'Ruiz', 'martin.ruiz@email.com', '3014567890', 'Carrera 12 #45-23, Medellín', 'RuizMart%98', 'Usuario', '2025-03-09 10:10:00'),
(10028, 'Catalina', 'Prieto', 'catalina.prieto@email.com', '3023335566', 'Avenida 15 #78-45, Cali', 'PrietoCat@456', 'Usuario', '2025-03-08 23:50:00'),
(10029, 'Julián', 'Pardo', 'julian.pardo@email.com', '3031112233', 'Calle 9 #34-67, Barranquilla', 'Julian123%', 'Usuario', '2025-03-09 07:40:00'),
(10030, 'Mariana', 'León', 'mariana.leon@email.com', '3042223344', 'Carrera 8 #12-34, Bogotá', 'MariL**56', 'Usuario', '2025-03-08 19:30:00'),
(10031, 'Tomás', 'Álvarez', 'tomas.alvarez@email.com', '3058889900', 'Avenida 23 #56-78, Cali', 'Tom$Alv12', 'Usuario', '2025-03-09 14:20:00'),
(10032, 'Isabel', 'Rincón', 'isabel.rincon@email.com', '3069990011', 'Calle 5 #78-90, Medellín', 'IsaRincon#90', 'Usuario', '2025-03-09 13:05:00'),
(10033, 'Miguel', 'Castaño', 'miguel.castano@email.com', '3071234567', 'Carrera 4 #23-56, Barranquilla', 'Miguel!Ct24', 'Usuario', '2025-03-09 09:30:00'),
(10034, 'Sofía', 'Gutiérrez', 'sofia.gutierrez@email.com', '3089876543', 'Calle 11 #45-78, Bogotá', 'SofGut!44', 'Usuario', '2025-03-09 12:50:00'),
(10035, 'Emiliano', 'Salazar', 'emiliano.salazar@email.com', '3094445566', 'Avenida 3 #34-23, Cali', 'EmiSal@65', 'Usuario', '2025-03-08 20:25:00'),
(10036, 'Valentina', 'Montoya', 'valentina.montoya@email.com', '3105556677', 'Carrera 6 #45-78, Medellín', 'ValeMont%11', 'Usuario', '2025-03-09 08:00:00'),
(10037, 'Pablo', 'Niño', 'pablo.nino@email.com', '3116667788', 'Calle 14 #23-45, Barranquilla', 'Pablo456!', 'Usuario', '2025-03-08 21:45:00'),
(10038, 'Natalia', 'Castillo', 'natalia.castillo@email.com', '3127778899', 'Avenida 8 #78-56, Bogotá', 'NatCast@21', 'Usuario', '2025-03-09 11:25:00'),
(10039, 'Diego', 'Mejía', 'diego.mejia@email.com', '3138889900', 'Calle 16 #45-12, Cali', 'Diego12**78', 'Usuario', '2025-03-09 14:10:00'),
(10040, 'Alejandra', 'Peña', 'alejandra.pena@email.com', '3149990011', 'Carrera 5 #34-78, Medellín', 'AlePe%34', 'Usuario', '2025-03-09 07:55:00'),
(10041, 'Santiago', 'Duque', 'santiago.duque@email.com', '3151234567', 'Calle 18 #67-45, Bogotá', 'Santi123@', 'Usuario', '2025-03-09 13:15:00'),
(10042, 'Gabriela', 'Molina', 'gabriela.molina@email.com', '3169876543', 'Avenida 4 #78-56, Barranquilla', 'GabiMol#87', 'Usuario', '2025-03-09 10:50:00'),
(10043, 'Matías', 'Vargas', 'matias.vargas@email.com', '3172223344', 'Carrera 14 #23-45, Cali', 'MatiVar%21', 'Usuario', '2025-03-08 22:35:00'),
(10044, 'Samantha', 'Cabrera', 'samantha.cabrera@email.com', '3183334455', 'Calle 20 #34-56, Medellín', 'SamCab&43', 'Usuario', '2025-03-09 09:20:00'),
(10045, 'Nicolás', 'Correa', 'nicolas.correa@email.com', '3194445566', 'Avenida 9 #45-78, Bogotá', 'NicoCorr@56', 'Usuario', '2025-03-09 12:35:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD PRIMARY KEY (`idCarrito`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `historial_usuario`
--
ALTER TABLE `historial_usuario`
  ADD PRIMARY KEY (`idHistorial`),
  ADD KEY `fk_idUsuario_Historial` (`idUsuario`),
  ADD KEY `fk_idPedido_Historial` (`idPedido`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPagos`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `fk_idUsuario` (`idUsuario`),
  ADD KEY `fk_idCarrito` (`idCarrito`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `reseña`
--
ALTER TABLE `reseña`
  ADD PRIMARY KEY (`idReseña`),
  ADD KEY `fk_idUsuario_Reseña` (`idUsuario`),
  ADD KEY `fk_idProducto_Reseña` (`idProducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `historial_usuario`
--
ALTER TABLE `historial_usuario`
  MODIFY `idHistorial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reseña`
--
ALTER TABLE `reseña`
  MODIFY `idReseña` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10066;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD CONSTRAINT `idUsuario` FOREIGN KEY (`idCarrito`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `historial_usuario`
--
ALTER TABLE `historial_usuario`
  ADD CONSTRAINT `fk_idPedido_Historial` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_idUsuario_Historial` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `idProducto` FOREIGN KEY (`idInventario`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `idPedido` FOREIGN KEY (`idPagos`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_idCarrito` FOREIGN KEY (`idCarrito`) REFERENCES `carrito_compras` (`idCarrito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reseña`
--
ALTER TABLE `reseña`
  ADD CONSTRAINT `fk_idProducto_Reseña` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_idUsuario_Reseña` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
