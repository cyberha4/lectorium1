-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 23 2016 г., 02:09
-- Версия сервера: 5.5.48
-- Версия PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `clearyii2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`, `updated_at`) VALUES
('administrator', 1, 1459286582, 1459286582),
('ContentCreator', 5, 1460794335, NULL),
('ContentModerator', 3, 1459751063, NULL),
('ContentModerator', 4, 1459772470, NULL),
('LectureCreator', 7, 1460810859, NULL),
('moderator', 2, 1459286582, 1459286582);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('AcessToBackend', 2, 'Доступ к бэкенду', NULL, 's:0:"";', 1460793756, 1460793756),
('administrator', 1, 'Administrator', NULL, NULL, 1459286582, 1459286582),
('ContentCreator', 1, 'ContentCreator', NULL, 's:0:"";', 1459772332, 1459772332),
('ContentModerator', 1, 'ContentModerator', NULL, 's:7:"s:0:"";";', 1459689341, 1459750699),
('LectureCreate', 2, 'Создание лекции', NULL, 's:0:"";', 1460808991, 1460808991),
('LectureCreator', 1, 'Lecture Creator', NULL, 's:7:"s:0:"";";', 1460808908, 1460809063),
('LectureOwnUpdate', 2, 'Изменение\\удаление своей созданной лекции', 'LectureOwnUpdateRule', 's:0:"";', 1460806069, 1460806069),
('LectureUpdate', 2, 'Изменение лекций', NULL, 's:7:"s:0:"";";', 1460805667, 1460811181),
('moderator', 1, 'Moderator', NULL, NULL, 1459286582, 1459286582),
('rbacManage', 2, 'Management RBAC structure', NULL, NULL, 1459286582, 1459286582),
('ScientistCreate', 2, 'ScientistCreate', NULL, 's:7:"s:0:"";";', 1459689399, 1459751188),
('ScientistOwnUpdate', 2, 'ScientistOwnUpdate', 'ScientistOwnUpdateRule', 's:7:"s:0:"";";', 1459772129, 1459776961),
('ScientistUpdate', 2, 'ScientistUpdate', NULL, 's:0:"";', 1459772099, 1459772099),
('userCreate', 2, 'Creating users', NULL, NULL, 1459286582, 1459286582),
('userDelete', 2, 'Deleting users', NULL, NULL, 1459286582, 1459286582),
('userManage', 2, 'Browse list of users', NULL, NULL, 1459286582, 1459286582),
('userPermissions', 2, 'User rights management', NULL, NULL, 1459286582, 1459286582),
('userUpdate', 2, 'Editing users', NULL, NULL, 1459286582, 1459286582),
('userUpdateNoElderRank', 2, 'Editing users with equal or lower rank', 'noElderRank', NULL, 1459286582, 1459286582),
('userView', 2, 'Viewing user information', NULL, NULL, 1459286582, 1459286582);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('ContentCreator', 'AcessToBackend'),
('LectureCreator', 'AcessToBackend'),
('ContentModerator', 'ContentCreator'),
('administrator', 'ContentModerator'),
('LectureCreator', 'LectureCreate'),
('ContentModerator', 'LectureCreator'),
('LectureCreator', 'LectureOwnUpdate'),
('ContentModerator', 'LectureUpdate'),
('LectureOwnUpdate', 'LectureUpdate'),
('administrator', 'moderator'),
('administrator', 'rbacManage'),
('ContentCreator', 'ScientistCreate'),
('ContentCreator', 'ScientistOwnUpdate'),
('ContentModerator', 'ScientistUpdate'),
('ScientistOwnUpdate', 'ScientistUpdate'),
('administrator', 'userCreate'),
('administrator', 'userDelete'),
('moderator', 'userManage'),
('administrator', 'userPermissions'),
('administrator', 'userUpdate'),
('userUpdateNoElderRank', 'userUpdate'),
('moderator', 'userUpdateNoElderRank'),
('moderator', 'userView');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('LectureOwnUpdateRule', 'O:29:"app\\rbac\\LectureOwnUpdateRule":3:{s:4:"name";s:20:"LectureOwnUpdateRule";s:9:"createdAt";i:1460806020;s:9:"updatedAt";i:1460806020;}', 1460806020, 1460806020),
('noElderRank', 'O:34:"budyaga\\users\\rbac\\NoElderRankRule":3:{s:4:"name";s:11:"noElderRank";s:9:"createdAt";N;s:9:"updatedAt";i:1431880756;}', 1459286582, 1459286582),
('ScientistOwnUpdateRule', 'O:31:"app\\rbac\\ScientistOwnUpdateRule":3:{s:4:"name";s:22:"ScientistOwnUpdateRule";s:9:"createdAt";i:1459772290;s:9:"updatedAt";i:1459772290;}', 1459772290, 1459772290),
('updateOwnContent', 'O:19:"app\\rbac\\updateRule":3:{s:4:"name";s:16:"updateOwnContent";s:9:"createdAt";i:1459362564;s:9:"updatedAt";i:1459362564;}', 1459362564, 1459362564);

