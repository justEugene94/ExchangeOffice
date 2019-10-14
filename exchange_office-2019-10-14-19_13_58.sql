-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Окт 14 2019 г., 19:13
-- Версия сервера: 5.7.27-0ubuntu0.18.04.1
-- Версия PHP: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `exchange_office`
--

-- --------------------------------------------------------

--
-- Структура таблицы `banknote_units`
--

CREATE TABLE `banknote_units` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `banknote_units`
--

INSERT INTO `banknote_units` (`id`, `name`) VALUES
(1, 5),
(2, 10),
(3, 20),
(4, 50),
(5, 100),
(6, 200),
(7, 500);

-- --------------------------------------------------------

--
-- Структура таблицы `coefficients`
--

CREATE TABLE `coefficients` (
  `id` int(10) UNSIGNED NOT NULL,
  `trade_id` int(10) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `percent` float(8,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `coefficients`
--

INSERT INTO `coefficients` (`id`, `trade_id`, `amount`, `percent`) VALUES
(1, 3, 2, 0.98),
(2, 2, 5, 0.97),
(3, 1, 7, 0.98),
(4, 2, 9, 0.98),
(5, 3, 11, 0.98);

-- --------------------------------------------------------

--
-- Структура таблицы `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currencies`
--

INSERT INTO `currencies` (`id`, `name`) VALUES
(1, 'USD'),
(2, 'EUR'),
(3, 'UAH'),
(4, 'RUR');

-- --------------------------------------------------------

--
-- Структура таблицы `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `exchange_currency_id` int(10) UNSIGNED NOT NULL,
  `unit_id` int(10) UNSIGNED NOT NULL,
  `trade_id` int(10) UNSIGNED NOT NULL,
  `value` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `currency_id`, `exchange_currency_id`, `unit_id`, `trade_id`, `value`, `created_at`) VALUES
(1, 1, 1, 3, 1, 1, 400, '2019-10-14 13:22:01'),
(2, 1, 2, 1, 2, 2, 600, '2019-10-14 16:04:10'),
(3, 1, 2, 3, 2, 2, 600, '2019-10-14 16:04:14'),
(4, 1, 3, 2, 2, 2, 600, '2019-10-14 16:04:20'),
(5, 1, 2, 3, 2, 2, 600, '2019-10-14 16:04:18'),
(6, 1, 3, 2, 2, 2, 600, '2019-10-14 16:04:24'),
(7, 1, 2, 1, 2, 2, 600, '2019-10-14 16:04:32'),
(8, 1, 2, 3, 2, 2, 600, '2019-10-14 16:04:28'),
(9, 1, 3, 2, 2, 2, 600, '2019-10-14 16:04:37'),
(10, 1, 2, 3, 2, 2, 600, '2019-10-14 16:04:40'),
(11, 1, 2, 3, 2, 2, 600, '2019-10-14 16:04:43'),
(12, 1, 2, 1, 2, 2, 600, '2019-10-14 16:04:48'),
(13, 1, 1, 2, 2, 2, 600, '2019-10-14 16:04:51'),
(14, 1, 3, 2, 2, 2, 600, '2019-10-14 16:04:54'),
(15, 1, 4, 2, 2, 2, 600, '2019-10-14 16:05:00'),
(16, 1, 4, 2, 2, 2, 600, '2019-10-14 16:04:57'),
(17, 1, 3, 2, 2, 2, 600, '2019-10-14 16:05:04'),
(18, 1, 2, 4, 2, 2, 600, '2019-10-14 16:05:08'),
(19, 1, 2, 1, 2, 2, 600, '2019-10-14 16:05:11'),
(20, 9, 1, 2, 3, 2, 1000, '2019-10-14 16:03:47');

-- --------------------------------------------------------

--
-- Структура таблицы `trades`
--

CREATE TABLE `trades` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `trades`
--

INSERT INTO `trades` (`id`, `name`) VALUES
(1, 'buy'),
(2, 'sale'),
(3, 'amount');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `phone#` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone#`, `created_at`) VALUES
(1, 'Bob', 'Smith', '12345678', NULL),
(9, 'Jim', 'Morrison', '87654321', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `banknote_units`
--
ALTER TABLE `banknote_units`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `coefficients`
--
ALTER TABLE `coefficients`
  ADD PRIMARY KEY (`id`),
  ADD KEY ` coefficients_trade_id_index` (`trade_id`);

--
-- Индексы таблицы `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requests_user_id_index` (`user_id`),
  ADD KEY `requests_currency_id_index` (`currency_id`),
  ADD KEY `requests_exchange_currecy_id_index` (`exchange_currency_id`),
  ADD KEY `requests_unit_id_index` (`unit_id`),
  ADD KEY `requests_trade_id_index` (`trade_id`);

--
-- Индексы таблицы `trades`
--
ALTER TABLE `trades`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone` (`phone#`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `banknote_units`
--
ALTER TABLE `banknote_units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `coefficients`
--
ALTER TABLE `coefficients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `trades`
--
ALTER TABLE `trades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `coefficients`
--
ALTER TABLE `coefficients`
  ADD CONSTRAINT `coefficients_ibfk_1` FOREIGN KEY (`trade_id`) REFERENCES `trades` (`id`);

--
-- Ограничения внешнего ключа таблицы `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `purchases_ibfk_3` FOREIGN KEY (`exchange_currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `purchases_ibfk_4` FOREIGN KEY (`trade_id`) REFERENCES `trades` (`id`),
  ADD CONSTRAINT `purchases_ibfk_5` FOREIGN KEY (`unit_id`) REFERENCES `banknote_units` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
