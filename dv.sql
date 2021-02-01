-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 01 2021 г., 09:39
-- Версия сервера: 10.4.17-MariaDB
-- Версия PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dv`
--

-- --------------------------------------------------------

--
-- Структура таблицы `hub_auditory`
--

CREATE TABLE `hub_auditory` (
  `hash_key` binary(64) NOT NULL,
  `load_date` datetime NOT NULL,
  `record_source` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hub_group`
--

CREATE TABLE `hub_group` (
  `hash_key` binary(64) NOT NULL,
  `load_date` datetime NOT NULL,
  `record_source` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hub_subject`
--

CREATE TABLE `hub_subject` (
  `hash_key` binary(64) NOT NULL,
  `load_date` datetime NOT NULL,
  `record_source` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `link_lesson`
--

CREATE TABLE `link_lesson` (
  `hash_key` binary(64) NOT NULL,
  `load_date` datetime NOT NULL,
  `record_source` varchar(255) NOT NULL,
  `auditory_hash_key` binary(64) NOT NULL,
  `subject_hash_key` binary(64) NOT NULL,
  `group_hash_key` binary(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `sat_auditory`
--

CREATE TABLE `sat_auditory` (
  `Number` int(11) NOT NULL,
  `auditory_hash_key` binary(64) NOT NULL,
  `load_date` datetime NOT NULL,
  `record_source` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `sat_group`
--

CREATE TABLE `sat_group` (
  `Name` varchar(255) NOT NULL,
  `group_hash_key` binary(64) NOT NULL,
  `load_date` datetime NOT NULL,
  `record_source` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `sat_lesson`
--

CREATE TABLE `sat_lesson` (
  `lesson_hash_key` binary(64) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `sat_subject`
--

CREATE TABLE `sat_subject` (
  `Name` varchar(255) NOT NULL,
  `subject_hash_key` binary(64) NOT NULL,
  `load_date` datetime NOT NULL,
  `record_source` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `hub_auditory`
--
ALTER TABLE `hub_auditory`
  ADD PRIMARY KEY (`hash_key`);

--
-- Индексы таблицы `hub_group`
--
ALTER TABLE `hub_group`
  ADD PRIMARY KEY (`hash_key`);

--
-- Индексы таблицы `hub_subject`
--
ALTER TABLE `hub_subject`
  ADD PRIMARY KEY (`hash_key`);

--
-- Индексы таблицы `link_lesson`
--
ALTER TABLE `link_lesson`
  ADD PRIMARY KEY (`hash_key`),
  ADD KEY `group_hash_key` (`group_hash_key`),
  ADD KEY `subject_hash_key` (`subject_hash_key`),
  ADD KEY `auditory_hash_key` (`auditory_hash_key`);

--
-- Индексы таблицы `sat_auditory`
--
ALTER TABLE `sat_auditory`
  ADD KEY `auditory_hash_key` (`auditory_hash_key`);

--
-- Индексы таблицы `sat_group`
--
ALTER TABLE `sat_group`
  ADD KEY `group_hash_key` (`group_hash_key`);

--
-- Индексы таблицы `sat_lesson`
--
ALTER TABLE `sat_lesson`
  ADD KEY `lesson_hash_key` (`lesson_hash_key`);

--
-- Индексы таблицы `sat_subject`
--
ALTER TABLE `sat_subject`
  ADD KEY `subject_hash_key` (`subject_hash_key`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `link_lesson`
--
ALTER TABLE `link_lesson`
  ADD CONSTRAINT `link_lesson_ibfk_1` FOREIGN KEY (`auditory_hash_key`) REFERENCES `hub_auditory` (`hash_key`),
  ADD CONSTRAINT `link_lesson_ibfk_2` FOREIGN KEY (`subject_hash_key`) REFERENCES `hub_subject` (`hash_key`),
  ADD CONSTRAINT `link_lesson_ibfk_3` FOREIGN KEY (`group_hash_key`) REFERENCES `hub_group` (`hash_key`);

--
-- Ограничения внешнего ключа таблицы `sat_auditory`
--
ALTER TABLE `sat_auditory`
  ADD CONSTRAINT `sat_auditory_ibfk_1` FOREIGN KEY (`auditory_hash_key`) REFERENCES `hub_auditory` (`hash_key`);

--
-- Ограничения внешнего ключа таблицы `sat_group`
--
ALTER TABLE `sat_group`
  ADD CONSTRAINT `sat_group_ibfk_1` FOREIGN KEY (`group_hash_key`) REFERENCES `hub_group` (`hash_key`);

--
-- Ограничения внешнего ключа таблицы `sat_lesson`
--
ALTER TABLE `sat_lesson`
  ADD CONSTRAINT `sat_lesson_ibfk_1` FOREIGN KEY (`lesson_hash_key`) REFERENCES `link_lesson` (`hash_key`);

--
-- Ограничения внешнего ключа таблицы `sat_subject`
--
ALTER TABLE `sat_subject`
  ADD CONSTRAINT `sat_subject_ibfk_1` FOREIGN KEY (`subject_hash_key`) REFERENCES `hub_subject` (`hash_key`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