-- --------------------------------------------------------

--
-- Структура таблицы `lecture`
--

CREATE TABLE IF NOT EXISTS `lecture` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `created_by` int(7) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `type` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `annotation` varchar(255) DEFAULT NULL,
  `scientist_id` int(5) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `lecture`
--

INSERT INTO `lecture` (`id`, `title`, `body`, `created_by`, `created_at`, `video_url`, `type`, `status`, `annotation`, `scientist_id`) VALUES
(1, 'title', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.  ываываыва ываываыв ываыва ыва ываы dfs dfsd ', 7, 777, '2XJORZ3MX1k', 2, 1, 'annotation', 1),
(2, 'Научно-популярные книжки: как их писать и зачем читать?', '!!!!!Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 3, '2XJORZ3MX1k', 2, 1, 'В сентябре 1941 года дедушка должен был демобилизоваться, но 22 июня Германия напала на Советский Союз. Началась великая Отечественная война', 2),
(3, 'title3', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2, 4, '2XJORZ3MX1k', 1, 1, 'annotation', 1),
(4, 'title4', 'body4', 2, 5, '2XJORZ3MX1k', 2, 1, 'annotation', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `scientist`
--

CREATE TABLE IF NOT EXISTS `scientist` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `biography` text,
  `achievements` text,
  `image` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `user_id` int(5) NOT NULL DEFAULT '1',
  `place` text
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `scientist`
--

INSERT INTO `scientist` (`id`, `name`, `city`, `biography`, `achievements`, `image`, `status`, `user_id`, `place`) VALUES
(1, 'кончаловский александр евгенич', 'Санкт-Петербургsds', 'Лесник435345', 'Много достижений', '/images/teacher.jpg', 1, 1, 'Математичеcкая лаборатория имени П.Л.Чебышева!'),
(2, 'выаываыва', 'sdfsdfsdf', 'sdfsdfsdfsdf', 'Много достижений', '/images/8nd.jpg', 1, 1, 'Математичеcкая лаборатория имени П.Л.Чебышева'),
(3, 'sdfsdfsdfsdf', 'sdfsdfs', 'sdfsdfsdf', 'Много достижений', '333', 1, 1, NULL),
(4, 'fgdfgdfg', 'вапвапвап', 'вапвапвап', 'Много достижений', '/images/Скан доверенности ОАО Элеконд.png', 1, 5, NULL),
(5, 'sdfsdfs', 'sdfsdf', 'sdfsdf', 'Много достижений', '/images/j4uAj2IzijQ.jpg', 0, 1, NULL),
(6, 'Пингвин-ученый', 'Лапландия', 'Помните пингвинов из Мадагаскара? Если да, то вам не нужна моя биография.', 'Много достижений', '/images/Penguins.jpg', 1, 1, NULL),
(7, 'without image', 'town', 'not have', 'Много достижений', NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ScientistForm`
--

CREATE TABLE IF NOT EXISTS `ScientistForm` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ScientistForm`
--

INSERT INTO `ScientistForm` (`id`, `text`, `url`, `image`) VALUES
(1, 'вапвапв', 'вапвап', ''),
(2, 'sdfsd', 'sdfs', ''),
(3, 'sdfsdf', 'sdfsdf1111', ''),
(4, 'asdasdasd', 'asdasdasd', ''),
(5, '!!!!!!!!!!!!!', '!!!!!!!!!!!!!!', '/J:\\openserever2\\domains\\clearyii2.loc/frontend/web/images/справка.jpg'),
(6, 'wefsdfsdf', 'sdfsdfsdf', '/J:\\openserever2\\domains\\clearyii2.loc/frontend/web/images/test22.jpg'),
(7, 'tyutyutyu', 'tyutyutyu', '/imagestest22.jpg'),
(8, 'opiopiop', 'iopiopiop678678', '/images/photo.png');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` smallint(6) NOT NULL DEFAULT '1',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `email`, `photo`, `sex`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '', '$2y$13$Y2iM9YqkXVrguZmucxApveDRkQrLyorcnqOW/HMyF1XhWVsAtC3xC', 'administrator@example.com', '', 1, 2, 1459286581, 1459685603),
(2, 'Moderator', '', '$2y$13$9yDHdthMkuS.o3gv91vdKuWPRdbZhHOAfmhRqO0SRq95qdvML8X96', 'moderator@example.com', NULL, 1, 2, 1459286582, 1459286582),
(3, 'kiberha4', 'vaPrx2dF72qazNmcKFQYrxT6gVwB2rVW', '$2y$13$Y2iM9YqkXVrguZmucxApveDRkQrLyorcnqOW/HMyF1XhWVsAtC3xC', 'proffi99@mail.ru', '', 1, 2, 1459286807, 1459286838),
(4, 'ContentModerator', '', '$2y$13$Y2iM9YqkXVrguZmucxApveDRkQrLyorcnqOW/HMyF1XhWVsAtC3xC', 'rarawe@dada.ru', '', 2, 2, 1459772460, 1459772460),
(5, 'ContentCreator', '', '$2y$13$Y2iM9YqkXVrguZmucxApveDRkQrLyorcnqOW/HMyF1XhWVsAtC3xC', 'aasd@ad.ru', '', 1, 2, 1459772497, 1459772497),
(6, 'test', '4ZNJhcHwbSQJuzbd3r4urqqMNRivTVSd', '$2y$13$Y2iM9YqkXVrguZmucxApveDRkQrLyorcnqOW/HMyF1XhWVsAtC3xC', 'Administrator@asdasd.ru', NULL, 1, 2, 1459773839, 1459773839),
(7, 'LectureCreator', 'tTlTD-an5DOFnwuMin1cxYGoDeRSmHm9', '$2y$13$NXgCUGfr7E20wU6iBJbMjOHe.5N0awjAvwpHFB.jajCFhVuxRUo/2', 'test@mail.ru', '', 1, 2, 1460809484, 1460809484);

-- --------------------------------------------------------

--
-- Структура таблицы `user_email_confirm_token`
--

CREATE TABLE IF NOT EXISTS `user_email_confirm_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `old_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_email_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_email_confirm` smallint(6) DEFAULT '0',
  `new_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new_email_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new_email_confirm` smallint(6) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user_email_confirm_token`
--

INSERT INTO `user_email_confirm_token` (`id`, `user_id`, `old_email`, `old_email_token`, `old_email_confirm`, `new_email`, `new_email_token`, `new_email_confirm`) VALUES
(1, 7, '', '', 1, 'test@mail.ru', 'W4sQr15AlL93EXUS2Mm67NBy1QKIRrzt', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user_oauth_key`
--

CREATE TABLE IF NOT EXISTS `user_oauth_key` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `provider_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user_password_reset_token`
--

CREATE TABLE IF NOT EXISTS `user_password_reset_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_fk` (`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `auth_item_rule_name_fk` (`rule_name`),
  ADD KEY `auth_item_type_index` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `auth_item_child_child_fk` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `lecture`
--
ALTER TABLE `lecture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-lecture-scientist_id-scientist-id` (`scientist_id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `scientist`
--
ALTER TABLE `scientist`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ScientistForm`
--
ALTER TABLE `ScientistForm`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_email_confirm_token`
--
ALTER TABLE `user_email_confirm_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_email_confirm_token_user_id_fk` (`user_id`);

--
-- Индексы таблицы `user_oauth_key`
--
ALTER TABLE `user_oauth_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_oauth_key_user_id_fk` (`user_id`);

--
-- Индексы таблицы `user_password_reset_token`
--
ALTER TABLE `user_password_reset_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_password_reset_token_user_id_fk` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `lecture`
--
ALTER TABLE `lecture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `scientist`
--
ALTER TABLE `scientist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `ScientistForm`
--
ALTER TABLE `ScientistForm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `user_email_confirm_token`
--
ALTER TABLE `user_email_confirm_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `user_oauth_key`
--
ALTER TABLE `user_oauth_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user_password_reset_token`
--
ALTER TABLE `user_password_reset_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_item_name_fk` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_assignment_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_rule_name_fk` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_child_fk` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_parent_fk` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `lecture`
--
ALTER TABLE `lecture`
  ADD CONSTRAINT `fk-lecture-scientist_id-scientist-id` FOREIGN KEY (`scientist_id`) REFERENCES `scientist` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_email_confirm_token`
--
ALTER TABLE `user_email_confirm_token`
  ADD CONSTRAINT `user_email_confirm_token_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_oauth_key`
--
ALTER TABLE `user_oauth_key`
  ADD CONSTRAINT `user_oauth_key_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_password_reset_token`
--
ALTER TABLE `user_password_reset_token`
  ADD CONSTRAINT `user_password_reset_token_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
