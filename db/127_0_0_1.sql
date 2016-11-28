-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 27 Νοε 2016 στις 11:54:20
-- Έκδοση διακομιστή: 10.1.19-MariaDB
-- Έκδοση PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `hackathon`
--
CREATE DATABASE IF NOT EXISTS `hackathon` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hackathon`;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `assignments`
--
-- σε χρήση(#1932 - Table 'hackathon.assignments' doesn't exist in engine)
-- Σφάλμα ανάγνωσης δεδομένων: (#1932 - Table 'hackathon.assignments' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `homework`
--
-- σε χρήση(#1932 - Table 'hackathon.homework' doesn't exist in engine)
-- Σφάλμα ανάγνωσης δεδομένων: (#1932 - Table 'hackathon.homework' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `schedule`
--
-- σε χρήση(#1932 - Table 'hackathon.schedule' doesn't exist in engine)
-- Σφάλμα ανάγνωσης δεδομένων: (#1932 - Table 'hackathon.schedule' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `teacherblocked`
--
-- σε χρήση(#1932 - Table 'hackathon.teacherblocked' doesn't exist in engine)
-- Σφάλμα ανάγνωσης δεδομένων: (#1932 - Table 'hackathon.teacherblocked' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `users`
--
-- σε χρήση(#1932 - Table 'hackathon.users' doesn't exist in engine)
-- Σφάλμα ανάγνωσης δεδομένων: (#1932 - Table 'hackathon.users' doesn't exist in engine)
--
-- Βάση δεδομένων: `hackathon_good`
--
CREATE DATABASE IF NOT EXISTS `hackathon_good` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `hackathon_good`;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `assignments`
--

CREATE TABLE `assignments` (
  `Name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Level` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `Difficulty` int(11) NOT NULL,
  `DateCreated` date NOT NULL,
  `MemberOfChain` int(11) NOT NULL DEFAULT '0',
  `Type` set('Theoretical','Practical') COLLATE utf8_unicode_ci NOT NULL,
  `HomeworkUrl` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `assignments`
--

INSERT INTO `assignments` (`Name`, `Level`, `ID`, `Difficulty`, `DateCreated`, `MemberOfChain`, `Type`, `HomeworkUrl`) VALUES
('Music Theory: Major scales, part 1', 1, 0, 1, '2016-11-27', 1, 'Theoretical', 'task1'),
('Music Theory: Major scales, part 2', 1, 1, 1, '2016-11-27', 1, 'Theoretical', 'task2'),
('Music Practical: Major scales', 1, 2, 1, '2016-11-27', 1, 'Practical', 'task3'),
('Music Theory: Minor scales', 1, 3, 1, '2016-11-27', 2, 'Theoretical', 'task4'),
('Music Practical: Minor scales', 1, 4, 1, '2016-11-27', 2, 'Practical', 'task5'),
('Music Theory: Chords, part 1', 1, 5, 1, '2016-11-27', 3, 'Theoretical', 'task6'),
('[Insert fun song title]', 1, 6, 1, '2016-11-27', 0, 'Practical', 'task7'),
('Music Theory: Major chords, part 1', 1, 8, 1, '2016-11-27', 5, 'Theoretical', 'task8'),
('Music Theory: Major cords, part 2', 1, 9, 1, '2016-11-27', 5, 'Theoretical', 'task9'),
('Music Practical: Major cords', 1, 10, 1, '2016-11-27', 5, 'Practical', 'task10'),
('Music Theory: Minor cords', 1, 11, 1, '2016-11-27', 6, 'Theoretical', 'task11'),
('Music Practical: Minor cords', 1, 12, 1, '2016-11-27', 6, 'Practical', 'task12'),
('Music Theory: Intonation\r\n', 1, 13, 1, '2016-11-27', 7, 'Theoretical', 'task13'),
('[Another fun song]', 1, 14, 1, '2016-11-27', 0, 'Practical', 'task14');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `students`
--

CREATE TABLE `students` (
  `Id` int(11) NOT NULL,
  `Username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `weekly_capacity` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `students`
--

INSERT INTO `students` (`Id`, `Username`, `Password`, `weekly_capacity`) VALUES
(1, 'thebesteva', 'thebest', 14),
(2, 'theaverageone', 'thebest', 9),
(3, 'notsogood', 'thebest', 5);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `teacheravailability`
--

