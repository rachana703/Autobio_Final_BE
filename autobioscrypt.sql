-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2019 at 08:14 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autobioscrypt`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_details`
--

CREATE TABLE `book_details` (
  `userid` int(10) NOT NULL,
  `bookid` int(20) NOT NULL,
  `bookname` varchar(50) NOT NULL,
  `genre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_details`
--

INSERT INTO `book_details` (`userid`, `bookid`, `bookname`, `genre`) VALUES
(1, 137, 'Harry Potter', 'fiction'),
(1, 138, 'Mahatma Gandhi Autobiography', 'inspirational');

-- --------------------------------------------------------

--
-- Table structure for table `chapter_details`
--

CREATE TABLE `chapter_details` (
  `bookid` int(20) NOT NULL,
  `chapterid` int(20) NOT NULL,
  `chaptername` varchar(50) NOT NULL,
  `chapter_no` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chapter_details`
--

INSERT INTO `chapter_details` (`bookid`, `chapterid`, `chaptername`, `chapter_no`) VALUES
(137, 120, 'chapter 1', 1),
(138, 121, 'chapter1 ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_details`
--

CREATE TABLE `page_details` (
  `chapterid` int(20) NOT NULL,
  `pageid` int(20) NOT NULL,
  `pagecontent` varchar(60000) NOT NULL,
  `page_no` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page_details`
--

INSERT INTO `page_details` (`chapterid`, `pageid`, `pagecontent`, `page_no`) VALUES
(120, 112, '<p><span style=\"color: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;\">The story unfolds with a letter arriving for Harry Potter, a simple boy, that brings with it a dark secret. The letter reveals to Harry Potter that both his parents were wizards and were killed by a Dark Lord’s curse when he was just a baby</span><br></p>', 1),
(121, 113, '<p>Manmohandas Karamchand Gandhi was a great leader.</p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(12) NOT NULL,
  `age` varchar(3) NOT NULL,
  `emailid` varchar(30) NOT NULL,
  `mobile_no` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`id`, `username`, `password`, `name`, `gender`, `age`, `emailid`, `mobile_no`) VALUES
(1, 'abc', 'abc', 'abc', 'male', '20', 'abc@gmail.com', 911),
(2, 'bhakti', 'bhakti', 'bhakti', 'female', '21', 'bk@gmail.com', 989889898),
(3, 'unnati', 'unnati', 'unnati', 'female', '21', 'unnati@gmail.com', 2147483647),
(4, 'mnhvjhg', '@Abcd1234', 'nvhg', 'male', '120', 'hjvjh@ghh.com', 1222222222),
(5, 'aaa', '@Abcd1234', 'RACHANA', 'female', '120', 'rachana@yhgv.com', 2147483647);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_details`
--
ALTER TABLE `book_details`
  ADD PRIMARY KEY (`bookid`),
  ADD KEY `fk_userid` (`userid`);

--
-- Indexes for table `chapter_details`
--
ALTER TABLE `chapter_details`
  ADD PRIMARY KEY (`chapterid`),
  ADD KEY `fk_bookid` (`bookid`);

--
-- Indexes for table `page_details`
--
ALTER TABLE `page_details`
  ADD PRIMARY KEY (`pageid`),
  ADD KEY `fk_chapterid` (`chapterid`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_details`
--
ALTER TABLE `book_details`
  MODIFY `bookid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `chapter_details`
--
ALTER TABLE `chapter_details`
  MODIFY `chapterid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT for table `page_details`
--
ALTER TABLE `page_details`
  MODIFY `pageid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_details`
--
ALTER TABLE `book_details`
  ADD CONSTRAINT `fk_userid` FOREIGN KEY (`userid`) REFERENCES `user_detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chapter_details`
--
ALTER TABLE `chapter_details`
  ADD CONSTRAINT `fk_bookid` FOREIGN KEY (`bookid`) REFERENCES `book_details` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `page_details`
--
ALTER TABLE `page_details`
  ADD CONSTRAINT `fk_chapterid` FOREIGN KEY (`chapterid`) REFERENCES `chapter_details` (`chapterid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
