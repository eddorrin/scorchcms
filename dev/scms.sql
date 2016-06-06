-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Vert: localhost:3306
-- Generert den: 05. Jun, 2016 21:30 PM
-- Tjenerversjon: 10.0.24-MariaDB
-- PHP-Versjon: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ispecws_scms`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `achievements`
--

CREATE TABLE IF NOT EXISTS `achievements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) NOT NULL DEFAULT 'ACH_',
  `category` varchar(255) NOT NULL DEFAULT 'identity',
  `level` int(11) NOT NULL DEFAULT '1',
  `reward_pixels` int(11) NOT NULL DEFAULT '100',
  `reward_points` int(11) DEFAULT '10',
  `progress_needed` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `badge_shop`
--

CREATE TABLE IF NOT EXISTS `badge_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badge_id` varchar(10) NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bantype` enum('user','ip') NOT NULL DEFAULT 'user',
  `value` varchar(50) NOT NULL,
  `reason` text NOT NULL,
  `expire` double NOT NULL DEFAULT '0',
  `added_by` varchar(50) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `appeal_state` enum('0','1','2') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=292 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `bans_appeals`
--

CREATE TABLE IF NOT EXISTS `bans_appeals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ban_id` int(11) NOT NULL,
  `send_ip` varchar(50) NOT NULL,
  `send_date` varchar(120) NOT NULL,
  `mail` varchar(120) NOT NULL,
  `plea` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ban_id` (`ban_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `bots`
--

CREATE TABLE IF NOT EXISTS `bots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ai_type` enum('generic','guide','pet') NOT NULL DEFAULT 'generic',
  `name` varchar(100) NOT NULL,
  `motto` varchar(120) NOT NULL,
  `look` text NOT NULL,
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `z` int(11) NOT NULL DEFAULT '0',
  `rotation` int(11) NOT NULL DEFAULT '0',
  `walk_mode` enum('stand','freeroam','specified_range') NOT NULL DEFAULT 'stand',
  `min_x` int(11) NOT NULL DEFAULT '0',
  `min_y` int(11) NOT NULL DEFAULT '0',
  `max_x` int(11) NOT NULL DEFAULT '0',
  `max_y` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `bots_responses`
--

CREATE TABLE IF NOT EXISTS `bots_responses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bot_id` int(10) unsigned NOT NULL,
  `keywords` text NOT NULL,
  `response_text` varchar(200) NOT NULL,
  `mode` enum('say','shout','whisper') NOT NULL DEFAULT 'say',
  `serve_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bot_id` (`bot_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `bots_speech`
--

CREATE TABLE IF NOT EXISTS `bots_speech` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bot_id` int(10) unsigned NOT NULL,
  `text` varchar(200) NOT NULL,
  `shout` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bot_id` (`bot_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `catalog_items`
--

CREATE TABLE IF NOT EXISTS `catalog_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `item_ids` varchar(120) NOT NULL,
  `catalog_name` varchar(100) NOT NULL,
  `cost_credits` int(11) NOT NULL,
  `cost_pixels` int(11) NOT NULL,
  `cost_snow` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL,
  `vip` enum('0','1','2') NOT NULL DEFAULT '0',
  `achievement` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4294967296 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `catalog_marketplace_offers`
--

CREATE TABLE IF NOT EXISTS `catalog_marketplace_offers` (
  `offer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `asking_price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL DEFAULT '0',
  `public_name` text NOT NULL,
  `sprite_id` int(11) NOT NULL,
  `item_type` int(1) NOT NULL DEFAULT '1',
  `timestamp` double NOT NULL,
  `state` int(1) NOT NULL DEFAULT '1',
  `extra_data` text NOT NULL,
  PRIMARY KEY (`offer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37997 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `catalog_pages`
--

CREATE TABLE IF NOT EXISTS `catalog_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '-1',
  `caption` varchar(100) NOT NULL,
  `icon_color` int(11) NOT NULL DEFAULT '1',
  `icon_image` int(11) NOT NULL DEFAULT '1',
  `visible` enum('0','1') NOT NULL DEFAULT '1',
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  `min_rank` int(10) unsigned NOT NULL DEFAULT '1',
  `club_only` enum('0','1') NOT NULL DEFAULT '0',
  `order_num` int(11) NOT NULL,
  `page_layout` enum('default_3x3','frontpage','spaces','recycler','recycler_info','recycler_prizes','trophies','plasto','marketplace','marketplace_own_items','pets','pets2','club_buy','spaces_new','club_gifts') NOT NULL DEFAULT 'default_3x3',
  `page_headline` text NOT NULL,
  `page_teaser` text NOT NULL,
  `page_special` text NOT NULL,
  `page_text1` text NOT NULL,
  `page_text2` text NOT NULL,
  `page_text_details` text NOT NULL,
  `page_text_teaser` text NOT NULL,
  `vip_only` enum('1','0') NOT NULL DEFAULT '0',
  `page_link_description` text NOT NULL,
  `page_link_pagename` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2147483648 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `chatlogs`
--

CREATE TABLE IF NOT EXISTS `chatlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `hour` int(11) NOT NULL,
  `minute` int(11) NOT NULL,
  `full_date` varchar(120) NOT NULL,
  `timestamp` double NOT NULL,
  `message` text NOT NULL,
  `user_name` varchar(100) NOT NULL DEFAULT 'Unknown User',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`room_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `cms_contents`
--

CREATE TABLE IF NOT EXISTS `cms_contents` (
  `add_footer` text NOT NULL,
  `add_side` text NOT NULL,
  `googleanalytics` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `cms_news`
--

CREATE TABLE IF NOT EXISTS `cms_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `shortstory` text COLLATE latin1_general_ci,
  `longstory` text COLLATE latin1_general_ci,
  `published` int(10) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE latin1_general_ci DEFAULT '/Public/Images/news/TS_Web60.png',
  `campaign` int(1) NOT NULL DEFAULT '0',
  `campaignimg` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `author` int(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `country_banned`
--

CREATE TABLE IF NOT EXISTS `country_banned` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `country_sites`
--

CREATE TABLE IF NOT EXISTS `country_sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `credit_vouchers`
--

CREATE TABLE IF NOT EXISTS `credit_vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `code` (`code`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=105 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `ecotron_rewards`
--

CREATE TABLE IF NOT EXISTS `ecotron_rewards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `display_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `reward_level` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `external_texts`
--

CREATE TABLE IF NOT EXISTS `external_texts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skey` text NOT NULL,
  `sval` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `external_variables`
--

CREATE TABLE IF NOT EXISTS `external_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skey` text NOT NULL,
  `sval` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `faq`
--

CREATE TABLE IF NOT EXISTS `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `furniture`
--

CREATE TABLE IF NOT EXISTS `furniture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `public_name` varchar(100) NOT NULL COMMENT 'temp only',
  `item_name` varchar(100) NOT NULL,
  `type` enum('s','i','e','h','v') NOT NULL DEFAULT 's',
  `width` int(11) NOT NULL DEFAULT '1',
  `length` int(11) NOT NULL DEFAULT '1',
  `stack_height` double NOT NULL DEFAULT '1',
  `can_stack` enum('0','1') NOT NULL DEFAULT '1',
  `can_sit` enum('0','1') NOT NULL DEFAULT '0',
  `is_walkable` enum('0','1') NOT NULL DEFAULT '0',
  `sprite_id` int(11) NOT NULL,
  `allow_recycle` enum('0','1') NOT NULL DEFAULT '1',
  `allow_trade` enum('0','1') NOT NULL DEFAULT '1',
  `allow_marketplace_sell` enum('0','1') NOT NULL DEFAULT '1',
  `allow_gift` enum('0','1') NOT NULL DEFAULT '1',
  `allow_inventory_stack` enum('0','1') NOT NULL DEFAULT '1',
  `interaction_type` enum('default','gate','postit','roomeffect','dimmer','trophy','bed','scoreboard','vendingmachine','alert','onewaygate','loveshuffler','habbowheel','dice','bottle','teleport','rentals','pet','roller','water','ball','bb_red_gate','bb_green_gate','bb_yellow_gate','bb_puck','bb_blue_gate','bb_patch','bb_teleport','blue_score','green_score','red_score','yellow_score','fbgate','tagpole','counter','red_goal','blue_goal','yellow_goal','green_goal','wired','wf_trg_onsay','wf_act_saymsg','wf_trg_enterroom','wf_act_moveuser','wf_act_togglefurni','wf_trg_furnistate','wf_trg_onfurni','pressure_pad','wf_trg_offfurni','wf_trg_gameend','wf_trg_gamestart','wf_trg_timer','wf_act_givepoints','wf_trg_attime','wf_trg_atscore','wf_act_moverotate','rollerskate','stickiepole','wf_xtra_random','wf_cnd_trggrer_on_frn','wf_cnd_furnis_hv_avtrs','wf_act_matchfurni','wf_cnd_has_furni_on','puzzlebox','switch','wf_act_give_phx','wf_cnd_phx') NOT NULL DEFAULT 'default',
  `interaction_modes_count` int(11) NOT NULL DEFAULT '1',
  `vending_ids` varchar(100) NOT NULL DEFAULT '0',
  `is_arrow` enum('0','1') NOT NULL DEFAULT '0',
  `foot_figure` enum('0','1') NOT NULL DEFAULT '0',
  `height_adjustable` varchar(100) NOT NULL DEFAULT '0',
  `effectM` int(3) NOT NULL DEFAULT '0',
  `effectF` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=999888202 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `fuserights`
--

CREATE TABLE IF NOT EXISTS `fuserights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) unsigned NOT NULL,
  `fuse` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rank` (`rank`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dataark for tabell `fuserights`
--

INSERT INTO `fuserights` (`id`, `rank`, `fuse`) VALUES
(1, 1, 'fuse_room_queue_default'),
(2, 1, 'fuse_buy_credits'),
(3, 1, 'fuse_login'),
(4, 1, 'default'),
(5, 1, 'fuse_trade'),
(6, 4, 'fuse_mod'),
(7, 6, 'fuse_admin'),
(8, 7, 'fuse_sysadmin'),
(9, 4, 'fuse_enter_any_room'),
(10, 1, 'fuse_club_dances'),
(11, 3, 'fuse_housekeeping_login'),
(12, 6, 'fuse_chatlogs'),
(13, 34, 'fuse_alert'),
(14, 4, 'fuse_kick'),
(15, 4, 'fuse_ban'),
(16, 7, 'fuse_housekeeping_catalog'),
(17, 4, 'fuse_housekeeping_moderation'),
(18, 6, 'fuse_housekeeping_sitemanagement'),
(19, 4, 'fuse_any_room_rights'),
(20, 6, 'fuse_ignore_maintenance'),
(21, 4, 'fuse_mute'),
(22, 4, 'fuse_roomkick'),
(23, 4, 'fuse_roomalert'),
(24, 4, 'fuse_enter_full_rooms'),
(25, 1, 'fuse_hide_room_walls');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `fuserights_subs`
--

CREATE TABLE IF NOT EXISTS `fuserights_subs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub` varchar(120) NOT NULL,
  `fuse` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub` (`sub`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `groups_details`
--

CREATE TABLE IF NOT EXISTS `groups_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `ownerid` int(10) NOT NULL,
  `roomid` int(10) NOT NULL,
  `created` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `badge` text COLLATE latin1_general_ci NOT NULL,
  `type` int(1) NOT NULL DEFAULT '0',
  `recommended` int(1) NOT NULL DEFAULT '0',
  `views` int(15) NOT NULL,
  `pane` smallint(1) NOT NULL DEFAULT '0',
  `topics` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `groups_memberships`
--

CREATE TABLE IF NOT EXISTS `groups_memberships` (
  `userid` int(10) NOT NULL,
  `groupid` int(10) NOT NULL,
  `member_rank` enum('3','2','1') COLLATE latin1_general_ci NOT NULL DEFAULT '3',
  `is_current` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `is_pending` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  KEY `userid` (`userid`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `help_subjects`
--

CREATE TABLE IF NOT EXISTS `help_subjects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `caption` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `help_topics`
--

CREATE TABLE IF NOT EXISTS `help_topics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject` int(11) unsigned NOT NULL DEFAULT '1',
  `title` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `known_issue` enum('0','1','2') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `hk_board`
--

CREATE TABLE IF NOT EXISTS `hk_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `hk_fuses`
--

CREATE TABLE IF NOT EXISTS `hk_fuses` (
  `fuse` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `hk_log`
--

CREATE TABLE IF NOT EXISTS `hk_log` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16525 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `homes`
--

CREATE TABLE IF NOT EXISTS `homes` (
  `home_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_type` enum('user','group') NOT NULL DEFAULT 'user',
  `link_id` int(10) unsigned NOT NULL,
  `allow_display` enum('0','1') NOT NULL DEFAULT '1',
  `bgimage` varchar(120) NOT NULL DEFAULT 'b_bg_colour_01',
  PRIMARY KEY (`home_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `homes_catalog`
--

CREATE TABLE IF NOT EXISTS `homes_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `type` varchar(1) NOT NULL,
  `data` text NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '1',
  `category` int(11) NOT NULL,
  `sorted` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1294 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `homes_categories`
--

CREATE TABLE IF NOT EXISTS `homes_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(120) NOT NULL DEFAULT 'stickers',
  `caption` varchar(120) NOT NULL DEFAULT 'undefined',
  `fuse_requirement` varchar(120) NOT NULL DEFAULT '',
  `order_num` int(11) NOT NULL DEFAULT '1',
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `homes_inventory`
--

CREATE TABLE IF NOT EXISTS `homes_inventory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL,
  `data` varchar(250) NOT NULL,
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `homes_items`
--

CREATE TABLE IF NOT EXISTS `homes_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `home_id` int(10) unsigned NOT NULL,
  `type` enum('sticker','widget','stickie') NOT NULL DEFAULT 'sticker',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `z` int(11) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `skin` text NOT NULL,
  `owner_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `x` (`x`) USING BTREE,
  KEY `y` (`y`) USING BTREE,
  KEY `z` (`z`) USING BTREE,
  KEY `home_id` (`home_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `ipn_requests`
--

CREATE TABLE IF NOT EXISTS `ipn_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` text NOT NULL,
  `ip` text NOT NULL,
  `status` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0 = Error, 1 = OK, 2 = Forced, 3 = Auth failure, 4 = UID not found, 5 = Forced, 6 = Data failure',
  `request_data` text NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `balance_diff` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `ip_cache`
--

CREATE TABLE IF NOT EXISTS `ip_cache` (
  `ip` varchar(16) NOT NULL,
  `country` varchar(75) NOT NULL DEFAULT 'UNKNOWN',
  `isSafe` enum('false','true') DEFAULT 'true',
  PRIMARY KEY (`ip`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `irc_sessions`
--

CREATE TABLE IF NOT EXISTS `irc_sessions` (
  `irc_username` varchar(50) NOT NULL,
  `vg_username` varchar(50) NOT NULL,
  `rank` int(1) NOT NULL,
  PRIMARY KEY (`irc_username`,`vg_username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `irc_users`
--

CREATE TABLE IF NOT EXISTS `irc_users` (
  `id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `base_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `id_UNIQUE` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28192 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `items_base`
--

CREATE TABLE IF NOT EXISTS `items_base` (
  `item_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `sprite_id` int(11) NOT NULL,
  `public_name` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `width` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `height` double(3,2) NOT NULL,
  `allow_stack` tinyint(1) NOT NULL,
  `allow_walk` tinyint(1) NOT NULL,
  `allow_sit` tinyint(1) NOT NULL,
  `allow_recycle` tinyint(1) NOT NULL,
  `allow_trade` tinyint(1) NOT NULL,
  `allow_marketplace_sell` tinyint(1) NOT NULL,
  `allow_gift` tinyint(1) NOT NULL,
  `allow_inventory_stack` tinyint(1) NOT NULL,
  `interaction_type` varchar(50) NOT NULL,
  `cycle_count` int(2) NOT NULL,
  `vending_ids` varchar(20) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2794 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `items_base_gifts`
--

CREATE TABLE IF NOT EXISTS `items_base_gifts` (
  `baseid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`baseid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `items_extradata`
--

CREATE TABLE IF NOT EXISTS `items_extradata` (
  `item_id` int(10) unsigned NOT NULL,
  `data` varchar(500) NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `items_gifts`
--

CREATE TABLE IF NOT EXISTS `items_gifts` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gift_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`,`gift_id`),
  UNIQUE KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `items_moodlight`
--

CREATE TABLE IF NOT EXISTS `items_moodlight` (
  `item_id` int(10) unsigned NOT NULL,
  `enabled` enum('0','1') NOT NULL DEFAULT '0',
  `current_preset` int(11) NOT NULL,
  `preset_one` text NOT NULL,
  `preset_two` text NOT NULL,
  `preset_three` text NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `items_rooms`
--

CREATE TABLE IF NOT EXISTS `items_rooms` (
  `item_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `x` decimal(4,2) NOT NULL COMMENT 'Holds data XX,YY for floor items, and width XX,YY for wall items',
  `y` decimal(4,2) NOT NULL COMMENT 'Holds data ZZ,ZZ for floor items (height), and length XX,YY for wall items	',
  `n` tinyint(2) NOT NULL COMMENT '0-6: Regular rotation for floor items, 7: left, 8: right for wall items',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `items_tele_links`
--

CREATE TABLE IF NOT EXISTS `items_tele_links` (
  `tele_one_id` int(10) unsigned NOT NULL,
  `tele_two_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tele_one_id`,`tele_two_id`),
  UNIQUE KEY `tele_one_id` (`tele_one_id`) USING BTREE,
  UNIQUE KEY `tele_two_id` (`tele_two_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `items_translations`
--

CREATE TABLE IF NOT EXISTS `items_translations` (
  `old` int(11) NOT NULL,
  `new` int(11) NOT NULL,
  PRIMARY KEY (`old`,`new`),
  KEY `old` (`old`),
  KEY `new` (`new`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `items_users`
--

CREATE TABLE IF NOT EXISTS `items_users` (
  `item_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `item_id_generator`
--

CREATE TABLE IF NOT EXISTS `item_id_generator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_generator` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_generator` (`id_generator`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `messenger_friendships`
--

CREATE TABLE IF NOT EXISTS `messenger_friendships` (
  `sender` int(10) unsigned NOT NULL,
  `receiver` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sender`,`receiver`),
  KEY `i_sender` (`sender`) USING HASH,
  KEY `i_receiver` (`receiver`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `messenger_requests`
--

CREATE TABLE IF NOT EXISTS `messenger_requests` (
  `sender` int(10) unsigned NOT NULL,
  `receiver` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sender`,`receiver`),
  KEY `i_sender` (`sender`) USING HASH,
  KEY `i_receiver` (`receiver`) USING HASH
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `mobwars`
--

CREATE TABLE IF NOT EXISTS `mobwars` (
  `mobwars_lobbyid` int(11) NOT NULL DEFAULT '0',
  `mobwars_arenaid` int(11) NOT NULL DEFAULT '0',
  `red_xyz` varchar(11) NOT NULL DEFAULT '1',
  `blue_xyz` varchar(11) NOT NULL DEFAULT '1',
  `red_arenaxy` varchar(11) NOT NULL DEFAULT '1',
  `blue_arenaxy` varchar(11) NOT NULL DEFAULT '1',
  `spectate_xy` varchar(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `moderation_forum_replies`
--

CREATE TABLE IF NOT EXISTS `moderation_forum_replies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(10) unsigned NOT NULL,
  `poster` varchar(120) NOT NULL,
  `date` varchar(50) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `moderation_forum_threads`
--

CREATE TABLE IF NOT EXISTS `moderation_forum_threads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poster` varchar(100) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `date` varchar(50) NOT NULL,
  `timestamp` double NOT NULL,
  `message` text NOT NULL,
  `locked` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `moderation_presets`
--

CREATE TABLE IF NOT EXISTS `moderation_presets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  `type` enum('message','roommessage') NOT NULL DEFAULT 'message',
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `moderation_tickets`
--

CREATE TABLE IF NOT EXISTS `moderation_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `status` enum('open','picked','resolved','abusive','invalid','deleted') NOT NULL DEFAULT 'open',
  `sender_id` int(10) unsigned NOT NULL,
  `reported_id` int(10) unsigned NOT NULL,
  `moderator_id` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `timestamp` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2491 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `navigator_flatcats`
--

CREATE TABLE IF NOT EXISTS `navigator_flatcats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(100) NOT NULL,
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  `min_rank` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `navigator_pubcats`
--

CREATE TABLE IF NOT EXISTS `navigator_pubcats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(100) NOT NULL,
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `navigator_pubcats_old`
--

CREATE TABLE IF NOT EXISTS `navigator_pubcats_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(100) NOT NULL,
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `navigator_publics`
--

CREATE TABLE IF NOT EXISTS `navigator_publics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernum` int(11) NOT NULL DEFAULT '1',
  `bannertype` enum('0','1') NOT NULL COMMENT '0 = big, 1 = normal',
  `caption` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `image_type` enum('internal','external') NOT NULL DEFAULT 'internal',
  `room_id` int(10) unsigned NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `category_parent_id` int(11) NOT NULL DEFAULT '-1',
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  `recommended` enum('0','1') NOT NULL DEFAULT '0',
  `category` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `news_comments`
--

CREATE TABLE IF NOT EXISTS `news_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `posttime` int(11) NOT NULL,
  `content` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=329 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `date` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `profile_blocks`
--

CREATE TABLE IF NOT EXISTS `profile_blocks` (
  `page_id` int(11) NOT NULL,
  `blocked_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `profile_wall`
--

CREATE TABLE IF NOT EXISTS `profile_wall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `owner_read` enum('0','1') NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `quests`
--

CREATE TABLE IF NOT EXISTS `quests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(32) NOT NULL DEFAULT '',
  `series_number` int(11) NOT NULL DEFAULT '0',
  `goal_type` int(10) NOT NULL DEFAULT '0',
  `goal_data` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `reward` int(11) NOT NULL DEFAULT '10',
  `data_bit` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `ranks`
--

CREATE TABLE IF NOT EXISTS `ranks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `prefix` text NOT NULL,
  `suffix` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9002 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roomtype` enum('public','private') NOT NULL DEFAULT 'private',
  `caption` varchar(100) NOT NULL DEFAULT 'Room',
  `owner` varchar(75) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL,
  `category` int(2) NOT NULL DEFAULT '0',
  `state` enum('open','locked','password') NOT NULL DEFAULT 'open',
  `users_now` int(3) NOT NULL DEFAULT '0',
  `users_max` int(3) NOT NULL DEFAULT '25',
  `model_name` varchar(20) NOT NULL,
  `public_ccts` text NOT NULL,
  `score` int(6) NOT NULL DEFAULT '0',
  `tags` varchar(100) NOT NULL,
  `icon_bg` int(2) NOT NULL DEFAULT '1',
  `icon_fg` int(2) NOT NULL DEFAULT '0',
  `icon_items` varchar(10) NOT NULL DEFAULT '0.0',
  `password` text NOT NULL,
  `wallpaper` varchar(10) NOT NULL DEFAULT '0.0',
  `floor` varchar(10) NOT NULL DEFAULT '0.0',
  `landscape` varchar(10) NOT NULL DEFAULT '0.0',
  `allow_pets` enum('0','1') NOT NULL DEFAULT '1',
  `allow_pets_eat` enum('0','1') NOT NULL DEFAULT '0',
  `allow_walkthrough` enum('0','1') NOT NULL DEFAULT '0',
  `allow_hidewall` enum('1','0') NOT NULL DEFAULT '0',
  `allow_rightsoverride` enum('1','0') NOT NULL DEFAULT '0',
  `floorthickness` int(11) NOT NULL DEFAULT '1',
  `wallthickness` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING HASH,
  KEY `owner` (`owner`) USING BTREE,
  KEY `category` (`category`) USING BTREE,
  KEY `caption` (`caption`) USING BTREE,
  KEY `tags` (`tags`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=165 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `room_active`
--

CREATE TABLE IF NOT EXISTS `room_active` (
  `roomid` int(10) unsigned NOT NULL,
  `active_users` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`roomid`),
  UNIQUE KEY `roomid` (`roomid`) USING HASH,
  KEY `activeusers` (`active_users`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `room_ads`
--

CREATE TABLE IF NOT EXISTS `room_ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ad_image` text NOT NULL,
  `ad_image_orig` text NOT NULL,
  `ad_link` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `views_limit` int(11) NOT NULL DEFAULT '0' COMMENT '0 = unlimited',
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `room_items`
--

CREATE TABLE IF NOT EXISTS `room_items` (
  `id` int(9) unsigned NOT NULL,
  `room_id` int(9) unsigned NOT NULL,
  `base_item` int(5) unsigned NOT NULL,
  `extra_data` text NOT NULL,
  `x` int(3) NOT NULL,
  `y` int(3) NOT NULL,
  `z` double NOT NULL,
  `rot` int(1) NOT NULL,
  `wall_pos` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `room_items_moodlight`
--

CREATE TABLE IF NOT EXISTS `room_items_moodlight` (
  `item_id` int(10) unsigned NOT NULL,
  `enabled` enum('0','1') NOT NULL DEFAULT '0',
  `current_preset` int(11) NOT NULL,
  `preset_one` text NOT NULL,
  `preset_two` text NOT NULL,
  `preset_three` text NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_id` (`item_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `room_items_songs`
--

CREATE TABLE IF NOT EXISTS `room_items_songs` (
  `item_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `song_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`,`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `room_links`
--

CREATE TABLE IF NOT EXISTS `room_links` (
  `roomid` int(9) unsigned NOT NULL,
  `toroomid` int(9) unsigned NOT NULL,
  `fromx` int(2) NOT NULL,
  `fromy` int(2) NOT NULL,
  `tox` int(2) NOT NULL,
  `toy` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `room_links_copy`
--

CREATE TABLE IF NOT EXISTS `room_links_copy` (
  `roomid` int(9) unsigned NOT NULL,
  `toroomid` int(9) unsigned NOT NULL,
  `fromx` int(2) NOT NULL,
  `fromy` int(2) NOT NULL,
  `tox` int(2) NOT NULL,
  `toy` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `room_models`
--

CREATE TABLE IF NOT EXISTS `room_models` (
  `id` varchar(100) NOT NULL,
  `door_x` int(11) NOT NULL,
  `door_y` int(11) NOT NULL,
  `door_z` double NOT NULL,
  `door_dir` int(4) NOT NULL DEFAULT '2',
  `heightmap` text NOT NULL,
  `public_items` text NOT NULL,
  `club_only` enum('0','1') NOT NULL DEFAULT '0',
  `poolmap` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `room_models_customs`
--

CREATE TABLE IF NOT EXISTS `room_models_customs` (
  `roomid` int(11) NOT NULL,
  `doorx` int(2) NOT NULL,
  `doory` int(2) NOT NULL,
  `height` double NOT NULL,
  `modeldata` text NOT NULL,
  `poolmap` text NOT NULL,
  PRIMARY KEY (`roomid`),
  UNIQUE KEY `roomid` (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `room_model_static`
--

CREATE TABLE IF NOT EXISTS `room_model_static` (
  `model` varchar(30) NOT NULL,
  `x` int(3) NOT NULL,
  `y` int(3) NOT NULL,
  `rot` int(3) NOT NULL,
  `content` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `room_rights`
--

CREATE TABLE IF NOT EXISTS `room_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `room_swearword_filter`
--

CREATE TABLE IF NOT EXISTS `room_swearword_filter` (
  `word` varchar(200) NOT NULL,
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `server_status`
--

CREATE TABLE IF NOT EXISTS `server_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `users_online` int(11) NOT NULL DEFAULT '0',
  `rooms_loaded` int(11) NOT NULL DEFAULT '0',
  `server_ver` text NOT NULL,
  `stamp` double NOT NULL,
  `minutesuptime` int(11) NOT NULL,
  `userpeak` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dataark for tabell `server_status`
--

INSERT INTO `server_status` (`id`, `status`, `users_online`, `rooms_loaded`, `server_ver`, `stamp`, `minutesuptime`, `userpeak`) VALUES
(2, '1', 0, 0, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `site_app_form`
--

CREATE TABLE IF NOT EXISTS `site_app_form` (
  `id` varchar(24) NOT NULL,
  `caption` varchar(120) NOT NULL,
  `descr` text NOT NULL,
  `field_type` enum('textbox','textarea','checkbox') NOT NULL,
  `required` enum('0','1') NOT NULL DEFAULT '1',
  `order_num` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `site_app_openings`
--

CREATE TABLE IF NOT EXISTS `site_app_openings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `text_descr` text NOT NULL,
  `text_reqs` text NOT NULL,
  `text_duties` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `site_config`
--

CREATE TABLE IF NOT EXISTS `site_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maintenance` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `maintaince` (`maintenance`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `site_cron`
--

CREATE TABLE IF NOT EXISTS `site_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prio` int(11) NOT NULL DEFAULT '5',
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  `scriptfile` varchar(50) NOT NULL,
  `last_exec` int(11) NOT NULL,
  `exec_every` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `site_hotcampaigns`
--

CREATE TABLE IF NOT EXISTS `site_hotcampaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '1',
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  `image_url` text NOT NULL,
  `caption` text NOT NULL,
  `descr` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `site_minimail`
--

CREATE TABLE IF NOT EXISTS `site_minimail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `receiver_id` int(10) unsigned NOT NULL,
  `folder` enum('inbox','sent','trash') NOT NULL DEFAULT 'inbox',
  `is_read` enum('0','1') NOT NULL DEFAULT '0',
  `subject` varchar(120) NOT NULL,
  `date` varchar(120) NOT NULL,
  `isodate` varchar(120) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2201 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `site_navi`
--

CREATE TABLE IF NOT EXISTS `site_navi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `caption` text NOT NULL,
  `class` text NOT NULL,
  `url` text NOT NULL,
  `visibility` enum('0','1','2','3') NOT NULL COMMENT '0 = Never, 1 = Always, 2 = Logged in only, 3 = Guests only',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `site_news`
--

CREATE TABLE IF NOT EXISTS `site_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seo_link` varchar(120) NOT NULL DEFAULT 'news-article',
  `title` text NOT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `topstory_image` text NOT NULL,
  `body` text NOT NULL,
  `snippet` text NOT NULL,
  `datestr` varchar(50) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `datestr` (`datestr`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `site_news_categories`
--

CREATE TABLE IF NOT EXISTS `site_news_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caption` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `songs`
--

CREATE TABLE IF NOT EXISTS `songs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `artist` varchar(32) NOT NULL,
  `song_data` text NOT NULL,
  `length` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `stafflog`
--

CREATE TABLE IF NOT EXISTS `stafflog` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `command` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `staff_bios`
--

CREATE TABLE IF NOT EXISTS `staff_bios` (
  `id` int(11) NOT NULL DEFAULT '0',
  `user` varchar(250) DEFAULT NULL,
  `bio` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `staff_log`
--

CREATE TABLE IF NOT EXISTS `staff_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staffuser` varchar(40) NOT NULL,
  `target` varchar(40) NOT NULL,
  `action_type` varchar(40) NOT NULL,
  `description` text,
  `extra_info` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `staff_logs`
--

CREATE TABLE IF NOT EXISTS `staff_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staffuser` varchar(40) NOT NULL,
  `target` varchar(40) NOT NULL,
  `action_type` varchar(40) NOT NULL,
  `description` text,
  `extra_info` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44010 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `tele_links`
--

CREATE TABLE IF NOT EXISTS `tele_links` (
  `tele_one_id` int(10) unsigned NOT NULL,
  `tele_two_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tele_one_id`,`tele_two_id`),
  UNIQUE KEY `tele_one_id` (`tele_one_id`) USING BTREE,
  UNIQUE KEY `tele_two_id` (`tele_two_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `trigger_in_place`
--

CREATE TABLE IF NOT EXISTS `trigger_in_place` (
  `original_trigger` int(11) NOT NULL,
  `triggers_item` int(11) NOT NULL,
  PRIMARY KEY (`original_trigger`,`triggers_item`),
  KEY `triggers_item` (`triggers_item`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `trigger_item`
--

CREATE TABLE IF NOT EXISTS `trigger_item` (
  `trigger_id` int(11) NOT NULL,
  `trigger_input` enum('integer','multi_furniture','static_trigger','string') NOT NULL,
  `trigger_data_2` varchar(10) DEFAULT NULL,
  `trigger_data` varchar(100) DEFAULT NULL,
  `all_user_triggerable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`trigger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `trigger_rotation`
--

CREATE TABLE IF NOT EXISTS `trigger_rotation` (
  `item_id` int(11) NOT NULL,
  `rotation_status` tinyint(4) NOT NULL,
  `movement_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `uberdown`
--

CREATE TABLE IF NOT EXISTS `uberdown` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(50) NOT NULL,
  `shit` char(255) NOT NULL,
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(50) NOT NULL,
  `real_name` char(100) NOT NULL DEFAULT '',
  `password` char(42) NOT NULL,
  `mail` varchar(50) NOT NULL DEFAULT 'defaultuser@meth0d.org',
  `auth_ticket` varchar(60) NOT NULL,
  `rank` int(1) unsigned NOT NULL DEFAULT '1',
  `credits` int(11) NOT NULL DEFAULT '0',
  `vip_points` int(11) NOT NULL DEFAULT '0',
  `activity_points` int(11) NOT NULL DEFAULT '0',
  `activity_points_lastupdate` double(5,0) NOT NULL DEFAULT '0',
  `look` char(100) NOT NULL DEFAULT 'hr-115-42.hd-190-1.ch-215-62.lg-285-91.sh-290-62',
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `motto` char(50) NOT NULL,
  `account_created` char(12) NOT NULL,
  `last_online` varchar(20) NOT NULL,
  `online` enum('0','1') NOT NULL DEFAULT '0',
  `ip_last` char(20) NOT NULL,
  `ip_reg` char(20) NOT NULL,
  `home_room` int(10) unsigned NOT NULL DEFAULT '0',
  `respect` int(11) NOT NULL DEFAULT '0',
  `daily_respect_points` int(1) NOT NULL DEFAULT '3',
  `daily_pet_respect_points` int(1) NOT NULL DEFAULT '3',
  `newbie_status` int(1) NOT NULL DEFAULT '3',
  `is_muted` enum('0','1') NOT NULL DEFAULT '0',
  `mutant_penalty` enum('0','1','2') NOT NULL DEFAULT '0',
  `mutant_penalty_expire` int(11) NOT NULL DEFAULT '0',
  `block_newfriends` enum('0','1') NOT NULL DEFAULT '0',
  `lastdailycredits` char(18) NOT NULL DEFAULT '',
  `points` int(11) NOT NULL DEFAULT '0',
  `block_trade` enum('1','0') NOT NULL DEFAULT '0',
  `crystals` int(11) NOT NULL DEFAULT '0',
  `currentquestid` int(11) unsigned NOT NULL,
  `currentquestprogress` int(11) NOT NULL,
  `achievement_points` int(11) NOT NULL,
  `country` varchar(6) NOT NULL DEFAULT '',
  `trusted_level` int(1) NOT NULL DEFAULT '0',
  `seckey` varchar(999) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `id` (`id`) USING HASH,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `ip_last` (`ip_last`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=459 ;

--
-- Dataark for tabell `users`
--

INSERT INTO `users` (`id`, `username`, `real_name`, `password`, `mail`, `auth_ticket`, `rank`, `credits`, `vip_points`, `activity_points`, `activity_points_lastupdate`, `look`, `gender`, `motto`, `account_created`, `last_online`, `online`, `ip_last`, `ip_reg`, `home_room`, `respect`, `daily_respect_points`, `daily_pet_respect_points`, `newbie_status`, `is_muted`, `mutant_penalty`, `mutant_penalty_expire`, `block_newfriends`, `lastdailycredits`, `points`, `block_trade`, `crystals`, `currentquestid`, `currentquestprogress`, `achievement_points`, `country`, `trusted_level`, `seckey`) VALUES
(457, '1', '', 'c4ca4238a0b923820dcc509a6f75849b', '1', '', 1, 10000, 0, 10000, 0, 'hr-115-42.hd-190-1.ch-215-62.lg-285-91.sh-290-62', 'M', '', '', '', '0', '', '', 0, 0, 3, 3, 3, '0', '0', 0, '0', '', 0, '0', 0, 0, 0, 0, '', 0, ''),
(458, 'Dzetki', '', '6575a6a284d3fcf952c9810fb9ede94d', 'me@se-gm.com', '', 1, 10000, 0, 10000, 0, 'hr-115-42.hd-190-1.ch-215-62.lg-285-91.sh-290-62', 'M', '', '', '', '0', '', '', 0, 0, 3, 3, 3, '0', '0', 0, '0', '', 0, '0', 0, 0, 0, 0, '', 0, '');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_achievement`
--

CREATE TABLE IF NOT EXISTS `user_achievement` (
  `userid` int(11) unsigned NOT NULL,
  `group` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `progress` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`group`),
  KEY `id` (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_achievements`
--

CREATE TABLE IF NOT EXISTS `user_achievements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `achievement_id` int(2) unsigned NOT NULL,
  `achievement_level` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_badges`
--

CREATE TABLE IF NOT EXISTS `user_badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `badge_id` varchar(20) NOT NULL,
  `badge_slot` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `badge` (`badge_id`) USING BTREE,
  KEY `slot` (`badge_slot`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1499 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_effects`
--

CREATE TABLE IF NOT EXISTS `user_effects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `effect_id` int(11) NOT NULL DEFAULT '1',
  `total_duration` int(11) NOT NULL DEFAULT '3600',
  `is_activated` enum('0','1') NOT NULL DEFAULT '0',
  `activated_stamp` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_favorites`
--

CREATE TABLE IF NOT EXISTS `user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_homes`
--

CREATE TABLE IF NOT EXISTS `user_homes` (
  `username` varchar(255) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_ignores`
--

CREATE TABLE IF NOT EXISTS `user_ignores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ignore_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `user_id` int(11) NOT NULL,
  `bans` int(11) NOT NULL DEFAULT '0',
  `cautions` int(11) NOT NULL DEFAULT '0',
  `reg_timestamp` double NOT NULL DEFAULT '0',
  `login_timestamp` double NOT NULL DEFAULT '0',
  `cfhs` int(11) NOT NULL DEFAULT '0',
  `cfhs_abusive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `userid` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_items`
--

CREATE TABLE IF NOT EXISTS `user_items` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(9) unsigned NOT NULL,
  `base_item` int(5) unsigned NOT NULL,
  `extra_data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_items_songs`
--

CREATE TABLE IF NOT EXISTS `user_items_songs` (
  `item_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `song_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_online`
--

CREATE TABLE IF NOT EXISTS `user_online` (
  `userid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid` (`userid`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_pets`
--

CREATE TABLE IF NOT EXISTS `user_pets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT 'Unnamed',
  `race` varchar(3) NOT NULL DEFAULT '000',
  `color` varchar(6) NOT NULL DEFAULT 'FFFFFF',
  `type` int(10) unsigned NOT NULL,
  `expirience` int(11) NOT NULL,
  `energy` int(11) NOT NULL,
  `nutrition` int(11) NOT NULL DEFAULT '100',
  `respect` int(11) NOT NULL DEFAULT '0',
  `createstamp` double NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `z` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `room_id` (`room_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_presents`
--

CREATE TABLE IF NOT EXISTS `user_presents` (
  `item_id` int(10) unsigned NOT NULL,
  `base_id` int(10) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  `extra_data` text NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_id` (`item_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_quests`
--

CREATE TABLE IF NOT EXISTS `user_quests` (
  `user_id` int(10) unsigned NOT NULL,
  `quest_id` int(10) unsigned NOT NULL,
  `progress` int(10) NOT NULL,
  PRIMARY KEY (`user_id`,`quest_id`),
  KEY `userid` (`user_id`) USING HASH,
  KEY `questid` (`quest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_roomvisits`
--

CREATE TABLE IF NOT EXISTS `user_roomvisits` (
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `entry_timestamp` double NOT NULL,
  `exit_timestamp` double NOT NULL,
  `hour` int(11) NOT NULL,
  `minute` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `room_id` (`room_id`) USING BTREE,
  KEY `entry_timestamp` (`entry_timestamp`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_subscriptions`
--

CREATE TABLE IF NOT EXISTS `user_subscriptions` (
  `user_id` int(1) unsigned NOT NULL,
  `subscription_id` char(20) NOT NULL,
  `timestamp_activated` int(1) NOT NULL,
  `timestamp_expire` int(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_tags`
--

CREATE TABLE IF NOT EXISTS `user_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `tag` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=113 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_tickets`
--

CREATE TABLE IF NOT EXISTS `user_tickets` (
  `userid` int(10) unsigned NOT NULL,
  `sessionticket` varchar(100) NOT NULL,
  `ipaddress` varchar(20) NOT NULL,
  PRIMARY KEY (`sessionticket`,`ipaddress`),
  UNIQUE KEY `index_id` (`userid`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_wardrobe`
--

CREATE TABLE IF NOT EXISTS `user_wardrobe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `slot_id` int(10) unsigned NOT NULL,
  `look` varchar(120) NOT NULL,
  `gender` enum('F','M') NOT NULL DEFAULT 'M',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=100 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `vip_items`
--

CREATE TABLE IF NOT EXISTS `vip_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(120) NOT NULL,
  `name` text NOT NULL,
  `descr` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT '5',
  `image` varchar(120) NOT NULL DEFAULT '',
  `featured` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
