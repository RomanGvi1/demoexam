

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




CREATE TABLE `request` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Новая',
  `curses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `request` (`id`, `user_id`, `date`, `status`, `curses`, `payment`, `review`) VALUES
(3, 6, '2025-10-23 17:30:00', 'Обучение завершено', '', 'наличные', ''),
(4, 6, '2025-10-17 17:40:00', 'Идет обучение', 'Веб-Дизайн', 'наличные', ''),
(5, 6, '2025-10-31 20:00:00', 'Новая', 'Проектирование базы данных', 'перевод', ''),
(6, 7, '2026-05-08 15:44:00', 'Новая', 'Курсы повышения\r\nквалификации', 'перевод', '');

-- --------------------------------------------------------

--
-- 

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fullname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





INSERT INTO `users` (`id`, `fullname`, `phone`, `email`, `login`, `password`, `is_admin`, `created_at`, `review`) VALUES
(1, 'in', '+7(123)-456-78-90', '123@mail.ru', 'Admin26', 'Demo20', 1, '2025-10-09 15:57:44', NULL),
(6, 'Alexsander Egorov', '+79003166636', 'sata@mail.ru', 'Santik', '12345678', 0, '2025-10-13 14:30:08', ''),
(7, 'dfgskfjgs dhsjkfgsdk sdkfjgsk', '+7(123)123-12-12', 'qw@bk.ru', 'qwerty', '12345678', 0, '2026-05-26 09:41:21', NULL),
(8, 'пап ваяв вяарв', '+7(123)123-12-12', 'qu@bk.ru', 'asdfgh', '12345678', 0, '2026-05-26 10:02:19', NULL),
(9, 'fdhgzdfhgваяв вяарв', '+7(123)123-12-12', 'hw@bk.ru', 'zxcvbn', '12345678', 0, '2026-05-26 10:03:03', NULL);


--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);


ALTER TABLE `request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