CREATE TABLE `teacheravailability` (
  `Id` int(11) NOT NULL,
  `Week` int(3) NOT NULL,
  `Day` set('Monday','Tuesday','Wednesday','Thursday','Friday') COLLATE utf8_unicode_ci NOT NULL,
  `StartTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `teacheravailability`
--

INSERT INTO `teacheravailability` (`Id`, `Week`, `Day`, `StartTime`) VALUES
(1, 48, 'Monday', 9),
(2, 48, 'Monday', 10),
(3, 48, 'Monday', 11),
(4, 48, 'Monday', 13),
(5, 48, 'Monday', 14),
(6, 48, 'Tuesday', 8),
(7, 48, 'Tuesday', 9),
(8, 48, 'Tuesday', 10),
(9, 48, 'Tuesday', 11),
(10, 48, 'Tuesday', 12),
(11, 48, 'Wednesday', 8),
(12, 48, 'Wednesday', 9),
(13, 48, 'Wednesday', 10),
(14, 48, 'Wednesday', 12),
(15, 48, 'Wednesday', 14),
(16, 48, 'Thursday', 8),
(17, 48, 'Thursday', 9),
(18, 48, 'Thursday', 12),
(19, 48, 'Thursday', 13),
(20, 48, 'Thursday', 14),
(21, 48, 'Friday', 10),
(22, 48, 'Friday', 11),
(23, 48, 'Friday', 12);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Level` int(11) NOT NULL,
  `Remarks` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `Username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TheoreticalSpeed` float NOT NULL,
  `PracticalSpeed` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Ευρετήρια για πίνακα `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Ευρετήρια για πίνακα `teacheravailability`
--
ALTER TABLE `teacheravailability`
  ADD PRIMARY KEY (`Id`);

--
-- Ευρετήρια για πίνακα `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `students`
--
ALTER TABLE `students`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT για πίνακα `teacheravailability`
--
ALTER TABLE `teacheravailability`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT για πίνακα `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;--
-- Βάση δεδομένων: `hackathon_wrong`
--
CREATE DATABASE IF NOT EXISTS `hackathon_wrong` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hackathon_wrong`;
--
-- Βάση δεδομένων: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__column_info`
--
-- σε χρήση(#1932 - Table 'phpmyadmin.pma__column_info' doesn't exist in engine)
-- Σφάλμα ανάγνωσης δεδομένων: (#1932 - Table 'phpmyadmin.pma__column_info' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Άδειασμα δεδομένων του πίνακα `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"hackathon_good","table":"assignments"},{"db":"hackathon_good","table":"students"},{"db":"hackathon_good","table":"Students"},{"db":"hackathon_good","table":"teacheravailability"},{"db":"hackathon_good","table":"users"}]');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__relation`
--
-- σε χρήση(#1932 - Table 'phpmyadmin.pma__relation' doesn't exist in engine)
-- Σφάλμα ανάγνωσης δεδομένων: (#1932 - Table 'phpmyadmin.pma__relation' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__table_coords`
--
-- σε χρήση(#1932 - Table 'phpmyadmin.pma__table_coords' doesn't exist in engine)
-- Σφάλμα ανάγνωσης δεδομένων: (#1932 - Table 'phpmyadmin.pma__table_coords' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Άδειασμα δεδομένων του πίνακα `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2016-11-27 02:53:36', '{"lang":"el","collation_connection":"utf8mb4_general_ci"}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Ευρετήρια για πίνακα `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Ευρετήρια για πίνακα `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Ευρετήρια για πίνακα `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Ευρετήρια για πίνακα `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Ευρετήρια για πίνακα `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Ευρετήρια για πίνακα `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Ευρετήρια για πίνακα `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Ευρετήρια για πίνακα `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Ευρετήρια για πίνακα `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Ευρετήρια για πίνακα `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Ευρετήρια για πίνακα `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Ευρετήρια για πίνακα `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Ευρετήρια για πίνακα `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Ευρετήρια για πίνακα `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT για πίνακα `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT για πίνακα `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT για πίνακα `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT για πίνακα `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Βάση δεδομένων: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
