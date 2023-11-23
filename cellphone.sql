-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 23, 2023 lúc 10:09 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cellphone`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL),
(8, 0, 0, 'Category', 'fa-bookmark', '/categories', '*', '2023-04-06 07:46:43', '2023-04-06 07:46:43'),
(9, 0, 0, 'Product', 'fa-product-hunt', '/products', '*', '2023-04-06 07:48:43', '2023-04-06 07:48:43'),
(10, 0, 0, 'User', 'fa-user', '/users', '*', '2023-04-06 07:50:01', '2023-04-06 07:50:01'),
(11, 0, 0, 'Banner', 'fa-image', '/banners', '*', '2023-04-18 08:59:39', '2023-04-18 08:59:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `input` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-06 07:45:14', '2023-04-06 07:45:14'),
(2, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 07:45:21', '2023-04-06 07:45:21'),
(3, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Category\",\"icon\":\"fa-bookmark\",\"uri\":\"\\/categories\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\"}', '2023-04-06 07:46:43', '2023-04-06 07:46:43'),
(4, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-04-06 07:46:43', '2023-04-06 07:46:43'),
(5, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-04-06 07:46:47', '2023-04-06 07:46:47'),
(6, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Product\",\"icon\":\"fa-product-hunt\",\"uri\":\"\\/products\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\"}', '2023-04-06 07:48:43', '2023-04-06 07:48:43'),
(7, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-04-06 07:48:43', '2023-04-06 07:48:43'),
(8, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-04-06 07:48:46', '2023-04-06 07:48:46'),
(9, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"User\",\"icon\":\"fa-user\",\"uri\":\"\\/users\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\"}', '2023-04-06 07:50:01', '2023-04-06 07:50:01'),
(10, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-04-06 07:50:01', '2023-04-06 07:50:01'),
(11, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-04-06 07:50:06', '2023-04-06 07:50:06'),
(12, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 07:50:09', '2023-04-06 07:50:09'),
(13, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 07:50:13', '2023-04-06 07:50:13'),
(14, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Laptop\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-04-06 07:50:49', '2023-04-06 07:50:49'),
(15, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-04-06 07:50:49', '2023-04-06 07:50:49'),
(16, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 07:50:54', '2023-04-06 07:50:54'),
(17, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"SmartPhone\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-04-06 07:51:04', '2023-04-06 07:51:04'),
(18, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-04-06 07:51:04', '2023-04-06 07:51:04'),
(19, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 07:51:21', '2023-04-06 07:51:21'),
(20, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n H\\u00ecnh,  M\\u00e1y T\\u00ednh \\u0110\\u1ec3 B\\u00e0n\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-04-06 07:51:52', '2023-04-06 07:51:52'),
(21, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-04-06 07:51:52', '2023-04-06 07:51:52'),
(22, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 07:52:08', '2023-04-06 07:52:08'),
(23, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e1y T\\u00ednh B\\u1ea3ng\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-04-06 07:52:16', '2023-04-06 07:52:16'),
(24, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-04-06 07:52:16', '2023-04-06 07:52:16'),
(25, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 07:52:22', '2023-04-06 07:52:22'),
(26, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Tai Nghe\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-04-06 07:52:30', '2023-04-06 07:52:30'),
(27, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-04-06 07:52:30', '2023-04-06 07:52:30'),
(28, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 07:52:42', '2023-04-06 07:52:42'),
(29, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"\\u0110\\u1ed3ng H\\u1ed3 Th\\u00f4ng Minh\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-04-06 07:52:50', '2023-04-06 07:52:50'),
(30, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-04-06 07:52:50', '2023-04-06 07:52:50'),
(31, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 07:52:54', '2023-04-06 07:52:54'),
(32, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Tivi\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-04-06 07:53:00', '2023-04-06 07:53:00'),
(33, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-04-06 07:53:00', '2023-04-06 07:53:00'),
(34, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 07:53:09', '2023-04-06 07:53:09'),
(35, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Nh\\u00e0 Th\\u00f4ng Minh\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-04-06 07:53:16', '2023-04-06 07:53:16'),
(36, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-04-06 07:53:16', '2023-04-06 07:53:16'),
(37, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:04:18', '2023-04-06 08:04:18'),
(38, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:04:20', '2023-04-06 08:04:20'),
(39, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 11 64GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"10490000\",\"quantity\":\"5\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:07:21', '2023-04-06 08:07:21'),
(40, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-06 08:07:22', '2023-04-06 08:07:22'),
(41, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:09:43', '2023-04-06 08:09:43'),
(42, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:09:46', '2023-04-06 08:09:46'),
(43, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:09:48', '2023-04-06 08:09:48'),
(44, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:12:36', '2023-04-06 08:12:36'),
(45, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Product\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-04-06 08:13:08', '2023-04-06 08:13:08'),
(46, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:13:08', '2023-04-06 08:13:08'),
(47, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"2\",\"_model\":\"App_Models_Product\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-04-06 08:13:12', '2023-04-06 08:13:12'),
(48, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:13:12', '2023-04-06 08:13:12'),
(49, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:13:20', '2023-04-06 08:13:20'),
(50, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 11 64GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"10490000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:13:38', '2023-04-06 08:13:38'),
(51, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-06 08:13:38', '2023-04-06 08:13:38'),
(52, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 11 64GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"10490\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\"}', '2023-04-06 08:14:34', '2023-04-06 08:14:34'),
(53, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-06 08:14:34', '2023-04-06 08:14:34'),
(54, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 11 64GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"10490\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\"}', '2023-04-06 08:14:41', '2023-04-06 08:14:41'),
(55, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:14:41', '2023-04-06 08:14:41'),
(56, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:14:46', '2023-04-06 08:14:46'),
(57, 1, 'admin/products/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:15:06', '2023-04-06 08:15:06'),
(58, 1, 'admin/products/3', 'PUT', '127.0.0.1', '{\"name\":\"iPhone 11 64GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"10490\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:15:20', '2023-04-06 08:15:20'),
(59, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:15:20', '2023-04-06 08:15:20'),
(60, 1, 'admin/products/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:15:24', '2023-04-06 08:15:24'),
(61, 1, 'admin/products/3/edit', 'GET', '127.0.0.1', '[]', '2023-04-06 08:16:08', '2023-04-06 08:16:08'),
(62, 1, 'admin/products/3', 'PUT', '127.0.0.1', '{\"name\":\"iPhone 11 64GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"10490\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_method\":\"PUT\"}', '2023-04-06 08:16:14', '2023-04-06 08:16:14'),
(63, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:16:15', '2023-04-06 08:16:15'),
(64, 1, 'admin/products/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:16:20', '2023-04-06 08:16:20'),
(65, 1, 'admin/products/3/edit', 'GET', '127.0.0.1', '[]', '2023-04-06 08:19:41', '2023-04-06 08:19:41'),
(66, 1, 'admin/products/3', 'PUT', '127.0.0.1', '{\"name\":\"iPhone 11 64GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"10490\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_method\":\"PUT\"}', '2023-04-06 08:19:47', '2023-04-06 08:19:47'),
(67, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:19:47', '2023-04-06 08:19:47'),
(68, 1, 'admin/products/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:20:53', '2023-04-06 08:20:53'),
(69, 1, 'admin/products/3', 'PUT', '127.0.0.1', '{\"name\":\"iPhone 11 64GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"10.49\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:21:03', '2023-04-06 08:21:03'),
(70, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:21:03', '2023-04-06 08:21:03'),
(71, 1, 'admin/products/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:21:10', '2023-04-06 08:21:10'),
(72, 1, 'admin/products/3', 'PUT', '127.0.0.1', '{\"name\":\"iPhone 11 64GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"104900\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:21:21', '2023-04-06 08:21:21'),
(73, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:21:22', '2023-04-06 08:21:22'),
(74, 1, 'admin/products/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:21:36', '2023-04-06 08:21:36'),
(75, 1, 'admin/products/3', 'PUT', '127.0.0.1', '{\"name\":\"iPhone 11 64GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"10490000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:21:41', '2023-04-06 08:21:41'),
(76, 1, 'admin/products/3/edit', 'GET', '127.0.0.1', '[]', '2023-04-06 08:21:42', '2023-04-06 08:21:42'),
(77, 1, 'admin/products/3', 'PUT', '127.0.0.1', '{\"name\":\"iPhone 11 64GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"104900\",\"quantity\":\"5\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_method\":\"PUT\"}', '2023-04-06 08:22:04', '2023-04-06 08:22:04'),
(78, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:22:05', '2023-04-06 08:22:05'),
(79, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:23:36', '2023-04-06 08:23:36'),
(80, 1, 'admin/products/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:23:41', '2023-04-06 08:23:41'),
(81, 1, 'admin/products/3', 'PUT', '127.0.0.1', '{\"name\":\"iPhone 11 64GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"10490000\",\"quantity\":\"5\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:23:50', '2023-04-06 08:23:50'),
(82, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:23:50', '2023-04-06 08:23:50'),
(83, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:28:15', '2023-04-06 08:28:15'),
(84, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:28:29', '2023-04-06 08:28:29'),
(85, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 11 128GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"12190000\",\"quantity\":\"5\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:29:12', '2023-04-06 08:29:12'),
(86, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:29:12', '2023-04-06 08:29:12'),
(87, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:29:16', '2023-04-06 08:29:16'),
(88, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 12 64GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"14690000\",\"quantity\":\"5\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:29:48', '2023-04-06 08:29:48'),
(89, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:29:48', '2023-04-06 08:29:48'),
(90, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:29:53', '2023-04-06 08:29:53'),
(91, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 12 128GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"15990000\",\"quantity\":\"5\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:30:21', '2023-04-06 08:30:21'),
(92, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:30:21', '2023-04-06 08:30:21'),
(93, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:30:47', '2023-04-06 08:30:47'),
(94, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 12 Pro Max 128GB I Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"23490000\",\"quantity\":\"5\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:31:10', '2023-04-06 08:31:10'),
(95, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:31:11', '2023-04-06 08:31:11'),
(96, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:31:13', '2023-04-06 08:31:13'),
(97, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 13 128GB | Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"16990000\",\"quantity\":\"5\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:31:50', '2023-04-06 08:31:50'),
(98, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:31:50', '2023-04-06 08:31:50'),
(99, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:31:53', '2023-04-06 08:31:53'),
(100, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 13 Pro Max 128GB | Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"25490000\",\"quantity\":\"5\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:32:19', '2023-04-06 08:32:19'),
(101, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:32:19', '2023-04-06 08:32:19'),
(102, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:32:21', '2023-04-06 08:32:21'),
(103, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 14 128GB | Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"19490000\",\"quantity\":\"5\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:32:44', '2023-04-06 08:32:44'),
(104, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:32:45', '2023-04-06 08:32:45'),
(105, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:32:49', '2023-04-06 08:32:49'),
(106, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 14 Pro 128GB | Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"25290000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:33:22', '2023-04-06 08:33:22'),
(107, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:33:22', '2023-04-06 08:33:22'),
(108, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_export_\":\"all\"}', '2023-04-06 08:33:24', '2023-04-06 08:33:24'),
(109, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_columns_\":\"category_id,id,image,name,price,quantity,status\",\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:33:38', '2023-04-06 08:33:38'),
(110, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:33:47', '2023-04-06 08:33:47'),
(111, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:33:53', '2023-04-06 08:33:53'),
(112, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:33:55', '2023-04-06 08:33:55'),
(113, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 14 Pro Max 128GB | Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"27150000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:34:47', '2023-04-06 08:34:47'),
(114, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:34:47', '2023-04-06 08:34:47'),
(115, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:34:54', '2023-04-06 08:34:54'),
(116, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPhone 14 Pro Max 256GB | Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"30290000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:35:15', '2023-04-06 08:35:15'),
(117, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:35:15', '2023-04-06 08:35:15'),
(118, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:35:22', '2023-04-06 08:35:22'),
(119, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"OPPO Find N2 Flip\",\"price\":\"19990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:35:46', '2023-04-06 08:35:46'),
(120, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:35:46', '2023-04-06 08:35:46'),
(121, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:35:49', '2023-04-06 08:35:49'),
(122, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"OPPO Reno8 T 5G (8GB - 128GB)\",\"price\":\"8490000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:36:12', '2023-04-06 08:36:12'),
(123, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:36:12', '2023-04-06 08:36:12'),
(124, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:36:25', '2023-04-06 08:36:25'),
(125, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Samsung Galaxy A34 5G 8GB 128GB\",\"price\":\"6790000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:36:46', '2023-04-06 08:36:46'),
(126, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:36:46', '2023-04-06 08:36:46'),
(127, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:36:47', '2023-04-06 08:36:47'),
(128, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Samsung Galaxy S23 8GB 256GB\",\"price\":\"19990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:37:14', '2023-04-06 08:37:14'),
(129, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:37:14', '2023-04-06 08:37:14'),
(130, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:37:20', '2023-04-06 08:37:20'),
(131, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Samsung Galaxy S23 Ultra 256GB\",\"price\":\"23890000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:37:45', '2023-04-06 08:37:45'),
(132, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:37:45', '2023-04-06 08:37:45'),
(133, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:37:47', '2023-04-06 08:37:47'),
(134, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Xiaomi 13 8GB 256GB\",\"price\":\"22090000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:38:11', '2023-04-06 08:38:11'),
(135, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:38:11', '2023-04-06 08:38:11'),
(136, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:38:17', '2023-04-06 08:38:17'),
(137, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Xiaomi Redmi Note 11 128GB\",\"price\":\"4090000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:38:48', '2023-04-06 08:38:48'),
(138, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:38:48', '2023-04-06 08:38:48'),
(139, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:39:06', '2023-04-06 08:39:06'),
(140, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Xiaomi Redmi Note 11 Pro\",\"price\":\"6090000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:39:29', '2023-04-06 08:39:29'),
(141, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:39:30', '2023-04-06 08:39:30'),
(142, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 08:39:34', '2023-04-06 08:39:34'),
(143, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Xiaomi Redmi Note 12\",\"price\":\"4990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"2\",\"_token\":\"4FXFe5OGiO1B27qEZ97uecPZt3KAJ7gFHhuOvsGz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-06 08:39:57', '2023-04-06 08:39:57'),
(144, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-06 08:39:57', '2023-04-06 08:39:57'),
(145, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-06 20:04:19', '2023-04-06 20:04:19'),
(146, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 20:04:32', '2023-04-06 20:04:32'),
(147, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-06 21:28:13', '2023-04-06 21:28:13'),
(148, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-06 21:30:33', '2023-04-06 21:30:33'),
(149, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-06 21:30:35', '2023-04-06 21:30:35'),
(150, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-08 08:16:50', '2023-04-08 08:16:50'),
(151, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-10 08:37:51', '2023-04-10 08:37:51'),
(152, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-10 08:37:57', '2023-04-10 08:37:57'),
(153, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-15 08:34:36', '2023-04-15 08:34:36'),
(154, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-15 08:34:46', '2023-04-15 08:34:46'),
(155, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2023-04-15 08:35:01', '2023-04-15 08:35:01'),
(156, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-15 08:35:07', '2023-04-15 08:35:07'),
(157, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Laptop Lenovo Ideapad Gaming 3 15ARH7\",\"price\":\"21990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-15 08:38:04', '2023-04-15 08:38:04'),
(158, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-15 08:38:05', '2023-04-15 08:38:05'),
(159, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-15 08:38:08', '2023-04-15 08:38:08'),
(160, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Apple MacBook Air M1 256GB 2020 I Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"18590000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-15 08:38:47', '2023-04-15 08:38:47'),
(161, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-15 08:38:47', '2023-04-15 08:38:47'),
(162, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-15 08:38:53', '2023-04-15 08:38:53'),
(163, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Laptop Lenovo Ideapad Gaming 3 15ARH7\",\"price\":\"23990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-15 08:39:17', '2023-04-15 08:39:17'),
(164, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-15 08:39:17', '2023-04-15 08:39:17'),
(165, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-15 08:39:24', '2023-04-15 08:39:24'),
(166, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Apple Macbook Air M2 2022 8GB 256GB I Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"25690000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-15 08:40:24', '2023-04-15 08:40:24'),
(167, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-15 08:40:24', '2023-04-15 08:40:24'),
(168, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-15 08:40:25', '2023-04-15 08:40:25'),
(169, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Laptop Asus Gaming Rog Strix G15 G513IH HN015W\",\"price\":\"18590000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-15 08:40:51', '2023-04-15 08:40:51'),
(170, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-15 08:40:51', '2023-04-15 08:40:51'),
(171, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-15 08:40:53', '2023-04-15 08:40:53'),
(172, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Apple Macbook Pro 13 M2 2022 8GB 256GB I Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"28690000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-15 08:41:33', '2023-04-15 08:41:33'),
(173, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:41:34', '2023-04-15 08:41:34'),
(174, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Laptop Lenovo Ideapad Gaming 3 15IHU6 82K101B5VN\",\"price\":\"18990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"after-save\":\"2\"}', '2023-04-15 08:42:02', '2023-04-15 08:42:02'),
(175, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:42:02', '2023-04-15 08:42:02'),
(176, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Laptop MSI Gaming GF63 10SC 804VN\",\"price\":\"17450000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\"}', '2023-04-15 08:42:32', '2023-04-15 08:42:32'),
(177, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-15 08:42:32', '2023-04-15 08:42:32'),
(178, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-15 08:42:33', '2023-04-15 08:42:33'),
(179, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Laptop Asus Vivobook X415EA BV451W\",\"price\":\"6990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-15 08:43:09', '2023-04-15 08:43:09'),
(180, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:43:10', '2023-04-15 08:43:10'),
(181, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"MacBook Pro 14 inch M2 Pro 2023 (10 CPU - 16 GPU - 16GB - 512GB)\",\"price\":\"48290000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"after-save\":\"2\"}', '2023-04-15 08:43:45', '2023-04-15 08:43:45'),
(182, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:43:45', '2023-04-15 08:43:45'),
(183, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Macbook Pro 14 inch 2021 | Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"46990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"after-save\":\"2\"}', '2023-04-15 08:44:18', '2023-04-15 08:44:18'),
(184, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:44:18', '2023-04-15 08:44:18'),
(185, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Apple Macbook Air M2 2022 16GB 256GB I Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"33490000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"after-save\":\"2\"}', '2023-04-15 08:44:59', '2023-04-15 08:44:59'),
(186, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:44:59', '2023-04-15 08:44:59'),
(187, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Laptop ASUS Gaming TUF FX506LHB-HN188W\",\"price\":\"16790000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\"}', '2023-04-15 08:46:02', '2023-04-15 08:46:02'),
(188, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-15 08:46:02', '2023-04-15 08:46:02'),
(189, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-15 08:46:04', '2023-04-15 08:46:04'),
(190, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Laptop Dell Inspiron 3511 5829BLK\",\"price\":\"13490000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-15 08:46:25', '2023-04-15 08:46:25'),
(191, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:46:25', '2023-04-15 08:46:25'),
(192, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Laptop ASUS VivoBook 15X A1503ZA-L1422W\",\"price\":\"17990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"after-save\":\"2\"}', '2023-04-15 08:47:19', '2023-04-15 08:47:19'),
(193, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:47:20', '2023-04-15 08:47:20'),
(194, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Laptop ASUS TUF Gaming F15 FX506HC-HN144W\",\"price\":\"19890000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"after-save\":\"2\"}', '2023-04-15 08:47:49', '2023-04-15 08:47:49'),
(195, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:47:50', '2023-04-15 08:47:50'),
(196, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Laptop HP Gaming Victus 15-FA0031DX 6503849\",\"price\":\"16790000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"after-save\":\"2\"}', '2023-04-15 08:48:13', '2023-04-15 08:48:13'),
(197, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:48:13', '2023-04-15 08:48:13'),
(198, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Apple MacBook Pro 13 M2 2022 16GB 512GB I Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"37790000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\",\"after-save\":\"2\"}', '2023-04-15 08:48:33', '2023-04-15 08:48:33'),
(199, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:48:33', '2023-04-15 08:48:33'),
(200, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Apple Macbook Air M2 2022 8GB 512GB I Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"30790000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"AO7lGLrMjBpJLLJNje8ZRQxl4w9dJuKXGvudddsL\"}', '2023-04-15 08:48:57', '2023-04-15 08:48:57'),
(201, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-15 08:48:57', '2023-04-15 08:48:57'),
(202, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-15 08:50:08', '2023-04-15 08:50:08'),
(203, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh Samsung LS24R350FZEXXV 23.8\",\"price\":\"2890000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-15 08:53:41', '2023-04-15 08:53:41'),
(204, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:53:41', '2023-04-15 08:53:41'),
(205, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh LG UltraWide 29WP60G 29 inch\",\"price\":\"5890000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 08:54:04', '2023-04-15 08:54:04'),
(206, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:54:05', '2023-04-15 08:54:05'),
(207, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh HKC MB24V9 24 inch\",\"price\":\"2490000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 08:54:41', '2023-04-15 08:54:41'),
(208, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:54:42', '2023-04-15 08:54:42'),
(209, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh LG 27 inch 27MP400\",\"price\":\"3290000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 08:55:07', '2023-04-15 08:55:07'),
(210, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:55:07', '2023-04-15 08:55:07'),
(211, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh Gaming LG Ultragear 24GN650-B 24 inch\",\"price\":\"4190000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 08:55:37', '2023-04-15 08:55:37'),
(212, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:55:37', '2023-04-15 08:55:37'),
(213, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh Samsung LU28R550UQEXXV 28 inch\",\"price\":\"6990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 08:56:04', '2023-04-15 08:56:04'),
(214, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:56:04', '2023-04-15 08:56:04'),
(215, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh LG Gaming 27 inch 27QN600\",\"price\":\"5890000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 08:57:13', '2023-04-15 08:57:13'),
(216, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:57:13', '2023-04-15 08:57:13'),
(217, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh Samsung Gaming Odyssey G32 LS27AG320NEXXV 27 inch\",\"price\":\"5390000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 08:57:36', '2023-04-15 08:57:36'),
(218, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:57:37', '2023-04-15 08:57:37'),
(219, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh Xiaomi Monitor 1C BHR4510GL 23.8 inch\",\"price\":\"3090000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 08:57:54', '2023-04-15 08:57:54'),
(220, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:57:54', '2023-04-15 08:57:54'),
(221, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh Dell UltraSharp 23.8 inch U2422H\",\"price\":\"6390000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 08:58:11', '2023-04-15 08:58:11'),
(222, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:58:12', '2023-04-15 08:58:12'),
(223, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh Xiaomi 27 inch RMMNT27NF\",\"price\":\"4490000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 08:58:33', '2023-04-15 08:58:33'),
(224, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:58:34', '2023-04-15 08:58:34'),
(225, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh LG 24QP500 24 inch\",\"price\":\"4690000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 08:58:52', '2023-04-15 08:58:52'),
(226, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:58:52', '2023-04-15 08:58:52'),
(227, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh th\\u00f4ng minh Samsung LS32BM700UEXXV 32 inch\",\"price\":\"8090000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 08:59:24', '2023-04-15 08:59:24'),
(228, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:59:24', '2023-04-15 08:59:24'),
(229, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh Samsung Gaming Odyssey G3 LS24AG320NEXXV 24 inch\",\"price\":\"3690000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 08:59:43', '2023-04-15 08:59:43'),
(230, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 08:59:43', '2023-04-15 08:59:43'),
(231, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh cong Gaming HKC MG32K2Q 32 inch\",\"price\":\"6250000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 09:00:00', '2023-04-15 09:00:00'),
(232, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 09:00:00', '2023-04-15 09:00:00'),
(233, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh Asus TUF Gaming VG247Q1A 24 inch\",\"price\":\"3690000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\",\"after-save\":\"2\"}', '2023-04-15 09:00:20', '2023-04-15 09:00:20'),
(234, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-15 09:00:21', '2023-04-15 09:00:21'),
(235, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh th\\u00f4ng minh Samsung M8 UHD 32 inch\",\"price\":\"13490000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"cjVd5pO7KsqCAPfKyyBlPmgMKNC89AJAcBvRiirQ\"}', '2023-04-15 09:00:40', '2023-04-15 09:00:40'),
(236, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-15 09:00:40', '2023-04-15 09:00:40'),
(237, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-15 09:04:28', '2023-04-15 09:04:28'),
(238, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-16 09:27:58', '2023-04-16 09:27:58'),
(239, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-16 09:29:30', '2023-04-16 09:29:30'),
(240, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-16 09:29:37', '2023-04-16 09:29:37'),
(241, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-16 09:42:54', '2023-04-16 09:42:54'),
(242, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-16 09:43:08', '2023-04-16 09:43:08'),
(243, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-18 08:21:03', '2023-04-18 08:21:03'),
(244, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 08:21:14', '2023-04-18 08:21:14'),
(245, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-04-18 08:59:13', '2023-04-18 08:59:13'),
(246, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Banner\",\"icon\":\"fa-image\",\"uri\":\"\\/banners\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"EhNtiHvPMgbE08qn1KMssvuKE9Mvx8eg8WEQ1Kyd\"}', '2023-04-18 08:59:39', '2023-04-18 08:59:39'),
(247, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-04-18 08:59:39', '2023-04-18 08:59:39'),
(248, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-04-18 08:59:41', '2023-04-18 08:59:41'),
(249, 1, 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 08:59:43', '2023-04-18 08:59:43'),
(250, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 08:59:54', '2023-04-18 08:59:54'),
(251, 1, 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 08:59:57', '2023-04-18 08:59:57'),
(252, 1, 'admin/banners/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 09:00:01', '2023-04-18 09:00:01'),
(253, 1, 'admin/banners', 'POST', '127.0.0.1', '{\"name\":\"REDMI NOTE 12 M\\u1edf b\\u00e1n gi\\u00e1 t\\u1ed1t\",\"_token\":\"EhNtiHvPMgbE08qn1KMssvuKE9Mvx8eg8WEQ1Kyd\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/banners\"}', '2023-04-18 09:01:16', '2023-04-18 09:01:16'),
(254, 1, 'admin/banners', 'GET', '127.0.0.1', '[]', '2023-04-18 09:01:16', '2023-04-18 09:01:16'),
(255, 1, 'admin/banners', 'GET', '127.0.0.1', '[]', '2023-04-18 09:04:59', '2023-04-18 09:04:59'),
(256, 1, 'admin/banners', 'GET', '127.0.0.1', '[]', '2023-04-18 09:06:53', '2023-04-18 09:06:53'),
(257, 1, 'admin/banners', 'GET', '127.0.0.1', '[]', '2023-04-18 09:08:20', '2023-04-18 09:08:20'),
(258, 1, 'admin/banners', 'GET', '127.0.0.1', '[]', '2023-04-18 09:08:30', '2023-04-18 09:08:30'),
(259, 1, 'admin/banners', 'GET', '127.0.0.1', '[]', '2023-04-18 09:08:38', '2023-04-18 09:08:38'),
(260, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-18 09:33:46', '2023-04-18 09:33:46'),
(261, 1, 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 09:33:49', '2023-04-18 09:33:49'),
(262, 1, 'admin/banners/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 09:33:52', '2023-04-18 09:33:52'),
(263, 1, 'admin/banners/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 09:34:08', '2023-04-18 09:34:08'),
(264, 1, 'admin/banners/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 09:34:12', '2023-04-18 09:34:12'),
(265, 1, 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 09:34:13', '2023-04-18 09:34:13'),
(266, 1, 'admin/banners/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 09:34:15', '2023-04-18 09:34:15'),
(267, 1, 'admin/banners', 'POST', '127.0.0.1', '{\"name\":\"IPHONE 14 PRO Gi\\u00e1 t\\u1ed1t b\\u1ea5t ng\\u1edd\",\"_token\":\"EhNtiHvPMgbE08qn1KMssvuKE9Mvx8eg8WEQ1Kyd\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/banners\"}', '2023-04-18 09:35:23', '2023-04-18 09:35:23'),
(268, 1, 'admin/banners', 'GET', '127.0.0.1', '[]', '2023-04-18 09:35:24', '2023-04-18 09:35:24'),
(269, 1, 'admin/banners/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 09:35:34', '2023-04-18 09:35:34'),
(270, 1, 'admin/banners/1', 'PUT', '127.0.0.1', '{\"name\":\"REDMI NOTE 12 M\\u1edf b\\u00e1n gi\\u00e1 t\\u1ed1t\",\"_token\":\"EhNtiHvPMgbE08qn1KMssvuKE9Mvx8eg8WEQ1Kyd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/banners\"}', '2023-04-18 09:35:39', '2023-04-18 09:35:39'),
(271, 1, 'admin/banners', 'GET', '127.0.0.1', '[]', '2023-04-18 09:35:40', '2023-04-18 09:35:40'),
(272, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Banner\",\"_token\":\"EhNtiHvPMgbE08qn1KMssvuKE9Mvx8eg8WEQ1Kyd\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-04-18 09:35:54', '2023-04-18 09:35:54'),
(273, 1, 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 09:35:54', '2023-04-18 09:35:54'),
(274, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-18 23:00:13', '2023-04-18 23:00:13'),
(275, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:00:40', '2023-04-18 23:00:40'),
(276, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:00:44', '2023-04-18 23:00:44'),
(277, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Macbook Pro 16 M1 Max 10 CPU - 32 GPU 32GB 1TB 2021\",\"price\":\"80990000\",\"quantity\":\"5\",\"status\":\"on\",\"category_id\":\"1\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-18 23:01:36', '2023-04-18 23:01:36'),
(278, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-18 23:01:37', '2023-04-18 23:01:37');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(279, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:03:03', '2023-04-18 23:03:03'),
(280, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh Gaming Asus VY249HE-W 24 inch\",\"price\":\"3290000\",\"quantity\":\"6\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-18 23:04:14', '2023-04-18 23:04:14'),
(281, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-18 23:04:14', '2023-04-18 23:04:14'),
(282, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:04:43', '2023-04-18 23:04:43'),
(283, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh \\u0111\\u1ed3 h\\u1ecda di \\u0111\\u1ed9ng Asus ProArt PA148CTV 14 inch\",\"price\":\"10390000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-18 23:05:24', '2023-04-18 23:05:24'),
(284, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:05:24', '2023-04-18 23:05:24'),
(285, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e0n h\\u00ecnh Gaming Asus ROG Swift OLED PG27AQDM 27 inch\",\"price\":\"29990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"3\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\"}', '2023-04-18 23:06:33', '2023-04-18 23:06:33'),
(286, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-18 23:06:34', '2023-04-18 23:06:34'),
(287, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:06:59', '2023-04-18 23:06:59'),
(288, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:07:13', '2023-04-18 23:07:13'),
(289, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-18 23:14:49', '2023-04-18 23:14:49'),
(290, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:14:51', '2023-04-18 23:14:51'),
(291, 1, 'admin/categories/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:14:58', '2023-04-18 23:14:58'),
(292, 1, 'admin/categories/3', 'PUT', '127.0.0.1', '{\"name\":\"M\\u00e0n H\\u00ecnh\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-04-18 23:15:05', '2023-04-18 23:15:05'),
(293, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-04-18 23:15:05', '2023-04-18 23:15:05'),
(294, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:28:17', '2023-04-18 23:28:17'),
(295, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:28:22', '2023-04-18 23:28:22'),
(296, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPad Air 5 (2022) 64GB I Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"14290000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-18 23:29:16', '2023-04-18 23:29:16'),
(297, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:29:16', '2023-04-18 23:29:16'),
(298, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPad mini 6 WiFi 64GB | Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"11890000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:29:37', '2023-04-18 23:29:37'),
(299, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:29:37', '2023-04-18 23:29:37'),
(300, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Samsung Galaxy Tab S8 Ultra 5G\",\"price\":\"24190000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:29:55', '2023-04-18 23:29:55'),
(301, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:29:55', '2023-04-18 23:29:55'),
(302, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPad Gen 10 10.9 inch 2022 Wifi 64GB I Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"10990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:30:31', '2023-04-18 23:30:31'),
(303, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:30:31', '2023-04-18 23:30:31'),
(304, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPad 10.2 2021 WiFi 64GB | Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"7390000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:30:47', '2023-04-18 23:30:47'),
(305, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:30:47', '2023-04-18 23:30:47'),
(306, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPad Pro 11 inch 2022 M2 Wifi 128GB I Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"20990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:31:05', '2023-04-18 23:31:05'),
(307, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:31:05', '2023-04-18 23:31:05'),
(308, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Samsung Galaxy Tab S8 WIFI\",\"price\":\"13390000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:31:23', '2023-04-18 23:31:23'),
(309, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:31:23', '2023-04-18 23:31:23'),
(310, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPad Pro 11 2021 M1 WiFi 128GB I Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"19990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:31:45', '2023-04-18 23:31:45'),
(311, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:31:45', '2023-04-18 23:31:45'),
(312, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Xiaomi Pad 5\",\"price\":\"7990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:32:26', '2023-04-18 23:32:26'),
(313, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:32:26', '2023-04-18 23:32:26'),
(314, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Samsung Galaxy Tab S8 5G\",\"price\":\"15290000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:32:45', '2023-04-18 23:32:45'),
(315, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:32:45', '2023-04-18 23:32:45'),
(316, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPad Air 5 (2022) 256GB I Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"18890000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:33:05', '2023-04-18 23:33:05'),
(317, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:33:05', '2023-04-18 23:33:05'),
(318, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Samsung Galaxy Tab S7 FE (4G)\",\"price\":\"9750000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:33:32', '2023-04-18 23:33:32'),
(319, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:33:32', '2023-04-18 23:33:32'),
(320, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Samsung Galaxy Tab A8 (2022)\",\"price\":\"6190000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:33:55', '2023-04-18 23:33:55'),
(321, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:33:56', '2023-04-18 23:33:56'),
(322, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPad Air 4 (2020) 4G 256GB I Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"17590000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:34:15', '2023-04-18 23:34:15'),
(323, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:34:16', '2023-04-18 23:34:16'),
(324, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"iPad 10.2 2021 WiFi 256GB | Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"11190000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"4\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:34:37', '2023-04-18 23:34:37'),
(325, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:34:38', '2023-04-18 23:34:38'),
(326, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:34:42', '2023-04-18 23:34:42'),
(327, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:34:45', '2023-04-18 23:34:45'),
(328, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"4\"}', '2023-04-18 23:34:49', '2023-04-18 23:34:49'),
(329, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:35:20', '2023-04-18 23:35:20'),
(330, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e1y l\\u1ecdc kh\\u00f4ng kh\\u00ed Xiaomi Air Purifier 4 Lite\",\"price\":\"2690000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"8\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products?&page=4\"}', '2023-04-18 23:36:21', '2023-04-18 23:36:21'),
(331, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:36:22', '2023-04-18 23:36:22'),
(332, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e1y l\\u1ecdc kh\\u00f4ng kh\\u00ed Xiaomi Air Purifier 4 Compact\",\"price\":\"1790000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"8\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:36:56', '2023-04-18 23:36:56'),
(333, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:36:57', '2023-04-18 23:36:57'),
(334, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e1y h\\u00fat b\\u1ee5i Dyson V12 Detect Slim Total Clean\",\"price\":\"20990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"8\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:37:29', '2023-04-18 23:37:29'),
(335, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:37:29', '2023-04-18 23:37:29'),
(336, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e1y chi\\u1ebfu mini Beecube X2 Max Gen 3 Full HD 1080P\",\"price\":\"3790000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"8\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:37:53', '2023-04-18 23:37:53'),
(337, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:37:53', '2023-04-18 23:37:53'),
(338, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e1y l\\u1ecdc kh\\u00f4ng kh\\u00ed Vsmart 35la5400\",\"price\":\"2090000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"8\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:38:28', '2023-04-18 23:38:28'),
(339, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:38:29', '2023-04-18 23:38:29'),
(340, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e1y l\\u1ecdc kh\\u00f4ng kh\\u00ed k\\u1ebft h\\u1ee3p qu\\u1ea1t LG Puricare AeroTower FS15GPBF0\",\"price\":\"19990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"8\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:38:55', '2023-04-18 23:38:55'),
(341, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:38:55', '2023-04-18 23:38:55'),
(342, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Robot h\\u00fat b\\u1ee5i lau nh\\u00e0 t\\u1ef1 \\u0111\\u1ed9ng l\\u00e0m s\\u1ea1ch Roborock S7 MaxV Ultra\",\"price\":\"23990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"8\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:39:31', '2023-04-18 23:39:31'),
(343, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:39:31', '2023-04-18 23:39:31'),
(344, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Robot h\\u00fat b\\u1ee5i Xiaomi Vaccum Mop 2\",\"price\":\"6390000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"8\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:40:02', '2023-04-18 23:40:02'),
(345, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:40:03', '2023-04-18 23:40:03'),
(346, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e1y h\\u00fat b\\u1ee5i c\\u1ea7m tay Roborock Dyad Pro\",\"price\":\"12490000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"8\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:40:33', '2023-04-18 23:40:33'),
(347, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:40:33', '2023-04-18 23:40:33'),
(348, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"M\\u00e1y chi\\u1ebfu Mini Wanbo T2R Max Full HD\",\"price\":\"4090000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"8\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\"}', '2023-04-18 23:41:06', '2023-04-18 23:41:06'),
(349, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-04-18 23:41:06', '2023-04-18 23:41:06'),
(350, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-18 23:41:56', '2023-04-18 23:41:56'),
(351, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe kh\\u00f4ng d\\u00e2y Samsung Galaxy Buds2\",\"price\":\"1390000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2023-04-18 23:42:32', '2023-04-18 23:42:32'),
(352, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:42:32', '2023-04-18 23:42:32'),
(353, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe kh\\u00f4ng d\\u00e2y Havit TW 967\",\"price\":\"250000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:42:54', '2023-04-18 23:42:54'),
(354, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:42:54', '2023-04-18 23:42:54'),
(355, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe Bluetooth Apple AirPods Pro 2022 | Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"6090000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:43:22', '2023-04-18 23:43:22'),
(356, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:43:23', '2023-04-18 23:43:23'),
(357, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe kh\\u00f4ng d\\u00e2y Marshall Minor 3\",\"price\":\"2990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:43:45', '2023-04-18 23:43:45'),
(358, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:43:46', '2023-04-18 23:43:46'),
(359, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe kh\\u00f4ng d\\u00e2y True Wireless JBL Live Pro 2\",\"price\":\"2990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:44:09', '2023-04-18 23:44:09'),
(360, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:44:10', '2023-04-18 23:44:10'),
(361, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe Bluetooth Apple AirPods 2 VN\\/A\",\"price\":\"2790000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:44:34', '2023-04-18 23:44:34'),
(362, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:44:34', '2023-04-18 23:44:34'),
(363, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe Bluetooth Apple AirPods 3 MagSafe | Ch\\u00ednh h\\u00e3ng Apple Vi\\u1ec7t Nam\",\"price\":\"4590000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:44:55', '2023-04-18 23:44:55'),
(364, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:44:56', '2023-04-18 23:44:56'),
(365, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe ch\\u1ee5p tai Sony WH-1000XM5\",\"price\":\"7990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:45:16', '2023-04-18 23:45:16'),
(366, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:45:16', '2023-04-18 23:45:16'),
(367, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe kh\\u00f4ng d\\u00e2y Samsung Galaxy Buds Pro\",\"price\":\"2690000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:45:41', '2023-04-18 23:45:41'),
(368, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:45:41', '2023-04-18 23:45:41'),
(369, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe kh\\u00f4ng d\\u00e2y Samsung Galaxy Buds Live\",\"price\":\"1090000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:46:07', '2023-04-18 23:46:07'),
(370, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:46:07', '2023-04-18 23:46:07'),
(371, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe kh\\u00f4ng d\\u00e2y Samsung Galaxy Buds2 Pro\",\"price\":\"4790000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:46:30', '2023-04-18 23:46:30'),
(372, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:46:31', '2023-04-18 23:46:31'),
(373, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe Bluetooth Havit TW945\",\"price\":\"290000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:46:49', '2023-04-18 23:46:49'),
(374, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:46:50', '2023-04-18 23:46:50'),
(375, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe ch\\u1ee5p tai Sony WH-1000XM4\",\"price\":\"6490000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:47:11', '2023-04-18 23:47:11'),
(376, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:47:11', '2023-04-18 23:47:11'),
(377, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe Bluetooth JBL T115BT\",\"price\":\"390000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:47:29', '2023-04-18 23:47:29'),
(378, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:47:29', '2023-04-18 23:47:29'),
(379, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Tai nghe kh\\u00f4ng d\\u00e2y Redmi Buds 4 Lite\",\"price\":\"690000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"5\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:48:08', '2023-04-18 23:48:08'),
(380, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:48:09', '2023-04-18 23:48:09'),
(381, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Apple Watch Series 8 41mm GPS vi\\u1ec1n nh\\u00f4m | Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"9050000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:49:31', '2023-04-18 23:49:31'),
(382, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:49:31', '2023-04-18 23:49:31'),
(383, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Apple Watch Series 7 41mm (GPS) Vi\\u1ec1n nh\\u00f4m d\\u00e2y cao su | Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"7890000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:49:49', '2023-04-18 23:49:49'),
(384, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:49:50', '2023-04-18 23:49:50'),
(385, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Apple Watch SE 44mm (GPS) Vi\\u1ec1n Nh\\u00f4m - D\\u00e2y Cao Su | Ch\\u00ednh H\\u00e3ng VN\\/A\",\"price\":\"6090000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:50:18', '2023-04-18 23:50:18'),
(386, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:50:18', '2023-04-18 23:50:18'),
(387, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Apple Watch SE 44mm (4G) Vi\\u1ec1n Nh\\u00f4m - D\\u00e2y Cao Su | Ch\\u00ednh H\\u00e3ng VN\\/A\",\"price\":\"5990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:50:42', '2023-04-18 23:50:42'),
(388, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:50:42', '2023-04-18 23:50:42'),
(389, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Apple Watch SE 2022 40mm | Ch\\u00ednh H\\u00e3ng VN\\/A\",\"price\":\"6290000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:51:17', '2023-04-18 23:51:17'),
(390, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:51:17', '2023-04-18 23:51:17'),
(391, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Apple Watch SE 2022 44mm | Ch\\u00ednh h\\u00e3ng VN\\/A\",\"price\":\"6790000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:51:34', '2023-04-18 23:51:34'),
(392, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:51:34', '2023-04-18 23:51:34'),
(393, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"\\u0110\\u1ed3ng h\\u1ed3 th\\u00f4ng minh Amazfit GTS 4 Mini\",\"price\":\"2390000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:52:01', '2023-04-18 23:52:01'),
(394, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:52:02', '2023-04-18 23:52:02'),
(395, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"\\u0110\\u1ed3ng h\\u1ed3 th\\u00f4ng minh Huawei Watch GT3 Pro d\\u00e2y silicone\",\"price\":\"6990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:52:26', '2023-04-18 23:52:26'),
(396, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:52:27', '2023-04-18 23:52:27'),
(397, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"\\u0110\\u1ed3ng h\\u1ed3 th\\u00f4ng minh Huawei Watch GT3 46mm d\\u00e2y da\",\"price\":\"5390000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:52:50', '2023-04-18 23:52:50'),
(398, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:52:50', '2023-04-18 23:52:50'),
(399, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"\\u0110\\u1ed3ng h\\u1ed3 th\\u00f4ng minh Huawei Watch Buds\",\"price\":\"9490000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:53:15', '2023-04-18 23:53:15'),
(400, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:53:15', '2023-04-18 23:53:15'),
(401, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"V\\u00f2ng \\u0111eo tay th\\u00f4ng minh Huawei Band 7\",\"price\":\"899000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:53:38', '2023-04-18 23:53:38'),
(402, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:53:38', '2023-04-18 23:53:38'),
(403, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"\\u0110\\u1ed3ng h\\u1ed3 th\\u00f4ng minh Xiaomi Watch S1 Pro\",\"price\":\"5790000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:54:04', '2023-04-18 23:54:04'),
(404, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:54:04', '2023-04-18 23:54:04'),
(405, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"\\u0110\\u1ed3ng h\\u1ed3 th\\u00f4ng minh Xiaomi Watch S1 Active\",\"price\":\"2990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:54:30', '2023-04-18 23:54:30'),
(406, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:54:30', '2023-04-18 23:54:30'),
(407, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"\\u0110\\u1ed3ng h\\u1ed3 th\\u00f4ng minh Xiaomi Redmi Watch 2 Lite\",\"price\":\"1190000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:54:55', '2023-04-18 23:54:55'),
(408, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:54:55', '2023-04-18 23:54:55'),
(409, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"V\\u00f2ng \\u0111eo tay th\\u00f4ng minh Xiaomi Mi Band 7\",\"price\":\"990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"6\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:55:21', '2023-04-18 23:55:21'),
(410, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:55:21', '2023-04-18 23:55:21'),
(411, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Smart Tivi Khung Tranh The Frame 4K Samsung LTV 50 inch 50LS03BA\",\"price\":\"18900000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:55:53', '2023-04-18 23:55:53'),
(412, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:55:54', '2023-04-18 23:55:54'),
(413, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Android Tivi Xiaomi P1 55 inch\",\"price\":\"8490000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:56:17', '2023-04-18 23:56:17'),
(414, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:56:17', '2023-04-18 23:56:17'),
(415, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Android Tivi Xiaomi P1 43 inch\",\"price\":\"5990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:56:35', '2023-04-18 23:56:35'),
(416, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:56:36', '2023-04-18 23:56:36'),
(417, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Smart Tivi Khung Tranh The Frame 4K Samsung LTV 65 inch 65LS03BA\",\"price\":\"29500000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:57:00', '2023-04-18 23:57:00'),
(418, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:57:01', '2023-04-18 23:57:01'),
(419, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Smart Tivi Samsung 4K 55 inch UA55AU7002\",\"price\":\"9890000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:57:41', '2023-04-18 23:57:41'),
(420, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:57:41', '2023-04-18 23:57:41'),
(421, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Smart Tivi Samsung 4K 50 inch UA50AU7002\",\"price\":\"8390000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:58:04', '2023-04-18 23:58:04'),
(422, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:58:05', '2023-04-18 23:58:05'),
(423, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Smart Tivi Samsung 4K 65 inch UA65AU7002\",\"price\":\"12990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:58:36', '2023-04-18 23:58:36'),
(424, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:58:36', '2023-04-18 23:58:36'),
(425, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Smart Tivi Coocaa FHD 43 inch Wifi 43S3U\",\"price\":\"3990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:58:57', '2023-04-18 23:58:57'),
(426, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:58:57', '2023-04-18 23:58:57'),
(427, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Android Tivi Xiaomi A2 58 inch\",\"price\":\"9190000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-18 23:59:43', '2023-04-18 23:59:43'),
(428, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-18 23:59:44', '2023-04-18 23:59:44'),
(429, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Android Tivi Xiaomi A2 43 inch\",\"price\":\"5490000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-19 00:00:09', '2023-04-19 00:00:09'),
(430, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-19 00:00:09', '2023-04-19 00:00:09'),
(431, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Smart Tivi Coocaa HD 32 inch WIFI 32S3U\",\"price\":\"2990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-19 00:00:27', '2023-04-19 00:00:27'),
(432, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-19 00:00:27', '2023-04-19 00:00:27'),
(433, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Smart Tivi Samsung QLED 65 inch 65Q60BAK\",\"price\":\"15990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-19 00:00:53', '2023-04-19 00:00:53'),
(434, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-19 00:00:53', '2023-04-19 00:00:53'),
(435, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Google Tivi Toshiba 55 inch 4K HDR 55C350LP\",\"price\":\"9990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-19 00:01:16', '2023-04-19 00:01:16'),
(436, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-19 00:01:17', '2023-04-19 00:01:17'),
(437, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Google Tivi Toshiba 50 inch 4K HDR 50C350LP\",\"price\":\"8990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-19 00:04:17', '2023-04-19 00:04:17'),
(438, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-19 00:04:17', '2023-04-19 00:04:17'),
(439, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Smart Tivi Sony 4K 55 inch KD-55X75K VN3\",\"price\":\"11990000\",\"quantity\":\"1\",\"status\":\"on\",\"category_id\":\"7\",\"_token\":\"S7GQRaDTflVf79BmGa8XUFlVVlpsf4urIwbc6GU9\",\"after-save\":\"2\"}', '2023-04-19 00:04:40', '2023-04-19 00:04:40'),
(440, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2023-04-19 00:04:41', '2023-04-19 00:04:41'),
(441, 1, 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-19 00:09:34', '2023-04-19 00:09:34'),
(442, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-19 08:17:32', '2023-04-19 08:17:32'),
(443, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-20 10:10:38', '2023-04-20 10:10:38'),
(444, 1, 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-20 10:10:43', '2023-04-20 10:10:43'),
(445, 1, 'admin/banners/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-20 10:10:49', '2023-04-20 10:10:49'),
(446, 1, 'admin/banners', 'POST', '127.0.0.1', '{\"name\":\"SONY WH-1000XM5\",\"_token\":\"VjtSBkjTjTckDbIxPv6R6RBdw1btUaJBl00EUkA5\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/banners\"}', '2023-04-20 10:12:14', '2023-04-20 10:12:14'),
(447, 1, 'admin/banners/create', 'GET', '127.0.0.1', '[]', '2023-04-20 10:12:14', '2023-04-20 10:12:14'),
(448, 1, 'admin/banners', 'POST', '127.0.0.1', '{\"name\":\"MUA COMBO APPLE\",\"_token\":\"VjtSBkjTjTckDbIxPv6R6RBdw1btUaJBl00EUkA5\"}', '2023-04-20 10:12:37', '2023-04-20 10:12:37'),
(449, 1, 'admin/banners', 'GET', '127.0.0.1', '[]', '2023-04-20 10:12:37', '2023-04-20 10:12:37'),
(450, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-04-20 22:51:29', '2023-04-20 22:51:29'),
(451, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-20 22:51:37', '2023-04-20 22:51:37'),
(452, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-04-20 22:56:28', '2023-04-20 22:56:28'),
(453, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-04-20 22:56:28', '2023-04-20 22:56:28'),
(454, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-05-22 21:18:12', '2023-05-22 21:18:12'),
(455, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-22 21:18:17', '2023-05-22 21:18:17'),
(456, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-22 21:18:27', '2023-05-22 21:18:27'),
(457, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-22 21:18:34', '2023-05-22 21:18:34'),
(458, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-22 21:19:37', '2023-05-22 21:19:37'),
(459, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-22 21:20:13', '2023-05-22 21:20:13'),
(460, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-22 21:20:27', '2023-05-22 21:20:27'),
(461, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2023-05-22 21:21:59', '2023-05-22 21:21:59'),
(462, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-22 21:22:07', '2023-05-22 21:22:07'),
(463, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-22 21:23:53', '2023-05-22 21:23:53'),
(464, 1, 'admin/categories/uploads', 'GET', '127.0.0.1', '[]', '2023-05-22 21:23:53', '2023-05-22 21:23:53'),
(465, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"name\":\"Laptop\",\"images\":\"images\\/iPhone 11 64GB.jpg\",\"_token\":\"2Zp3JuJE40mqRueS4i74OWY4u4Vf6NWnEj60o9P9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-05-22 21:23:58', '2023-05-22 21:23:58'),
(466, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-22 21:23:58', '2023-05-22 21:23:58'),
(467, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-22 21:26:29', '2023-05-22 21:26:29'),
(468, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-23 01:21:11', '2023-05-23 01:21:11'),
(469, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:21:20', '2023-05-23 01:21:20'),
(470, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"name\":\"Laptop\",\"images\":\"iPhone 11 64GB.jpg\",\"_token\":\"OQVbWrE3Yz8sRTsNnTLQnHXnfTDTIl7IyWUCGfFf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-05-23 01:21:27', '2023-05-23 01:21:27'),
(471, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-23 01:21:28', '2023-05-23 01:21:28'),
(472, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:21:42', '2023-05-23 01:21:42'),
(473, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:22:03', '2023-05-23 01:22:03'),
(474, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:22:08', '2023-05-23 01:22:08'),
(475, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"name\":\"Laptop\",\"_token\":\"OQVbWrE3Yz8sRTsNnTLQnHXnfTDTIl7IyWUCGfFf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-05-23 01:22:21', '2023-05-23 01:22:21'),
(476, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-23 01:22:21', '2023-05-23 01:22:21'),
(477, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:28:55', '2023-05-23 01:28:55'),
(478, 1, 'admin/categories/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:29:45', '2023-05-23 01:29:45'),
(479, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:29:48', '2023-05-23 01:29:48'),
(480, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-23 01:29:51', '2023-05-23 01:29:51'),
(481, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-23 01:30:48', '2023-05-23 01:30:48'),
(482, 1, 'admin/categories/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:31:59', '2023-05-23 01:31:59'),
(483, 1, 'admin/categories/uploads', 'GET', '127.0.0.1', '[]', '2023-05-23 01:32:00', '2023-05-23 01:32:00'),
(484, 1, 'admin/categories/2', 'PUT', '127.0.0.1', '{\"name\":\"SmartPhone\",\"_token\":\"OQVbWrE3Yz8sRTsNnTLQnHXnfTDTIl7IyWUCGfFf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-05-23 01:32:08', '2023-05-23 01:32:08'),
(485, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-23 01:32:08', '2023-05-23 01:32:08'),
(486, 1, 'admin/categories/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:32:14', '2023-05-23 01:32:14'),
(487, 1, 'admin/categories/uploads', 'GET', '127.0.0.1', '[]', '2023-05-23 01:32:15', '2023-05-23 01:32:15'),
(488, 1, 'admin/categories/3', 'PUT', '127.0.0.1', '{\"name\":\"M\\u00e0n H\\u00ecnh\",\"_token\":\"OQVbWrE3Yz8sRTsNnTLQnHXnfTDTIl7IyWUCGfFf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-05-23 01:32:22', '2023-05-23 01:32:22'),
(489, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-23 01:32:23', '2023-05-23 01:32:23'),
(490, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:32:33', '2023-05-23 01:32:33'),
(491, 1, 'admin/categories/uploads', 'GET', '127.0.0.1', '[]', '2023-05-23 01:32:33', '2023-05-23 01:32:33'),
(492, 1, 'admin/categories/4', 'PUT', '127.0.0.1', '{\"name\":\"M\\u00e1y T\\u00ednh B\\u1ea3ng\",\"_token\":\"OQVbWrE3Yz8sRTsNnTLQnHXnfTDTIl7IyWUCGfFf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-05-23 01:32:39', '2023-05-23 01:32:39'),
(493, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-23 01:32:39', '2023-05-23 01:32:39'),
(494, 1, 'admin/categories/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:32:44', '2023-05-23 01:32:44'),
(495, 1, 'admin/categories/uploads', 'GET', '127.0.0.1', '[]', '2023-05-23 01:32:45', '2023-05-23 01:32:45'),
(496, 1, 'admin/categories/5', 'PUT', '127.0.0.1', '{\"name\":\"Tai Nghe\",\"_token\":\"OQVbWrE3Yz8sRTsNnTLQnHXnfTDTIl7IyWUCGfFf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-05-23 01:32:49', '2023-05-23 01:32:49'),
(497, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-23 01:32:50', '2023-05-23 01:32:50'),
(498, 1, 'admin/categories/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:32:54', '2023-05-23 01:32:54'),
(499, 1, 'admin/categories/uploads', 'GET', '127.0.0.1', '[]', '2023-05-23 01:32:55', '2023-05-23 01:32:55'),
(500, 1, 'admin/categories/6', 'PUT', '127.0.0.1', '{\"name\":\"\\u0110\\u1ed3ng H\\u1ed3 Th\\u00f4ng Minh\",\"_token\":\"OQVbWrE3Yz8sRTsNnTLQnHXnfTDTIl7IyWUCGfFf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-05-23 01:33:06', '2023-05-23 01:33:06'),
(501, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-23 01:33:06', '2023-05-23 01:33:06'),
(502, 1, 'admin/categories/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:33:13', '2023-05-23 01:33:13'),
(503, 1, 'admin/categories/uploads', 'GET', '127.0.0.1', '[]', '2023-05-23 01:33:14', '2023-05-23 01:33:14'),
(504, 1, 'admin/categories/7', 'PUT', '127.0.0.1', '{\"name\":\"Tivi\",\"_token\":\"OQVbWrE3Yz8sRTsNnTLQnHXnfTDTIl7IyWUCGfFf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-05-23 01:36:00', '2023-05-23 01:36:00'),
(505, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-23 01:36:00', '2023-05-23 01:36:00'),
(506, 1, 'admin/categories/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 01:36:05', '2023-05-23 01:36:05'),
(507, 1, 'admin/categories/uploads', 'GET', '127.0.0.1', '[]', '2023-05-23 01:36:05', '2023-05-23 01:36:05'),
(508, 1, 'admin/categories/8', 'PUT', '127.0.0.1', '{\"name\":\"Nh\\u00e0 Th\\u00f4ng Minh\",\"_token\":\"OQVbWrE3Yz8sRTsNnTLQnHXnfTDTIl7IyWUCGfFf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2023-05-23 01:36:15', '2023-05-23 01:36:15'),
(509, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2023-05-23 01:36:15', '2023-05-23 01:36:15'),
(510, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-05-23 02:49:21', '2023-05-23 02:49:21'),
(511, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-05-23 03:03:37', '2023-05-23 03:03:37'),
(512, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 03:03:42', '2023-05-23 03:03:42'),
(513, 1, 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 03:03:51', '2023-05-23 03:03:51'),
(514, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-05-23 10:00:12', '2023-05-23 10:00:12'),
(515, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 10:00:40', '2023-05-23 10:00:40'),
(516, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-05-23 21:46:07', '2023-05-23 21:46:07'),
(517, 1, 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 21:46:15', '2023-05-23 21:46:15'),
(518, 1, 'admin/banners/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 21:46:22', '2023-05-23 21:46:22'),
(519, 1, 'admin/banners/2', 'PUT', '127.0.0.1', '{\"name\":\"IPHONE 14 PRO Gi\\u00e1 t\\u1ed1t b\\u1ea5t ng\\u1edd\",\"_token\":\"orFrKEvDxE7TALFo9NtimzvHt0ZnijZknke2ZV3n\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/banners\"}', '2023-05-23 21:46:34', '2023-05-23 21:46:34'),
(520, 1, 'admin/banners', 'GET', '127.0.0.1', '[]', '2023-05-23 21:46:34', '2023-05-23 21:46:34'),
(521, 1, 'admin/banners/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 21:46:54', '2023-05-23 21:46:54'),
(522, 1, 'admin/banners/3', 'PUT', '127.0.0.1', '{\"name\":\"SONY WH-1000XM5\",\"_token\":\"orFrKEvDxE7TALFo9NtimzvHt0ZnijZknke2ZV3n\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/banners\"}', '2023-05-23 21:47:05', '2023-05-23 21:47:05'),
(523, 1, 'admin/banners', 'GET', '127.0.0.1', '[]', '2023-05-23 21:47:05', '2023-05-23 21:47:05'),
(524, 1, 'admin/banners/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-05-23 21:47:09', '2023-05-23 21:47:09'),
(525, 1, 'admin/banners/4', 'PUT', '127.0.0.1', '{\"name\":\"MUA COMBO APPLE\",\"_token\":\"orFrKEvDxE7TALFo9NtimzvHt0ZnijZknke2ZV3n\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/banners\"}', '2023-05-23 21:47:16', '2023-05-23 21:47:16'),
(526, 1, 'admin/banners', 'GET', '127.0.0.1', '[]', '2023-05-23 21:47:16', '2023-05-23 21:47:16'),
(527, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-22 20:14:01', '2023-10-22 20:14:01'),
(528, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-10-22 20:14:08', '2023-10-22 20:14:08'),
(529, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-10-22 20:14:23', '2023-10-22 20:14:23'),
(530, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"admin\",\"email\":\"thaihieudz@gmail.com\",\"phone\":\"0382704938\",\"email_verified_at\":\"2023-10-23 03:14:23\",\"password\":\"hieu1808\",\"remember_token\":null,\"_token\":\"MHMWqj8COGJ7qlX4vebv7VlSAl4m9rYCBCJQrfxY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/users\"}', '2023-10-22 20:14:50', '2023-10-22 20:14:50'),
(531, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2023-10-22 20:14:51', '2023-10-22 20:14:51'),
(532, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-22 20:15:26', '2023-10-22 20:15:26'),
(533, 1, 'admin/users/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-10-22 20:15:48', '2023-10-22 20:15:48'),
(534, 1, 'admin/users/3', 'PUT', '127.0.0.1', '{\"name\":\"Minh\",\"email\":\"minh@gmail.com\",\"phone\":\"0962424917\",\"email_verified_at\":\"2023-10-23 03:15:48\",\"password\":\"hieu1808\",\"remember_token\":null,\"_token\":\"05um5KlTkg2MnXjZHPHEli4IlnRXVFsDQyCp2LDm\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/users\"}', '2023-10-22 20:16:01', '2023-10-22 20:16:01'),
(535, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2023-10-22 20:16:02', '2023-10-22 20:16:02'),
(536, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-22 20:16:32', '2023-10-22 20:16:32'),
(537, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-10-22 20:16:44', '2023-10-22 20:16:44'),
(538, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-10-22 20:16:45', '2023-10-22 20:16:45'),
(539, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-10-22 20:16:53', '2023-10-22 20:16:53'),
(540, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-10-22 20:16:57', '2023-10-22 20:16:57'),
(541, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-22 20:18:37', '2023-10-22 20:18:37'),
(542, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-10-22 20:18:42', '2023-10-22 20:18:42'),
(543, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-11-10 08:30:05', '2023-11-10 08:30:05'),
(544, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-11-10 08:30:23', '2023-11-10 08:30:23'),
(545, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-11-10 08:30:57', '2023-11-10 08:30:57'),
(546, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-11-10 08:31:48', '2023-11-10 08:31:48'),
(547, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-11-10 08:32:30', '2023-11-10 08:32:30'),
(548, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-11-10 19:44:39', '2023-11-10 19:44:39'),
(549, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-11-10 19:44:43', '2023-11-10 19:44:43'),
(550, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-11-20 20:02:07', '2023-11-20 20:02:07'),
(551, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-11-20 20:03:19', '2023-11-20 20:03:19'),
(552, 1, 'admin/banners', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-11-20 20:04:13', '2023-11-20 20:04:13'),
(553, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-11-20 20:04:22', '2023-11-20 20:04:22'),
(554, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-11-20 20:04:26', '2023-11-20 20:04:26');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(555, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-11-20 20:11:37', '2023-11-20 20:11:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `http_method` varchar(255) DEFAULT NULL,
  `http_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2023-04-06 07:17:26', '2023-04-06 07:17:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 8, NULL, NULL),
