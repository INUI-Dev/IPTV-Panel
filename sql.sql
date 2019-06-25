-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2019 at 06:17 PM
-- Server version: 5.7.25
-- PHP Version: 5.3.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `theme`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--
CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `code` text NOT NULL,
  `position` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `basket`
--

CREATE TABLE `basket` (
  `id` int(11) NOT NULL,
  `prod` varchar(1000) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  `paypal` varchar(1000) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT 'none',
  `paid` varchar(100) DEFAULT 'false',
  `hash` varchar(1000) DEFAULT NULL,
  `ext` varchar(20) DEFAULT '.zip',
  `downloads` int(11) DEFAULT '0',
  `ip` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `length` varchar(100) DEFAULT NULL,
  `type2` varchar(100) DEFAULT NULL,
  `display` varchar(1000) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `prod_type` varchar(100) DEFAULT 'none',
  `nac` varchar(100) NOT NULL DEFAULT 'none',
  `mac` varchar(100) NOT NULL DEFAULT 'none'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `browsers`
--

CREATE TABLE `browsers` (
  `id` int(11) NOT NULL,
  `identify` varchar(500) NOT NULL,
  `os` varchar(1000) NOT NULL,
  `browser` varchar(1000) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `products` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `city` varchar(1000) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `credits`
--

CREATE TABLE `credits` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `price` varchar(200) NOT NULL,
  `amount` int(200) NOT NULL,
  `desc` text NOT NULL,
  `cur_code` varchar(100) NOT NULL DEFAULT 'GBP',
  `cur_sign` varchar(100) NOT NULL DEFAULT '£'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `fname` varchar(1000) NOT NULL,
  `description` text NOT NULL,
  `subscriptions` longtext NOT NULL,
  `price` varchar(100) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `featured` varchar(20) NOT NULL DEFAULT 'true',
  `discount` varchar(100) NOT NULL DEFAULT 'none',
  `display` varchar(100) NOT NULL,
  `sales` int(11) NOT NULL DEFAULT '0',
  `category` text NOT NULL,
  `line` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'days',
  `length` varchar(100) NOT NULL,
  `prod_type` varchar(100) NOT NULL DEFAULT 'line'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iptv`
--

CREATE TABLE `iptv` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `m3u_name` varchar(1000) NOT NULL,
  `active` varchar(11) NOT NULL,
  `sub` varchar(200) NOT NULL,
  `code` longtext NOT NULL,
  `price` varchar(100) NOT NULL DEFAULT 'free',
  `location` text NOT NULL,
  `webtv` longtext NOT NULL,
  `smart_code` longtext NOT NULL,
  `limit` varchar(200) NOT NULL DEFAULT 'false',
  `limit_to` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `limit`
--

CREATE TABLE `limit` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `device` varchar(100) NOT NULL,
  `m3u` varchar(111) NOT NULL,
  `m3u_id` varchar(100) NOT NULL,
  `user` varchar(2000) NOT NULL,
  `user_agent` text NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'live',
  `country` varchar(200) NOT NULL DEFAULT 'not set',
  `city` varchar(200) NOT NULL DEFAULT 'not set',
  `ip_address` varchar(200) NOT NULL DEFAULT 'not set',
  `agent` varchar(2000) NOT NULL DEFAULT 'not set'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lines`
--

CREATE TABLE `lines` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `user` varchar(100) NOT NULL,
  `active` varchar(1000) NOT NULL DEFAULT 'false',
  `last_viewed` varchar(100) NOT NULL DEFAULT 'none',
  `total_views` int(11) NOT NULL DEFAULT '0',
  `sub_plan` varchar(1000) NOT NULL DEFAULT 'none',
  `pass` varchar(1000) NOT NULL DEFAULT 'none',
  `location` varchar(1000) NOT NULL DEFAULT 'noine',
  `expires` varchar(100) NOT NULL DEFAULT '0',
  `display` varchar(100) NOT NULL DEFAULT 'new',
  `length` varchar(100) NOT NULL DEFAULT '1000',
  `type` varchar(100) NOT NULL DEFAULT '0111',
  `seller` varchar(100) NOT NULL DEFAULT 'none',
  `limit_to` varchar(3) NOT NULL DEFAULT 'jhg',
  `mac` varchar(1000) DEFAULT 'Not Set'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `live`
--

CREATE TABLE `live` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `price` varchar(100) NOT NULL,
  `views` int(11) NOT NULL,
  `fname` varchar(1000) NOT NULL,
  `tvg_name` varchar(1000) NOT NULL,
  `name` varchar(200) NOT NULL,
  `visible` varchar(10) NOT NULL DEFAULT 'true',
  `display` varchar(200) NOT NULL,
  `added` varchar(1000) NOT NULL,
  `likes` int(11) NOT NULL,
  `series` varchar(100) NOT NULL DEFAULT 'Default',
  `m3u_name` varchar(1000) NOT NULL,
  `epg` varchar(500) DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m3u_names`
--

CREATE TABLE `m3u_names` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `items` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mesages`
--

CREATE TABLE `mesages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `from_email` varchar(200) NOT NULL,
  `subject` varchar(1000) NOT NULL DEFAULT 'Support Requesr',
  `status` varchar(1000) NOT NULL DEFAULT 'noreply'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ministra_streams`
--

CREATE TABLE `ministra_streams` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `code` varchar(500) NOT NULL,
  `item_id` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `m3u` int(11) NOT NULL,
  `epg` varchar(100) NOT NULL DEFAULT '.uk',
  `type` varchar(10) NOT NULL DEFAULT 'vod',
  `limit` varchar(100) NOT NULL DEFAULT 'false',
  `user` varchar(200) DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `name` varchar(1000) NOT NULL,
  `fname` varchar(1000) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `refer`
--

CREATE TABLE `refer` (
  `id` int(11) NOT NULL,
  `referrer` varchar(100) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rating` varchar(10) NOT NULL,
  `links` varchar(200) NOT NULL,
  `posted_by` varchar(100) NOT NULL,
  `review` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE `stats` (
  `id` int(11) NOT NULL,
  `lines` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `credits` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `user` varchar(1000) NOT NULL,
  `remaining` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `streams`
--

CREATE TABLE `streams` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `code` varchar(500) NOT NULL,
  `item_id` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `m3u` int(11) NOT NULL,
  `epg` varchar(100) NOT NULL DEFAULT '.uk',
  `type` varchar(10) NOT NULL DEFAULT 'vod',
  `limit` varchar(100) NOT NULL DEFAULT 'false',
  `user` varchar(200) DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `user` varchar(100) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'file',
  `display` varchar(1000) NOT NULL,
  `image` varchar(100) NOT NULL DEFAULT 'noimg.jpg',
  `expires` varchar(1000) NOT NULL,
  `uname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `code` text NOT NULL,
  `content` text NOT NULL,
  `display` varchar(1000) NOT NULL,
  `short` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabs`
--

CREATE TABLE `tabs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `directory` varchar(1000) NOT NULL,
  `colors` text NOT NULL,
  `color` varchar(1000) NOT NULL,
  `thumb` varchar(10000) NOT NULL DEFAULT 'none',
  `active` varchar(100) NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uname` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pword` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `active` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `role` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(300) COLLATE latin1_general_ci DEFAULT NULL,
  `signup_date` varchar(100) COLLATE latin1_general_ci DEFAULT '2012/01/07',
  `expire` varchar(100) COLLATE latin1_general_ci DEFAULT 'none',
  `expire_date` varchar(100) COLLATE latin1_general_ci DEFAULT 'none',
  `time` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `subscribed` varchar(100) COLLATE latin1_general_ci DEFAULT 'false',
  `credits` int(11) DEFAULT NULL,
  `purchased` int(11) DEFAULT NULL,
  `stream` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `stream_type` varchar(100) COLLATE latin1_general_ci DEFAULT 'default',
  `mac` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT 'none'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_db`
--

CREATE TABLE `users_db` (
  `uname` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pword` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `active` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `role` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(300) COLLATE latin1_general_ci DEFAULT NULL,
  `signup_date` varchar(100) COLLATE latin1_general_ci DEFAULT '2012/01/07',
  `expire` varchar(100) COLLATE latin1_general_ci DEFAULT 'none',
  `expire_date` varchar(100) COLLATE latin1_general_ci DEFAULT 'none',
  `time` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `subscribed` varchar(100) COLLATE latin1_general_ci DEFAULT 'false',
  `credits` int(11) DEFAULT NULL,
  `purchased` int(11) DEFAULT NULL,
  `stream` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `stream_type` varchar(100) COLLATE latin1_general_ci DEFAULT 'default'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_lines`
--

CREATE TABLE `user_lines` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `cost` varchar(100) NOT NULL,
  `length` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `m3u_name` varchar(1000) NOT NULL DEFAULT 'main.m3u'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_online`
--

CREATE TABLE `user_online` (
  `id` int(11) NOT NULL,
  `vid_id` int(11) NOT NULL,
  `isuser` varchar(10) NOT NULL,
  `session1` varchar(1000) NOT NULL,
  `time` varchar(1000) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `refer` text NOT NULL,
  `ip` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `town` varchar(100) NOT NULL,
  `browser` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_streams`
--

CREATE TABLE `user_streams` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `code` varchar(500) NOT NULL,
  `item_id` int(11) NOT NULL,
  `views` int(11) DEFAULT NULL,
  `m3u` int(11) DEFAULT NULL,
  `epg` varchar(100) NOT NULL DEFAULT '.uk',
  `type` varchar(10) NOT NULL DEFAULT 'vod',
  `limit` varchar(100) NOT NULL DEFAULT 'false',
  `user` varchar(200) DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `fname` varchar(5000) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `name` varchar(1000) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `display` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `desc` text COLLATE latin1_general_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `series` text COLLATE latin1_general_ci NOT NULL,
  `image` varchar(500) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dislike` int(11) NOT NULL DEFAULT '0',
  `length` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT 'Unknown',
  `type` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `visible` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `pass` varchar(500) COLLATE latin1_general_ci NOT NULL DEFAULT 'none',
  `featured` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `login` varchar(51) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `likes` int(11) NOT NULL DEFAULT '0',
  `added` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `liked_by` varchar(2000) COLLATE latin1_general_ci NOT NULL DEFAULT 'none',
  `sub` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `iptv` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT 'true'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vid_cate`
--

CREATE TABLE `vid_cate` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `browsers`
--
ALTER TABLE `browsers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iptv`
--
ALTER TABLE `iptv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `limit`
--
ALTER TABLE `limit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lines`
--
ALTER TABLE `lines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live`
--
ALTER TABLE `live`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m3u_names`
--
ALTER TABLE `m3u_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mesages`
--
ALTER TABLE `mesages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ministra_streams`
--
ALTER TABLE `ministra_streams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refer`
--
ALTER TABLE `refer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `streams`
--
ALTER TABLE `streams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tabs`
--
ALTER TABLE `tabs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uname`);

--
-- Indexes for table `users_db`
--
ALTER TABLE `users_db`
  ADD PRIMARY KEY (`uname`);

--
-- Indexes for table `user_lines`
--
ALTER TABLE `user_lines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_online`
--
ALTER TABLE `user_online`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_streams`
--
ALTER TABLE `user_streams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vid_cate`
--
ALTER TABLE `vid_cate`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `basket`
--
ALTER TABLE `basket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `browsers`
--
ALTER TABLE `browsers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credits`
--
ALTER TABLE `credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iptv`
--
ALTER TABLE `iptv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `limit`
--
ALTER TABLE `limit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lines`
--
ALTER TABLE `lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live`
--
ALTER TABLE `live`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m3u_names`
--
ALTER TABLE `m3u_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mesages`
--
ALTER TABLE `mesages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ministra_streams`
--
ALTER TABLE `ministra_streams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refer`
--
ALTER TABLE `refer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stats`
--
ALTER TABLE `stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `streams`
--
ALTER TABLE `streams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabs`
--
ALTER TABLE `tabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_lines`
--
ALTER TABLE `user_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_online`
--
ALTER TABLE `user_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_streams`
--
ALTER TABLE `user_streams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vid_cate`
--
ALTER TABLE `vid_cate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

CREATE TABLE IF NOT EXISTS `ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `code` text,
  `position` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `name`, `code`, `position`) VALUES
(5, 'top', '<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<!-- in2streams -->\r\n<ins class="adsbygoogle"\r\n     style="display:block"\r\n     data-ad-client="ca-pub-4579602742595312"\r\n     data-ad-slot="1912793884"\r\n     data-ad-format="auto"\r\n     data-full-width-responsive="true"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', 'top'),
(6, 'Side', '<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<!-- in2streams -->\r\n<ins class="adsbygoogle"\r\n     style="display:block"\r\n     data-ad-client="ca-pub-4579602742595312"\r\n     data-ad-slot="1912793884"\r\n     data-ad-format="auto"\r\n     data-full-width-responsive="true"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', 'side');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--


CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `settings`
--


-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE IF NOT EXISTS `stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lines` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `credits` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `user` varchar(1000) DEFAULT NULL,
  `remaining` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `stats`
--


-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE IF NOT EXISTS `themes` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `directory` varchar(1000) DEFAULT NULL,
  `colors` text,
  `color` varchar(1000) DEFAULT NULL,
  `thumb` varchar(10000) DEFAULT 'none',
  `active` varchar(100) DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `directory`, `colors`, `color`, `thumb`, `active`) VALUES
(1, 'original', 'new', '', '', 'none', 'false'),
(2, 'new', 'purpos', '', '0', 'none', 'true');

