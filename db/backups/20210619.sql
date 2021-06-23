-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 19-06-2021 a las 10:09:59
-- Versión del servidor: 5.7.33-log
-- Versión de PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `c2210292_pro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_accesory`
--

CREATE TABLE `sg_accesory` (
  `ac_id` int(11) NOT NULL,
  `ac_name` varchar(128) NOT NULL,
  `ac_code` varchar(45) DEFAULT NULL,
  `ac_status` tinyint(4) NOT NULL,
  `ac_created` varchar(64) NOT NULL,
  `ac_modified` varchar(64) NOT NULL,
  `ac_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_admin`
--

CREATE TABLE `sg_admin` (
  `ad_id` int(11) NOT NULL,
  `ad_name` varchar(64) DEFAULT NULL,
  `ad_last` varchar(64) DEFAULT NULL,
  `ad_user` varchar(64) DEFAULT NULL,
  `ad_password` varchar(64) DEFAULT NULL,
  `ad_email` varchar(64) DEFAULT NULL,
  `ad_status` tinyint(11) DEFAULT NULL,
  `ad_ar_id` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sg_admin`
--

INSERT INTO `sg_admin` (`ad_id`, `ad_name`, `ad_last`, `ad_user`, `ad_password`, `ad_email`, `ad_status`, `ad_ar_id`) VALUES
(1, 'Admin', 'General', 'admin', '636600d53f155e6ceb3b9a5f13beaa9e', 'mail@mail.com', 1, 1),
(19, 'Diego', 'Vega', 'diego vega', 'b3b4d2dbedc99fe843fd3dedb02f086f', 'proneumaticosmza@yahoo.com.ar', NULL, 3),
(20, 'Claudia', 'Medrano', 'clau', '61c3374714fa819f82718b0d37baf150', 'proneumaticosmza@yahoo.com.ar', NULL, 2),
(21, 'Carlos', 'Pillado', 'Carlos', '0829424ffa0d3a2547b6c9622c77de03', 'carlospillado@yahoo.com.ar', NULL, 2),
(37, 'Adriana ', 'Medrano', 'Adri', '0829424ffa0d3a2547b6c9622c77de03', 'dramedrano@gmail.com', NULL, 1),
(35, 'SERGIO', 'PILLADO', 'SERGIO PILLADO ', '81dc9bdb52d04dc20036dbd8313ed055', 'proneumaticos@yahoo.com.ar', NULL, 2),
(36, 'MARIO ', 'HERRERA', 'MARIO HERRERA', '5bf8aaef51c6e0d363cbe554acaf3f20', 'proneumaticos@hotmail.com.ar', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_admin_rol`
--

CREATE TABLE `sg_admin_rol` (
  `ar_id` int(11) NOT NULL,
  `ar_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ar_created` varchar(32) NOT NULL,
  `ar_modified` varchar(32) NOT NULL,
  `ar_delete` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sg_admin_rol`
--

INSERT INTO `sg_admin_rol` (`ar_id`, `ar_name`, `ar_created`, `ar_modified`, `ar_delete`) VALUES
(1, 'Super usuario', '1425382642', '1448980020', 0),
(2, 'Administradores', '1425382642', '1448980196', 0),
(3, 'Operadores', '1430210966', '1448980182', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_bbranch`
--

CREATE TABLE `sg_bbranch` (
  `bb_id` int(11) NOT NULL,
  `bb_name` varchar(128) NOT NULL,
  `bb_code` varchar(45) DEFAULT NULL,
  `bb_status` tinyint(4) NOT NULL,
  `bb_created` varchar(64) NOT NULL,
  `bb_modified` varchar(64) NOT NULL,
  `bb_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_bmodel`
--

CREATE TABLE `sg_bmodel` (
  `bm_id` int(11) NOT NULL,
  `bm_name` varchar(128) NOT NULL,
  `bm_size` varchar(32) NOT NULL,
  `bm_status` tinyint(4) NOT NULL,
  `bm_created` varchar(64) NOT NULL,
  `bm_modified` varchar(64) NOT NULL,
  `bm_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_branch`
--

CREATE TABLE `sg_branch` (
  `br_id` int(11) NOT NULL,
  `br_name` varchar(128) NOT NULL,
  `br_status` tinyint(4) NOT NULL,
  `br_created` varchar(64) NOT NULL,
  `br_modified` varchar(64) NOT NULL,
  `br_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_cbranch`
--

CREATE TABLE `sg_cbranch` (
  `cb_id` int(11) NOT NULL,
  `cb_name` varchar(128) NOT NULL,
  `cb_code` varchar(45) DEFAULT NULL,
  `cb_status` tinyint(4) NOT NULL,
  `cb_created` varchar(64) NOT NULL,
  `cb_modified` varchar(64) NOT NULL,
  `cb_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_cmodel`
--

CREATE TABLE `sg_cmodel` (
  `cm_id` int(11) NOT NULL,
  `cm_cb_id` int(11) NOT NULL,
  `cm_name` varchar(128) NOT NULL,
  `cm_size` varchar(32) NOT NULL,
  `cm_status` tinyint(4) NOT NULL,
  `cm_created` varchar(64) NOT NULL,
  `cm_modified` varchar(64) NOT NULL,
  `cm_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_company`
--

CREATE TABLE `sg_company` (
  `co_id` int(11) NOT NULL,
  `co_name` varchar(128) NOT NULL,
  `co_phone` varchar(64) NOT NULL,
  `co_email` varchar(64) NOT NULL,
  `co_user` varchar(64) NOT NULL,
  `co_password` varchar(128) NOT NULL,
  `co_observation` text NOT NULL,
  `co_status` tinyint(4) NOT NULL,
  `co_created` varchar(64) NOT NULL,
  `co_modified` varchar(64) NOT NULL,
  `co_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sg_company`
--

INSERT INTO `sg_company` (`co_id`, `co_name`, `co_phone`, `co_email`, `co_user`, `co_password`, `co_observation`, `co_status`, `co_created`, `co_modified`, `co_deleted`) VALUES
(1, 'SEGUROS RIVADAVIA', '2616099557', 'GNUDO@YAHOO.COM.AR', 'GNUDO', '1135', '', 0, '1622132189', '1622132189', 0),
(2, 'SEGUROS RIVADAVIA', '1160197415', 'CBAMONDIS@YAHOO.COM.AR', 'CBAMONDIS', '1135', '', 0, '1622132253', '1622132253', 0),
(3, 'SEGUROS RIVADAVIA', '2616099557', 'gnudo@yahoo.com.ar', 'gnudo', '1135', '', 0, '1622133176', '1622133176', 0),
(4, 'SEGUROS RIVADAVIA', '1160197415', 'cbamondis@yahoo.com.ar', 'cbamondis', '1135', '', 0, '1622133221', '1622133221', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_customer`
--

CREATE TABLE `sg_customer` (
  `cu_id` int(11) NOT NULL,
  `cu_name` varchar(128) NOT NULL,
  `cu_email` varchar(128) NOT NULL,
  `cu_phone` varchar(64) NOT NULL,
  `cu_document` varchar(64) NOT NULL,
  `cu_status` tinyint(4) NOT NULL,
  `cu_created` varchar(64) NOT NULL,
  `cu_modified` varchar(64) NOT NULL,
  `cu_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_gallery`
--

CREATE TABLE `sg_gallery` (
  `ga_id` int(11) NOT NULL,
  `ga_name` text NOT NULL,
  `ga_type` varchar(64) NOT NULL,
  `ga_created` varchar(64) NOT NULL,
  `ga_modified` varchar(64) NOT NULL,
  `ga_deleted` tinyint(4) NOT NULL,
  `ga_status` tinyint(4) NOT NULL,
  `ga_si_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_model`
--

CREATE TABLE `sg_model` (
  `mo_id` int(11) NOT NULL,
  `mo_br_id` int(11) NOT NULL,
  `mo_name` varchar(128) NOT NULL,
  `mo_status` tinyint(4) NOT NULL,
  `mo_created` varchar(64) NOT NULL,
  `mo_modified` varchar(64) NOT NULL,
  `mo_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_news`
--

CREATE TABLE `sg_news` (
  `ne_id` int(11) NOT NULL,
  `ne_title` varchar(128) NOT NULL,
  `ne_subtitle` varchar(255) NOT NULL,
  `ne_content` text NOT NULL,
  `ne_picture` varchar(64) NOT NULL,
  `ne_status` tinyint(4) NOT NULL,
  `ne_created` varchar(64) NOT NULL,
  `ne_modified` varchar(64) NOT NULL,
  `ne_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_page`
--

CREATE TABLE `sg_page` (
  `pa_id` int(11) NOT NULL,
  `pa_name` varchar(64) NOT NULL,
  `pa_content` text NOT NULL,
  `pa_status` tinyint(4) NOT NULL,
  `pa_created` varchar(64) NOT NULL,
  `pa_modified` varchar(64) NOT NULL,
  `pa_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sg_page`
--

INSERT INTO `sg_page` (`pa_id`, `pa_name`, `pa_content`, `pa_status`, `pa_created`, `pa_modified`, `pa_deleted`) VALUES
(1, 'TÃ©rminos y Condiciones', '<div>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud ex<i>erci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at ver</i>o eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</div><ul><li><span style=\"line-height: 18.5714302062988px;\">Lorem ipsum dolor sit amet</span></li><li><span style=\"line-height: 18.5714302062988px;\"><span style=\"line-height: 18.5714302062988px;\">Lorem ipsum dolor sit amet</span></span></li><li><span style=\"line-height: 18.5714302062988px;\"><span style=\"line-height: 18.5714302062988px;\"><span style=\"line-height: 18.5714302062988px;\">Lorem ipsum dolor sit amet</span></span></span></li><li><span style=\"line-height: 18.5714302062988px;\"><span style=\"line-height: 18.5714302062988px;\"><span style=\"line-height: 18.5714302062988px;\"><span style=\"line-height: 18.5714302062988px;\">Lorem ipsum dolor sit amet</span></span></span></span></li><li><span style=\"line-height: 18.5714302062988px;\"><span style=\"line-height: 18.5714302062988px;\"><span style=\"line-height: 18.5714302062988px;\"><span style=\"line-height: 18.5714302062988px;\"><span style=\"line-height: 18.5714302062988px;\">Lorem ipsum dolor sit amet</span></span></span></span></span></li></ul><div>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</div><div><br></div><div>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; <b>est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et q</b>uinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</div><div></div>', 1, '1443451367', '1443451446', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_provider`
--

CREATE TABLE `sg_provider` (
  `pr_id` int(11) NOT NULL,
  `pr_name` varchar(128) NOT NULL,
  `pr_observation` text NOT NULL,
  `pr_status` tinyint(4) NOT NULL,
  `pr_created` varchar(64) NOT NULL,
  `pr_modified` varchar(64) NOT NULL,
  `pr_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_seller`
--

CREATE TABLE `sg_seller` (
  `se_id` int(11) NOT NULL,
  `se_name` varchar(128) NOT NULL,
  `se_user` varchar(128) NOT NULL,
  `se_pass` varchar(128) NOT NULL,
  `se_email` varchar(128) NOT NULL,
  `se_status` tinyint(4) NOT NULL,
  `se_created` varchar(64) NOT NULL,
  `se_modified` varchar(64) NOT NULL,
  `se_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sg_seller`
--

INSERT INTO `sg_seller` (`se_id`, `se_name`, `se_user`, `se_pass`, `se_email`, `se_status`, `se_created`, `se_modified`, `se_deleted`) VALUES
(14, 'Vendedor 1', 'vendedor1', 'e10adc3949ba59abbe56e057f20f883e', 'mdampuero@gmail.com', 0, '1446002141', '1447771134', 0),
(15, 'Vendedor 2', 'vendedor 2', 'e10adc3949ba59abbe56e057f20f883e', 'mdampuero@gmail.com', 0, '1447771150', '1447771150', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_setting`
--

CREATE TABLE `sg_setting` (
  `se_id` int(11) NOT NULL,
  `se_title` varchar(64) NOT NULL,
  `se_footer` varchar(255) NOT NULL,
  `se_img_logo_header` varchar(64) NOT NULL,
  `se_img_bg` varchar(64) NOT NULL,
  `se_system_email` varchar(64) NOT NULL,
  `se_count_page` int(11) NOT NULL,
  `se_page_range` int(11) NOT NULL,
  `se_email_host` varchar(64) NOT NULL,
  `se_email_port` varchar(64) NOT NULL,
  `se_email_user` varchar(64) NOT NULL,
  `se_email_password` varchar(64) NOT NULL,
  `se_email_email` varchar(64) NOT NULL,
  `se_email_name` varchar(64) NOT NULL,
  `se_email_secure` varchar(64) NOT NULL,
  `se_url_sps` varchar(256) NOT NULL,
  `se_url_sps_response` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sg_setting`
--

INSERT INTO `sg_setting` (`se_id`, `se_title`, `se_footer`, `se_img_logo_header`, `se_img_bg`, `se_system_email`, `se_count_page`, `se_page_range`, `se_email_host`, `se_email_port`, `se_email_user`, `se_email_password`, `se_email_email`, `se_email_name`, `se_email_secure`, `se_url_sps`, `se_url_sps_response`) VALUES
(1, 'SmartPro', 'www.smart-pro.com.ar @ 2015', '554b9d9416e14.jpg', '564523d45d34f.png', 'mdampuero@gmail.com', 50, 50, 'mail.apachecms.com.ar', '587', 'mauricio@apachecms.com.ar', 'Santiago385', 'mauricio@apachecms.com.ar', 'Pro NeumÃ¡ticos Mza', '', 'http://localhost/ShopGallery/web/public/sps/simulatorsps', 'http://localhost/ShopGallery/web/public/sps/simulatorresult');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_sinister`
--

CREATE TABLE `sg_sinister` (
  `si_id` int(11) NOT NULL,
  `si_qr` varchar(64) NOT NULL,
  `si_se_id` int(11) NOT NULL,
  `si_date` date DEFAULT NULL,
  `si_co_id` int(11) NOT NULL,
  `si_br_id` int(11) NOT NULL,
  `si_mo_id` int(11) NOT NULL,
  `si_version` varchar(255) NOT NULL,
  `si_number` varchar(64) NOT NULL,
  `si_domain` varchar(12) NOT NULL,
  `si_fullname` varchar(128) NOT NULL,
  `si_phone` varchar(64) NOT NULL,
  `si_email` varchar(64) NOT NULL,
  `si_customer_address` text NOT NULL,
  `si_st_id` int(11) DEFAULT '0',
  `si_city` varchar(255) DEFAULT NULL,
  `si_tb_id_au` int(11) NOT NULL,
  `si_tm_id_au` int(11) NOT NULL,
  `si_ts_id_au` int(11) NOT NULL,
  `si_tamount_au` int(11) NOT NULL,
  `si_tobservation_au` text NOT NULL,
  `si_tb_id_po` int(11) NOT NULL,
  `si_tm_id_po` int(11) NOT NULL,
  `si_ts_id_po` int(11) NOT NULL,
  `si_stock_au` tinyint(1) NOT NULL,
  `si_stock_po` tinyint(1) NOT NULL,
  `si_stock_co` tinyint(1) NOT NULL,
  `si_stock_ba` tinyint(1) NOT NULL,
  `si_amount_po` int(11) NOT NULL,
  `si_tobservation_po` text NOT NULL,
  `si_cb_id` int(11) NOT NULL,
  `si_cm_id` int(11) NOT NULL,
  `si_amount_co` int(11) NOT NULL,
  `si_observation_co` text NOT NULL,
  `si_bb_id` int(11) NOT NULL,
  `si_bm_id` int(11) NOT NULL,
  `si_amount_ba` int(11) NOT NULL,
  `si_observation_ba` text NOT NULL,
  `si_step` int(11) NOT NULL,
  `si_status` tinyint(4) NOT NULL,
  `si_data_complete` tinyint(4) NOT NULL,
  `si_au_pr_id` int(11) NOT NULL,
  `si_au_date` date DEFAULT NULL,
  `si_po_pr_id` int(11) NOT NULL,
  `si_po_date` date DEFAULT NULL,
  `si_co_pr_id` int(11) NOT NULL,
  `si_co_date` date DEFAULT NULL,
  `si_ba_pr_id` int(11) NOT NULL,
  `si_ba_date` date DEFAULT NULL,
  `si_au_date_from` date DEFAULT NULL,
  `si_au_transport` varchar(255) NOT NULL,
  `si_po_date_from` date DEFAULT NULL,
  `si_po_transport` varchar(255) NOT NULL,
  `si_co_date_from` date DEFAULT NULL,
  `si_co_transport` varchar(255) NOT NULL,
  `si_ba_date_from` date DEFAULT NULL,
  `si_ba_transport` varchar(255) NOT NULL,
  `si_observation_loan` text NOT NULL,
  `si_loan` text NOT NULL,
  `si_finish_description` text NOT NULL,
  `si_finish_payment` text NOT NULL,
  `si_days` int(11) NOT NULL DEFAULT '0',
  `si_created` varchar(64) NOT NULL,
  `si_modified` varchar(64) NOT NULL,
  `si_deleted` tinyint(4) NOT NULL,
  `si_delivery` tinyint(4) NOT NULL,
  `si_tr_id` int(11) NOT NULL DEFAULT '0',
  `si_track_id` varchar(128) DEFAULT NULL,
  `si_delivery_name` varchar(255) DEFAULT NULL,
  `si_delivery_document` varchar(128) DEFAULT NULL,
  `si_ba_number` varchar(45) DEFAULT NULL,
  `si_ba_price_sale` float DEFAULT NULL,
  `si_ba_price_cost` float DEFAULT NULL,
  `si_co_number` varchar(45) DEFAULT NULL,
  `si_co_price_sale` float DEFAULT NULL,
  `si_co_price_cost` float DEFAULT NULL,
  `si_po_number` varchar(45) DEFAULT NULL,
  `si_po_price_sale` float DEFAULT NULL,
  `si_po_price_cost` float DEFAULT NULL,
  `si_au_number` varchar(45) DEFAULT NULL,
  `si_au_price_sale` float DEFAULT NULL,
  `si_au_price_cost` float DEFAULT NULL,
  `si_total_cost` float DEFAULT '0',
  `si_total_sale` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sg_sinister`
--

INSERT INTO `sg_sinister` (`si_id`, `si_qr`, `si_se_id`, `si_date`, `si_co_id`, `si_br_id`, `si_mo_id`, `si_version`, `si_number`, `si_domain`, `si_fullname`, `si_phone`, `si_email`, `si_customer_address`, `si_st_id`, `si_city`, `si_tb_id_au`, `si_tm_id_au`, `si_ts_id_au`, `si_tamount_au`, `si_tobservation_au`, `si_tb_id_po`, `si_tm_id_po`, `si_ts_id_po`, `si_stock_au`, `si_stock_po`, `si_stock_co`, `si_stock_ba`, `si_amount_po`, `si_tobservation_po`, `si_cb_id`, `si_cm_id`, `si_amount_co`, `si_observation_co`, `si_bb_id`, `si_bm_id`, `si_amount_ba`, `si_observation_ba`, `si_step`, `si_status`, `si_data_complete`, `si_au_pr_id`, `si_au_date`, `si_po_pr_id`, `si_po_date`, `si_co_pr_id`, `si_co_date`, `si_ba_pr_id`, `si_ba_date`, `si_au_date_from`, `si_au_transport`, `si_po_date_from`, `si_po_transport`, `si_co_date_from`, `si_co_transport`, `si_ba_date_from`, `si_ba_transport`, `si_observation_loan`, `si_loan`, `si_finish_description`, `si_finish_payment`, `si_days`, `si_created`, `si_modified`, `si_deleted`, `si_delivery`, `si_tr_id`, `si_track_id`, `si_delivery_name`, `si_delivery_document`, `si_ba_number`, `si_ba_price_sale`, `si_ba_price_cost`, `si_co_number`, `si_co_price_sale`, `si_co_price_cost`, `si_po_number`, `si_po_price_sale`, `si_po_price_cost`, `si_au_number`, `si_au_price_sale`, `si_au_price_cost`, `si_total_cost`, `si_total_sale`) VALUES
(1, 'c7a879806f2da7f79ed0447a6c9f675e.png', 0, '2021-05-27', 1, 0, 0, '', '246', 'jfvuk', 'ARAYA CONCHA ROXANA ANDREA ', 'bk', '', '', 5, 'vertin', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, '', 0, 0, 0, '', 0, 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', 0, '1622133769', '1622133770', 0, 1, 0, '', 'ARAYA CONCHA ROXANA ANDREA ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(2, '580a4f26fbc73738471bef3b79a08f3f.png', 0, '2021-05-27', 1, 0, 0, '', '123456', 'mjh451', 'GUSTAVO NUDO', '02616099557', 'nudo.gustavo@gmail.com', 'Clark 574', 14, 'Mendoza', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, '', 0, 0, 0, '', 0, 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', 0, '1622133785', '1622133785', 0, 1, 0, '', 'GUSTAVO NUDO', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(3, '3a2308b3a059b95818c3eb7a1bcadac3.png', 0, '2021-05-27', 1, 0, 0, '', '22316', 'ert', 'carlos pillado', '', 'cba', '', 14, '', 0, 0, 0, 1, '', 0, 0, 0, 1, 0, 0, 0, 0, '', 0, 0, 0, '', 0, 0, 0, '', 0, 5, 0, 0, '0000-00-00', 0, NULL, 0, NULL, 0, NULL, '0000-00-00', '', NULL, '', NULL, '', NULL, '', '', '', '', '', 0, '1622133790', '1622134338', 0, 1, 0, '', 'carlos pillado', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_sinister_accesory`
--

CREATE TABLE `sg_sinister_accesory` (
  `sa_id` int(11) NOT NULL,
  `sa_si_id` int(11) NOT NULL,
  `sa_ac_id` int(11) NOT NULL,
  `sa_count` int(11) NOT NULL,
  `sa_in_stock` tinyint(4) NOT NULL,
  `sa_pr_id` int(11) NOT NULL,
  `sa_date` date NOT NULL,
  `sa_date_from` date NOT NULL,
  `sa_transport` varchar(255) NOT NULL,
  `sa_price_cost` float DEFAULT NULL,
  `sa_price_sale` float DEFAULT NULL,
  `sa_number` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_sinister_activity`
--

CREATE TABLE `sg_sinister_activity` (
  `act_id` int(11) NOT NULL,
  `act_ad_id` int(11) NOT NULL,
  `act_si_id` int(11) NOT NULL,
  `act_observation` text NOT NULL,
  `act_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sg_sinister_activity`
--

INSERT INTO `sg_sinister_activity` (`act_id`, `act_ad_id`, `act_si_id`, `act_observation`, `act_created`) VALUES
(1, 21, 1, 'Creado', 1622133770),
(2, 21, 2, 'Creado', 1622133785),
(3, 21, 3, 'Creado', 1622133790),
(4, 21, 3, 'De \'Faltan Definir Repuestos\' a \'En espera de repuestos\'', 1622134139),
(5, 21, 3, 'De \'Faltan Definir Repuestos\' a \'En espera de repuestos\'', 1622134139),
(6, 21, 3, 'Editado', 1622134140),
(7, 21, 3, 'De \'En espera de repuestos\' a \'Ingresado sin entregar\'', 1622134235),
(8, 21, 3, 'Editado', 1622134243),
(9, 21, 3, 'Editado', 1622134246),
(10, 21, 3, 'De \'Ingresado sin entregar\' a \'Entregado\'', 1622134285),
(11, 21, 3, 'De \'Ingresado sin entregar\' a \'Entregado\'', 1622134288),
(12, 21, 3, 'De \'Entregado\' a \'Facturado\'', 1622134302),
(13, 21, 3, 'De \'Entregado\' a \'Facturado\'', 1622134309),
(14, 21, 3, 'De \'Ingresado sin entregar\' a \'Facturado\'', 1622134338);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_state`
--

CREATE TABLE `sg_state` (
  `st_id` int(10) NOT NULL,
  `st_state` varchar(255) NOT NULL,
  `st_status` tinyint(4) NOT NULL,
  `st_created` varchar(64) NOT NULL,
  `st_modified` varchar(64) NOT NULL,
  `st_deleted` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sg_state`
--

INSERT INTO `sg_state` (`st_id`, `st_state`, `st_status`, `st_created`, `st_modified`, `st_deleted`) VALUES
(1, 'Buenos Aires', 1, '231321321', '2133213123', 0),
(2, 'Buenos Aires-GBA', 1, '231321321', '2133213123', 0),
(3, 'Capital Federal', 1, '231321321', '2133213123', 0),
(4, 'Catamarca', 1, '231321321', '2133213123', 0),
(5, 'Chaco', 1, '231321321', '2133213123', 0),
(6, 'Chubut', 1, '231321321', '2133213123', 0),
(7, 'Cordoba', 1, '231321321', '2133213123', 0),
(8, 'Corrientes', 1, '231321321', '2133213123', 0),
(9, 'Entre Rios', 1, '231321321', '2133213123', 0),
(10, 'Formosa', 1, '231321321', '2133213123', 0),
(11, 'Jujuy', 1, '231321321', '2133213123', 0),
(12, 'La Pampa', 1, '231321321', '2133213123', 0),
(13, 'La Rioja', 1, '231321321', '2133213123', 0),
(14, 'Mendoza', 1, '231321321', '2133213123', 0),
(15, 'Misiones', 1, '231321321', '2133213123', 0),
(16, 'Neuquen', 1, '231321321', '2133213123', 0),
(17, 'Rio Negro', 1, '231321321', '2133213123', 0),
(18, 'Salta', 1, '231321321', '2133213123', 0),
(19, 'San Juan', 1, '231321321', '2133213123', 0),
(20, 'San Luis', 1, '231321321', '2133213123', 0),
(21, 'Santa Cruz', 1, '231321321', '2133213123', 0),
(22, 'Santa Fe', 1, '231321321', '2133213123', 0),
(23, 'Santiago del Estero', 1, '231321321', '2133213123', 0),
(24, 'Tierra del Fuego', 1, '231321321', '2133213123', 0),
(25, 'Tucuman', 1, '231321321', '2133213123', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_tbranch`
--

CREATE TABLE `sg_tbranch` (
  `tb_id` int(11) NOT NULL,
  `tb_name` varchar(128) NOT NULL,
  `tb_code` varchar(45) DEFAULT NULL,
  `tb_status` tinyint(4) NOT NULL,
  `tb_created` varchar(64) NOT NULL,
  `tb_modified` varchar(64) NOT NULL,
  `tb_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_tmodel`
--

CREATE TABLE `sg_tmodel` (
  `tm_id` int(11) NOT NULL,
  `tm_name` varchar(128) NOT NULL,
  `tm_status` tinyint(4) NOT NULL,
  `tm_created` varchar(64) NOT NULL,
  `tm_modified` varchar(64) NOT NULL,
  `tm_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_transport`
--

CREATE TABLE `sg_transport` (
  `tr_id` int(10) NOT NULL,
  `tr_transport` varchar(255) NOT NULL,
  `tr_status` tinyint(4) NOT NULL,
  `tr_created` varchar(64) NOT NULL,
  `tr_modified` varchar(64) NOT NULL,
  `tr_deleted` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sg_tsize`
--

CREATE TABLE `sg_tsize` (
  `ts_id` int(11) NOT NULL,
  `ts_tb_id` int(11) NOT NULL,
  `ts_tm_id` int(11) NOT NULL,
  `ts_name` varchar(128) NOT NULL,
  `ts_status` tinyint(4) NOT NULL,
  `ts_created` varchar(64) NOT NULL,
  `ts_modified` varchar(64) NOT NULL,
  `ts_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `sg_accesory`
--
ALTER TABLE `sg_accesory`
  ADD PRIMARY KEY (`ac_id`);

--
-- Indices de la tabla `sg_admin`
--
ALTER TABLE `sg_admin`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indices de la tabla `sg_admin_rol`
--
ALTER TABLE `sg_admin_rol`
  ADD PRIMARY KEY (`ar_id`);

--
-- Indices de la tabla `sg_bbranch`
--
ALTER TABLE `sg_bbranch`
  ADD PRIMARY KEY (`bb_id`);

--
-- Indices de la tabla `sg_bmodel`
--
ALTER TABLE `sg_bmodel`
  ADD PRIMARY KEY (`bm_id`);

--
-- Indices de la tabla `sg_branch`
--
ALTER TABLE `sg_branch`
  ADD PRIMARY KEY (`br_id`);

--
-- Indices de la tabla `sg_cbranch`
--
ALTER TABLE `sg_cbranch`
  ADD PRIMARY KEY (`cb_id`);

--
-- Indices de la tabla `sg_cmodel`
--
ALTER TABLE `sg_cmodel`
  ADD PRIMARY KEY (`cm_id`);

--
-- Indices de la tabla `sg_company`
--
ALTER TABLE `sg_company`
  ADD PRIMARY KEY (`co_id`);

--
-- Indices de la tabla `sg_customer`
--
ALTER TABLE `sg_customer`
  ADD PRIMARY KEY (`cu_id`);

--
-- Indices de la tabla `sg_gallery`
--
ALTER TABLE `sg_gallery`
  ADD PRIMARY KEY (`ga_id`);

--
-- Indices de la tabla `sg_model`
--
ALTER TABLE `sg_model`
  ADD PRIMARY KEY (`mo_id`);

--
-- Indices de la tabla `sg_news`
--
ALTER TABLE `sg_news`
  ADD PRIMARY KEY (`ne_id`);

--
-- Indices de la tabla `sg_page`
--
ALTER TABLE `sg_page`
  ADD PRIMARY KEY (`pa_id`);

--
-- Indices de la tabla `sg_provider`
--
ALTER TABLE `sg_provider`
  ADD PRIMARY KEY (`pr_id`);

--
-- Indices de la tabla `sg_seller`
--
ALTER TABLE `sg_seller`
  ADD PRIMARY KEY (`se_id`);

--
-- Indices de la tabla `sg_setting`
--
ALTER TABLE `sg_setting`
  ADD PRIMARY KEY (`se_id`);

--
-- Indices de la tabla `sg_sinister`
--
ALTER TABLE `sg_sinister`
  ADD PRIMARY KEY (`si_id`);

--
-- Indices de la tabla `sg_sinister_accesory`
--
ALTER TABLE `sg_sinister_accesory`
  ADD PRIMARY KEY (`sa_id`);

--
-- Indices de la tabla `sg_sinister_activity`
--
ALTER TABLE `sg_sinister_activity`
  ADD PRIMARY KEY (`act_id`);

--
-- Indices de la tabla `sg_state`
--
ALTER TABLE `sg_state`
  ADD PRIMARY KEY (`st_id`);

--
-- Indices de la tabla `sg_tbranch`
--
ALTER TABLE `sg_tbranch`
  ADD PRIMARY KEY (`tb_id`);

--
-- Indices de la tabla `sg_tmodel`
--
ALTER TABLE `sg_tmodel`
  ADD PRIMARY KEY (`tm_id`);

--
-- Indices de la tabla `sg_transport`
--
ALTER TABLE `sg_transport`
  ADD PRIMARY KEY (`tr_id`);

--
-- Indices de la tabla `sg_tsize`
--
ALTER TABLE `sg_tsize`
  ADD PRIMARY KEY (`ts_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `sg_accesory`
--
ALTER TABLE `sg_accesory`
  MODIFY `ac_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_admin`
--
ALTER TABLE `sg_admin`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `sg_admin_rol`
--
ALTER TABLE `sg_admin_rol`
  MODIFY `ar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `sg_bbranch`
--
ALTER TABLE `sg_bbranch`
  MODIFY `bb_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_bmodel`
--
ALTER TABLE `sg_bmodel`
  MODIFY `bm_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_branch`
--
ALTER TABLE `sg_branch`
  MODIFY `br_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_cbranch`
--
ALTER TABLE `sg_cbranch`
  MODIFY `cb_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_cmodel`
--
ALTER TABLE `sg_cmodel`
  MODIFY `cm_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_company`
--
ALTER TABLE `sg_company`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sg_customer`
--
ALTER TABLE `sg_customer`
  MODIFY `cu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_gallery`
--
ALTER TABLE `sg_gallery`
  MODIFY `ga_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_model`
--
ALTER TABLE `sg_model`
  MODIFY `mo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_news`
--
ALTER TABLE `sg_news`
  MODIFY `ne_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_page`
--
ALTER TABLE `sg_page`
  MODIFY `pa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sg_provider`
--
ALTER TABLE `sg_provider`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_seller`
--
ALTER TABLE `sg_seller`
  MODIFY `se_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `sg_setting`
--
ALTER TABLE `sg_setting`
  MODIFY `se_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sg_sinister`
--
ALTER TABLE `sg_sinister`
  MODIFY `si_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sg_sinister_accesory`
--
ALTER TABLE `sg_sinister_accesory`
  MODIFY `sa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_sinister_activity`
--
ALTER TABLE `sg_sinister_activity`
  MODIFY `act_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `sg_state`
--
ALTER TABLE `sg_state`
  MODIFY `st_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `sg_tbranch`
--
ALTER TABLE `sg_tbranch`
  MODIFY `tb_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_tmodel`
--
ALTER TABLE `sg_tmodel`
  MODIFY `tm_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_transport`
--
ALTER TABLE `sg_transport`
  MODIFY `tr_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sg_tsize`
--
ALTER TABLE `sg_tsize`
  MODIFY `ts_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