(1, 9, NULL, NULL),
(1, 10, NULL, NULL),
(1, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) NOT NULL,
  `password` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$RBRB4I17psAXNA6m2zYNnu5s5SLNXkQsHko8umDGazqCfHq4VaOQe', 'Administrator', NULL, 'cm79neooy9KvOlbSwIQRrLmyvbWPZP8BBJRYACC9XsjdfZxDdgP5sJu7SIga', '2023-04-06 07:17:26', '2023-04-06 07:17:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `name`, `img`, `created_at`, `updated_at`) VALUES
(2, 'IPHONE 14 PRO Giá tốt bất ngờ', 'images/banner-20200131075945_0ab9acddca024f60a44e7814b352fce1.webp', '2023-04-18 09:35:23', '2023-05-23 21:46:34'),
(3, 'SONY WH-1000XM5', 'images/banner-la-gi.jpg', '2023-04-20 10:12:14', '2023-05-23 21:47:05'),
(4, 'MUA COMBO APPLE', 'images/ttip11-15-4.jpg', '2023-04-20 10:12:37', '2023-05-23 21:47:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `images`) VALUES
(1, 'Laptop', '2023-04-06 07:50:49', '2023-05-23 01:22:21', 'files/laptop.png'),
(2, 'SmartPhone', '2023-04-06 07:51:04', '2023-05-23 01:32:08', 'files/smartphone.png'),
(3, 'Màn Hình', '2023-04-06 07:51:52', '2023-05-23 01:32:23', 'files/display.png'),
(4, 'Máy Tính Bảng', '2023-04-06 07:52:16', '2023-05-23 01:32:39', 'files/tablet.png'),
(5, 'Tai Nghe', '2023-04-06 07:52:30', '2023-05-23 01:32:49', 'files/headphone.png'),
(6, 'Đồng Hồ Thông Minh', '2023-04-06 07:52:50', '2023-05-23 01:33:06', 'files/watch.png'),
(7, 'Tivi', '2023-04-06 07:53:00', '2023-05-23 01:36:00', 'files/tivi.webp'),
(8, 'Nhà Thông Minh', '2023-04-06 07:53:16', '2023-05-23 01:36:15', 'files/homeai.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_04_06_141857_create_categories_table', 2),
(7, '2023_04_06_141916_create_products_table', 2),
(8, '2023_04_18_155138_create_banners_table', 3),
(9, '2023_04_21_053238_create_productdetails_table', 4),
(11, '2023_05_23_034633_edit_news_table', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `quantity`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(3, 'iPhone 11 64GB I Chính hãng VN/A', 'images/iPhone 11 64GB.jpg', '10490000', 5, 1, 2, '2023-04-06 08:14:41', '2023-04-06 08:23:50'),
(4, 'iPhone 11 128GB I Chính hãng VN/A', 'images/iPhone 11 128GB.jpg', '12190000', 5, 1, 2, '2023-04-06 08:29:12', '2023-04-06 08:29:12'),
(5, 'iPhone 12 64GB I Chính hãng VN/A', 'images/iPhone 12 64GB.jpg', '14690000', 5, 1, 2, '2023-04-06 08:29:48', '2023-04-06 08:29:48'),
(6, 'iPhone 12 128GB I Chính hãng VN/A', 'images/iPhone 12 128GB.jpg', '15990000', 5, 1, 2, '2023-04-06 08:30:21', '2023-04-06 08:30:21'),
(7, 'iPhone 12 Pro Max 128GB I Chính hãng VN/A', 'images/iPhone 12 Pro Max 128GB.jpg', '23490000', 5, 1, 2, '2023-04-06 08:31:10', '2023-04-06 08:31:10'),
(8, 'iPhone 13 128GB | Chính hãng VN/A', 'images/iPhone 13 128GB.jpg', '16990000', 5, 1, 2, '2023-04-06 08:31:50', '2023-04-06 08:31:50'),
(9, 'iPhone 13 Pro Max 128GB | Chính hãng VN/A', 'images/iPhone 13 Pro Max 128GB.jpg', '25490000', 5, 1, 2, '2023-04-06 08:32:19', '2023-04-06 08:32:19'),
(10, 'iPhone 14 128GB | Chính hãng VN/A', 'images/iPhone 14 128GB.jpg', '19490000', 5, 1, 2, '2023-04-06 08:32:44', '2023-04-06 08:32:44'),
(11, 'iPhone 14 Pro 128GB | Chính hãng VN/A', 'images/iPhone 14 Pro 128GB.jpg', '25290000', 1, 1, 2, '2023-04-06 08:33:22', '2023-04-06 08:33:22'),
(12, 'iPhone 14 Pro Max 128GB | Chính hãng VN/A', 'images/iPhone 14 Pro Max 128GB.jpg', '27150000', 1, 1, 2, '2023-04-06 08:34:47', '2023-04-06 08:34:47'),
(13, 'iPhone 14 Pro Max 256GB | Chính hãng VN/A', 'images/iPhone 14 Pro Max 256GB.jpg', '30290000', 1, 1, 2, '2023-04-06 08:35:15', '2023-04-06 08:35:15'),
(14, 'OPPO Find N2 Flip', 'images/OPPO Find N2 Flip.jpg', '19990000', 1, 1, 2, '2023-04-06 08:35:46', '2023-04-06 08:35:46'),
(15, 'OPPO Reno8 T 5G (8GB - 128GB)', 'images/OPPO Reno8 T 5G (8GB - 128GB).jpg', '8490000', 1, 1, 2, '2023-04-06 08:36:12', '2023-04-06 08:36:12'),
(16, 'Samsung Galaxy A34 5G 8GB 128GB', 'images/Samsung Galaxy A34 5G 8GB 128GB.jpg', '6790000', 1, 1, 2, '2023-04-06 08:36:46', '2023-04-06 08:36:46'),
(17, 'Samsung Galaxy S23 8GB 256GB', 'images/Samsung Galaxy S23 8GB 256GB.jpg', '19990000', 1, 1, 2, '2023-04-06 08:37:14', '2023-04-06 08:37:14'),
(18, 'Samsung Galaxy S23 Ultra 256GB', 'images/Samsung Galaxy S23 Ultra 256GB.jpg', '23890000', 1, 1, 2, '2023-04-06 08:37:45', '2023-04-06 08:37:45'),
(19, 'Xiaomi 13 8GB 256GB', 'images/Xiaomi 13 8GB 256GB.jpg', '22090000', 1, 1, 2, '2023-04-06 08:38:11', '2023-04-06 08:38:11'),
(20, 'Xiaomi Redmi Note 11 128GB', 'images/Xiaomi Redmi Note 11 128GB.jpg', '4090000', 1, 1, 2, '2023-04-06 08:38:48', '2023-04-06 08:38:48'),
(21, 'Xiaomi Redmi Note 11 Pro', 'images/Xiaomi Redmi Note 11 Pro.jpg', '6090000', 1, 1, 2, '2023-04-06 08:39:29', '2023-04-06 08:39:29'),
(22, 'Xiaomi Redmi Note 12', 'images/Xiaomi Redmi Note 12.jpg', '4990000', 1, 1, 2, '2023-04-06 08:39:57', '2023-04-06 08:39:57'),
(23, 'Laptop Lenovo Ideapad Gaming 3 15ARH7', 'images/thi_t_k_ch_a_c_t_n_3.webp', '21990000', 1, 1, 1, '2023-04-15 08:38:04', '2023-04-15 08:38:04'),
(24, 'Apple MacBook Air M1 256GB 2020 I Chính hãng Apple Việt Nam', 'images/air_m2.webp', '18590000', 1, 1, 1, '2023-04-15 08:38:47', '2023-04-15 08:38:47'),
(25, 'Laptop Lenovo Ideapad Gaming 3 15ARH7', 'images/1h47.webp', '23990000', 1, 1, 1, '2023-04-15 08:39:17', '2023-04-15 08:39:17'),
(26, 'Apple Macbook Air M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', 'images/macbook_air_m2.webp', '25690000', 1, 1, 1, '2023-04-15 08:40:24', '2023-04-15 08:40:24'),
(27, 'Laptop Asus Gaming Rog Strix G15 G513IH HN015W', 'images/4h43.webp', '18590000', 1, 1, 1, '2023-04-15 08:40:51', '2023-04-15 08:40:51'),
(28, 'Apple Macbook Pro 13 M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', 'images/pro-m2.webp', '28690000', 1, 1, 1, '2023-04-15 08:41:33', '2023-04-15 08:41:33'),
(29, 'Laptop Lenovo Ideapad Gaming 3 15IHU6 82K101B5VN', 'images/lap5h05.webp', '18990000', 1, 1, 1, '2023-04-15 08:42:02', '2023-04-15 08:42:02'),
(30, 'Laptop MSI Gaming GF63 10SC 804VN', 'images/9h26.webp', '17450000', 1, 1, 1, '2023-04-15 08:42:32', '2023-04-15 08:42:32'),
(31, 'Laptop Asus Vivobook X415EA BV451W', 'images/8_10_16.webp', '6990000', 1, 1, 1, '2023-04-15 08:43:09', '2023-04-15 08:43:09'),
(32, 'MacBook Pro 14 inch M2 Pro 2023 (10 CPU - 16 GPU - 16GB - 512GB)', 'images/m2_pro_14.webp', '48290000', 1, 1, 1, '2023-04-15 08:43:45', '2023-04-15 08:43:45'),
(33, 'Macbook Pro 14 inch 2021 | Chính hãng Apple Việt Nam', 'images/pro_2021.webp', '46990000', 1, 1, 1, '2023-04-15 08:44:18', '2023-04-15 08:44:18'),
(34, 'Apple Macbook Air M2 2022 16GB 256GB I Chính hãng Apple Việt Nam', 'images/air_m2_16gb.webp', '33490000', 1, 1, 1, '2023-04-15 08:44:59', '2023-04-15 08:44:59'),
(35, 'Laptop ASUS Gaming TUF FX506LHB-HN188W', 'images/5h03_1.webp', '16790000', 1, 1, 1, '2023-04-15 08:46:02', '2023-04-15 08:46:02'),
(36, 'Laptop Dell Inspiron 3511 5829BLK', 'images/text_ng_n_3__1_71.webp', '13490000', 1, 1, 1, '2023-04-15 08:46:25', '2023-04-15 08:46:25'),
(37, 'Laptop ASUS VivoBook 15X A1503ZA-L1422W', 'images/gaming_003_5__4.webp', '17990000', 1, 1, 1, '2023-04-15 08:47:19', '2023-04-15 08:47:19'),
(38, 'Laptop ASUS TUF Gaming F15 FX506HC-HN144W', 'images/5h53.webp', '19890000', 1, 1, 1, '2023-04-15 08:47:49', '2023-04-15 08:47:49'),
(39, 'Laptop HP Gaming Victus 15-FA0031DX 6503849', 'images/laptop-hp-gaming-victus-15-fa0031dx-6503849-6.webp', '16790000', 1, 1, 1, '2023-04-15 08:48:13', '2023-04-15 08:48:13'),
(40, 'Apple MacBook Pro 13 M2 2022 16GB 512GB I Chính hãng Apple Việt Nam', 'images/mac_pro_16gb.webp', '37790000', 1, 1, 1, '2023-04-15 08:48:33', '2023-04-15 08:48:33'),
(41, 'Apple Macbook Air M2 2022 8GB 512GB I Chính hãng Apple Việt Nam', 'images/air_m2_1.webp', '30790000', 1, 1, 1, '2023-04-15 08:48:57', '2023-04-15 08:48:57'),
(42, 'Màn hình Samsung LS24R350FZEXXV 23.8', 'images/group_179_1__1.webp', '2890000', 1, 1, 3, '2023-04-15 08:53:41', '2023-04-15 08:53:41'),
(43, 'Màn hình LG UltraWide 29WP60G 29 inch', 'images/2_63.webp', '5890000', 1, 1, 3, '2023-04-15 08:54:04', '2023-04-15 08:54:04'),
(44, 'Màn hình HKC MB24V9 24 inch', 'images/group_179_1.webp', '2490000', 1, 1, 3, '2023-04-15 08:54:42', '2023-04-15 08:54:42'),
(45, 'Màn hình LG 27 inch 27MP400', 'images/man-hinh-lg-27-inch-27mp400-1.webp', '3290000', 1, 1, 3, '2023-04-15 08:55:07', '2023-04-15 08:55:07'),
(46, 'Màn hình Gaming LG Ultragear 24GN650-B 24 inch', 'images/7_18_78.webp', '4190000', 1, 1, 3, '2023-04-15 08:55:37', '2023-04-15 08:55:37'),
(47, 'Màn hình Samsung LU28R550UQEXXV 28 inch', 'images/2_63_1.webp', '6990000', 1, 1, 3, '2023-04-15 08:56:04', '2023-04-15 08:56:04'),
(48, 'Màn hình LG Gaming 27 inch 27QN600', 'images/8_7_6.webp', '5890000', 1, 1, 3, '2023-04-15 08:57:13', '2023-04-15 08:57:13'),
(49, 'Màn hình Samsung Gaming Odyssey G32 LS27AG320NEXXV 27 inch', 'images/gaming_002_1.webp', '5390000', 1, 1, 3, '2023-04-15 08:57:37', '2023-04-15 08:57:37'),
(50, 'Màn hình Xiaomi Monitor 1C BHR4510GL 23.8 inch', 'images/1_85_6.webp', '3090000', 1, 1, 3, '2023-04-15 08:57:54', '2023-04-15 08:57:54'),
(51, 'Màn hình Dell UltraSharp 23.8 inch U2422H', 'images/1_85_5.webp', '6390000', 1, 1, 3, '2023-04-15 08:58:11', '2023-04-15 08:58:11'),
(52, 'Màn hình Xiaomi 27 inch RMMNT27NF', 'images/3_51_2.webp', '4490000', 1, 1, 3, '2023-04-15 08:58:34', '2023-04-15 08:58:34'),
(53, 'Màn hình LG 24QP500 24 inch', 'images/11_6_70.webp', '4690000', 1, 1, 3, '2023-04-15 08:58:52', '2023-04-15 08:58:52'),
(54, 'Màn hình thông minh Samsung LS32BM700UEXXV 32 inch', 'images/83_2.webp', '8090000', 1, 1, 3, '2023-04-15 08:59:24', '2023-04-15 08:59:24'),
(55, 'Màn hình Samsung Gaming Odyssey G3 LS24AG320NEXXV 24 inch', 'images/6_24_1.webp', '3690000', 1, 1, 3, '2023-04-15 08:59:43', '2023-04-15 08:59:43'),
(56, 'Màn hình cong Gaming HKC MG32K2Q 32 inch', 'images/group_259_2__1_1.webp', '6250000', 1, 1, 3, '2023-04-15 09:00:00', '2023-04-15 09:00:00'),
(57, 'Màn hình Asus TUF Gaming VG247Q1A 24 inch', 'images/18_2_111.webp', '3690000', 1, 1, 3, '2023-04-15 09:00:20', '2023-04-15 09:00:20'),
(58, 'Màn hình thông minh Samsung M8 UHD 32 inch', 'images/1_83_1.webp', '13490000', 1, 1, 3, '2023-04-15 09:00:40', '2023-04-15 09:00:40'),
(59, 'Macbook Pro 16 M1 Max 10 CPU - 32 GPU 32GB 1TB 2021', 'images/cl.webp', '80990000', 5, 1, 1, '2023-04-18 23:01:37', '2023-04-18 23:01:37'),
(60, 'Màn hình Gaming Asus VY249HE-W 24 inch', 'images/sas.webp', '3290000', 6, 1, 3, '2023-04-18 23:04:14', '2023-04-18 23:04:14'),
(61, 'Màn hình đồ họa di động Asus ProArt PA148CTV 14 inch', 'images/38_2_3.webp', '10390000', 1, 1, 3, '2023-04-18 23:05:24', '2023-04-18 23:05:24'),
(62, 'Màn hình Gaming Asus ROG Swift OLED PG27AQDM 27 inch', 'images/sadas.webp', '29990000', 1, 1, 3, '2023-04-18 23:06:34', '2023-04-18 23:06:34'),
(63, 'iPad Air 5 (2022) 64GB I Chính hãng Apple Việt Nam', 'images/1_253_3.webp', '14290000', 1, 1, 4, '2023-04-18 23:29:16', '2023-04-18 23:29:16'),
(64, 'iPad mini 6 WiFi 64GB | Chính hãng Apple Việt Nam', 'images/2.webp', '11890000', 1, 1, 4, '2023-04-18 23:29:37', '2023-04-18 23:29:37'),
(65, 'Samsung Galaxy Tab S8 Ultra 5G', 'images/3.webp', '24190000', 1, 1, 4, '2023-04-18 23:29:55', '2023-04-18 23:29:55'),
(66, 'iPad Gen 10 10.9 inch 2022 Wifi 64GB I Chính hãng Apple Việt Nam', 'images/4.webp', '10990000', 1, 1, 4, '2023-04-18 23:30:31', '2023-04-18 23:30:31'),
(67, 'iPad 10.2 2021 WiFi 64GB | Chính hãng Apple Việt Nam', 'images/5.webp', '7390000', 1, 1, 4, '2023-04-18 23:30:47', '2023-04-18 23:30:47'),
(68, 'iPad Pro 11 inch 2022 M2 Wifi 128GB I Chính hãng Apple Việt Nam', 'images/6.webp', '20990000', 1, 1, 4, '2023-04-18 23:31:05', '2023-04-18 23:31:05'),
(69, 'Samsung Galaxy Tab S8 WIFI', 'images/7.webp', '13390000', 1, 1, 4, '2023-04-18 23:31:23', '2023-04-18 23:31:23'),
(70, 'iPad Pro 11 2021 M1 WiFi 128GB I Chính hãng Apple Việt Nam', 'images/8.webp', '19990000', 1, 1, 4, '2023-04-18 23:31:45', '2023-04-18 23:31:45'),
(71, 'Xiaomi Pad 5', 'images/9.webp', '7990000', 1, 1, 4, '2023-04-18 23:32:26', '2023-04-18 23:32:26'),
(72, 'Samsung Galaxy Tab S8 5G', 'images/10.webp', '15290000', 1, 1, 4, '2023-04-18 23:32:45', '2023-04-18 23:32:45'),
(73, 'iPad Air 5 (2022) 256GB I Chính hãng Apple Việt Nam', 'images/11.webp', '18890000', 1, 1, 4, '2023-04-18 23:33:05', '2023-04-18 23:33:05'),
(74, 'Samsung Galaxy Tab S7 FE (4G)', 'images/12.webp', '9750000', 1, 1, 4, '2023-04-18 23:33:32', '2023-04-18 23:33:32'),
(75, 'Samsung Galaxy Tab A8 (2022)', 'images/13.webp', '6190000', 1, 1, 4, '2023-04-18 23:33:56', '2023-04-18 23:33:56'),
(76, 'iPad Air 4 (2020) 4G 256GB I Chính hãng Apple Việt Nam', 'images/14.webp', '17590000', 1, 1, 4, '2023-04-18 23:34:15', '2023-04-18 23:34:15'),
(77, 'iPad 10.2 2021 WiFi 256GB | Chính hãng Apple Việt Nam', 'images/15.webp', '11190000', 1, 1, 4, '2023-04-18 23:34:37', '2023-04-18 23:34:37'),
(78, 'Máy lọc không khí Xiaomi Air Purifier 4 Lite', 'images/ksp_v2.webp', '2690000', 1, 1, 8, '2023-04-18 23:36:21', '2023-04-18 23:36:21'),
(79, 'Máy lọc không khí Xiaomi Air Purifier 4 Compact', 'images/compact.webp', '1790000', 1, 1, 8, '2023-04-18 23:36:56', '2023-04-18 23:36:56'),
(80, 'Máy hút bụi Dyson V12 Detect Slim Total Clean', 'images/1_597.webp', '20990000', 1, 1, 8, '2023-04-18 23:37:29', '2023-04-18 23:37:29'),
(81, 'Máy chiếu mini Beecube X2 Max Gen 3 Full HD 1080P', 'images/may_chieu_beecube.webp', '3790000', 1, 1, 8, '2023-04-18 23:37:53', '2023-04-18 23:37:53'),
(82, 'Máy lọc không khí Vsmart 35la5400', 'images/may-loc-khong-khi-vsmart-35la5400_4.webp', '2090000', 1, 1, 8, '2023-04-18 23:38:28', '2023-04-18 23:38:28'),
(83, 'Máy lọc không khí kết hợp quạt LG Puricare AeroTower FS15GPBF0', 'images/okela.webp', '19990000', 1, 1, 8, '2023-04-18 23:38:55', '2023-04-18 23:38:55'),
(84, 'Robot hút bụi lau nhà tự động làm sạch Roborock S7 MaxV Ultra', 'images/roborock-s7-maxv-ultra.webp', '23990000', 1, 1, 8, '2023-04-18 23:39:31', '2023-04-18 23:39:31'),
(85, 'Robot hút bụi Xiaomi Vaccum Mop 2', 'images/template_robot--.webp', '6390000', 1, 1, 8, '2023-04-18 23:40:02', '2023-04-18 23:40:02'),
(86, 'Máy hút bụi cầm tay Roborock Dyad Pro', 'images/text_ng_n_23__10.webp', '12490000', 1, 1, 8, '2023-04-18 23:40:33', '2023-04-18 23:40:33'),
(87, 'Máy chiếu Mini Wanbo T2R Max Full HD', 'images/wanbo_t2r.webp', '4090000', 1, 1, 8, '2023-04-18 23:41:06', '2023-04-18 23:41:06'),
(88, 'Tai nghe không dây Samsung Galaxy Buds2', 'images/frame_1_3_9.webp', '1390000', 1, 1, 5, '2023-04-18 23:42:32', '2023-04-18 23:42:32'),
(89, 'Tai nghe không dây Havit TW 967', 'images/frame_7_1.webp', '250000', 1, 1, 5, '2023-04-18 23:42:54', '2023-04-18 23:42:54'),
(90, 'Tai nghe Bluetooth Apple AirPods Pro 2022 | Chính hãng Apple Việt Nam', 'images/group_111_5_.webp', '6090000', 1, 1, 5, '2023-04-18 23:43:22', '2023-04-18 23:43:22'),
(91, 'Tai nghe không dây Marshall Minor 3', 'images/group_150_1_3.webp', '2990000', 1, 1, 5, '2023-04-18 23:43:45', '2023-04-18 23:43:45'),
(92, 'Tai nghe không dây True Wireless JBL Live Pro 2', 'images/group_157_1.webp', '2990000', 1, 1, 5, '2023-04-18 23:44:09', '2023-04-18 23:44:09'),
(93, 'Tai nghe Bluetooth Apple AirPods 2 VN/A', 'images/group_169_2.webp', '2790000', 1, 1, 5, '2023-04-18 23:44:34', '2023-04-18 23:44:34'),
(94, 'Tai nghe Bluetooth Apple AirPods 3 MagSafe | Chính hãng Apple Việt Nam', 'images/group_170_9.webp', '4590000', 1, 1, 5, '2023-04-18 23:44:56', '2023-04-18 23:44:56'),
(95, 'Tai nghe chụp tai Sony WH-1000XM5', 'images/group_172_2.webp', '7990000', 1, 1, 5, '2023-04-18 23:45:16', '2023-04-18 23:45:16'),
(96, 'Tai nghe không dây Samsung Galaxy Buds Pro', 'images/group_182_1.webp', '2690000', 1, 1, 5, '2023-04-18 23:45:41', '2023-04-18 23:45:41'),
(97, 'Tai nghe không dây Samsung Galaxy Buds Live', 'images/group_182_1__1.webp', '1090000', 1, 1, 5, '2023-04-18 23:46:07', '2023-04-18 23:46:07'),
(98, 'Tai nghe không dây Samsung Galaxy Buds2 Pro', 'images/group_182_2.webp', '4790000', 1, 1, 5, '2023-04-18 23:46:30', '2023-04-18 23:46:30'),
(99, 'Tai nghe Bluetooth Havit TW945', 'images/group_196_1_.webp', '290000', 1, 1, 5, '2023-04-18 23:46:50', '2023-04-18 23:46:50'),
(100, 'Tai nghe chụp tai Sony WH-1000XM4', 'images/group_17333.webp', '6490000', 1, 1, 5, '2023-04-18 23:47:11', '2023-04-18 23:47:11'),
(101, 'Tai nghe Bluetooth JBL T115BT', 'images/jbl_t115bt_1.webp', '390000', 1, 1, 5, '2023-04-18 23:47:29', '2023-04-18 23:47:29'),
(102, 'Tai nghe không dây Redmi Buds 4 Lite', 'images/t_i_xu_ng_23__4_4.webp', '690000', 1, 1, 5, '2023-04-18 23:48:08', '2023-04-18 23:48:08'),
(103, 'Apple Watch Series 8 41mm GPS viền nhôm | Chính hãng VN/A', 'images/apple_gps_1_.webp', '9050000', 1, 1, 6, '2023-04-18 23:49:31', '2023-04-18 23:49:31'),
(104, 'Apple Watch Series 7 41mm (GPS) Viền nhôm dây cao su | Chính hãng VN/A', 'images/apple_gps_7_.webp', '7890000', 1, 1, 6, '2023-04-18 23:49:49', '2023-04-18 23:49:49'),
(105, 'Apple Watch SE 44mm (GPS) Viền Nhôm - Dây Cao Su | Chính Hãng VN/A', 'images/apple_gps_8_.webp', '6090000', 1, 1, 6, '2023-04-18 23:50:18', '2023-04-18 23:50:18'),
(106, 'Apple Watch SE 44mm (4G) Viền Nhôm - Dây Cao Su | Chính Hãng VN/A', 'images/apple_lte_10_.webp', '5990000', 1, 1, 6, '2023-04-18 23:50:42', '2023-04-18 23:50:42'),
(107, 'Apple Watch SE 2022 40mm | Chính Hãng VN/A', 'images/apple_lte_12_.webp', '6290000', 1, 1, 6, '2023-04-18 23:51:17', '2023-04-18 23:51:17'),
(108, 'Apple Watch SE 2022 44mm | Chính hãng VN/A', 'images/apple_lte_13_.webp', '6790000', 1, 1, 6, '2023-04-18 23:51:34', '2023-04-18 23:51:34'),
(109, 'Đồng hồ thông minh Amazfit GTS 4 Mini', 'images/garmin_54_.webp', '2390000', 1, 1, 6, '2023-04-18 23:52:01', '2023-04-18 23:52:01'),
(110, 'Đồng hồ thông minh Huawei Watch GT3 Pro dây silicone', 'images/huawei_1_.webp', '6990000', 1, 1, 6, '2023-04-18 23:52:26', '2023-04-18 23:52:26'),
(111, 'Đồng hồ thông minh Huawei Watch GT3 46mm dây da', 'images/huawei_1_2.webp', '5390000', 1, 1, 6, '2023-04-18 23:52:50', '2023-04-18 23:52:50'),
(112, 'Đồng hồ thông minh Huawei Watch Buds', 'images/huawei_13_.webp', '9490000', 1, 1, 6, '2023-04-18 23:53:15', '2023-04-18 23:53:15'),
(113, 'Vòng đeo tay thông minh Huawei Band 7', 'images/smart_band.webp', '899000', 1, 1, 6, '2023-04-18 23:53:38', '2023-04-18 23:53:38'),
(114, 'Đồng hồ thông minh Xiaomi Watch S1 Pro', 'images/xiaomi_1__1.webp', '5790000', 1, 1, 6, '2023-04-18 23:54:04', '2023-04-18 23:54:04'),
(115, 'Đồng hồ thông minh Xiaomi Watch S1 Active', 'images/xiaomi_1_6.webp', '2990000', 1, 1, 6, '2023-04-18 23:54:30', '2023-04-18 23:54:30'),
(116, 'Đồng hồ thông minh Xiaomi Redmi Watch 2 Lite', 'images/xiaomi_2_.webp', '1190000', 1, 1, 6, '2023-04-18 23:54:55', '2023-04-18 23:54:55'),
(117, 'Vòng đeo tay thông minh Xiaomi Mi Band 7', 'images/xiaomi_3_.webp', '990000', 1, 1, 6, '2023-04-18 23:55:21', '2023-04-18 23:55:21'),
(118, 'Smart Tivi Khung Tranh The Frame 4K Samsung LTV 50 inch 50LS03BA', 'images/t_i_xu_ng_8__1_5.webp', '18900000', 1, 1, 7, '2023-04-18 23:55:53', '2023-04-18 23:55:53'),
(119, 'Android Tivi Xiaomi P1 55 inch', 'images/1_74_38.webp', '8490000', 1, 1, 7, '2023-04-18 23:56:17', '2023-04-18 23:56:17'),
(120, 'Android Tivi Xiaomi P1 43 inch', 'images/1_74_38_1.webp', '5990000', 1, 1, 7, '2023-04-18 23:56:35', '2023-04-18 23:56:35'),
(121, 'Smart Tivi Khung Tranh The Frame 4K Samsung LTV 65 inch 65LS03BA', 'images/kq75lsb03afxkr_003_front3_black_1.webp', '29500000', 1, 1, 7, '2023-04-18 23:57:00', '2023-04-18 23:57:00'),
(122, 'Smart Tivi Samsung 4K 55 inch UA55AU7002', 'images/1_217_2.webp', '9890000', 1, 1, 7, '2023-04-18 23:57:41', '2023-04-18 23:57:41'),
(123, 'Smart Tivi Samsung 4K 50 inch UA50AU7002', 'images/1_217_2_1.webp', '8390000', 1, 1, 7, '2023-04-18 23:58:04', '2023-04-18 23:58:04'),
(124, 'Smart Tivi Samsung 4K 65 inch UA65AU7002', 'images/1_217_2_1_1.webp', '12990000', 1, 1, 7, '2023-04-18 23:58:36', '2023-04-18 23:58:36'),
(125, 'Smart Tivi Coocaa FHD 43 inch Wifi 43S3U', 'images/1_325.webp', '3990000', 1, 1, 7, '2023-04-18 23:58:57', '2023-04-18 23:58:57'),
(126, 'Android Tivi Xiaomi A2 58 inch', 'images/4_45_20.webp', '9190000', 1, 1, 7, '2023-04-18 23:59:43', '2023-04-18 23:59:43'),
(127, 'Android Tivi Xiaomi A2 43 inch', 'images/hh_1__1.webp', '5490000', 1, 1, 7, '2023-04-19 00:00:09', '2023-04-19 00:00:09'),
(128, 'Smart Tivi Coocaa HD 32 inch WIFI 32S3U', 'images/26_1_71.webp', '2990000', 1, 1, 7, '2023-04-19 00:00:27', '2023-04-19 00:00:27'),
(129, 'Smart Tivi Samsung QLED 65 inch 65Q60BAK', 'images/55_1_13.webp', '15990000', 1, 1, 7, '2023-04-19 00:00:53', '2023-04-19 00:00:53'),
(130, 'Google Tivi Toshiba 55 inch 4K HDR 55C350LP', 'images/smart_tivi_toshiba_55_inch_4k_hdr_55c350lp.webp', '9990000', 1, 1, 7, '2023-04-19 00:01:16', '2023-04-19 00:01:16'),
(131, 'Google Tivi Toshiba 50 inch 4K HDR 50C350LP', 'images/smart_tivi_toshiba_55_inch_4k_hdr_55c350lp_1.webp', '8990000', 1, 1, 7, '2023-04-19 00:04:17', '2023-04-19 00:04:17'),
(132, 'Smart Tivi Sony 4K 55 inch KD-55X75K VN3', 'images/smart-tivi-sony-4k-50-inch-kd-50x75k-1_1.webp', '11990000', 1, 1, 7, '2023-04-19 00:04:40', '2023-04-19 00:04:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'thaihieudz@gmail.com', '0382704938', '2023-10-22 20:14:23', '$2y$10$/GW7Nxzqp0btpEC3SJf/U.Zqu1bJj4ejLwCX9UrYVHy5ghD1PeyKi', NULL, '2023-04-08 19:20:31', '2023-10-22 20:14:50'),
(2, 'Thái Hội Hiếu', 'hoagquoc11@gmail.com', '0382704389', NULL, '$2y$10$JkkBxlUzVASCHfj5m/erfOWYB15kJVWxeSPLEGvcwmixNejON7IUS', NULL, '2023-04-16 09:25:01', '2023-04-16 09:25:01'),
(3, 'Minh', 'minh@gmail.com', '0962424917', '2023-10-22 20:15:48', '$2y$10$0BvkMLjjBaIcAZJ/XZD4Pe9Ynh3S6h4UGvafRcjoMAlyA.5womALC', NULL, '2023-05-23 02:48:53', '2023-10-22 20:16:02'),
(4, 'Hiếu Đẹp Trai', 'htphone@gmail.com', '0123123123', NULL, '$2y$10$W8H3C6ztpLjwHxDMXxycjOhxas//UjPpkzGRsqiHseLA.vJPwGNYa', NULL, '2023-11-10 08:41:59', '2023-11-10 08:41:59');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Chỉ mục cho bảng `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Chỉ mục cho bảng `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Chỉ mục cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Chỉ mục cho bảng `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=556;

--
-- AUTO_INCREMENT cho bảng `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
