-- phpMyAdmin SQL Dump
-- version 4.4.13.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 17, 2016 at 10:31 AM
-- Server version: 5.6.28-0ubuntu0.15.10.1
-- PHP Version: 5.6.11-1ubuntu3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moodle`
--

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_assign` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0',
  `sendstudentnotifications` tinyint(2) NOT NULL DEFAULT '1',
  `preventsubmissionnotingroup` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table saves information about an instance of mod_assign';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext COLLATE utf8_unicode_ci,
  `commentformat` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Text feedback for submitted assignments';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_annot`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_annot` (
  `id` bigint(10) NOT NULL,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext COLLATE utf8_unicode_ci,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'line',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores annotations added to pdfs submitted by students';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_cmnt`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint(10) NOT NULL,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext COLLATE utf8_unicode_ci,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores comments added to pdfs';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_quick`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_quick` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'yellow'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores teacher specified quicklist comments';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about the number of files submitted by a student';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines assignments';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext COLLATE utf8_unicode_ci,
  `data2` longtext COLLATE utf8_unicode_ci,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about submitted assignments';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_upgrade`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_upgrade` (
  `id` bigint(10) NOT NULL,
  `oldcmid` bigint(10) NOT NULL DEFAULT '0',
  `oldinstance` bigint(10) NOT NULL DEFAULT '0',
  `newcmid` bigint(10) NOT NULL DEFAULT '0',
  `newinstance` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about upgraded assignments';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about file submissions for assignments';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext COLLATE utf8_unicode_ci,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about onlinetext submission';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_grades` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading information about a single assignment submission.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_plugin_config`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subtype` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Config data for an instance of a plugin in an assignment.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_submission` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  `latest` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about student interactions with';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of flags that can be set for a single user in a single ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_mapping`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Map an assignment specific id number to a user';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_controllers`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `operation` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backup',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store the backup_controllers as they are used';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store every course backup status';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_logs`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
  `id` bigint(10) NOT NULL,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all the logs from backup and restore operations (by';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge`
--

CREATE TABLE IF NOT EXISTS `mdl_badge` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuerurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuercontact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messagesubject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines badge';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_backpack`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines settings for connecting external backpack';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria for issuing badges';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_met`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria that were met for an issued badge';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_param`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines parameters for badges criteria';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_external`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_external` (
  `id` bigint(10) NOT NULL,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting for external badges display';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_issued`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_issued` (
  `id` bigint(10) NOT NULL,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines issued badges';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_manual_award`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Track manual award criteria for badges';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block`
--

CREATE TABLE IF NOT EXISTS `mdl_block` (
  `id` bigint(10) NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains all installed blocks';

--
-- Dumping data for table `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 0, 0, 1),
(2, 'activity_results', 0, 0, 1),
(3, 'admin_bookmarks', 0, 0, 1),
(4, 'badges', 0, 0, 1),
(5, 'blog_menu', 0, 0, 1),
(6, 'blog_recent', 0, 0, 1),
(7, 'blog_tags', 0, 0, 1),
(8, 'calendar_month', 0, 0, 1),
(9, 'calendar_upcoming', 0, 0, 1),
(10, 'comments', 0, 0, 1),
(11, 'community', 0, 0, 1),
(12, 'completionstatus', 0, 0, 1),
(13, 'course_list', 0, 0, 1),
(14, 'course_overview', 0, 0, 1),
(15, 'course_summary', 0, 0, 1),
(16, 'feedback', 0, 0, 0),
(17, 'glossary_random', 0, 0, 1),
(18, 'html', 0, 0, 1),
(19, 'login', 0, 0, 1),
(20, 'mentees', 0, 0, 1),
(21, 'messages', 0, 0, 1),
(22, 'mnet_hosts', 0, 0, 1),
(23, 'myprofile', 0, 0, 1),
(24, 'navigation', 0, 0, 1),
(25, 'news_items', 0, 0, 1),
(26, 'online_users', 0, 0, 1),
(27, 'participants', 0, 0, 1),
(28, 'private_files', 0, 0, 1),
(29, 'quiz_results', 0, 0, 0),
(30, 'recent_activity', 86400, 0, 1),
(31, 'rss_client', 300, 0, 1),
(32, 'search_forums', 0, 0, 1),
(33, 'section_links', 0, 0, 1),
(34, 'selfcompletion', 0, 0, 1),
(35, 'settings', 0, 0, 1),
(36, 'site_main_menu', 0, 0, 1),
(37, 'social_activities', 0, 0, 1),
(38, 'tag_flickr', 0, 0, 1),
(39, 'tag_youtube', 0, 0, 0),
(40, 'tags', 0, 0, 1),
(107, 'kaplan_plugin', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_community`
--

CREATE TABLE IF NOT EXISTS `mdl_block_community` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `coursedescription` longtext COLLATE utf8_unicode_ci,
  `courseurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `imageurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Community block';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
  `id` bigint(10) NOT NULL,
  `blockname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultregion` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores block instances. The type of block this is';

--
-- Dumping data for table `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
(1, 'site_main_menu', 2, 0, 'site-index', NULL, 'side-pre', 0, ''),
(2, 'course_summary', 2, 0, 'site-index', NULL, 'side-post', 0, ''),
(3, 'calendar_month', 2, 0, 'site-index', NULL, 'side-post', 1, ''),
(4, 'navigation', 1, 1, '*', NULL, 'side-pre', 0, ''),
(5, 'settings', 1, 1, '*', NULL, 'side-pre', 1, ''),
(7, 'private_files', 1, 0, 'my-index', '2', 'side-post', 0, ''),
(8, 'online_users', 1, 0, 'my-index', '2', 'side-post', 1, ''),
(9, 'badges', 1, 0, 'my-index', '2', 'side-post', 2, ''),
(10, 'calendar_month', 1, 0, 'my-index', '2', 'side-post', 3, ''),
(11, 'calendar_upcoming', 1, 0, 'my-index', '2', 'side-post', 4, ''),
(12, 'course_overview', 1, 0, 'my-index', '2', 'content', 0, ''),
(13, 'private_files', 5, 0, 'my-index', '3', 'side-post', 0, ''),
(14, 'online_users', 5, 0, 'my-index', '3', 'side-post', 1, ''),
(15, 'badges', 5, 0, 'my-index', '3', 'side-post', 2, ''),
(16, 'calendar_month', 5, 0, 'my-index', '3', 'side-post', 3, ''),
(17, 'calendar_upcoming', 5, 0, 'my-index', '3', 'side-post', 4, ''),
(18, 'course_overview', 5, 0, 'my-index', '3', 'content', 0, ''),
(19, 'search_forums', 24, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(20, 'news_items', 24, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(21, 'calendar_upcoming', 24, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(22, 'recent_activity', 24, 0, 'course-view-*', NULL, 'side-post', 3, ''),
(28, 'course_list', 24, 0, 'course-view-*', NULL, 'side-pre', 2, ''),
(46, 'search_forums', 54, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(47, 'news_items', 54, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(48, 'calendar_upcoming', 54, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(49, 'recent_activity', 54, 0, 'course-view-*', NULL, 'side-post', 3, ''),
(83, 'private_files', 53, 0, 'my-index', '5', 'side-post', 0, ''),
(84, 'online_users', 53, 0, 'my-index', '5', 'side-post', 1, ''),
(85, 'badges', 53, 0, 'my-index', '5', 'side-post', 2, ''),
(86, 'calendar_month', 53, 0, 'my-index', '5', 'side-post', 3, ''),
(87, 'calendar_upcoming', 53, 0, 'my-index', '5', 'side-post', 4, ''),
(88, 'course_overview', 53, 0, 'my-index', '5', 'content', 0, ''),
(103, 'kaplan_plugin', 5, 0, 'my-index', '3', 'side-pre', 4, ''),
(104, 'kaplan_plugin', 53, 0, 'my-index', '5', 'side-pre', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_positions`
--

CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
  `id` bigint(10) NOT NULL,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpage` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the position of a sticky block_instance on a another ';

--
-- Dumping data for table `mdl_block_positions`
--

INSERT INTO `mdl_block_positions` (`id`, `blockinstanceid`, `contextid`, `pagetype`, `subpage`, `visible`, `region`, `weight`) VALUES
(2, 4, 1, 'admin-index', '', 1, 'side-pre', -1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_recent_activity`
--

CREATE TABLE IF NOT EXISTS `mdl_block_recent_activity` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `action` tinyint(1) NOT NULL,
  `modname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Recent activity block';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_rss_client`
--

CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `preferredtitle` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skiptime` bigint(10) NOT NULL DEFAULT '0',
  `skipuntil` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Remote news feed information. Contains the news feed id, the';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_association`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Associations of blog entries with courses and module instanc';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_external`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filtertags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='External blog links used for RSS copying of blog entries to ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book`
--

CREATE TABLE IF NOT EXISTS `mdl_book` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `navstyle` smallint(4) NOT NULL DEFAULT '1',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book_chapters`
--

CREATE TABLE IF NOT EXISTS `mdl_book_chapters` (
  `id` bigint(10) NOT NULL,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book_chapters';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_filters`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
  `id` bigint(10) NOT NULL,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping information about cached data';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
  `id` bigint(10) NOT NULL,
  `flagtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiry` bigint(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cache of time-sensitive flags';

--
-- Dumping data for table `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1458186689, '1', 1458193889),
(2, 'accesslib/dirtycontexts', '/1/3/24', 1458138725, '1', 1458145925),
(3, 'accesslib/dirtycontexts', '/1/5/31', 1458062699, '1', 1458069899),
(4, 'accesslib/dirtycontexts', '/1/30', 1458064873, '1', 1458072073),
(5, 'accesslib/dirtycontexts', '/1/5/32', 1458104265, '1', 1458111465),
(6, 'accesslib/dirtycontexts', '/1/2/30', 1458102500, '1', 1458109700),
(7, 'accesslib/dirtycontexts', '/1/2/31', 1458104265, '1', 1458111465),
(8, 'accesslib/dirtycontexts', '/1/5/33', 1458104531, '1', 1458111731),
(9, 'accesslib/dirtycontexts', '/1/5/34', 1458115206, '1', 1458122406),
(10, 'accesslib/dirtycontexts', '/1/36', 1458122526, '1', 1458129726),
(11, 'accesslib/dirtycontexts', '/1/5/37', 1458122526, '1', 1458129726),
(12, 'accesslib/dirtycontexts', '/1/5/38', 1458126216, '1', 1458133416),
(13, 'accesslib/dirtycontexts', '/1/5/40', 1458126347, '1', 1458133547),
(14, 'accesslib/dirtycontexts', '/1/5/41', 1458132961, '1', 1458140161),
(15, 'accesslib/dirtycontexts', '/1/5/42', 1458133214, '1', 1458140414),
(16, 'accesslib/dirtycontexts', '/1/5/43', 1458133546, '1', 1458140746),
(17, 'accesslib/dirtycontexts', '/1/5/44', 1458133819, '1', 1458141019),
(18, 'accesslib/dirtycontexts', '/1/5/45', 1458135444, '1', 1458142644),
(19, 'accesslib/dirtycontexts', '/1/5/46', 1458135693, '1', 1458142893),
(20, 'accesslib/dirtycontexts', '/1/5/47', 1458136083, '1', 1458143283),
(21, 'accesslib/dirtycontexts', '/1/5/48', 1458136397, '1', 1458143597),
(22, 'accesslib/dirtycontexts', '/1/5/49', 1458136929, '1', 1458144129),
(23, 'accesslib/dirtycontexts', '/1/5/50', 1458137198, '1', 1458144398),
(24, 'accesslib/dirtycontexts', '/1/5/51', 1458137660, '1', 1458144860),
(25, 'userpreferenceschanged', '3', 1458190765, '1', 1458197965),
(26, 'accesslib/dirtycontexts', '/1/3/54', 1458139190, '1', 1458146390),
(27, 'accesslib/dirtycontexts', '/1/52', 1458141099, '1', 1458148299),
(28, 'accesslib/dirtycontexts', '/1/5/60', 1458141099, '1', 1458148299),
(29, 'accesslib/dirtycontexts', '/1/5/62', 1458142025, '1', 1458149225),
(30, 'accesslib/dirtycontexts', '/1/5/63', 1458142188, '1', 1458149388),
(31, 'accesslib/dirtycontexts', '/1/5/64', 1458142470, '1', 1458149670),
(32, 'accesslib/dirtycontexts', '/1/5/65', 1458142861, '1', 1458150061),
(33, 'accesslib/dirtycontexts', '/1/5/66', 1458143007, '1', 1458150207),
(34, 'accesslib/dirtycontexts', '/1/5/67', 1458143753, '1', 1458150953),
(35, 'accesslib/dirtycontexts', '/1/5/68', 1458144589, '1', 1458151789),
(36, 'accesslib/dirtycontexts', '/1/5/69', 1458144800, '1', 1458152000),
(37, 'accesslib/dirtycontexts', '/1/5/70', 1458145007, '1', 1458152207),
(38, 'accesslib/dirtycontexts', '/1/5/71', 1458145494, '1', 1458152694),
(39, 'accesslib/dirtycontexts', '/1/5/72', 1458145885, '1', 1458153085),
(40, 'accesslib/dirtycontexts', '/1/5/73', 1458146230, '1', 1458153430),
(41, 'accesslib/dirtycontexts', '/1/5/74', 1458146616, '1', 1458153816),
(42, 'accesslib/dirtycontexts', '/1/5/75', 1458146718, '1', 1458153918),
(43, 'accesslib/dirtycontexts', '/1/76', 1458147095, '1', 1458154295),
(44, 'accesslib/dirtycontexts', '/1/77', 1458147311, '1', 1458154511),
(45, 'accesslib/dirtycontexts', '/1/78', 1458147517, '1', 1458154717),
(46, 'accesslib/dirtycontexts', '/1/79', 1458147656, '1', 1458154856),
(47, 'accesslib/dirtycontexts', '/1/80', 1458147741, '1', 1458154941),
(48, 'accesslib/dirtycontexts', '/1/81', 1458147908, '1', 1458155108),
(49, 'accesslib/dirtycontexts', '/1/82', 1458148478, '1', 1458155678),
(50, 'accesslib/dirtycontexts', '/1/83', 1458148740, '1', 1458155940),
(51, 'accesslib/dirtycontexts', '/1/84', 1458149108, '1', 1458156308),
(52, 'accesslib/dirtycontexts', '/1/85', 1458149442, '1', 1458156642),
(53, 'accesslib/dirtycontexts', '/1/86', 1458149999, '1', 1458157199),
(54, 'accesslib/dirtycontexts', '/1/87', 1458150177, '1', 1458157377),
(55, 'accesslib/dirtycontexts', '/1/88', 1458150418, '1', 1458157618),
(56, 'accesslib/dirtycontexts', '/1/89', 1458150694, '1', 1458157894),
(57, 'accesslib/dirtycontexts', '/1/90', 1458151395, '1', 1458158595),
(58, 'accesslib/dirtycontexts', '/1/91', 1458151772, '1', 1458158972),
(59, 'accesslib/dirtycontexts', '/1/5/61', 1458151928, '1', 1458159128),
(60, 'accesslib/dirtycontexts', '/1/92', 1458186748, '1', 1458193948),
(61, 'accesslib/dirtycontexts', '/1/5/99', 1458186748, '1', 1458193948),
(62, 'accesslib/dirtycontexts', '/1/2/100', 1458186748, '1', 1458193948),
(63, 'accesslib/dirtycontexts', '/1/5/101', 1458187233, '1', 1458194433),
(64, 'accesslib/dirtycontexts', '/1/53/103', 1458187233, '1', 1458194433),
(65, 'accesslib/dirtycontexts', '/1/53/104', 1458187593, '1', 1458194793),
(66, 'accesslib/dirtycontexts', '/1/5/105', 1458187593, '1', 1458194793),
(67, 'accesslib/dirtycontexts', '/1/53/106', 1458187756, '1', 1458194956),
(68, 'accesslib/dirtycontexts', '/1/53/107', 1458188263, '1', 1458195463),
(69, 'accesslib/dirtycontexts', '/1/5/108', 1458188263, '1', 1458195463),
(70, 'accesslib/dirtycontexts', '/1/53/109', 1458188617, '1', 1458195817),
(71, 'accesslib/dirtycontexts', '/1/53/110', 1458189120, '1', 1458196320),
(72, 'accesslib/dirtycontexts', '/1/5/111', 1458189950, '1', 1458197150),
(73, 'accesslib/dirtycontexts', '/1/53/112', 1458190244, '1', 1458197444),
(74, 'accesslib/dirtycontexts', '/1/11', 1458190602, '1', 1458197802),
(75, 'accesslib/dirtycontexts', '/1/5/39', 1458190630, '1', 1458197830),
(76, 'accesslib/dirtycontexts', '/1/53/102', 1458190750, '1', 1458197950);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `captype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=663 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines all capabilities';

--
-- Dumping data for table `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(3, 'moodle/site:deleteanymessage', 'write', 10, 'moodle', 32),
(4, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(5, 'moodle/site:deleteownmessage', 'write', 10, 'moodle', 0),
(6, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(7, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(8, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(9, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(10, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(12, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(13, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(14, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(15, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(16, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(17, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(18, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(23, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(24, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(25, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(26, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(27, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(28, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(29, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(30, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(31, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(32, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(33, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(34, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(35, 'moodle/user:create', 'write', 10, 'moodle', 24),
(36, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(37, 'moodle/user:update', 'write', 10, 'moodle', 24),
(38, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(39, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(40, 'moodle/user:viewlastip', 'read', 30, 'moodle', 8),
(41, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(42, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(43, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(44, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(45, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(46, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(47, 'moodle/user:ignoreuserquota', 'write', 10, 'moodle', 0),
(48, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(49, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(50, 'moodle/role:review', 'read', 50, 'moodle', 8),
(51, 'moodle/role:override', 'write', 50, 'moodle', 28),
(52, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(53, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(54, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(55, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(56, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(57, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(58, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(59, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(60, 'moodle/course:create', 'write', 40, 'moodle', 4),
(61, 'moodle/course:request', 'write', 10, 'moodle', 0),
(62, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(63, 'moodle/course:update', 'write', 50, 'moodle', 4),
(64, 'moodle/course:view', 'read', 50, 'moodle', 0),
(65, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(66, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(67, 'moodle/course:reviewotherusers', 'read', 50, 'moodle', 0),
(68, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(69, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(70, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(71, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(72, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(73, 'moodle/course:ignorefilesizelimits', 'write', 50, 'moodle', 0),
(74, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(75, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(76, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(77, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(78, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(79, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(80, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(81, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(82, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(83, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(84, 'moodle/course:isincompletionreports', 'read', 50, 'moodle', 0),
(85, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(86, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(87, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(88, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(89, 'moodle/course:viewsuspendedusers', 'read', 10, 'moodle', 0),
(90, 'moodle/course:tag', 'write', 50, 'moodle', 16),
(91, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(92, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(93, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(94, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(95, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(96, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(97, 'moodle/blog:associatecourse', 'write', 50, 'moodle', 0),
(98, 'moodle/blog:associatemodule', 'write', 70, 'moodle', 0),
(99, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(100, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(101, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(102, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(103, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(104, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(105, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(106, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(107, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(108, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(109, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(110, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(111, 'moodle/question:add', 'write', 50, 'moodle', 20),
(112, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(113, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(114, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(115, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(116, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(117, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(118, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(119, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(120, 'moodle/question:config', 'write', 10, 'moodle', 2),
(121, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(122, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(123, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(124, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(125, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(126, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(127, 'moodle/course:movesections', 'write', 50, 'moodle', 0),
(128, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(129, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(130, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(131, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(132, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(133, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(134, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(135, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(136, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(137, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(138, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(139, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(140, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(141, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(142, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(143, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(144, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(145, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(146, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(147, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(148, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(149, 'moodle/tag:flag', 'write', 10, 'moodle', 16),
(150, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(151, 'moodle/block:view', 'read', 80, 'moodle', 0),
(152, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(153, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(154, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(155, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(156, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(157, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(158, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(159, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(160, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(161, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(162, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(163, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(164, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(165, 'moodle/community:add', 'write', 10, 'moodle', 0),
(166, 'moodle/community:download', 'write', 10, 'moodle', 0),
(167, 'moodle/badges:manageglobalsettings', 'write', 10, 'moodle', 34),
(168, 'moodle/badges:viewbadges', 'read', 50, 'moodle', 0),
(169, 'moodle/badges:manageownbadges', 'write', 30, 'moodle', 0),
(170, 'moodle/badges:viewotherbadges', 'read', 30, 'moodle', 0),
(171, 'moodle/badges:earnbadge', 'write', 50, 'moodle', 0),
(172, 'moodle/badges:createbadge', 'write', 50, 'moodle', 16),
(173, 'moodle/badges:deletebadge', 'write', 50, 'moodle', 32),
(174, 'moodle/badges:configuredetails', 'write', 50, 'moodle', 16),
(175, 'moodle/badges:configurecriteria', 'write', 50, 'moodle', 4),
(176, 'moodle/badges:configuremessages', 'write', 50, 'moodle', 16),
(177, 'moodle/badges:awardbadge', 'write', 50, 'moodle', 16),
(178, 'moodle/badges:viewawarded', 'read', 50, 'moodle', 8),
(179, 'moodle/site:forcelanguage', 'read', 10, 'moodle', 0),
(180, 'mod/assign:view', 'read', 70, 'mod_assign', 0),
(181, 'mod/assign:submit', 'write', 70, 'mod_assign', 0),
(182, 'mod/assign:grade', 'write', 70, 'mod_assign', 4),
(183, 'mod/assign:exportownsubmission', 'read', 70, 'mod_assign', 0),
(184, 'mod/assign:addinstance', 'write', 50, 'mod_assign', 4),
(185, 'mod/assign:editothersubmission', 'write', 70, 'mod_assign', 41),
(186, 'mod/assign:grantextension', 'write', 70, 'mod_assign', 0),
(187, 'mod/assign:revealidentities', 'write', 70, 'mod_assign', 0),
(188, 'mod/assign:reviewgrades', 'write', 70, 'mod_assign', 0),
(189, 'mod/assign:releasegrades', 'write', 70, 'mod_assign', 0),
(190, 'mod/assign:managegrades', 'write', 70, 'mod_assign', 0),
(191, 'mod/assign:manageallocations', 'write', 70, 'mod_assign', 0),
(192, 'mod/assign:viewgrades', 'read', 70, 'mod_assign', 0),
(193, 'mod/assign:viewblinddetails', 'write', 70, 'mod_assign', 8),
(194, 'mod/assign:receivegradernotifications', 'read', 70, 'mod_assign', 0),
(195, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(196, 'mod/assignment:addinstance', 'write', 50, 'mod_assignment', 4),
(197, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(198, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(199, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(200, 'mod/book:addinstance', 'write', 50, 'mod_book', 4),
(201, 'mod/book:read', 'read', 70, 'mod_book', 0),
(202, 'mod/book:viewhiddenchapters', 'read', 70, 'mod_book', 0),
(203, 'mod/book:edit', 'write', 70, 'mod_book', 4),
(204, 'mod/chat:addinstance', 'write', 50, 'mod_chat', 4),
(205, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(206, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(207, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(208, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(209, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(210, 'mod/choice:addinstance', 'write', 50, 'mod_choice', 4),
(211, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(212, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(213, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(214, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(215, 'mod/data:addinstance', 'write', 50, 'mod_data', 4),
(216, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(217, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(218, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(219, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(220, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(221, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(222, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(223, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(224, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(225, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(226, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(227, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(228, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(229, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(230, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(231, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(232, 'mod/data:exportuserinfo', 'read', 70, 'mod_data', 8),
(233, 'mod/feedback:addinstance', 'write', 50, 'mod_feedback', 4),
(234, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(235, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(236, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(237, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(238, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(239, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(240, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(241, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(242, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(243, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(244, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(245, 'mod/folder:addinstance', 'write', 50, 'mod_folder', 4),
(246, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(247, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(248, 'mod/forum:addinstance', 'write', 50, 'mod_forum', 4),
(249, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(250, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(251, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(252, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(253, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(254, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(255, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(256, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(257, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(258, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(259, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(260, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(261, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(262, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(263, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(264, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(265, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(266, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(267, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(268, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(269, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(270, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(271, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(272, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(273, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
(274, 'mod/forum:canposttomygroups', 'write', 70, 'mod_forum', 0),
(275, 'mod/glossary:addinstance', 'write', 50, 'mod_glossary', 4),
(276, 'mod/glossary:view', 'read', 70, 'mod_glossary', 0),
(277, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(278, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(279, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(280, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(281, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(282, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(283, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(284, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(285, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(286, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(287, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(288, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(289, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(290, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(291, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(292, 'mod/imscp:addinstance', 'write', 50, 'mod_imscp', 4),
(293, 'mod/label:addinstance', 'write', 50, 'mod_label', 4),
(294, 'mod/lesson:addinstance', 'write', 50, 'mod_lesson', 4),
(295, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(296, 'mod/lesson:grade', 'write', 70, 'mod_lesson', 20),
(297, 'mod/lesson:viewreports', 'read', 70, 'mod_lesson', 8),
(298, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(299, 'mod/lesson:manageoverrides', 'write', 70, 'mod_lesson', 0),
(300, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(301, 'mod/lti:addinstance', 'write', 50, 'mod_lti', 4),
(302, 'mod/lti:manage', 'write', 70, 'mod_lti', 8),
(303, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(304, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(305, 'mod/page:view', 'read', 70, 'mod_page', 0),
(306, 'mod/page:addinstance', 'write', 50, 'mod_page', 4),
(307, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(308, 'mod/quiz:addinstance', 'write', 50, 'mod_quiz', 4),
(309, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(310, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(311, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(312, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(313, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(314, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 20),
(315, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(316, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(317, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(318, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(319, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(320, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(321, 'mod/quiz:emailwarnoverdue', 'read', 70, 'mod_quiz', 0),
(322, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(323, 'mod/resource:addinstance', 'write', 50, 'mod_resource', 4),
(324, 'mod/scorm:addinstance', 'write', 50, 'mod_scorm', 4),
(325, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(326, 'mod/scorm:skipview', 'read', 70, 'mod_scorm', 0),
(327, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(328, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(329, 'mod/scorm:deleteresponses', 'write', 70, 'mod_scorm', 0),
(330, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(331, 'mod/survey:addinstance', 'write', 50, 'mod_survey', 4),
(332, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(333, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(334, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(335, 'mod/url:view', 'read', 70, 'mod_url', 0),
(336, 'mod/url:addinstance', 'write', 50, 'mod_url', 4),
(337, 'mod/wiki:addinstance', 'write', 50, 'mod_wiki', 4),
(338, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(339, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(340, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(341, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(342, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(343, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(344, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(345, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(346, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(347, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(348, 'mod/workshop:addinstance', 'write', 50, 'mod_workshop', 4),
(349, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(350, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(351, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(352, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(353, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(354, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(355, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(356, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(357, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(358, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(359, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(360, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(361, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(362, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(363, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(364, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(365, 'enrol/category:config', 'write', 50, 'enrol_category', 0),
(366, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(367, 'enrol/cohort:unenrol', 'write', 50, 'enrol_cohort', 0),
(368, 'enrol/database:unenrol', 'write', 50, 'enrol_database', 0),
(369, 'enrol/database:config', 'write', 50, 'enrol_database', 0),
(370, 'enrol/flatfile:manage', 'write', 50, 'enrol_flatfile', 0),
(371, 'enrol/flatfile:unenrol', 'write', 50, 'enrol_flatfile', 0),
(372, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(373, 'enrol/imsenterprise:config', 'write', 50, 'enrol_imsenterprise', 0),
(374, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(375, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(376, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(377, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(378, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(379, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(380, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(381, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(382, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(383, 'enrol/mnet:config', 'write', 50, 'enrol_mnet', 0),
(384, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(385, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(386, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(387, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(388, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(389, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(390, 'enrol/self:holdkey', 'write', 50, 'enrol_self', 0),
(391, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(392, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(393, 'message/airnotifier:managedevice', 'write', 10, 'message_airnotifier', 0),
(394, 'block/activity_modules:addinstance', 'write', 80, 'block_activity_modules', 20),
(395, 'block/activity_results:addinstance', 'write', 80, 'block_activity_results', 20),
(396, 'block/admin_bookmarks:myaddinstance', 'write', 10, 'block_admin_bookmarks', 0),
(397, 'block/admin_bookmarks:addinstance', 'write', 80, 'block_admin_bookmarks', 20),
(398, 'block/badges:addinstance', 'read', 80, 'block_badges', 0),
(399, 'block/badges:myaddinstance', 'read', 10, 'block_badges', 8),
(400, 'block/blog_menu:addinstance', 'write', 80, 'block_blog_menu', 20),
(401, 'block/blog_recent:addinstance', 'write', 80, 'block_blog_recent', 20),
(402, 'block/blog_tags:addinstance', 'write', 80, 'block_blog_tags', 20),
(403, 'block/calendar_month:myaddinstance', 'write', 10, 'block_calendar_month', 0),
(404, 'block/calendar_month:addinstance', 'write', 80, 'block_calendar_month', 20),
(405, 'block/calendar_upcoming:myaddinstance', 'write', 10, 'block_calendar_upcoming', 0),
(406, 'block/calendar_upcoming:addinstance', 'write', 80, 'block_calendar_upcoming', 20),
(407, 'block/comments:myaddinstance', 'write', 10, 'block_comments', 0),
(408, 'block/comments:addinstance', 'write', 80, 'block_comments', 20),
(409, 'block/community:myaddinstance', 'write', 10, 'block_community', 0),
(410, 'block/community:addinstance', 'write', 80, 'block_community', 20),
(411, 'block/completionstatus:addinstance', 'write', 80, 'block_completionstatus', 20),
(412, 'block/course_list:myaddinstance', 'write', 10, 'block_course_list', 0),
(413, 'block/course_list:addinstance', 'write', 80, 'block_course_list', 20),
(414, 'block/course_overview:myaddinstance', 'write', 10, 'block_course_overview', 0),
(415, 'block/course_overview:addinstance', 'write', 80, 'block_course_overview', 20),
(416, 'block/course_summary:addinstance', 'write', 80, 'block_course_summary', 20),
(417, 'block/feedback:addinstance', 'write', 80, 'block_feedback', 20),
(418, 'block/glossary_random:myaddinstance', 'write', 10, 'block_glossary_random', 0),
(419, 'block/glossary_random:addinstance', 'write', 80, 'block_glossary_random', 20),
(420, 'block/html:myaddinstance', 'write', 10, 'block_html', 0),
(421, 'block/html:addinstance', 'write', 80, 'block_html', 20),
(422, 'block/login:addinstance', 'write', 80, 'block_login', 20),
(423, 'block/mentees:myaddinstance', 'write', 10, 'block_mentees', 0),
(424, 'block/mentees:addinstance', 'write', 80, 'block_mentees', 20),
(425, 'block/messages:myaddinstance', 'write', 10, 'block_messages', 0),
(426, 'block/messages:addinstance', 'write', 80, 'block_messages', 20),
(427, 'block/mnet_hosts:myaddinstance', 'write', 10, 'block_mnet_hosts', 0),
(428, 'block/mnet_hosts:addinstance', 'write', 80, 'block_mnet_hosts', 20),
(429, 'block/myprofile:myaddinstance', 'write', 10, 'block_myprofile', 0),
(430, 'block/myprofile:addinstance', 'write', 80, 'block_myprofile', 20),
(431, 'block/navigation:myaddinstance', 'write', 10, 'block_navigation', 0),
(432, 'block/navigation:addinstance', 'write', 80, 'block_navigation', 20),
(433, 'block/news_items:myaddinstance', 'write', 10, 'block_news_items', 0),
(434, 'block/news_items:addinstance', 'write', 80, 'block_news_items', 20),
(435, 'block/online_users:myaddinstance', 'write', 10, 'block_online_users', 0),
(436, 'block/online_users:addinstance', 'write', 80, 'block_online_users', 20),
(437, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(438, 'block/participants:addinstance', 'write', 80, 'block_participants', 20),
(439, 'block/private_files:myaddinstance', 'write', 10, 'block_private_files', 0),
(440, 'block/private_files:addinstance', 'write', 80, 'block_private_files', 20),
(441, 'block/quiz_results:addinstance', 'write', 80, 'block_quiz_results', 20),
(442, 'block/recent_activity:addinstance', 'write', 80, 'block_recent_activity', 20),
(443, 'block/recent_activity:viewaddupdatemodule', 'read', 50, 'block_recent_activity', 0),
(444, 'block/recent_activity:viewdeletemodule', 'read', 50, 'block_recent_activity', 0),
(445, 'block/rss_client:myaddinstance', 'write', 10, 'block_rss_client', 0),
(446, 'block/rss_client:addinstance', 'write', 80, 'block_rss_client', 20),
(447, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(448, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(449, 'block/search_forums:addinstance', 'write', 80, 'block_search_forums', 20),
(450, 'block/section_links:addinstance', 'write', 80, 'block_section_links', 20),
(451, 'block/selfcompletion:addinstance', 'write', 80, 'block_selfcompletion', 20),
(452, 'block/settings:myaddinstance', 'write', 10, 'block_settings', 0),
(453, 'block/settings:addinstance', 'write', 80, 'block_settings', 20),
(454, 'block/site_main_menu:addinstance', 'write', 80, 'block_site_main_menu', 20),
(455, 'block/social_activities:addinstance', 'write', 80, 'block_social_activities', 20),
(456, 'block/tag_flickr:addinstance', 'write', 80, 'block_tag_flickr', 20),
(457, 'block/tag_youtube:addinstance', 'write', 80, 'block_tag_youtube', 20),
(458, 'block/tags:myaddinstance', 'write', 10, 'block_tags', 0),
(459, 'block/tags:addinstance', 'write', 80, 'block_tags', 20),
(460, 'report/completion:view', 'read', 50, 'report_completion', 8),
(461, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(462, 'report/log:view', 'read', 50, 'report_log', 8),
(463, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(464, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(465, 'report/outline:view', 'read', 50, 'report_outline', 8),
(466, 'report/participation:view', 'read', 50, 'report_participation', 8),
(467, 'report/performance:view', 'read', 10, 'report_performance', 2),
(468, 'report/progress:view', 'read', 50, 'report_progress', 8),
(469, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(470, 'report/security:view', 'read', 10, 'report_security', 2),
(471, 'report/stats:view', 'read', 50, 'report_stats', 8),
(472, 'report/usersessions:manageownsessions', 'write', 30, 'report_usersessions', 0),
(473, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(474, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(475, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(476, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(477, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(478, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(479, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(480, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(481, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(482, 'gradeimport/direct:view', 'write', 50, 'gradeimport_direct', 0),
(483, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(484, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(485, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(486, 'gradereport/history:view', 'read', 50, 'gradereport_history', 8),
(487, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(488, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(489, 'gradereport/singleview:view', 'read', 50, 'gradereport_singleview', 8),
(490, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(491, 'webservice/amf:use', 'read', 50, 'webservice_amf', 0),
(492, 'webservice/rest:use', 'read', 50, 'webservice_rest', 0),
(493, 'webservice/soap:use', 'read', 50, 'webservice_soap', 0),
(494, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 0),
(495, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
(496, 'repository/areafiles:view', 'read', 70, 'repository_areafiles', 0),
(497, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(498, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(499, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(500, 'repository/equella:view', 'read', 70, 'repository_equella', 0),
(501, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(502, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(503, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(504, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(505, 'repository/local:view', 'read', 70, 'repository_local', 0),
(506, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(507, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(508, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(509, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(510, 'repository/skydrive:view', 'read', 70, 'repository_skydrive', 0),
(511, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(512, 'repository/url:view', 'read', 70, 'repository_url', 0),
(513, 'repository/user:view', 'read', 70, 'repository_user', 0),
(514, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(515, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(516, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(517, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(518, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(519, 'tool/monitor:subscribe', 'read', 50, 'tool_monitor', 8),
(520, 'tool/monitor:managerules', 'write', 50, 'tool_monitor', 4),
(521, 'tool/monitor:managetool', 'write', 10, 'tool_monitor', 4),
(522, 'tool/uploaduser:uploaduserpictures', 'write', 10, 'tool_uploaduser', 16),
(523, 'booktool/exportimscp:export', 'read', 70, 'booktool_exportimscp', 0),
(524, 'booktool/importhtml:import', 'write', 70, 'booktool_importhtml', 4),
(525, 'booktool/print:print', 'read', 70, 'booktool_print', 0),
(526, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(527, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(528, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0),
(661, 'block/kaplan_plugin:myaddinstance', 'write', 10, 'block_kaplan_plugin', 0),
(662, 'block/kaplan_plugin:addinstance', 'write', 80, 'block_kaplan_plugin', 20);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat`
--

CREATE TABLE IF NOT EXISTS `mdl_chat` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each of these is a chat room';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
  `id` bigint(10) NOT NULL,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all the actual chat messages';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages_current`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores current session';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_users`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
  `id` bigint(10) NOT NULL,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of which users are in which chat rooms';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice`
--

CREATE TABLE IF NOT EXISTS `mdl_choice` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `allowmultiple` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `includeinactive` tinyint(2) NOT NULL DEFAULT '1',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `showpreview` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Available choices are stored here';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
  `id` bigint(10) NOT NULL,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='choices performed by users';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
  `id` bigint(10) NOT NULL,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext COLLATE utf8_unicode_ci,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='available options to choice';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents one cohort (aka site-wide group).';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort_members`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
  `id` bigint(10) NOT NULL,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a cohort.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_comments` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commentarea` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle comments module';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config`
--

CREATE TABLE IF NOT EXISTS `mdl_config` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle configuration variables';

--
-- Dumping data for table `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email'),
(4, 'auth_pop3mailbox', 'INBOX'),
(5, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(6, 'theme', 'clean'),
(7, 'filter_multilang_converted', '1'),
(8, 'siteidentifier', 'ebLwAmOP1OVNrFkV9F9wokRthgU7zng6localhost'),
(9, 'backup_version', '2008111700'),
(10, 'backup_release', '2.0 dev'),
(11, 'mnet_dispatcher_mode', 'off'),
(12, 'sessiontimeout', '7200'),
(13, 'stringfilters', ''),
(14, 'filterall', '0'),
(15, 'texteditors', 'atto,tinymce,textarea'),
(16, 'upgrade_minmaxgradestepignored', '1'),
(17, 'upgrade_extracreditweightsstepignored', '1'),
(18, 'upgrade_calculatedgradeitemsignored', '1'),
(19, 'mnet_localhost_id', '1'),
(20, 'mnet_all_hosts_id', '2'),
(21, 'siteguest', '1'),
(22, 'siteadmins', '2'),
(23, 'themerev', '1458190253'),
(24, 'jsrev', '1458190253'),
(25, 'gdversion', '2'),
(26, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(27, 'version', '2015111603'),
(28, 'enableoutcomes', '0'),
(29, 'usecomments', '1'),
(30, 'usetags', '1'),
(31, 'enablenotes', '1'),
(32, 'enableportfolios', '0'),
(33, 'enablewebservices', '1'),
(34, 'messaging', '1'),
(35, 'messaginghidereadnotifications', '0'),
(36, 'messagingdeletereadnotificationsdelay', '604800'),
(37, 'messagingallowemailoverride', '0'),
(38, 'enablestats', '0'),
(39, 'enablerssfeeds', '0'),
(40, 'enableblogs', '1'),
(41, 'enablecompletion', '0'),
(42, 'completiondefault', '1'),
(43, 'enableavailability', '0'),
(44, 'enableplagiarism', '0'),
(45, 'enablebadges', '1'),
(46, 'defaultpreference_maildisplay', '2'),
(47, 'defaultpreference_mailformat', '1'),
(48, 'defaultpreference_maildigest', '0'),
(49, 'defaultpreference_autosubscribe', '1'),
(50, 'defaultpreference_trackforums', '0'),
(51, 'autologinguests', '0'),
(52, 'hiddenuserfields', ''),
(53, 'showuseridentity', 'email'),
(54, 'fullnamedisplay', 'language'),
(55, 'alternativefullnameformat', 'language'),
(56, 'maxusersperpage', '100'),
(57, 'enablegravatar', '0'),
(58, 'gravatardefaulturl', 'mm'),
(59, 'enablecourserequests', '0'),
(60, 'defaultrequestcategory', '1'),
(61, 'requestcategoryselection', '0'),
(62, 'courserequestnotify', ''),
(63, 'grade_profilereport', 'user'),
(64, 'grade_aggregationposition', '1'),
(65, 'grade_includescalesinaggregation', '1'),
(66, 'grade_hiddenasdate', '0'),
(67, 'gradepublishing', '0'),
(68, 'grade_export_displaytype', '1'),
(69, 'grade_export_decimalpoints', '2'),
(70, 'grade_navmethod', '0'),
(71, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email'),
(72, 'grade_export_customprofilefields', ''),
(73, 'recovergradesdefault', '0'),
(74, 'gradeexport', ''),
(75, 'unlimitedgrades', '0'),
(76, 'grade_report_showmin', '1'),
(77, 'gradepointmax', '100'),
(78, 'gradepointdefault', '100'),
(79, 'grade_minmaxtouse', '1'),
(80, 'grade_mygrades_report', 'overview'),
(81, 'gradereport_mygradeurl', ''),
(82, 'grade_hideforcedsettings', '1'),
(83, 'grade_aggregation', '13'),
(84, 'grade_aggregation_flag', '0'),
(85, 'grade_aggregations_visible', '13'),
(86, 'grade_aggregateonlygraded', '1'),
(87, 'grade_aggregateonlygraded_flag', '2'),
(88, 'grade_aggregateoutcomes', '0'),
(89, 'grade_aggregateoutcomes_flag', '2'),
(90, 'grade_keephigh', '0'),
(91, 'grade_keephigh_flag', '3'),
(92, 'grade_droplow', '0'),
(93, 'grade_droplow_flag', '2'),
(94, 'grade_overridecat', '1'),
(95, 'grade_displaytype', '1'),
(96, 'grade_decimalpoints', '2'),
(97, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(98, 'grade_report_studentsperpage', '100'),
(99, 'grade_report_showonlyactiveenrol', '1'),
(100, 'grade_report_quickgrading', '1'),
(101, 'grade_report_showquickfeedback', '0'),
(102, 'grade_report_meanselection', '1'),
(103, 'grade_report_enableajax', '0'),
(104, 'grade_report_showcalculations', '1'),
(105, 'grade_report_showeyecons', '0'),
(106, 'grade_report_showaverages', '1'),
(107, 'grade_report_showlocks', '0'),
(108, 'grade_report_showranges', '0'),
(109, 'grade_report_showanalysisicon', '1'),
(110, 'grade_report_showuserimage', '1'),
(111, 'grade_report_showactivityicons', '1'),
(112, 'grade_report_shownumberofgrades', '0'),
(113, 'grade_report_averagesdisplaytype', 'inherit'),
(114, 'grade_report_rangesdisplaytype', 'inherit'),
(115, 'grade_report_averagesdecimalpoints', 'inherit'),
(116, 'grade_report_rangesdecimalpoints', 'inherit'),
(117, 'grade_report_historyperpage', '50'),
(118, 'grade_report_overview_showrank', '0'),
(119, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(120, 'grade_report_user_showrank', '0'),
(121, 'grade_report_user_showpercentage', '1'),
(122, 'grade_report_user_showgrade', '1'),
(123, 'grade_report_user_showfeedback', '1'),
(124, 'grade_report_user_showrange', '1'),
(125, 'grade_report_user_showweight', '1'),
(126, 'grade_report_user_showaverage', '0'),
(127, 'grade_report_user_showlettergrade', '0'),
(128, 'grade_report_user_rangedecimals', '0'),
(129, 'grade_report_user_showhiddenitems', '1'),
(130, 'grade_report_user_showtotalsifcontainhidden', '0'),
(131, 'grade_report_user_showcontributiontocoursetotal', '1'),
(132, 'badges_defaultissuername', ''),
(133, 'badges_defaultissuercontact', ''),
(134, 'badges_badgesalt', 'badges1458047378'),
(135, 'badges_allowexternalbackpack', '1'),
(136, 'badges_allowcoursebadges', '1'),
(137, 'forcetimezone', '99'),
(138, 'country', '0'),
(139, 'defaultcity', ''),
(140, 'geoipfile', '/var/moodledata/geoip/GeoLiteCity.dat'),
(141, 'googlemapkey3', ''),
(142, 'allcountrycodes', ''),
(143, 'autolang', '1'),
(144, 'lang', 'en'),
(145, 'langmenu', '1'),
(146, 'langlist', ''),
(147, 'langrev', '1458190253'),
(148, 'langcache', '1'),
(149, 'langstringcache', '1'),
(150, 'locale', ''),
(151, 'latinexcelexport', '0'),
(152, 'requiremodintro', '0'),
(154, 'authloginviaemail', '0'),
(155, 'allowaccountssameemail', '0'),
(156, 'authpreventaccountcreation', '0'),
(157, 'loginpageautofocus', '0'),
(158, 'guestloginbutton', '1'),
(159, 'limitconcurrentlogins', '0'),
(160, 'alternateloginurl', ''),
(161, 'forgottenpasswordurl', ''),
(162, 'auth_instructions', ''),
(163, 'allowemailaddresses', ''),
(164, 'denyemailaddresses', ''),
(165, 'verifychangedemail', '1'),
(166, 'recaptchapublickey', ''),
(167, 'recaptchaprivatekey', ''),
(168, 'filteruploadedfiles', '0'),
(169, 'filtermatchoneperpage', '0'),
(170, 'filtermatchonepertext', '0'),
(171, 'sitedefaultlicense', 'allrightsreserved'),
(172, 'portfolio_moderate_filesize_threshold', '1048576'),
(173, 'portfolio_high_filesize_threshold', '5242880'),
(174, 'portfolio_moderate_db_threshold', '20'),
(175, 'portfolio_high_db_threshold', '50'),
(176, 'repositorycacheexpire', '120'),
(177, 'repositorygetfiletimeout', '30'),
(178, 'repositorysyncfiletimeout', '1'),
(179, 'repositorysyncimagetimeout', '3'),
(180, 'repositoryallowexternallinks', '1'),
(181, 'legacyfilesinnewcourses', '0'),
(182, 'legacyfilesaddallowed', '1'),
(183, 'mobilecssurl', ''),
(184, 'enablewsdocumentation', '0'),
(185, 'allowbeforeblock', '0'),
(186, 'allowedip', ''),
(187, 'blockedip', ''),
(188, 'protectusernames', '1'),
(189, 'forcelogin', '0'),
(190, 'forceloginforprofiles', '1'),
(191, 'forceloginforprofileimage', '0'),
(192, 'opentogoogle', '0'),
(193, 'maxbytes', '0'),
(194, 'userquota', '104857600'),
(195, 'allowobjectembed', '0'),
(196, 'enabletrusttext', '0'),
(197, 'maxeditingtime', '1800'),
(198, 'extendedusernamechars', '0'),
(199, 'sitepolicy', ''),
(200, 'sitepolicyguest', ''),
(201, 'keeptagnamecase', '1'),
(202, 'profilesforenrolledusersonly', '1'),
(203, 'cronclionly', '1'),
(204, 'cronremotepassword', ''),
(205, 'lockoutthreshold', '0'),
(206, 'lockoutwindow', '1800'),
(207, 'lockoutduration', '1800'),
(208, 'passwordpolicy', '1'),
(209, 'minpasswordlength', '8'),
(210, 'minpassworddigits', '1'),
(211, 'minpasswordlower', '1'),
(212, 'minpasswordupper', '1'),
(213, 'minpasswordnonalphanum', '1'),
(214, 'maxconsecutiveidentchars', '0'),
(215, 'passwordreuselimit', '0'),
(216, 'pwresettime', '1800'),
(217, 'passwordchangelogout', '0'),
(218, 'groupenrolmentkeypolicy', '1'),
(219, 'disableuserimages', '0'),
(220, 'emailchangeconfirmation', '1'),
(221, 'rememberusername', '2'),
(222, 'strictformsrequired', '0'),
(223, 'loginhttps', '0'),
(224, 'cookiesecure', '0'),
(225, 'cookiehttponly', '0'),
(226, 'allowframembedding', '0'),
(227, 'loginpasswordautocomplete', '0'),
(228, 'displayloginfailures', '0'),
(229, 'notifyloginfailures', ''),
(230, 'notifyloginthreshold', '10'),
(231, 'runclamonupload', '0'),
(232, 'pathtoclam', ''),
(233, 'quarantinedir', ''),
(234, 'clamfailureonupload', 'donothing'),
(235, 'themelist', ''),
(236, 'themedesignermode', '0'),
(237, 'allowuserthemes', '0'),
(238, 'allowcoursethemes', '0'),
(239, 'allowcategorythemes', '0'),
(240, 'allowthemechangeonurl', '0'),
(241, 'allowuserblockhiding', '1'),
(242, 'allowblockstodock', '1'),
(243, 'custommenuitems', ''),
(244, 'customusermenuitems', 'grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences'),
(245, 'enabledevicedetection', '1'),
(246, 'devicedetectregex', '[]'),
(247, 'calendartype', 'gregorian'),
(248, 'calendar_adminseesall', '0'),
(249, 'calendar_site_timeformat', '0'),
(250, 'calendar_startwday', '1'),
(251, 'calendar_weekend', '65'),
(252, 'calendar_lookahead', '21'),
(253, 'calendar_maxevents', '10'),
(254, 'enablecalendarexport', '1'),
(255, 'calendar_customexport', '1'),
(256, 'calendar_exportlookahead', '365'),
(257, 'calendar_exportlookback', '5'),
(258, 'calendar_exportsalt', 'HhTU61qrSsiyB3szO5VWJY4gAcuvSdAONFVVRBOenPlFzGhi5ZqnHLQOC6Vg'),
(259, 'calendar_showicalsource', '1'),
(260, 'useblogassociations', '1'),
(261, 'bloglevel', '4'),
(262, 'useexternalblogs', '1'),
(263, 'externalblogcrontime', '86400'),
(264, 'maxexternalblogsperuser', '1'),
(265, 'blogusecomments', '1'),
(266, 'blogshowcommentscount', '1'),
(267, 'defaulthomepage', '1'),
(268, 'allowguestmymoodle', '1'),
(269, 'navshowfullcoursenames', '0'),
(270, 'navshowcategories', '1'),
(271, 'navshowmycoursecategories', '0'),
(272, 'navshowallcourses', '0'),
(273, 'navexpandmycourses', '1'),
(274, 'navsortmycoursessort', 'sortorder'),
(275, 'navcourselimit', '20'),
(276, 'usesitenameforsitepages', '0'),
(277, 'linkadmincategories', '0'),
(278, 'linkcoursesections', '0'),
(279, 'navshowfrontpagemods', '1'),
(280, 'navadduserpostslinks', '1'),
(281, 'formatstringstriptags', '1'),
(282, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(283, 'core_media_enable_youtube', '1'),
(284, 'core_media_enable_vimeo', '0'),
(285, 'core_media_enable_mp3', '1'),
(286, 'core_media_enable_flv', '1'),
(287, 'core_media_enable_swf', '1'),
(288, 'core_media_enable_html5audio', '1'),
(289, 'core_media_enable_html5video', '1'),
(290, 'core_media_enable_qt', '1'),
(291, 'core_media_enable_wmp', '1'),
(292, 'core_media_enable_rm', '1'),
(293, 'docroot', 'http://docs.moodle.org'),
(294, 'doclang', ''),
(295, 'doctonewwindow', '0'),
(296, 'courselistshortnames', '0'),
(297, 'coursesperpage', '20'),
(298, 'courseswithsummarieslimit', '10'),
(299, 'courseoverviewfileslimit', '1'),
(300, 'courseoverviewfilesext', '.jpg,.gif,.png'),
(301, 'useexternalyui', '0'),
(302, 'yuicomboloading', '1'),
(303, 'cachejs', '1'),
(304, 'modchooserdefault', '1'),
(305, 'modeditingmenu', '1'),
(306, 'blockeditingmenu', '1'),
(307, 'additionalhtmlhead', ''),
(308, 'additionalhtmltopofbody', ''),
(309, 'additionalhtmlfooter', ''),
(310, 'pathtodu', ''),
(311, 'aspellpath', ''),
(312, 'pathtodot', ''),
(313, 'pathtogs', '/usr/bin/gs'),
(314, 'supportpage', ''),
(315, 'dbsessions', '0'),
(316, 'sessioncookie', ''),
(317, 'sessioncookiepath', ''),
(318, 'sessioncookiedomain', ''),
(319, 'statsfirstrun', 'none'),
(320, 'statsmaxruntime', '0'),
(321, 'statsruntimedays', '31'),
(322, 'statsruntimestarthour', '0'),
(323, 'statsruntimestartminute', '0'),
(324, 'statsuserthreshold', '0'),
(325, 'slasharguments', '1'),
(326, 'getremoteaddrconf', '0'),
(327, 'proxyhost', ''),
(328, 'proxyport', '0'),
(329, 'proxytype', 'HTTP'),
(330, 'proxyuser', ''),
(331, 'proxypassword', ''),
(332, 'proxybypass', 'localhost, 127.0.0.1'),
(333, 'maintenance_enabled', '0'),
(334, 'maintenance_message', ''),
(335, 'deleteunconfirmed', '168'),
(336, 'deleteincompleteusers', '0'),
(337, 'disablegradehistory', '0'),
(338, 'gradehistorylifetime', '0'),
(339, 'tempdatafoldercleanup', '168'),
(340, 'extramemorylimit', '512M'),
(341, 'maxtimelimit', '0'),
(342, 'curlcache', '120'),
(343, 'curltimeoutkbitrate', '56'),
(344, 'updateautocheck', '1'),
(345, 'updateminmaturity', '200'),
(346, 'updatenotifybuilds', '0'),
(347, 'enablesafebrowserintegration', '0'),
(348, 'dndallowtextandlinks', '0'),
(349, 'enablecssoptimiser', '0'),
(350, 'debug', '32767'),
(351, 'debugdisplay', '1'),
(352, 'debugsmtp', '0'),
(353, 'perfdebug', '7'),
(354, 'debugstringids', '0'),
(355, 'debugvalidators', '0'),
(356, 'debugpageinfo', '0'),
(357, 'profilingenabled', '0'),
(358, 'profilingincluded', ''),
(359, 'profilingexcluded', ''),
(360, 'profilingautofrec', '0'),
(361, 'profilingallowme', '0'),
(362, 'profilingallowall', '0'),
(363, 'profilinglifetime', '1440'),
(364, 'profilingimportprefix', '(I)'),
(365, 'release', '3.0.3 (Build: 20160314)'),
(366, 'branch', '30'),
(367, 'localcachedirpurged', '1458190253'),
(368, 'scheduledtaskreset', '1458190253'),
(369, 'allversionshash', '02c9cb0b9a531eec3c4563c17d6c1a3dd1f9d8d7'),
(371, 'notloggedinroleid', '6'),
(372, 'guestroleid', '6'),
(373, 'defaultuserroleid', '7'),
(374, 'creatornewroleid', '3'),
(375, 'restorernewroleid', '3'),
(376, 'gradebookroles', '5'),
(377, 'chat_method', 'ajax'),
(378, 'chat_refresh_userlist', '10'),
(379, 'chat_old_ping', '35'),
(380, 'chat_refresh_room', '5'),
(381, 'chat_normal_updatemode', 'jsupdate'),
(382, 'chat_serverhost', 'localhost'),
(383, 'chat_serverip', '127.0.0.1'),
(384, 'chat_serverport', '9111'),
(385, 'chat_servermax', '100'),
(386, 'data_enablerssfeeds', '0'),
(387, 'feedback_allowfullanonymous', '0'),
(388, 'forum_displaymode', '3'),
(389, 'forum_replytouser', '1'),
(390, 'forum_shortpost', '300'),
(391, 'forum_longpost', '600'),
(392, 'forum_manydiscussions', '100'),
(393, 'forum_maxbytes', '512000'),
(394, 'forum_maxattachments', '9'),
(395, 'forum_trackingtype', '1'),
(396, 'forum_trackreadposts', '1'),
(397, 'forum_allowforcedreadtracking', '0'),
(398, 'forum_oldpostdays', '14'),
(399, 'forum_usermarksread', '0'),
(400, 'forum_cleanreadtime', '2'),
(401, 'digestmailtime', '17'),
(402, 'forum_enablerssfeeds', '0'),
(403, 'forum_enabletimedposts', '0'),
(404, 'glossary_entbypage', '10'),
(405, 'glossary_dupentries', '0'),
(406, 'glossary_allowcomments', '0'),
(407, 'glossary_linkbydefault', '1'),
(408, 'glossary_defaultapproval', '1'),
(409, 'glossary_enablerssfeeds', '0'),
(410, 'glossary_linkentries', '0'),
(411, 'glossary_casesensitive', '0'),
(412, 'glossary_fullmatch', '0'),
(413, 'lesson_slideshowwidth', '640'),
(414, 'lesson_slideshowheight', '480'),
(415, 'lesson_slideshowbgcolor', '#FFFFFF'),
(416, 'lesson_mediawidth', '640'),
(417, 'lesson_mediaheight', '480'),
(418, 'lesson_mediaclose', '0'),
(419, 'lesson_maxanswers', '4'),
(420, 'lesson_defaultnextpage', '0'),
(421, 'block_course_list_adminview', 'all'),
(422, 'block_course_list_hideallcourseslink', '0'),
(423, 'block_html_allowcssclasses', '0'),
(424, 'block_online_users_timetosee', '5'),
(425, 'block_rss_client_num_entries', '5'),
(426, 'block_rss_client_timeout', '30'),
(427, 'filter_censor_badwords', ''),
(428, 'filter_multilang_force_old', '0'),
(429, 'logguests', '1'),
(430, 'loglifetime', '0'),
(431, 'airnotifierurl', 'https://messages.moodle.net'),
(432, 'airnotifierport', '443'),
(433, 'airnotifiermobileappname', 'com.moodle.moodlemobile'),
(434, 'airnotifierappname', 'commoodlemoodlemobile'),
(435, 'airnotifieraccesskey', ''),
(436, 'smtphosts', ''),
(437, 'smtpsecure', ''),
(438, 'smtpauthtype', 'LOGIN'),
(439, 'smtpuser', ''),
(440, 'smtppass', ''),
(441, 'smtpmaxbulk', '1'),
(442, 'noreplyaddress', 'noreply@localhost'),
(443, 'emailonlyfromnoreplyaddress', '0'),
(444, 'sitemailcharset', '0'),
(445, 'allowusermailcharset', '0'),
(446, 'allowattachments', '1'),
(447, 'mailnewline', 'LF'),
(448, 'jabberhost', ''),
(449, 'jabberserver', ''),
(450, 'jabberusername', ''),
(451, 'jabberpassword', ''),
(452, 'jabberport', '5222'),
(453, 'enablemobilewebservice', '1'),
(454, 'profileroles', '5,4,3'),
(455, 'coursecontact', '3'),
(456, 'frontpage', '6'),
(457, 'frontpageloggedin', '6'),
(458, 'maxcategorydepth', '2'),
(459, 'frontpagecourselimit', '200'),
(460, 'commentsperpage', '15'),
(461, 'defaultfrontpageroleid', '8'),
(462, 'supportname', 'Admin User'),
(463, 'supportemail', 'admin@moodle.com'),
(464, 'messageinbound_enabled', '0'),
(465, 'messageinbound_mailbox', ''),
(466, 'messageinbound_domain', ''),
(467, 'messageinbound_host', ''),
(468, 'messageinbound_hostssl', 'ssl'),
(469, 'messageinbound_hostuser', ''),
(470, 'messageinbound_hostpass', ''),
(471, 'timezone', 'Africa/Abidjan'),
(472, 'registerauth', ''),
(476, 'webserviceprotocols', 'xmlrpc,rest');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_log`
--

CREATE TABLE IF NOT EXISTS `mdl_config_log` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  `oldvalue` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=930 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Changes done in server configuration through admin UI';

--
-- Dumping data for table `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1458047384, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1458047384, NULL, 'usecomments', '1', NULL),
(3, 0, 1458047384, NULL, 'usetags', '1', NULL),
(4, 0, 1458047384, NULL, 'enablenotes', '1', NULL),
(5, 0, 1458047384, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1458047384, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1458047384, NULL, 'messaging', '1', NULL),
(8, 0, 1458047384, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1458047384, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1458047384, NULL, 'messagingallowemailoverride', '0', NULL),
(11, 0, 1458047384, NULL, 'enablestats', '0', NULL),
(12, 0, 1458047384, NULL, 'enablerssfeeds', '0', NULL),
(13, 0, 1458047384, NULL, 'enableblogs', '1', NULL),
(14, 0, 1458047384, NULL, 'enablecompletion', '0', NULL),
(15, 0, 1458047384, NULL, 'completiondefault', '1', NULL),
(16, 0, 1458047384, NULL, 'enableavailability', '0', NULL),
(17, 0, 1458047384, NULL, 'enableplagiarism', '0', NULL),
(18, 0, 1458047384, NULL, 'enablebadges', '1', NULL),
(19, 0, 1458047384, NULL, 'defaultpreference_maildisplay', '2', NULL),
(20, 0, 1458047384, NULL, 'defaultpreference_mailformat', '1', NULL),
(21, 0, 1458047384, NULL, 'defaultpreference_maildigest', '0', NULL),
(22, 0, 1458047384, NULL, 'defaultpreference_autosubscribe', '1', NULL),
(23, 0, 1458047384, NULL, 'defaultpreference_trackforums', '0', NULL),
(24, 0, 1458047384, NULL, 'autologinguests', '0', NULL),
(25, 0, 1458047384, NULL, 'hiddenuserfields', '', NULL),
(26, 0, 1458047384, NULL, 'showuseridentity', 'email', NULL),
(27, 0, 1458047384, NULL, 'fullnamedisplay', 'language', NULL),
(28, 0, 1458047384, NULL, 'alternativefullnameformat', 'language', NULL),
(29, 0, 1458047384, NULL, 'maxusersperpage', '100', NULL),
(30, 0, 1458047384, NULL, 'enablegravatar', '0', NULL),
(31, 0, 1458047384, NULL, 'gravatardefaulturl', 'mm', NULL),
(32, 0, 1458047384, 'moodlecourse', 'visible', '1', NULL),
(33, 0, 1458047384, 'moodlecourse', 'format', 'weeks', NULL),
(34, 0, 1458047384, 'moodlecourse', 'maxsections', '52', NULL),
(35, 0, 1458047384, 'moodlecourse', 'numsections', '10', NULL),
(36, 0, 1458047384, 'moodlecourse', 'hiddensections', '0', NULL),
(37, 0, 1458047384, 'moodlecourse', 'coursedisplay', '0', NULL),
(38, 0, 1458047384, 'moodlecourse', 'lang', '', NULL),
(39, 0, 1458047384, 'moodlecourse', 'newsitems', '5', NULL),
(40, 0, 1458047384, 'moodlecourse', 'showgrades', '1', NULL),
(41, 0, 1458047384, 'moodlecourse', 'showreports', '0', NULL),
(42, 0, 1458047384, 'moodlecourse', 'maxbytes', '0', NULL),
(43, 0, 1458047384, 'moodlecourse', 'enablecompletion', '0', NULL),
(44, 0, 1458047384, 'moodlecourse', 'groupmode', '0', NULL),
(45, 0, 1458047384, 'moodlecourse', 'groupmodeforce', '0', NULL),
(46, 0, 1458047384, NULL, 'enablecourserequests', '0', NULL),
(47, 0, 1458047384, NULL, 'defaultrequestcategory', '1', NULL),
(48, 0, 1458047384, NULL, 'requestcategoryselection', '0', NULL),
(49, 0, 1458047384, NULL, 'courserequestnotify', '', NULL),
(50, 0, 1458047384, 'backup', 'loglifetime', '30', NULL),
(51, 0, 1458047384, 'backup', 'backup_general_users', '1', NULL),
(52, 0, 1458047384, 'backup', 'backup_general_users_locked', '', NULL),
(53, 0, 1458047384, 'backup', 'backup_general_anonymize', '0', NULL),
(54, 0, 1458047384, 'backup', 'backup_general_anonymize_locked', '', NULL),
(55, 0, 1458047384, 'backup', 'backup_general_role_assignments', '1', NULL),
(56, 0, 1458047384, 'backup', 'backup_general_role_assignments_locked', '', NULL),
(57, 0, 1458047384, 'backup', 'backup_general_activities', '1', NULL),
(58, 0, 1458047384, 'backup', 'backup_general_activities_locked', '', NULL),
(59, 0, 1458047384, 'backup', 'backup_general_blocks', '1', NULL),
(60, 0, 1458047384, 'backup', 'backup_general_blocks_locked', '', NULL),
(61, 0, 1458047384, 'backup', 'backup_general_filters', '1', NULL),
(62, 0, 1458047384, 'backup', 'backup_general_filters_locked', '', NULL),
(63, 0, 1458047384, 'backup', 'backup_general_comments', '1', NULL),
(64, 0, 1458047384, 'backup', 'backup_general_comments_locked', '', NULL),
(65, 0, 1458047384, 'backup', 'backup_general_badges', '1', NULL),
(66, 0, 1458047384, 'backup', 'backup_general_badges_locked', '', NULL),
(67, 0, 1458047384, 'backup', 'backup_general_userscompletion', '1', NULL),
(68, 0, 1458047384, 'backup', 'backup_general_userscompletion_locked', '', NULL),
(69, 0, 1458047384, 'backup', 'backup_general_logs', '0', NULL),
(70, 0, 1458047384, 'backup', 'backup_general_logs_locked', '', NULL),
(71, 0, 1458047384, 'backup', 'backup_general_histories', '0', NULL),
(72, 0, 1458047384, 'backup', 'backup_general_histories_locked', '', NULL),
(73, 0, 1458047384, 'backup', 'backup_general_questionbank', '1', NULL),
(74, 0, 1458047385, 'backup', 'backup_general_questionbank_locked', '', NULL),
(75, 0, 1458047385, 'backup', 'backup_general_groups', '1', NULL),
(76, 0, 1458047385, 'backup', 'backup_general_groups_locked', '', NULL),
(77, 0, 1458047385, 'backup', 'import_general_maxresults', '10', NULL),
(78, 0, 1458047385, 'backup', 'import_general_duplicate_admin_allowed', '0', NULL),
(79, 0, 1458047385, 'backup', 'backup_auto_active', '0', NULL),
(80, 0, 1458047385, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(81, 0, 1458047385, 'backup', 'backup_auto_hour', '0', NULL),
(82, 0, 1458047385, 'backup', 'backup_auto_minute', '0', NULL),
(83, 0, 1458047385, 'backup', 'backup_auto_storage', '0', NULL),
(84, 0, 1458047385, 'backup', 'backup_auto_destination', '', NULL),
(85, 0, 1458047385, 'backup', 'backup_auto_max_kept', '1', NULL),
(86, 0, 1458047385, 'backup', 'backup_auto_delete_days', '0', NULL),
(87, 0, 1458047385, 'backup', 'backup_auto_min_kept', '0', NULL),
(88, 0, 1458047385, 'backup', 'backup_shortname', '0', NULL),
(89, 0, 1458047385, 'backup', 'backup_auto_skip_hidden', '1', NULL),
(90, 0, 1458047385, 'backup', 'backup_auto_skip_modif_days', '30', NULL),
(91, 0, 1458047385, 'backup', 'backup_auto_skip_modif_prev', '0', NULL),
(92, 0, 1458047385, 'backup', 'backup_auto_users', '1', NULL),
(93, 0, 1458047385, 'backup', 'backup_auto_role_assignments', '1', NULL),
(94, 0, 1458047385, 'backup', 'backup_auto_activities', '1', NULL),
(95, 0, 1458047385, 'backup', 'backup_auto_blocks', '1', NULL),
(96, 0, 1458047385, 'backup', 'backup_auto_filters', '1', NULL),
(97, 0, 1458047385, 'backup', 'backup_auto_comments', '1', NULL),
(98, 0, 1458047385, 'backup', 'backup_auto_badges', '1', NULL),
(99, 0, 1458047385, 'backup', 'backup_auto_userscompletion', '1', NULL),
(100, 0, 1458047385, 'backup', 'backup_auto_logs', '0', NULL),
(101, 0, 1458047385, 'backup', 'backup_auto_histories', '0', NULL),
(102, 0, 1458047385, 'backup', 'backup_auto_questionbank', '1', NULL),
(103, 0, 1458047385, 'backup', 'backup_auto_groups', '1', NULL),
(104, 0, 1458047385, NULL, 'grade_profilereport', 'user', NULL),
(105, 0, 1458047385, NULL, 'grade_aggregationposition', '1', NULL),
(106, 0, 1458047386, NULL, 'grade_includescalesinaggregation', '1', NULL),
(107, 0, 1458047386, NULL, 'grade_hiddenasdate', '0', NULL),
(108, 0, 1458047386, NULL, 'gradepublishing', '0', NULL),
(109, 0, 1458047386, NULL, 'grade_export_displaytype', '1', NULL),
(110, 0, 1458047386, NULL, 'grade_export_decimalpoints', '2', NULL),
(111, 0, 1458047386, NULL, 'grade_navmethod', '0', NULL),
(112, 0, 1458047386, NULL, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email', NULL),
(113, 0, 1458047386, NULL, 'grade_export_customprofilefields', '', NULL),
(114, 0, 1458047386, NULL, 'recovergradesdefault', '0', NULL),
(115, 0, 1458047386, NULL, 'gradeexport', '', NULL),
(116, 0, 1458047386, NULL, 'unlimitedgrades', '0', NULL),
(117, 0, 1458047386, NULL, 'grade_report_showmin', '1', NULL),
(118, 0, 1458047386, NULL, 'gradepointmax', '100', NULL),
(119, 0, 1458047386, NULL, 'gradepointdefault', '100', NULL),
(120, 0, 1458047386, NULL, 'grade_minmaxtouse', '1', NULL),
(121, 0, 1458047386, NULL, 'grade_mygrades_report', 'overview', NULL),
(122, 0, 1458047386, NULL, 'gradereport_mygradeurl', '', NULL),
(123, 0, 1458047386, NULL, 'grade_hideforcedsettings', '1', NULL),
(124, 0, 1458047386, NULL, 'grade_aggregation', '13', NULL),
(125, 0, 1458047386, NULL, 'grade_aggregation_flag', '0', NULL),
(126, 0, 1458047386, NULL, 'grade_aggregations_visible', '13', NULL),
(127, 0, 1458047386, NULL, 'grade_aggregateonlygraded', '1', NULL),
(128, 0, 1458047386, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(129, 0, 1458047386, NULL, 'grade_aggregateoutcomes', '0', NULL),
(130, 0, 1458047386, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(131, 0, 1458047386, NULL, 'grade_keephigh', '0', NULL),
(132, 0, 1458047386, NULL, 'grade_keephigh_flag', '3', NULL),
(133, 0, 1458047387, NULL, 'grade_droplow', '0', NULL),
(134, 0, 1458047387, NULL, 'grade_droplow_flag', '2', NULL),
(135, 0, 1458047387, NULL, 'grade_overridecat', '1', NULL),
(136, 0, 1458047387, NULL, 'grade_displaytype', '1', NULL),
(137, 0, 1458047387, NULL, 'grade_decimalpoints', '2', NULL),
(138, 0, 1458047387, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(139, 0, 1458047387, NULL, 'grade_report_studentsperpage', '100', NULL),
(140, 0, 1458047387, NULL, 'grade_report_showonlyactiveenrol', '1', NULL),
(141, 0, 1458047387, NULL, 'grade_report_quickgrading', '1', NULL),
(142, 0, 1458047387, NULL, 'grade_report_showquickfeedback', '0', NULL),
(143, 0, 1458047387, NULL, 'grade_report_meanselection', '1', NULL),
(144, 0, 1458047387, NULL, 'grade_report_enableajax', '0', NULL),
(145, 0, 1458047387, NULL, 'grade_report_showcalculations', '1', NULL),
(146, 0, 1458047387, NULL, 'grade_report_showeyecons', '0', NULL),
(147, 0, 1458047387, NULL, 'grade_report_showaverages', '1', NULL),
(148, 0, 1458047387, NULL, 'grade_report_showlocks', '0', NULL),
(149, 0, 1458047387, NULL, 'grade_report_showranges', '0', NULL),
(150, 0, 1458047387, NULL, 'grade_report_showanalysisicon', '1', NULL),
(151, 0, 1458047387, NULL, 'grade_report_showuserimage', '1', NULL),
(152, 0, 1458047387, NULL, 'grade_report_showactivityicons', '1', NULL),
(153, 0, 1458047387, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(154, 0, 1458047387, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(155, 0, 1458047387, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(156, 0, 1458047387, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(157, 0, 1458047387, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(158, 0, 1458047387, NULL, 'grade_report_historyperpage', '50', NULL),
(159, 0, 1458047387, NULL, 'grade_report_overview_showrank', '0', NULL),
(160, 0, 1458047388, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(161, 0, 1458047388, NULL, 'grade_report_user_showrank', '0', NULL),
(162, 0, 1458047388, NULL, 'grade_report_user_showpercentage', '1', NULL),
(163, 0, 1458047388, NULL, 'grade_report_user_showgrade', '1', NULL),
(164, 0, 1458047388, NULL, 'grade_report_user_showfeedback', '1', NULL),
(165, 0, 1458047388, NULL, 'grade_report_user_showrange', '1', NULL),
(166, 0, 1458047388, NULL, 'grade_report_user_showweight', '1', NULL),
(167, 0, 1458047388, NULL, 'grade_report_user_showaverage', '0', NULL),
(168, 0, 1458047388, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(169, 0, 1458047388, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(170, 0, 1458047388, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(171, 0, 1458047388, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(172, 0, 1458047388, NULL, 'grade_report_user_showcontributiontocoursetotal', '1', NULL),
(173, 0, 1458047388, NULL, 'badges_defaultissuername', '', NULL),
(174, 0, 1458047388, NULL, 'badges_defaultissuercontact', '', NULL),
(175, 0, 1458047388, NULL, 'badges_badgesalt', 'badges1458047378', NULL),
(176, 0, 1458047388, NULL, 'badges_allowexternalbackpack', '1', NULL),
(177, 0, 1458047388, NULL, 'badges_allowcoursebadges', '1', NULL),
(178, 0, 1458047390, NULL, 'forcetimezone', '99', NULL),
(179, 0, 1458047390, NULL, 'country', '0', NULL),
(180, 0, 1458047390, NULL, 'defaultcity', '', NULL),
(181, 0, 1458047390, NULL, 'geoipfile', '/var/moodledata/geoip/GeoLiteCity.dat', NULL),
(182, 0, 1458047390, NULL, 'googlemapkey3', '', NULL),
(183, 0, 1458047390, NULL, 'allcountrycodes', '', NULL),
(184, 0, 1458047390, NULL, 'autolang', '1', NULL),
(185, 0, 1458047390, NULL, 'lang', 'en', NULL),
(186, 0, 1458047390, NULL, 'langmenu', '1', NULL),
(187, 0, 1458047390, NULL, 'langlist', '', NULL),
(188, 0, 1458047390, NULL, 'langcache', '1', NULL),
(189, 0, 1458047390, NULL, 'langstringcache', '1', NULL),
(190, 0, 1458047390, NULL, 'locale', '', NULL),
(191, 0, 1458047390, NULL, 'latinexcelexport', '0', NULL),
(192, 0, 1458047390, NULL, 'requiremodintro', '0', NULL),
(193, 0, 1458047390, NULL, 'registerauth', '', NULL),
(194, 0, 1458047390, NULL, 'authloginviaemail', '0', NULL),
(195, 0, 1458047390, NULL, 'allowaccountssameemail', '0', NULL),
(196, 0, 1458047390, NULL, 'authpreventaccountcreation', '0', NULL),
(197, 0, 1458047390, NULL, 'loginpageautofocus', '0', NULL),
(198, 0, 1458047390, NULL, 'guestloginbutton', '1', NULL),
(199, 0, 1458047390, NULL, 'limitconcurrentlogins', '0', NULL),
(200, 0, 1458047390, NULL, 'alternateloginurl', '', NULL),
(201, 0, 1458047390, NULL, 'forgottenpasswordurl', '', NULL),
(202, 0, 1458047390, NULL, 'auth_instructions', '', NULL),
(203, 0, 1458047390, NULL, 'allowemailaddresses', '', NULL),
(204, 0, 1458047390, NULL, 'denyemailaddresses', '', NULL),
(205, 0, 1458047390, NULL, 'verifychangedemail', '1', NULL),
(206, 0, 1458047390, NULL, 'recaptchapublickey', '', NULL),
(207, 0, 1458047390, NULL, 'recaptchaprivatekey', '', NULL),
(208, 0, 1458047390, 'cachestore_memcache', 'testservers', '', NULL),
(209, 0, 1458047390, 'cachestore_memcached', 'testservers', '', NULL),
(210, 0, 1458047390, 'cachestore_mongodb', 'testserver', '', NULL),
(211, 0, 1458047390, NULL, 'filteruploadedfiles', '0', NULL),
(212, 0, 1458047390, NULL, 'filtermatchoneperpage', '0', NULL),
(213, 0, 1458047390, NULL, 'filtermatchonepertext', '0', NULL),
(214, 0, 1458047390, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(215, 0, 1458047390, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(216, 0, 1458047390, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(217, 0, 1458047390, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(218, 0, 1458047390, NULL, 'portfolio_high_db_threshold', '50', NULL),
(219, 0, 1458047390, 'question_preview', 'behaviour', 'deferredfeedback', NULL),
(220, 0, 1458047390, 'question_preview', 'correctness', '1', NULL),
(221, 0, 1458047390, 'question_preview', 'marks', '2', NULL),
(222, 0, 1458047390, 'question_preview', 'markdp', '2', NULL),
(223, 0, 1458047390, 'question_preview', 'feedback', '1', NULL),
(224, 0, 1458047390, 'question_preview', 'generalfeedback', '1', NULL),
(225, 0, 1458047390, 'question_preview', 'rightanswer', '1', NULL),
(226, 0, 1458047390, 'question_preview', 'history', '0', NULL),
(227, 0, 1458047390, NULL, 'repositorycacheexpire', '120', NULL),
(228, 0, 1458047390, NULL, 'repositorygetfiletimeout', '30', NULL),
(229, 0, 1458047390, NULL, 'repositorysyncfiletimeout', '1', NULL),
(230, 0, 1458047390, NULL, 'repositorysyncimagetimeout', '3', NULL),
(231, 0, 1458047390, NULL, 'repositoryallowexternallinks', '1', NULL),
(232, 0, 1458047390, NULL, 'legacyfilesinnewcourses', '0', NULL),
(233, 0, 1458047390, NULL, 'legacyfilesaddallowed', '1', NULL),
(234, 0, 1458047390, NULL, 'mobilecssurl', '', NULL),
(235, 0, 1458047390, NULL, 'enablewsdocumentation', '0', NULL),
(236, 0, 1458047390, NULL, 'allowbeforeblock', '0', NULL),
(237, 0, 1458047390, NULL, 'allowedip', '', NULL),
(238, 0, 1458047390, NULL, 'blockedip', '', NULL),
(239, 0, 1458047390, NULL, 'protectusernames', '1', NULL),
(240, 0, 1458047390, NULL, 'forcelogin', '0', NULL),
(241, 0, 1458047390, NULL, 'forceloginforprofiles', '1', NULL),
(242, 0, 1458047390, NULL, 'forceloginforprofileimage', '0', NULL),
(243, 0, 1458047390, NULL, 'opentogoogle', '0', NULL),
(244, 0, 1458047390, NULL, 'maxbytes', '0', NULL),
(245, 0, 1458047390, NULL, 'userquota', '104857600', NULL),
(246, 0, 1458047390, NULL, 'allowobjectembed', '0', NULL),
(247, 0, 1458047390, NULL, 'enabletrusttext', '0', NULL),
(248, 0, 1458047390, NULL, 'maxeditingtime', '1800', NULL),
(249, 0, 1458047390, NULL, 'extendedusernamechars', '0', NULL),
(250, 0, 1458047390, NULL, 'sitepolicy', '', NULL),
(251, 0, 1458047390, NULL, 'sitepolicyguest', '', NULL),
(252, 0, 1458047390, NULL, 'keeptagnamecase', '1', NULL),
(253, 0, 1458047390, NULL, 'profilesforenrolledusersonly', '1', NULL),
(254, 0, 1458047390, NULL, 'cronclionly', '1', NULL),
(255, 0, 1458047390, NULL, 'cronremotepassword', '', NULL),
(256, 0, 1458047391, NULL, 'lockoutthreshold', '0', NULL),
(257, 0, 1458047391, NULL, 'lockoutwindow', '1800', NULL),
(258, 0, 1458047391, NULL, 'lockoutduration', '1800', NULL),
(259, 0, 1458047391, NULL, 'passwordpolicy', '1', NULL),
(260, 0, 1458047391, NULL, 'minpasswordlength', '8', NULL),
(261, 0, 1458047391, NULL, 'minpassworddigits', '1', NULL),
(262, 0, 1458047391, NULL, 'minpasswordlower', '1', NULL),
(263, 0, 1458047391, NULL, 'minpasswordupper', '1', NULL),
(264, 0, 1458047391, NULL, 'minpasswordnonalphanum', '1', NULL),
(265, 0, 1458047391, NULL, 'maxconsecutiveidentchars', '0', NULL),
(266, 0, 1458047391, NULL, 'passwordreuselimit', '0', NULL),
(267, 0, 1458047391, NULL, 'pwresettime', '1800', NULL),
(268, 0, 1458047391, NULL, 'passwordchangelogout', '0', NULL),
(269, 0, 1458047391, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(270, 0, 1458047391, NULL, 'disableuserimages', '0', NULL),
(271, 0, 1458047391, NULL, 'emailchangeconfirmation', '1', NULL),
(272, 0, 1458047391, NULL, 'rememberusername', '2', NULL),
(273, 0, 1458047391, NULL, 'strictformsrequired', '0', NULL),
(274, 0, 1458047391, NULL, 'loginhttps', '0', NULL),
(275, 0, 1458047391, NULL, 'cookiesecure', '0', NULL),
(276, 0, 1458047391, NULL, 'cookiehttponly', '0', NULL),
(277, 0, 1458047391, NULL, 'allowframembedding', '0', NULL),
(278, 0, 1458047391, NULL, 'loginpasswordautocomplete', '0', NULL),
(279, 0, 1458047391, NULL, 'displayloginfailures', '0', NULL),
(280, 0, 1458047391, NULL, 'notifyloginfailures', '', NULL),
(281, 0, 1458047391, NULL, 'notifyloginthreshold', '10', NULL),
(282, 0, 1458047391, NULL, 'runclamonupload', '0', NULL),
(283, 0, 1458047391, NULL, 'pathtoclam', '', NULL),
(284, 0, 1458047391, NULL, 'quarantinedir', '', NULL),
(285, 0, 1458047391, NULL, 'clamfailureonupload', 'donothing', NULL),
(286, 0, 1458047391, NULL, 'themelist', '', NULL),
(287, 0, 1458047391, NULL, 'themedesignermode', '0', NULL),
(288, 0, 1458047391, NULL, 'allowuserthemes', '0', NULL),
(289, 0, 1458047391, NULL, 'allowcoursethemes', '0', NULL),
(290, 0, 1458047391, NULL, 'allowcategorythemes', '0', NULL),
(291, 0, 1458047391, NULL, 'allowthemechangeonurl', '0', NULL),
(292, 0, 1458047391, NULL, 'allowuserblockhiding', '1', NULL),
(293, 0, 1458047391, NULL, 'allowblockstodock', '1', NULL),
(294, 0, 1458047391, NULL, 'custommenuitems', '', NULL),
(295, 0, 1458047391, NULL, 'customusermenuitems', 'grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences', NULL),
(296, 0, 1458047391, NULL, 'enabledevicedetection', '1', NULL),
(297, 0, 1458047391, NULL, 'devicedetectregex', '[]', NULL),
(298, 0, 1458047391, 'theme_clean', 'invert', '0', NULL),
(299, 0, 1458047391, 'theme_clean', 'logo', '', NULL),
(300, 0, 1458047391, 'theme_clean', 'customcss', '', NULL),
(301, 0, 1458047391, 'theme_clean', 'footnote', '', NULL),
(302, 0, 1458047391, 'theme_more', 'textcolor', '#333366', NULL),
(303, 0, 1458047391, 'theme_more', 'linkcolor', '#FF6500', NULL),
(304, 0, 1458047391, 'theme_more', 'bodybackground', '', NULL),
(305, 0, 1458047391, 'theme_more', 'backgroundimage', '', NULL),
(306, 0, 1458047391, 'theme_more', 'backgroundrepeat', 'repeat', NULL),
(307, 0, 1458047391, 'theme_more', 'backgroundposition', '0', NULL),
(308, 0, 1458047391, 'theme_more', 'backgroundfixed', '0', NULL),
(309, 0, 1458047391, 'theme_more', 'contentbackground', '#FFFFFF', NULL),
(310, 0, 1458047391, 'theme_more', 'secondarybackground', '#FFFFFF', NULL),
(311, 0, 1458047391, 'theme_more', 'invert', '1', NULL),
(312, 0, 1458047391, 'theme_more', 'logo', '', NULL),
(313, 0, 1458047391, 'theme_more', 'customcss', '', NULL),
(314, 0, 1458047391, 'theme_more', 'footnote', '', NULL),
(315, 0, 1458047391, NULL, 'calendartype', 'gregorian', NULL),
(316, 0, 1458047391, NULL, 'calendar_adminseesall', '0', NULL),
(317, 0, 1458047391, NULL, 'calendar_site_timeformat', '0', NULL),
(318, 0, 1458047391, NULL, 'calendar_startwday', '1', NULL),
(319, 0, 1458047391, NULL, 'calendar_weekend', '65', NULL),
(320, 0, 1458047391, NULL, 'calendar_lookahead', '21', NULL),
(321, 0, 1458047391, NULL, 'calendar_maxevents', '10', NULL),
(322, 0, 1458047391, NULL, 'enablecalendarexport', '1', NULL),
(323, 0, 1458047391, NULL, 'calendar_customexport', '1', NULL),
(324, 0, 1458047391, NULL, 'calendar_exportlookahead', '365', NULL),
(325, 0, 1458047391, NULL, 'calendar_exportlookback', '5', NULL),
(326, 0, 1458047391, NULL, 'calendar_exportsalt', 'HhTU61qrSsiyB3szO5VWJY4gAcuvSdAONFVVRBOenPlFzGhi5ZqnHLQOC6Vg', NULL),
(327, 0, 1458047391, NULL, 'calendar_showicalsource', '1', NULL),
(328, 0, 1458047391, NULL, 'useblogassociations', '1', NULL),
(329, 0, 1458047391, NULL, 'bloglevel', '4', NULL),
(330, 0, 1458047391, NULL, 'useexternalblogs', '1', NULL),
(331, 0, 1458047391, NULL, 'externalblogcrontime', '86400', NULL),
(332, 0, 1458047391, NULL, 'maxexternalblogsperuser', '1', NULL),
(333, 0, 1458047391, NULL, 'blogusecomments', '1', NULL),
(334, 0, 1458047391, NULL, 'blogshowcommentscount', '1', NULL),
(335, 0, 1458047391, NULL, 'defaulthomepage', '1', NULL),
(336, 0, 1458047391, NULL, 'allowguestmymoodle', '1', NULL),
(337, 0, 1458047391, NULL, 'navshowfullcoursenames', '0', NULL),
(338, 0, 1458047391, NULL, 'navshowcategories', '1', NULL),
(339, 0, 1458047391, NULL, 'navshowmycoursecategories', '0', NULL),
(340, 0, 1458047391, NULL, 'navshowallcourses', '0', NULL),
(341, 0, 1458047391, NULL, 'navexpandmycourses', '1', NULL),
(342, 0, 1458047391, NULL, 'navsortmycoursessort', 'sortorder', NULL),
(343, 0, 1458047391, NULL, 'navcourselimit', '20', NULL),
(344, 0, 1458047391, NULL, 'usesitenameforsitepages', '0', NULL),
(345, 0, 1458047391, NULL, 'linkadmincategories', '0', NULL),
(346, 0, 1458047391, NULL, 'linkcoursesections', '0', NULL),
(347, 0, 1458047391, NULL, 'navshowfrontpagemods', '1', NULL),
(348, 0, 1458047391, NULL, 'navadduserpostslinks', '1', NULL),
(349, 0, 1458047391, NULL, 'formatstringstriptags', '1', NULL),
(350, 0, 1458047391, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(351, 0, 1458047391, NULL, 'core_media_enable_youtube', '1', NULL),
(352, 0, 1458047391, NULL, 'core_media_enable_vimeo', '0', NULL),
(353, 0, 1458047391, NULL, 'core_media_enable_mp3', '1', NULL),
(354, 0, 1458047391, NULL, 'core_media_enable_flv', '1', NULL),
(355, 0, 1458047391, NULL, 'core_media_enable_swf', '1', NULL),
(356, 0, 1458047391, NULL, 'core_media_enable_html5audio', '1', NULL),
(357, 0, 1458047391, NULL, 'core_media_enable_html5video', '1', NULL),
(358, 0, 1458047391, NULL, 'core_media_enable_qt', '1', NULL),
(359, 0, 1458047391, NULL, 'core_media_enable_wmp', '1', NULL),
(360, 0, 1458047391, NULL, 'core_media_enable_rm', '1', NULL),
(361, 0, 1458047391, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(362, 0, 1458047391, NULL, 'doclang', '', NULL),
(363, 0, 1458047391, NULL, 'doctonewwindow', '0', NULL),
(364, 0, 1458047391, NULL, 'courselistshortnames', '0', NULL),
(365, 0, 1458047391, NULL, 'coursesperpage', '20', NULL),
(366, 0, 1458047391, NULL, 'courseswithsummarieslimit', '10', NULL),
(367, 0, 1458047391, NULL, 'courseoverviewfileslimit', '1', NULL),
(368, 0, 1458047391, NULL, 'courseoverviewfilesext', '.jpg,.gif,.png', NULL),
(369, 0, 1458047391, NULL, 'useexternalyui', '0', NULL),
(370, 0, 1458047391, NULL, 'yuicomboloading', '1', NULL),
(371, 0, 1458047391, NULL, 'cachejs', '1', NULL),
(372, 0, 1458047391, NULL, 'modchooserdefault', '1', NULL),
(373, 0, 1458047391, NULL, 'modeditingmenu', '1', NULL),
(374, 0, 1458047391, NULL, 'blockeditingmenu', '1', NULL),
(375, 0, 1458047391, NULL, 'additionalhtmlhead', '', NULL),
(376, 0, 1458047391, NULL, 'additionalhtmltopofbody', '', NULL),
(377, 0, 1458047391, NULL, 'additionalhtmlfooter', '', NULL),
(378, 0, 1458047391, NULL, 'pathtodu', '', NULL),
(379, 0, 1458047391, NULL, 'aspellpath', '', NULL),
(380, 0, 1458047391, NULL, 'pathtodot', '', NULL),
(381, 0, 1458047392, NULL, 'pathtogs', '/usr/bin/gs', NULL),
(382, 0, 1458047392, NULL, 'supportpage', '', NULL),
(383, 0, 1458047392, NULL, 'dbsessions', '0', NULL),
(384, 0, 1458047392, NULL, 'sessioncookie', '', NULL),
(385, 0, 1458047392, NULL, 'sessioncookiepath', '', NULL),
(386, 0, 1458047392, NULL, 'sessioncookiedomain', '', NULL),
(387, 0, 1458047392, NULL, 'statsfirstrun', 'none', NULL),
(388, 0, 1458047392, NULL, 'statsmaxruntime', '0', NULL),
(389, 0, 1458047392, NULL, 'statsruntimedays', '31', NULL),
(390, 0, 1458047392, NULL, 'statsruntimestarthour', '0', NULL),
(391, 0, 1458047392, NULL, 'statsruntimestartminute', '0', NULL),
(392, 0, 1458047392, NULL, 'statsuserthreshold', '0', NULL),
(393, 0, 1458047392, NULL, 'slasharguments', '1', NULL),
(394, 0, 1458047392, NULL, 'getremoteaddrconf', '0', NULL),
(395, 0, 1458047392, NULL, 'proxyhost', '', NULL),
(396, 0, 1458047392, NULL, 'proxyport', '0', NULL),
(397, 0, 1458047392, NULL, 'proxytype', 'HTTP', NULL),
(398, 0, 1458047392, NULL, 'proxyuser', '', NULL),
(399, 0, 1458047392, NULL, 'proxypassword', '', NULL),
(400, 0, 1458047392, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(401, 0, 1458047392, NULL, 'maintenance_enabled', '0', NULL),
(402, 0, 1458047392, NULL, 'maintenance_message', '', NULL),
(403, 0, 1458047392, NULL, 'deleteunconfirmed', '168', NULL),
(404, 0, 1458047392, NULL, 'deleteincompleteusers', '0', NULL),
(405, 0, 1458047392, NULL, 'disablegradehistory', '0', NULL),
(406, 0, 1458047392, NULL, 'gradehistorylifetime', '0', NULL),
(407, 0, 1458047392, NULL, 'tempdatafoldercleanup', '168', NULL),
(408, 0, 1458047392, NULL, 'extramemorylimit', '512M', NULL),
(409, 0, 1458047392, NULL, 'maxtimelimit', '0', NULL),
(410, 0, 1458047392, NULL, 'curlcache', '120', NULL),
(411, 0, 1458047392, NULL, 'curltimeoutkbitrate', '56', NULL),
(412, 0, 1458047392, NULL, 'updateautocheck', '1', NULL),
(413, 0, 1458047392, NULL, 'updateminmaturity', '200', NULL),
(414, 0, 1458047392, NULL, 'updatenotifybuilds', '0', NULL),
(415, 0, 1458047392, NULL, 'enablesafebrowserintegration', '0', NULL),
(416, 0, 1458047392, NULL, 'dndallowtextandlinks', '0', NULL),
(417, 0, 1458047392, NULL, 'enablecssoptimiser', '0', NULL),
(418, 0, 1458047392, NULL, 'debug', '0', NULL),
(419, 0, 1458047392, NULL, 'debugdisplay', '0', NULL),
(420, 0, 1458047392, NULL, 'debugsmtp', '0', NULL),
(421, 0, 1458047392, NULL, 'perfdebug', '7', NULL),
(422, 0, 1458047392, NULL, 'debugstringids', '0', NULL),
(423, 0, 1458047392, NULL, 'debugvalidators', '0', NULL),
(424, 0, 1458047392, NULL, 'debugpageinfo', '0', NULL),
(425, 0, 1458047392, NULL, 'profilingenabled', '0', NULL),
(426, 0, 1458047392, NULL, 'profilingincluded', '', NULL),
(427, 0, 1458047392, NULL, 'profilingexcluded', '', NULL),
(428, 0, 1458047392, NULL, 'profilingautofrec', '0', NULL),
(429, 0, 1458047392, NULL, 'profilingallowme', '0', NULL),
(430, 0, 1458047392, NULL, 'profilingallowall', '0', NULL),
(431, 0, 1458047392, NULL, 'profilinglifetime', '1440', NULL),
(432, 0, 1458047392, NULL, 'profilingimportprefix', '(I)', NULL),
(433, 0, 1458047413, 'activitynames', 'filter_active', '1', ''),
(434, 0, 1458047414, 'mathjaxloader', 'filter_active', '1', ''),
(435, 0, 1458047414, 'mediaplugin', 'filter_active', '1', ''),
(436, 2, 1458048083, NULL, 'notloggedinroleid', '6', NULL),
(437, 2, 1458048083, NULL, 'guestroleid', '6', NULL),
(438, 2, 1458048083, NULL, 'defaultuserroleid', '7', NULL),
(439, 2, 1458048083, NULL, 'creatornewroleid', '3', NULL),
(440, 2, 1458048083, NULL, 'restorernewroleid', '3', NULL),
(441, 2, 1458048083, NULL, 'gradebookroles', '5', NULL),
(442, 2, 1458048083, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments', NULL),
(443, 2, 1458048083, 'assign', 'showrecentsubmissions', '0', NULL),
(444, 2, 1458048083, 'assign', 'submissionreceipts', '1', NULL),
(445, 2, 1458048083, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.', NULL),
(446, 2, 1458048083, 'assign', 'alwaysshowdescription', '1', NULL),
(447, 2, 1458048083, 'assign', 'alwaysshowdescription_adv', '', NULL),
(448, 2, 1458048084, 'assign', 'alwaysshowdescription_locked', '', NULL),
(449, 2, 1458048084, 'assign', 'allowsubmissionsfromdate', '0', NULL),
(450, 2, 1458048084, 'assign', 'allowsubmissionsfromdate_enabled', '1', NULL),
(451, 2, 1458048084, 'assign', 'allowsubmissionsfromdate_adv', '', NULL),
(452, 2, 1458048084, 'assign', 'duedate', '604800', NULL),
(453, 2, 1458048084, 'assign', 'duedate_enabled', '1', NULL),
(454, 2, 1458048084, 'assign', 'duedate_adv', '', NULL),
(455, 2, 1458048084, 'assign', 'cutoffdate', '1209600', NULL),
(456, 2, 1458048084, 'assign', 'cutoffdate_enabled', '', NULL),
(457, 2, 1458048084, 'assign', 'cutoffdate_adv', '', NULL),
(458, 2, 1458048084, 'assign', 'submissiondrafts', '0', NULL),
(459, 2, 1458048084, 'assign', 'submissiondrafts_adv', '', NULL),
(460, 2, 1458048084, 'assign', 'submissiondrafts_locked', '', NULL),
(461, 2, 1458048084, 'assign', 'requiresubmissionstatement', '0', NULL),
(462, 2, 1458048084, 'assign', 'requiresubmissionstatement_adv', '', NULL),
(463, 2, 1458048084, 'assign', 'requiresubmissionstatement_locked', '', NULL),
(464, 2, 1458048084, 'assign', 'attemptreopenmethod', 'none', NULL),
(465, 2, 1458048084, 'assign', 'attemptreopenmethod_adv', '', NULL),
(466, 2, 1458048084, 'assign', 'attemptreopenmethod_locked', '', NULL),
(467, 2, 1458048084, 'assign', 'maxattempts', '-1', NULL),
(468, 2, 1458048084, 'assign', 'maxattempts_adv', '', NULL),
(469, 2, 1458048084, 'assign', 'maxattempts_locked', '', NULL),
(470, 2, 1458048084, 'assign', 'teamsubmission', '0', NULL),
(471, 2, 1458048084, 'assign', 'teamsubmission_adv', '', NULL),
(472, 2, 1458048084, 'assign', 'teamsubmission_locked', '', NULL),
(473, 2, 1458048084, 'assign', 'preventsubmissionnotingroup', '0', NULL),
(474, 2, 1458048084, 'assign', 'preventsubmissionnotingroup_adv', '', NULL),
(475, 2, 1458048084, 'assign', 'preventsubmissionnotingroup_locked', '', NULL),
(476, 2, 1458048084, 'assign', 'requireallteammemberssubmit', '0', NULL),
(477, 2, 1458048084, 'assign', 'requireallteammemberssubmit_adv', '', NULL),
(478, 2, 1458048084, 'assign', 'requireallteammemberssubmit_locked', '', NULL),
(479, 2, 1458048084, 'assign', 'teamsubmissiongroupingid', '', NULL),
(480, 2, 1458048084, 'assign', 'teamsubmissiongroupingid_adv', '', NULL),
(481, 2, 1458048084, 'assign', 'sendnotifications', '0', NULL),
(482, 2, 1458048084, 'assign', 'sendnotifications_adv', '', NULL),
(483, 2, 1458048084, 'assign', 'sendnotifications_locked', '', NULL),
(484, 2, 1458048084, 'assign', 'sendlatenotifications', '0', NULL),
(485, 2, 1458048084, 'assign', 'sendlatenotifications_adv', '', NULL),
(486, 2, 1458048084, 'assign', 'sendlatenotifications_locked', '', NULL),
(487, 2, 1458048084, 'assign', 'sendstudentnotifications', '1', NULL),
(488, 2, 1458048084, 'assign', 'sendstudentnotifications_adv', '', NULL),
(489, 2, 1458048084, 'assign', 'sendstudentnotifications_locked', '', NULL),
(490, 2, 1458048084, 'assign', 'blindmarking', '0', NULL),
(491, 2, 1458048084, 'assign', 'blindmarking_adv', '', NULL),
(492, 2, 1458048084, 'assign', 'blindmarking_locked', '', NULL),
(493, 2, 1458048084, 'assign', 'markingworkflow', '0', NULL),
(494, 2, 1458048084, 'assign', 'markingworkflow_adv', '', NULL),
(495, 2, 1458048084, 'assign', 'markingworkflow_locked', '', NULL),
(496, 2, 1458048084, 'assign', 'markingallocation', '0', NULL),
(497, 2, 1458048084, 'assign', 'markingallocation_adv', '', NULL),
(498, 2, 1458048084, 'assign', 'markingallocation_locked', '', NULL),
(499, 2, 1458048084, 'assignsubmission_file', 'default', '1', NULL),
(500, 2, 1458048084, 'assignsubmission_file', 'maxfiles', '20', NULL),
(501, 2, 1458048084, 'assignsubmission_file', 'maxbytes', '1048576', NULL),
(502, 2, 1458048084, 'assignsubmission_onlinetext', 'default', '0', NULL),
(503, 2, 1458048084, 'assignfeedback_comments', 'default', '1', NULL),
(504, 2, 1458048084, 'assignfeedback_comments', 'inline', '0', NULL),
(505, 2, 1458048084, 'assignfeedback_comments', 'inline_adv', '', NULL),
(506, 2, 1458048084, 'assignfeedback_comments', 'inline_locked', '', NULL),
(507, 2, 1458048084, 'assignfeedback_editpdf', 'stamps', '', NULL),
(508, 2, 1458048084, 'assignfeedback_file', 'default', '0', NULL),
(509, 2, 1458048084, 'assignfeedback_offline', 'default', '0', NULL),
(510, 2, 1458048084, 'book', 'numberingoptions', '0,1,2,3', NULL),
(511, 2, 1458048084, 'book', 'navoptions', '0,1,2', NULL),
(512, 2, 1458048084, 'book', 'numbering', '1', NULL),
(513, 2, 1458048084, 'book', 'navstyle', '1', NULL),
(514, 2, 1458048084, NULL, 'chat_method', 'ajax', NULL),
(515, 2, 1458048084, NULL, 'chat_refresh_userlist', '10', NULL),
(516, 2, 1458048084, NULL, 'chat_old_ping', '35', NULL),
(517, 2, 1458048084, NULL, 'chat_refresh_room', '5', NULL),
(518, 2, 1458048084, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(519, 2, 1458048084, NULL, 'chat_serverhost', 'localhost', NULL),
(520, 2, 1458048084, NULL, 'chat_serverip', '127.0.0.1', NULL),
(521, 2, 1458048084, NULL, 'chat_serverport', '9111', NULL),
(522, 2, 1458048084, NULL, 'chat_servermax', '100', NULL),
(523, 2, 1458048084, NULL, 'data_enablerssfeeds', '0', NULL),
(524, 2, 1458048084, NULL, 'feedback_allowfullanonymous', '0', NULL),
(525, 2, 1458048084, 'folder', 'showexpanded', '1', NULL),
(526, 2, 1458048084, NULL, 'forum_displaymode', '3', NULL),
(527, 2, 1458048084, NULL, 'forum_replytouser', '1', NULL),
(528, 2, 1458048084, NULL, 'forum_shortpost', '300', NULL),
(529, 2, 1458048084, NULL, 'forum_longpost', '600', NULL),
(530, 2, 1458048084, NULL, 'forum_manydiscussions', '100', NULL),
(531, 2, 1458048084, NULL, 'forum_maxbytes', '512000', NULL),
(532, 2, 1458048084, NULL, 'forum_maxattachments', '9', NULL),
(533, 2, 1458048084, NULL, 'forum_trackingtype', '1', NULL),
(534, 2, 1458048084, NULL, 'forum_trackreadposts', '1', NULL),
(535, 2, 1458048084, NULL, 'forum_allowforcedreadtracking', '0', NULL),
(536, 2, 1458048084, NULL, 'forum_oldpostdays', '14', NULL),
(537, 2, 1458048084, NULL, 'forum_usermarksread', '0', NULL),
(538, 2, 1458048084, NULL, 'forum_cleanreadtime', '2', NULL),
(539, 2, 1458048084, NULL, 'digestmailtime', '17', NULL),
(540, 2, 1458048084, NULL, 'forum_enablerssfeeds', '0', NULL),
(541, 2, 1458048084, NULL, 'forum_enabletimedposts', '0', NULL),
(542, 2, 1458048084, NULL, 'glossary_entbypage', '10', NULL),
(543, 2, 1458048084, NULL, 'glossary_dupentries', '0', NULL),
(544, 2, 1458048084, NULL, 'glossary_allowcomments', '0', NULL),
(545, 2, 1458048084, NULL, 'glossary_linkbydefault', '1', NULL),
(546, 2, 1458048084, NULL, 'glossary_defaultapproval', '1', NULL),
(547, 2, 1458048084, NULL, 'glossary_enablerssfeeds', '0', NULL),
(548, 2, 1458048084, NULL, 'glossary_linkentries', '0', NULL),
(549, 2, 1458048084, NULL, 'glossary_casesensitive', '0', NULL),
(550, 2, 1458048084, NULL, 'glossary_fullmatch', '0', NULL),
(551, 2, 1458048084, 'imscp', 'keepold', '1', NULL),
(552, 2, 1458048084, 'imscp', 'keepold_adv', '', NULL),
(553, 2, 1458048084, 'label', 'dndmedia', '1', NULL),
(554, 2, 1458048084, 'label', 'dndresizewidth', '400', NULL),
(555, 2, 1458048084, 'label', 'dndresizeheight', '400', NULL),
(556, 2, 1458048084, NULL, 'lesson_slideshowwidth', '640', NULL),
(557, 2, 1458048084, NULL, 'lesson_slideshowheight', '480', NULL),
(558, 2, 1458048084, NULL, 'lesson_slideshowbgcolor', '#FFFFFF', NULL),
(559, 2, 1458048084, NULL, 'lesson_mediawidth', '640', NULL),
(560, 2, 1458048084, NULL, 'lesson_mediaheight', '480', NULL),
(561, 2, 1458048084, NULL, 'lesson_mediaclose', '0', NULL),
(562, 2, 1458048084, NULL, 'lesson_maxanswers', '4', NULL),
(563, 2, 1458048084, NULL, 'lesson_defaultnextpage', '0', NULL),
(564, 2, 1458048084, 'page', 'displayoptions', '5', NULL),
(565, 2, 1458048084, 'page', 'printheading', '1', NULL),
(566, 2, 1458048084, 'page', 'printintro', '0', NULL),
(567, 2, 1458048084, 'page', 'display', '5', NULL),
(568, 2, 1458048084, 'page', 'popupwidth', '620', NULL),
(569, 2, 1458048084, 'page', 'popupheight', '450', NULL),
(570, 2, 1458048084, 'quiz', 'timelimit', '0', NULL),
(571, 2, 1458048084, 'quiz', 'timelimit_adv', '', NULL),
(572, 2, 1458048084, 'quiz', 'overduehandling', 'autosubmit', NULL),
(573, 2, 1458048084, 'quiz', 'overduehandling_adv', '', NULL),
(574, 2, 1458048084, 'quiz', 'graceperiod', '86400', NULL),
(575, 2, 1458048084, 'quiz', 'graceperiod_adv', '', NULL),
(576, 2, 1458048084, 'quiz', 'graceperiodmin', '60', NULL),
(577, 2, 1458048084, 'quiz', 'attempts', '0', NULL),
(578, 2, 1458048084, 'quiz', 'attempts_adv', '', NULL),
(579, 2, 1458048084, 'quiz', 'grademethod', '1', NULL),
(580, 2, 1458048084, 'quiz', 'grademethod_adv', '', NULL),
(581, 2, 1458048084, 'quiz', 'maximumgrade', '10', NULL),
(582, 2, 1458048084, 'quiz', 'questionsperpage', '1', NULL),
(583, 2, 1458048084, 'quiz', 'questionsperpage_adv', '', NULL),
(584, 2, 1458048084, 'quiz', 'navmethod', 'free', NULL),
(585, 2, 1458048084, 'quiz', 'navmethod_adv', '1', NULL),
(586, 2, 1458048084, 'quiz', 'shuffleanswers', '1', NULL),
(587, 2, 1458048084, 'quiz', 'shuffleanswers_adv', '', NULL),
(588, 2, 1458048084, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(589, 2, 1458048084, 'quiz', 'canredoquestions', '0', NULL),
(590, 2, 1458048084, 'quiz', 'canredoquestions_adv', '1', NULL),
(591, 2, 1458048084, 'quiz', 'attemptonlast', '0', NULL),
(592, 2, 1458048084, 'quiz', 'attemptonlast_adv', '1', NULL),
(593, 2, 1458048084, 'quiz', 'reviewattempt', '69904', NULL),
(594, 2, 1458048084, 'quiz', 'reviewcorrectness', '69904', NULL),
(595, 2, 1458048084, 'quiz', 'reviewmarks', '69904', NULL),
(596, 2, 1458048084, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(597, 2, 1458048084, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(598, 2, 1458048084, 'quiz', 'reviewrightanswer', '69904', NULL),
(599, 2, 1458048084, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(600, 2, 1458048084, 'quiz', 'showuserpicture', '0', NULL),
(601, 2, 1458048084, 'quiz', 'showuserpicture_adv', '', NULL),
(602, 2, 1458048084, 'quiz', 'decimalpoints', '2', NULL),
(603, 2, 1458048084, 'quiz', 'decimalpoints_adv', '', NULL),
(604, 2, 1458048084, 'quiz', 'questiondecimalpoints', '-1', NULL),
(605, 2, 1458048084, 'quiz', 'questiondecimalpoints_adv', '1', NULL),
(606, 2, 1458048084, 'quiz', 'showblocks', '0', NULL),
(607, 2, 1458048084, 'quiz', 'showblocks_adv', '1', NULL),
(608, 2, 1458048084, 'quiz', 'password', '', NULL),
(609, 2, 1458048084, 'quiz', 'password_adv', '', NULL),
(610, 2, 1458048084, 'quiz', 'subnet', '', NULL),
(611, 2, 1458048084, 'quiz', 'subnet_adv', '1', NULL),
(612, 2, 1458048084, 'quiz', 'delay1', '0', NULL),
(613, 2, 1458048084, 'quiz', 'delay1_adv', '1', NULL),
(614, 2, 1458048084, 'quiz', 'delay2', '0', NULL),
(615, 2, 1458048084, 'quiz', 'delay2_adv', '1', NULL),
(616, 2, 1458048084, 'quiz', 'browsersecurity', '-', NULL),
(617, 2, 1458048084, 'quiz', 'browsersecurity_adv', '1', NULL),
(618, 2, 1458048084, 'quiz', 'initialnumfeedbacks', '2', NULL),
(619, 2, 1458048084, 'quiz', 'autosaveperiod', '60', NULL),
(620, 2, 1458048084, 'resource', 'framesize', '130', NULL),
(621, 2, 1458048084, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(622, 2, 1458048084, 'resource', 'printintro', '1', NULL),
(623, 2, 1458048084, 'resource', 'display', '0', NULL),
(624, 2, 1458048084, 'resource', 'showsize', '0', NULL),
(625, 2, 1458048084, 'resource', 'showtype', '0', NULL),
(626, 2, 1458048084, 'resource', 'showdate', '0', NULL),
(627, 2, 1458048084, 'resource', 'popupwidth', '620', NULL),
(628, 2, 1458048084, 'resource', 'popupheight', '450', NULL),
(629, 2, 1458048084, 'resource', 'filterfiles', '0', NULL),
(630, 2, 1458048085, 'scorm', 'displaycoursestructure', '0', NULL),
(631, 2, 1458048085, 'scorm', 'displaycoursestructure_adv', '', NULL),
(632, 2, 1458048085, 'scorm', 'popup', '0', NULL),
(633, 2, 1458048085, 'scorm', 'popup_adv', '', NULL),
(634, 2, 1458048085, 'scorm', 'displayactivityname', '1', NULL),
(635, 2, 1458048085, 'scorm', 'framewidth', '100', NULL),
(636, 2, 1458048085, 'scorm', 'framewidth_adv', '1', NULL),
(637, 2, 1458048085, 'scorm', 'frameheight', '500', NULL),
(638, 2, 1458048085, 'scorm', 'frameheight_adv', '1', NULL),
(639, 2, 1458048085, 'scorm', 'winoptgrp_adv', '1', NULL),
(640, 2, 1458048085, 'scorm', 'scrollbars', '0', NULL),
(641, 2, 1458048085, 'scorm', 'directories', '0', NULL),
(642, 2, 1458048085, 'scorm', 'location', '0', NULL),
(643, 2, 1458048085, 'scorm', 'menubar', '0', NULL),
(644, 2, 1458048085, 'scorm', 'toolbar', '0', NULL),
(645, 2, 1458048085, 'scorm', 'status', '0', NULL),
(646, 2, 1458048085, 'scorm', 'skipview', '0', NULL),
(647, 2, 1458048085, 'scorm', 'skipview_adv', '1', NULL),
(648, 2, 1458048085, 'scorm', 'hidebrowse', '0', NULL),
(649, 2, 1458048085, 'scorm', 'hidebrowse_adv', '1', NULL),
(650, 2, 1458048085, 'scorm', 'hidetoc', '0', NULL),
(651, 2, 1458048085, 'scorm', 'hidetoc_adv', '1', NULL),
(652, 2, 1458048085, 'scorm', 'nav', '1', NULL),
(653, 2, 1458048085, 'scorm', 'nav_adv', '1', NULL),
(654, 2, 1458048085, 'scorm', 'navpositionleft', '-100', NULL),
(655, 2, 1458048085, 'scorm', 'navpositionleft_adv', '1', NULL),
(656, 2, 1458048085, 'scorm', 'navpositiontop', '-100', NULL),
(657, 2, 1458048085, 'scorm', 'navpositiontop_adv', '1', NULL),
(658, 2, 1458048085, 'scorm', 'collapsetocwinsize', '767', NULL),
(659, 2, 1458048085, 'scorm', 'collapsetocwinsize_adv', '1', NULL),
(660, 2, 1458048085, 'scorm', 'displayattemptstatus', '1', NULL),
(661, 2, 1458048085, 'scorm', 'displayattemptstatus_adv', '', NULL),
(662, 2, 1458048085, 'scorm', 'grademethod', '1', NULL),
(663, 2, 1458048085, 'scorm', 'maxgrade', '100', NULL),
(664, 2, 1458048085, 'scorm', 'maxattempt', '0', NULL),
(665, 2, 1458048085, 'scorm', 'whatgrade', '0', NULL),
(666, 2, 1458048085, 'scorm', 'forcecompleted', '0', NULL),
(667, 2, 1458048085, 'scorm', 'forcenewattempt', '0', NULL),
(668, 2, 1458048085, 'scorm', 'autocommit', '0', NULL),
(669, 2, 1458048085, 'scorm', 'lastattemptlock', '0', NULL),
(670, 2, 1458048085, 'scorm', 'auto', '0', NULL),
(671, 2, 1458048085, 'scorm', 'updatefreq', '0', NULL),
(672, 2, 1458048085, 'scorm', 'scorm12standard', '1', NULL),
(673, 2, 1458048085, 'scorm', 'allowtypeexternal', '0', NULL),
(674, 2, 1458048085, 'scorm', 'allowtypelocalsync', '0', NULL),
(675, 2, 1458048085, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(676, 2, 1458048085, 'scorm', 'allowaicchacp', '0', NULL),
(677, 2, 1458048085, 'scorm', 'aicchacptimeout', '30', NULL),
(678, 2, 1458048085, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(679, 2, 1458048085, 'scorm', 'aiccuserid', '1', NULL),
(680, 2, 1458048085, 'scorm', 'forcejavascript', '1', NULL),
(681, 2, 1458048085, 'scorm', 'allowapidebug', '0', NULL),
(682, 2, 1458048085, 'scorm', 'apidebugmask', '.*', NULL),
(683, 2, 1458048085, 'scorm', 'protectpackagedownloads', '0', NULL),
(684, 2, 1458048085, 'url', 'framesize', '130', NULL),
(685, 2, 1458048085, 'url', 'secretphrase', '', NULL),
(686, 2, 1458048085, 'url', 'rolesinparams', '0', NULL),
(687, 2, 1458048085, 'url', 'displayoptions', '0,1,5,6', NULL),
(688, 2, 1458048085, 'url', 'printintro', '1', NULL),
(689, 2, 1458048085, 'url', 'display', '0', NULL),
(690, 2, 1458048085, 'url', 'popupwidth', '620', NULL),
(691, 2, 1458048085, 'url', 'popupheight', '450', NULL),
(692, 2, 1458048085, 'workshop', 'grade', '80', NULL),
(693, 2, 1458048085, 'workshop', 'gradinggrade', '20', NULL),
(694, 2, 1458048085, 'workshop', 'gradedecimals', '0', NULL),
(695, 2, 1458048085, 'workshop', 'maxbytes', '0', NULL),
(696, 2, 1458048085, 'workshop', 'strategy', 'accumulative', NULL),
(697, 2, 1458048085, 'workshop', 'examplesmode', '0', NULL),
(698, 2, 1458048085, 'workshopallocation_random', 'numofreviews', '5', NULL),
(699, 2, 1458048085, 'workshopform_numerrors', 'grade0', 'No', NULL),
(700, 2, 1458048085, 'workshopform_numerrors', 'grade1', 'Yes', NULL),
(701, 2, 1458048085, 'workshopeval_best', 'comparison', '5', NULL),
(702, 2, 1458048085, NULL, 'block_course_list_adminview', 'all', NULL),
(703, 2, 1458048085, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(704, 2, 1458048085, 'block_course_overview', 'defaultmaxcourses', '10', NULL),
(705, 2, 1458048085, 'block_course_overview', 'forcedefaultmaxcourses', '0', NULL),
(706, 2, 1458048085, 'block_course_overview', 'showchildren', '0', NULL),
(707, 2, 1458048085, 'block_course_overview', 'showwelcomearea', '0', NULL),
(708, 2, 1458048085, 'block_course_overview', 'showcategories', '0', NULL),
(709, 2, 1458048085, NULL, 'block_html_allowcssclasses', '0', NULL),
(710, 2, 1458048085, NULL, 'block_online_users_timetosee', '5', NULL),
(711, 2, 1458048085, NULL, 'block_rss_client_num_entries', '5', NULL),
(712, 2, 1458048085, NULL, 'block_rss_client_timeout', '30', NULL),
(713, 2, 1458048085, 'block_section_links', 'numsections1', '22', NULL),
(714, 2, 1458048085, 'block_section_links', 'incby1', '2', NULL),
(715, 2, 1458048085, 'block_section_links', 'numsections2', '40', NULL),
(716, 2, 1458048085, 'block_section_links', 'incby2', '5', NULL),
(717, 2, 1458048085, 'block_tag_youtube', 'apikey', '', NULL),
(718, 2, 1458048085, 'format_singleactivity', 'activitytype', 'forum', NULL),
(719, 2, 1458048085, 'enrol_cohort', 'roleid', '5', NULL),
(720, 2, 1458048085, 'enrol_cohort', 'unenrolaction', '0', NULL),
(721, 2, 1458048085, 'enrol_database', 'dbtype', '', NULL),
(722, 2, 1458048085, 'enrol_database', 'dbhost', 'localhost', NULL),
(723, 2, 1458048085, 'enrol_database', 'dbuser', '', NULL),
(724, 2, 1458048085, 'enrol_database', 'dbpass', '', NULL),
(725, 2, 1458048085, 'enrol_database', 'dbname', '', NULL),
(726, 2, 1458048085, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(727, 2, 1458048085, 'enrol_database', 'dbsetupsql', '', NULL),
(728, 2, 1458048085, 'enrol_database', 'dbsybasequoting', '0', NULL),
(729, 2, 1458048085, 'enrol_database', 'debugdb', '0', NULL),
(730, 2, 1458048085, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(731, 2, 1458048085, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(732, 2, 1458048085, 'enrol_database', 'localrolefield', 'shortname', NULL),
(733, 2, 1458048085, 'enrol_database', 'localcategoryfield', 'id', NULL),
(734, 2, 1458048085, 'enrol_database', 'remoteenroltable', '', NULL),
(735, 2, 1458048085, 'enrol_database', 'remotecoursefield', '', NULL),
(736, 2, 1458048085, 'enrol_database', 'remoteuserfield', '', NULL),
(737, 2, 1458048085, 'enrol_database', 'remoterolefield', '', NULL),
(738, 2, 1458048085, 'enrol_database', 'remoteotheruserfield', '', NULL),
(739, 2, 1458048085, 'enrol_database', 'defaultrole', '5', NULL),
(740, 2, 1458048085, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(741, 2, 1458048085, 'enrol_database', 'unenrolaction', '0', NULL),
(742, 2, 1458048085, 'enrol_database', 'newcoursetable', '', NULL),
(743, 2, 1458048085, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(744, 2, 1458048085, 'enrol_database', 'newcourseshortname', 'shortname', NULL);
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(745, 2, 1458048085, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(746, 2, 1458048085, 'enrol_database', 'newcoursecategory', '', NULL),
(747, 2, 1458048085, 'enrol_database', 'defaultcategory', '1', NULL),
(748, 2, 1458048085, 'enrol_database', 'templatecourse', '', NULL),
(749, 2, 1458048085, 'enrol_flatfile', 'location', '', NULL),
(750, 2, 1458048085, 'enrol_flatfile', 'encoding', 'UTF-8', NULL),
(751, 2, 1458048085, 'enrol_flatfile', 'mailstudents', '0', NULL),
(752, 2, 1458048085, 'enrol_flatfile', 'mailteachers', '0', NULL),
(753, 2, 1458048085, 'enrol_flatfile', 'mailadmins', '0', NULL),
(754, 2, 1458048085, 'enrol_flatfile', 'unenrolaction', '3', NULL),
(755, 2, 1458048085, 'enrol_flatfile', 'expiredaction', '3', NULL),
(756, 2, 1458048085, 'enrol_guest', 'requirepassword', '0', NULL),
(757, 2, 1458048085, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(758, 2, 1458048085, 'enrol_guest', 'showhint', '0', NULL),
(759, 2, 1458048085, 'enrol_guest', 'defaultenrol', '1', NULL),
(760, 2, 1458048085, 'enrol_guest', 'status', '1', NULL),
(761, 2, 1458048085, 'enrol_guest', 'status_adv', '', NULL),
(762, 2, 1458048085, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(763, 2, 1458048085, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(764, 2, 1458048085, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(765, 2, 1458048085, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(766, 2, 1458048085, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(767, 2, 1458048085, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(768, 2, 1458048085, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(769, 2, 1458048085, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(770, 2, 1458048085, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(771, 2, 1458048085, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(772, 2, 1458048085, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(773, 2, 1458048085, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(774, 2, 1458048085, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(775, 2, 1458048085, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(776, 2, 1458048085, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(777, 2, 1458048085, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(778, 2, 1458048085, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(779, 2, 1458048085, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(780, 2, 1458048085, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(781, 2, 1458048085, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(782, 2, 1458048085, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode', NULL),
(783, 2, 1458048085, 'enrol_imsenterprise', 'imscoursemapfullname', 'short', NULL),
(784, 2, 1458048085, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore', NULL),
(785, 2, 1458048085, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(786, 2, 1458048085, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(787, 2, 1458048085, 'enrol_manual', 'expiredaction', '1', NULL),
(788, 2, 1458048085, 'enrol_manual', 'expirynotifyhour', '6', NULL),
(789, 2, 1458048085, 'enrol_manual', 'defaultenrol', '1', NULL),
(790, 2, 1458048085, 'enrol_manual', 'status', '0', NULL),
(791, 2, 1458048085, 'enrol_manual', 'roleid', '5', NULL),
(792, 2, 1458048085, 'enrol_manual', 'enrolstart', '4', NULL),
(793, 2, 1458048085, 'enrol_manual', 'enrolperiod', '0', NULL),
(794, 2, 1458048085, 'enrol_manual', 'expirynotify', '0', NULL),
(795, 2, 1458048085, 'enrol_manual', 'expirythreshold', '86400', NULL),
(796, 2, 1458048085, 'enrol_meta', 'nosyncroleids', '', NULL),
(797, 2, 1458048085, 'enrol_meta', 'syncall', '1', NULL),
(798, 2, 1458048085, 'enrol_meta', 'unenrolaction', '3', NULL),
(799, 2, 1458048085, 'enrol_meta', 'coursesort', 'sortorder', NULL),
(800, 2, 1458048085, 'enrol_mnet', 'roleid', '5', NULL),
(801, 2, 1458048085, 'enrol_mnet', 'roleid_adv', '1', NULL),
(802, 2, 1458048085, 'enrol_paypal', 'paypalbusiness', '', NULL),
(803, 2, 1458048085, 'enrol_paypal', 'mailstudents', '0', NULL),
(804, 2, 1458048085, 'enrol_paypal', 'mailteachers', '0', NULL),
(805, 2, 1458048085, 'enrol_paypal', 'mailadmins', '0', NULL),
(806, 2, 1458048085, 'enrol_paypal', 'expiredaction', '3', NULL),
(807, 2, 1458048085, 'enrol_paypal', 'status', '1', NULL),
(808, 2, 1458048085, 'enrol_paypal', 'cost', '0', NULL),
(809, 2, 1458048085, 'enrol_paypal', 'currency', 'USD', NULL),
(810, 2, 1458048085, 'enrol_paypal', 'roleid', '5', NULL),
(811, 2, 1458048085, 'enrol_paypal', 'enrolperiod', '0', NULL),
(812, 2, 1458048085, 'enrol_self', 'requirepassword', '0', NULL),
(813, 2, 1458048085, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(814, 2, 1458048085, 'enrol_self', 'showhint', '0', NULL),
(815, 2, 1458048085, 'enrol_self', 'expiredaction', '1', NULL),
(816, 2, 1458048085, 'enrol_self', 'expirynotifyhour', '6', NULL),
(817, 2, 1458048085, 'enrol_self', 'defaultenrol', '1', NULL),
(818, 2, 1458048085, 'enrol_self', 'status', '1', NULL),
(819, 2, 1458048085, 'enrol_self', 'newenrols', '1', NULL),
(820, 2, 1458048085, 'enrol_self', 'groupkey', '0', NULL),
(821, 2, 1458048085, 'enrol_self', 'roleid', '5', NULL),
(822, 2, 1458048085, 'enrol_self', 'enrolperiod', '0', NULL),
(823, 2, 1458048085, 'enrol_self', 'expirynotify', '0', NULL),
(824, 2, 1458048085, 'enrol_self', 'expirythreshold', '86400', NULL),
(825, 2, 1458048085, 'enrol_self', 'longtimenosee', '0', NULL),
(826, 2, 1458048085, 'enrol_self', 'maxenrolled', '0', NULL),
(827, 2, 1458048085, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(828, 2, 1458048085, NULL, 'filter_censor_badwords', '', NULL),
(829, 2, 1458048086, 'filter_emoticon', 'formats', '1,4,0', NULL),
(830, 2, 1458048086, 'filter_mathjaxloader', 'httpurl', 'http://cdn.mathjax.org/mathjax/2.5-latest/MathJax.js', NULL),
(831, 2, 1458048086, 'filter_mathjaxloader', 'httpsurl', 'https://cdn.mathjax.org/mathjax/2.5-latest/MathJax.js', NULL),
(832, 2, 1458048086, 'filter_mathjaxloader', 'texfiltercompatibility', '0', NULL),
(833, 2, 1458048086, 'filter_mathjaxloader', 'mathjaxconfig', '\nMathJax.Hub.Config({\n    config: ["Accessible.js", "Safe.js"],\n    errorSettings: { message: ["!"] },\n    skipStartupTypeset: true,\n    messageStyle: "none"\n});\n', NULL),
(834, 2, 1458048086, 'filter_mathjaxloader', 'additionaldelimiters', '', NULL),
(835, 2, 1458048086, NULL, 'filter_multilang_force_old', '0', NULL),
(836, 2, 1458048086, 'filter_tex', 'latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(837, 2, 1458048086, 'filter_tex', 'latexbackground', '#FFFFFF', NULL),
(838, 2, 1458048086, 'filter_tex', 'density', '120', NULL),
(839, 2, 1458048086, 'filter_tex', 'pathlatex', '/usr/bin/latex', NULL),
(840, 2, 1458048086, 'filter_tex', 'pathdvips', '/usr/bin/dvips', NULL),
(841, 2, 1458048086, 'filter_tex', 'pathconvert', '/usr/bin/convert', NULL),
(842, 2, 1458048086, 'filter_tex', 'pathdvisvgm', '/usr/bin/dvisvgm', NULL),
(843, 2, 1458048086, 'filter_tex', 'pathmimetex', '', NULL),
(844, 2, 1458048086, 'filter_tex', 'convertformat', 'gif', NULL),
(845, 2, 1458048086, 'filter_urltolink', 'formats', '0', NULL),
(846, 2, 1458048086, 'filter_urltolink', 'embedimages', '1', NULL),
(847, 2, 1458048086, 'logstore_database', 'dbdriver', '', NULL),
(848, 2, 1458048086, 'logstore_database', 'dbhost', '', NULL),
(849, 2, 1458048086, 'logstore_database', 'dbuser', '', NULL),
(850, 2, 1458048086, 'logstore_database', 'dbpass', '', NULL),
(851, 2, 1458048086, 'logstore_database', 'dbname', '', NULL),
(852, 2, 1458048086, 'logstore_database', 'dbtable', '', NULL),
(853, 2, 1458048086, 'logstore_database', 'dbpersist', '0', NULL),
(854, 2, 1458048086, 'logstore_database', 'dbsocket', '', NULL),
(855, 2, 1458048086, 'logstore_database', 'dbport', '', NULL),
(856, 2, 1458048086, 'logstore_database', 'dbschema', '', NULL),
(857, 2, 1458048086, 'logstore_database', 'dbcollation', '', NULL),
(858, 2, 1458048086, 'logstore_database', 'buffersize', '50', NULL),
(859, 2, 1458048086, 'logstore_database', 'logguests', '0', NULL),
(860, 2, 1458048086, 'logstore_database', 'includelevels', '1,2,0', NULL),
(861, 2, 1458048086, 'logstore_database', 'includeactions', 'c,r,u,d', NULL),
(862, 2, 1458048086, 'logstore_legacy', 'loglegacy', '0', NULL),
(863, 2, 1458048086, NULL, 'logguests', '1', NULL),
(864, 2, 1458048086, NULL, 'loglifetime', '0', NULL),
(865, 2, 1458048086, 'logstore_standard', 'logguests', '1', NULL),
(866, 2, 1458048086, 'logstore_standard', 'loglifetime', '0', NULL),
(867, 2, 1458048086, 'logstore_standard', 'buffersize', '50', NULL),
(868, 2, 1458048086, NULL, 'airnotifierurl', 'https://messages.moodle.net', NULL),
(869, 2, 1458048086, NULL, 'airnotifierport', '443', NULL),
(870, 2, 1458048086, NULL, 'airnotifiermobileappname', 'com.moodle.moodlemobile', NULL),
(871, 2, 1458048086, NULL, 'airnotifierappname', 'commoodlemoodlemobile', NULL),
(872, 2, 1458048086, NULL, 'airnotifieraccesskey', '', NULL),
(873, 2, 1458048086, NULL, 'smtphosts', '', NULL),
(874, 2, 1458048086, NULL, 'smtpsecure', '', NULL),
(875, 2, 1458048086, NULL, 'smtpauthtype', 'LOGIN', NULL),
(876, 2, 1458048086, NULL, 'smtpuser', '', NULL),
(877, 2, 1458048086, NULL, 'smtppass', '', NULL),
(878, 2, 1458048086, NULL, 'smtpmaxbulk', '1', NULL),
(879, 2, 1458048086, NULL, 'noreplyaddress', 'noreply@localhost', NULL),
(880, 2, 1458048086, NULL, 'emailonlyfromnoreplyaddress', '0', NULL),
(881, 2, 1458048086, NULL, 'sitemailcharset', '0', NULL),
(882, 2, 1458048086, NULL, 'allowusermailcharset', '0', NULL),
(883, 2, 1458048086, NULL, 'allowattachments', '1', NULL),
(884, 2, 1458048086, NULL, 'mailnewline', 'LF', NULL),
(885, 2, 1458048086, NULL, 'jabberhost', '', NULL),
(886, 2, 1458048086, NULL, 'jabberserver', '', NULL),
(887, 2, 1458048086, NULL, 'jabberusername', '', NULL),
(888, 2, 1458048086, NULL, 'jabberpassword', '', NULL),
(889, 2, 1458048086, NULL, 'jabberport', '5222', NULL),
(890, 2, 1458048086, 'editor_atto', 'toolbar', 'collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html', NULL),
(891, 2, 1458048086, 'editor_atto', 'autosavefrequency', '60', NULL),
(892, 2, 1458048086, 'atto_collapse', 'showgroups', '5', NULL),
(893, 2, 1458048086, 'atto_equation', 'librarygroup1', '\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n', NULL),
(894, 2, 1458048086, 'atto_equation', 'librarygroup2', '\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n', NULL),
(895, 2, 1458048086, 'atto_equation', 'librarygroup3', '\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n', NULL),
(896, 2, 1458048086, 'atto_equation', 'librarygroup4', '\n\\sum{a,b}\n\\sqrt[a]{b+c}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n\\frac{a}{b+c}\n\\vec{a}\n\\binom {a} {b}\n{a \\brack b}\n{a \\brace b}\n', NULL),
(897, 2, 1458048086, 'atto_table', 'allowborders', '0', NULL),
(898, 2, 1458048086, 'atto_table', 'allowbackgroundcolour', '0', NULL),
(899, 2, 1458048086, 'atto_table', 'allowwidth', '0', NULL),
(900, 2, 1458048086, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen', NULL),
(901, 2, 1458048086, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings', NULL),
(902, 2, 1458048086, 'editor_tinymce', 'customconfig', '', NULL),
(903, 2, 1458048086, 'tinymce_moodleemoticon', 'requireemoticon', '1', NULL),
(904, 2, 1458048086, 'tinymce_spellchecker', 'spellengine', '', NULL),
(905, 2, 1458048086, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(906, 2, 1458048086, NULL, 'enablemobilewebservice', '0', NULL),
(907, 2, 1458048086, NULL, 'profileroles', '5,4,3', NULL),
(908, 2, 1458048086, NULL, 'coursecontact', '3', NULL),
(909, 2, 1458048086, NULL, 'frontpage', '6', NULL),
(910, 2, 1458048086, NULL, 'frontpageloggedin', '6', NULL),
(911, 2, 1458048086, NULL, 'maxcategorydepth', '2', NULL),
(912, 2, 1458048086, NULL, 'frontpagecourselimit', '200', NULL),
(913, 2, 1458048086, NULL, 'commentsperpage', '15', NULL),
(914, 2, 1458048086, NULL, 'defaultfrontpageroleid', '8', NULL),
(915, 2, 1458048086, NULL, 'supportname', 'Admin User', NULL),
(916, 2, 1458048086, NULL, 'supportemail', 'admin@moodle.com', NULL),
(917, 2, 1458048086, NULL, 'messageinbound_enabled', '0', NULL),
(918, 2, 1458048086, NULL, 'messageinbound_mailbox', '', NULL),
(919, 2, 1458048086, NULL, 'messageinbound_domain', '', NULL),
(920, 2, 1458048086, NULL, 'messageinbound_host', '', NULL),
(921, 2, 1458048086, NULL, 'messageinbound_hostssl', 'ssl', NULL),
(922, 2, 1458048086, NULL, 'messageinbound_hostuser', '', NULL),
(923, 2, 1458048086, NULL, 'messageinbound_hostpass', '', NULL),
(924, 2, 1458048103, NULL, 'timezone', 'Africa/Abidjan', NULL),
(925, 2, 1458048103, NULL, 'registerauth', '', NULL),
(926, 2, 1458063331, NULL, 'enablewebservices', '1', '0'),
(927, 2, 1458066926, NULL, 'enablemobilewebservice', '1', '0'),
(928, 2, 1458105877, NULL, 'debug', '32767', '0'),
(929, 2, 1458105877, NULL, 'debugdisplay', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_plugins`
--

CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
  `id` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1218 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle modules and plugins configuration variables';

--
-- Dumping data for table `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'question', 'multichoice_sortorder', '1'),
(2, 'question', 'truefalse_sortorder', '2'),
(3, 'question', 'match_sortorder', '3'),
(4, 'question', 'shortanswer_sortorder', '4'),
(5, 'question', 'numerical_sortorder', '5'),
(6, 'question', 'essay_sortorder', '6'),
(7, 'moodlecourse', 'visible', '1'),
(8, 'moodlecourse', 'format', 'weeks'),
(9, 'moodlecourse', 'maxsections', '52'),
(10, 'moodlecourse', 'numsections', '10'),
(11, 'moodlecourse', 'hiddensections', '0'),
(12, 'moodlecourse', 'coursedisplay', '0'),
(13, 'moodlecourse', 'lang', ''),
(14, 'moodlecourse', 'newsitems', '5'),
(15, 'moodlecourse', 'showgrades', '1'),
(16, 'moodlecourse', 'showreports', '0'),
(17, 'moodlecourse', 'maxbytes', '0'),
(18, 'moodlecourse', 'enablecompletion', '0'),
(19, 'moodlecourse', 'groupmode', '0'),
(20, 'moodlecourse', 'groupmodeforce', '0'),
(21, 'backup', 'loglifetime', '30'),
(22, 'backup', 'backup_general_users', '1'),
(23, 'backup', 'backup_general_users_locked', ''),
(24, 'backup', 'backup_general_anonymize', '0'),
(25, 'backup', 'backup_general_anonymize_locked', ''),
(26, 'backup', 'backup_general_role_assignments', '1'),
(27, 'backup', 'backup_general_role_assignments_locked', ''),
(28, 'backup', 'backup_general_activities', '1'),
(29, 'backup', 'backup_general_activities_locked', ''),
(30, 'backup', 'backup_general_blocks', '1'),
(31, 'backup', 'backup_general_blocks_locked', ''),
(32, 'backup', 'backup_general_filters', '1'),
(33, 'backup', 'backup_general_filters_locked', ''),
(34, 'backup', 'backup_general_comments', '1'),
(35, 'backup', 'backup_general_comments_locked', ''),
(36, 'backup', 'backup_general_badges', '1'),
(37, 'backup', 'backup_general_badges_locked', ''),
(38, 'backup', 'backup_general_userscompletion', '1'),
(39, 'backup', 'backup_general_userscompletion_locked', ''),
(40, 'backup', 'backup_general_logs', '0'),
(41, 'backup', 'backup_general_logs_locked', ''),
(42, 'backup', 'backup_general_histories', '0'),
(43, 'backup', 'backup_general_histories_locked', ''),
(44, 'backup', 'backup_general_questionbank', '1'),
(45, 'backup', 'backup_general_questionbank_locked', ''),
(46, 'backup', 'backup_general_groups', '1'),
(47, 'backup', 'backup_general_groups_locked', ''),
(48, 'backup', 'import_general_maxresults', '10'),
(49, 'backup', 'import_general_duplicate_admin_allowed', '0'),
(50, 'backup', 'backup_auto_active', '0'),
(51, 'backup', 'backup_auto_weekdays', '0000000'),
(52, 'backup', 'backup_auto_hour', '0'),
(53, 'backup', 'backup_auto_minute', '0'),
(54, 'backup', 'backup_auto_storage', '0'),
(55, 'backup', 'backup_auto_destination', ''),
(56, 'backup', 'backup_auto_max_kept', '1'),
(57, 'backup', 'backup_auto_delete_days', '0'),
(58, 'backup', 'backup_auto_min_kept', '0'),
(59, 'backup', 'backup_shortname', '0'),
(60, 'backup', 'backup_auto_skip_hidden', '1'),
(61, 'backup', 'backup_auto_skip_modif_days', '30'),
(62, 'backup', 'backup_auto_skip_modif_prev', '0'),
(63, 'backup', 'backup_auto_users', '1'),
(64, 'backup', 'backup_auto_role_assignments', '1'),
(65, 'backup', 'backup_auto_activities', '1'),
(66, 'backup', 'backup_auto_blocks', '1'),
(67, 'backup', 'backup_auto_filters', '1'),
(68, 'backup', 'backup_auto_comments', '1'),
(69, 'backup', 'backup_auto_badges', '1'),
(70, 'backup', 'backup_auto_userscompletion', '1'),
(71, 'backup', 'backup_auto_logs', '0'),
(72, 'backup', 'backup_auto_histories', '0'),
(73, 'backup', 'backup_auto_questionbank', '1'),
(74, 'backup', 'backup_auto_groups', '1'),
(75, 'cachestore_memcache', 'testservers', ''),
(76, 'cachestore_memcached', 'testservers', ''),
(77, 'cachestore_mongodb', 'testserver', ''),
(78, 'question_preview', 'behaviour', 'deferredfeedback'),
(79, 'question_preview', 'correctness', '1'),
(80, 'question_preview', 'marks', '2'),
(81, 'question_preview', 'markdp', '2'),
(82, 'question_preview', 'feedback', '1'),
(83, 'question_preview', 'generalfeedback', '1'),
(84, 'question_preview', 'rightanswer', '1'),
(85, 'question_preview', 'history', '0'),
(86, 'theme_clean', 'invert', '0'),
(87, 'theme_clean', 'logo', ''),
(88, 'theme_clean', 'customcss', ''),
(89, 'theme_clean', 'footnote', ''),
(90, 'theme_more', 'textcolor', '#333366'),
(91, 'theme_more', 'linkcolor', '#FF6500'),
(92, 'theme_more', 'bodybackground', ''),
(93, 'theme_more', 'backgroundimage', ''),
(94, 'theme_more', 'backgroundrepeat', 'repeat'),
(95, 'theme_more', 'backgroundposition', '0'),
(96, 'theme_more', 'backgroundfixed', '0'),
(97, 'theme_more', 'contentbackground', '#FFFFFF'),
(98, 'theme_more', 'secondarybackground', '#FFFFFF'),
(99, 'theme_more', 'invert', '1'),
(100, 'theme_more', 'logo', ''),
(101, 'theme_more', 'customcss', ''),
(102, 'theme_more', 'footnote', ''),
(103, 'availability_completion', 'version', '2015111600'),
(104, 'availability_date', 'version', '2015111600'),
(105, 'availability_grade', 'version', '2015111600'),
(106, 'availability_group', 'version', '2015111600'),
(107, 'availability_grouping', 'version', '2015111600'),
(108, 'availability_profile', 'version', '2015111600'),
(109, 'qtype_calculated', 'version', '2015111600'),
(110, 'qtype_calculatedmulti', 'version', '2015111600'),
(111, 'qtype_calculatedsimple', 'version', '2015111600'),
(112, 'qtype_ddimageortext', 'version', '2015111600'),
(113, 'qtype_ddmarker', 'version', '2015111600'),
(114, 'qtype_ddwtos', 'version', '2015111600'),
(115, 'qtype_description', 'version', '2015111600'),
(116, 'qtype_essay', 'version', '2015111600'),
(117, 'qtype_gapselect', 'version', '2015111600'),
(118, 'qtype_match', 'version', '2015111600'),
(119, 'qtype_missingtype', 'version', '2015111600'),
(120, 'qtype_multianswer', 'version', '2015111600'),
(121, 'qtype_multichoice', 'version', '2015111600'),
(122, 'qtype_numerical', 'version', '2015111600'),
(123, 'qtype_random', 'version', '2015111600'),
(124, 'qtype_randomsamatch', 'version', '2015111600'),
(125, 'qtype_shortanswer', 'version', '2015111600'),
(126, 'qtype_truefalse', 'version', '2015111600'),
(127, 'mod_assign', 'version', '2015111600'),
(128, 'mod_assignment', 'version', '2015111600'),
(130, 'mod_book', 'version', '2015111600'),
(131, 'mod_chat', 'version', '2015111600'),
(132, 'mod_choice', 'version', '2015111600'),
(133, 'mod_data', 'version', '2015111600'),
(134, 'mod_feedback', 'version', '2015111600'),
(136, 'mod_folder', 'version', '2015111600'),
(138, 'mod_forum', 'version', '2015111600'),
(139, 'mod_glossary', 'version', '2015111600'),
(140, 'mod_imscp', 'version', '2015111600'),
(142, 'mod_label', 'version', '2015111600'),
(143, 'mod_lesson', 'version', '2015111600'),
(144, 'mod_lti', 'version', '2015111600'),
(145, 'mod_page', 'version', '2015111600'),
(147, 'mod_quiz', 'version', '2015111600'),
(148, 'mod_resource', 'version', '2015111600'),
(149, 'mod_scorm', 'version', '2015111601'),
(150, 'mod_survey', 'version', '2015111600'),
(152, 'mod_url', 'version', '2015111600'),
(154, 'mod_wiki', 'version', '2015111600'),
(156, 'mod_workshop', 'version', '2015111600'),
(157, 'auth_cas', 'version', '2015111600'),
(159, 'auth_db', 'version', '2015111600'),
(161, 'auth_email', 'version', '2015111600'),
(162, 'auth_fc', 'version', '2015111600'),
(164, 'auth_imap', 'version', '2015111600'),
(166, 'auth_ldap', 'version', '2015111600'),
(168, 'auth_manual', 'version', '2015111600'),
(169, 'auth_mnet', 'version', '2015111600'),
(171, 'auth_nntp', 'version', '2015111600'),
(173, 'auth_nologin', 'version', '2015111600'),
(174, 'auth_none', 'version', '2015111600'),
(175, 'auth_pam', 'version', '2015111600'),
(177, 'auth_pop3', 'version', '2015111600'),
(179, 'auth_radius', 'version', '2015111600'),
(181, 'auth_shibboleth', 'version', '2015111600'),
(183, 'auth_webservice', 'version', '2015111600'),
(184, 'calendartype_gregorian', 'version', '2015111600'),
(185, 'enrol_category', 'version', '2015111600'),
(187, 'enrol_cohort', 'version', '2015111600'),
(188, 'enrol_database', 'version', '2015111600'),
(190, 'enrol_flatfile', 'version', '2015111600'),
(192, 'enrol_flatfile', 'map_1', 'manager'),
(193, 'enrol_flatfile', 'map_2', 'coursecreator'),
(194, 'enrol_flatfile', 'map_3', 'editingteacher'),
(195, 'enrol_flatfile', 'map_4', 'teacher'),
(196, 'enrol_flatfile', 'map_5', 'student'),
(197, 'enrol_flatfile', 'map_6', 'guest'),
(198, 'enrol_flatfile', 'map_7', 'user'),
(199, 'enrol_flatfile', 'map_8', 'frontpage'),
(200, 'enrol_guest', 'version', '2015111600'),
(201, 'enrol_imsenterprise', 'version', '2015111600'),
(203, 'enrol_ldap', 'version', '2015111600'),
(205, 'enrol_manual', 'version', '2015111600'),
(207, 'enrol_meta', 'version', '2015111600'),
(209, 'enrol_mnet', 'version', '2015111600'),
(210, 'enrol_paypal', 'version', '2015111600'),
(211, 'enrol_self', 'version', '2015111600'),
(213, 'message_airnotifier', 'version', '2015111600'),
(215, 'message', 'airnotifier_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(216, 'message', 'airnotifier_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(217, 'message', 'airnotifier_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(218, 'message', 'airnotifier_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(219, 'message', 'airnotifier_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(220, 'message', 'airnotifier_provider_mod_assign_assign_notification_permitted', 'permitted'),
(221, 'message', 'airnotifier_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(222, 'message', 'airnotifier_provider_mod_feedback_submission_permitted', 'permitted'),
(223, 'message', 'airnotifier_provider_mod_feedback_message_permitted', 'permitted'),
(224, 'message', 'airnotifier_provider_mod_forum_posts_permitted', 'permitted'),
(225, 'message', 'airnotifier_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(226, 'message', 'airnotifier_provider_mod_quiz_submission_permitted', 'permitted'),
(227, 'message', 'airnotifier_provider_mod_quiz_confirmation_permitted', 'permitted'),
(228, 'message', 'airnotifier_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(229, 'message', 'airnotifier_provider_moodle_notices_permitted', 'permitted'),
(230, 'message', 'airnotifier_provider_moodle_errors_permitted', 'permitted'),
(231, 'message', 'airnotifier_provider_moodle_availableupdate_permitted', 'permitted'),
(232, 'message', 'airnotifier_provider_moodle_instantmessage_permitted', 'permitted'),
(233, 'message', 'airnotifier_provider_moodle_backup_permitted', 'permitted'),
(234, 'message', 'airnotifier_provider_moodle_courserequested_permitted', 'permitted'),
(235, 'message', 'airnotifier_provider_moodle_courserequestapproved_permitted', 'permitted'),
(236, 'message', 'airnotifier_provider_moodle_courserequestrejected_permitted', 'permitted'),
(237, 'message', 'airnotifier_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(238, 'message', 'airnotifier_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(239, 'message_email', 'version', '2015111600'),
(241, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(242, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(243, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(244, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(245, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(246, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(247, 'message', 'email_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(248, 'message', 'message_provider_enrol_manual_expiry_notification_loggedin', 'email'),
(249, 'message', 'message_provider_enrol_manual_expiry_notification_loggedoff', 'email'),
(250, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(251, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(252, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(253, 'message', 'email_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(254, 'message', 'message_provider_enrol_self_expiry_notification_loggedin', 'email'),
(255, 'message', 'message_provider_enrol_self_expiry_notification_loggedoff', 'email'),
(256, 'message', 'email_provider_mod_assign_assign_notification_permitted', 'permitted'),
(257, 'message', 'message_provider_mod_assign_assign_notification_loggedin', 'email'),
(258, 'message', 'message_provider_mod_assign_assign_notification_loggedoff', 'email'),
(259, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(260, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(261, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(262, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(263, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(264, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(265, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(266, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(267, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(268, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(269, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(270, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(271, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(272, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(273, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(274, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(275, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(276, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(277, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(278, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(279, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(280, 'message', 'email_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(281, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedin', 'email'),
(282, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedoff', 'email'),
(283, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(284, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(285, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(286, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(287, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(288, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(289, 'message', 'email_provider_moodle_availableupdate_permitted', 'permitted'),
(290, 'message', 'message_provider_moodle_availableupdate_loggedin', 'email'),
(291, 'message', 'message_provider_moodle_availableupdate_loggedoff', 'email'),
(292, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(293, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(294, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(295, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(296, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(297, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(298, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(299, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(300, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(301, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(302, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(303, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(304, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(305, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(306, 'message', 'email_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(307, 'message', 'message_provider_moodle_badgerecipientnotice_loggedoff', 'popup,email'),
(308, 'message', 'email_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(309, 'message', 'message_provider_moodle_badgecreatornotice_loggedoff', 'email'),
(310, 'message_jabber', 'version', '2015111600'),
(312, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(313, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(314, 'message', 'jabber_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(315, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(316, 'message', 'jabber_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(317, 'message', 'jabber_provider_mod_assign_assign_notification_permitted', 'permitted'),
(318, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(319, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(320, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(321, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(322, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(323, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(324, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(325, 'message', 'jabber_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(326, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(327, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(328, 'message', 'jabber_provider_moodle_availableupdate_permitted', 'permitted'),
(329, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(330, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(331, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(332, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(333, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(334, 'message', 'jabber_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(335, 'message', 'jabber_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(336, 'message_popup', 'version', '2015111600'),
(338, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(339, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(340, 'message', 'popup_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(341, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(342, 'message', 'popup_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(343, 'message', 'popup_provider_mod_assign_assign_notification_permitted', 'permitted'),
(344, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(345, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(346, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(347, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(348, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(349, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(350, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(351, 'message', 'popup_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(352, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(353, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(354, 'message', 'popup_provider_moodle_availableupdate_permitted', 'permitted'),
(355, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(356, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(357, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(358, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(359, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(360, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(361, 'message', 'popup_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(362, 'message', 'message_provider_moodle_badgerecipientnotice_loggedin', 'popup'),
(363, 'message', 'popup_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(364, 'block_activity_modules', 'version', '2015111600'),
(365, 'block_activity_results', 'version', '2015111600'),
(366, 'block_admin_bookmarks', 'version', '2015111600'),
(367, 'block_badges', 'version', '2015111600'),
(368, 'block_blog_menu', 'version', '2015111600'),
(369, 'block_blog_recent', 'version', '2015111600'),
(370, 'block_blog_tags', 'version', '2015111600'),
(371, 'block_calendar_month', 'version', '2015111600'),
(372, 'block_calendar_upcoming', 'version', '2015111600'),
(373, 'block_comments', 'version', '2015111600'),
(374, 'block_community', 'version', '2015111600'),
(375, 'block_completionstatus', 'version', '2015111600'),
(376, 'block_course_list', 'version', '2015111600'),
(377, 'block_course_overview', 'version', '2015111600'),
(378, 'block_course_summary', 'version', '2015111600'),
(379, 'block_feedback', 'version', '2015111600'),
(381, 'block_glossary_random', 'version', '2015111600'),
(382, 'block_html', 'version', '2015111600'),
(383, 'block_login', 'version', '2015111600'),
(384, 'block_mentees', 'version', '2015111600'),
(385, 'block_messages', 'version', '2015111600'),
(386, 'block_mnet_hosts', 'version', '2015111600'),
(387, 'block_myprofile', 'version', '2015111600'),
(388, 'block_navigation', 'version', '2015111600'),
(389, 'block_news_items', 'version', '2015111600'),
(390, 'block_online_users', 'version', '2015111600'),
(391, 'block_participants', 'version', '2015111600'),
(392, 'block_private_files', 'version', '2015111600'),
(393, 'block_quiz_results', 'version', '2015111600'),
(395, 'block_recent_activity', 'version', '2015111600'),
(396, 'block_rss_client', 'version', '2015111600'),
(397, 'block_search_forums', 'version', '2015111600'),
(398, 'block_section_links', 'version', '2015111600'),
(399, 'block_selfcompletion', 'version', '2015111600'),
(400, 'block_settings', 'version', '2015111600'),
(401, 'block_site_main_menu', 'version', '2015111600'),
(402, 'block_social_activities', 'version', '2015111600'),
(403, 'block_tag_flickr', 'version', '2015111600'),
(404, 'block_tag_youtube', 'version', '2015111600'),
(406, 'block_tags', 'version', '2015111600'),
(407, 'filter_activitynames', 'version', '2015111600'),
(409, 'filter_algebra', 'version', '2015111600'),
(410, 'filter_censor', 'version', '2015111600'),
(411, 'filter_data', 'version', '2015111600'),
(413, 'filter_emailprotect', 'version', '2015111600'),
(414, 'filter_emoticon', 'version', '2015111600'),
(415, 'filter_glossary', 'version', '2015111600'),
(417, 'filter_mathjaxloader', 'version', '2015111600'),
(419, 'filter_mediaplugin', 'version', '2015111600'),
(421, 'filter_multilang', 'version', '2015111600'),
(422, 'filter_tex', 'version', '2015111600'),
(424, 'filter_tidy', 'version', '2015111600'),
(425, 'filter_urltolink', 'version', '2015111600'),
(426, 'editor_atto', 'version', '2015111600'),
(428, 'editor_textarea', 'version', '2015111600'),
(429, 'editor_tinymce', 'version', '2015111600'),
(430, 'format_singleactivity', 'version', '2015111600'),
(431, 'format_social', 'version', '2015111600'),
(432, 'format_topics', 'version', '2015111600'),
(433, 'format_weeks', 'version', '2015111600'),
(434, 'profilefield_checkbox', 'version', '2015111600'),
(435, 'profilefield_datetime', 'version', '2015111600'),
(436, 'profilefield_menu', 'version', '2015111600'),
(437, 'profilefield_text', 'version', '2015111600'),
(438, 'profilefield_textarea', 'version', '2015111600'),
(439, 'report_backups', 'version', '2015111600'),
(440, 'report_completion', 'version', '2015111600'),
(442, 'report_configlog', 'version', '2015111600'),
(443, 'report_courseoverview', 'version', '2015111600'),
(444, 'report_eventlist', 'version', '2015111600'),
(445, 'report_log', 'version', '2015111600'),
(447, 'report_loglive', 'version', '2015111600'),
(448, 'report_outline', 'version', '2015111600'),
(450, 'report_participation', 'version', '2015111600'),
(452, 'report_performance', 'version', '2015111600'),
(453, 'report_progress', 'version', '2015111600'),
(455, 'report_questioninstances', 'version', '2015111600'),
(456, 'report_security', 'version', '2015111600'),
(457, 'report_stats', 'version', '2015111600'),
(459, 'report_usersessions', 'version', '2015111600'),
(460, 'gradeexport_ods', 'version', '2015111600'),
(461, 'gradeexport_txt', 'version', '2015111600'),
(462, 'gradeexport_xls', 'version', '2015111600'),
(463, 'gradeexport_xml', 'version', '2015111600'),
(464, 'gradeimport_csv', 'version', '2015111600'),
(465, 'gradeimport_direct', 'version', '2015111600'),
(466, 'gradeimport_xml', 'version', '2015111600'),
(467, 'gradereport_grader', 'version', '2015111600'),
(468, 'gradereport_history', 'version', '2015111600'),
(469, 'gradereport_outcomes', 'version', '2015111600'),
(470, 'gradereport_overview', 'version', '2015111600'),
(471, 'gradereport_singleview', 'version', '2015111600'),
(472, 'gradereport_user', 'version', '2015111600'),
(473, 'gradingform_guide', 'version', '2015111600'),
(474, 'gradingform_rubric', 'version', '2015111600'),
(475, 'mnetservice_enrol', 'version', '2015111600'),
(476, 'webservice_amf', 'version', '2015111600'),
(477, 'webservice_rest', 'version', '2015111600'),
(478, 'webservice_soap', 'version', '2015111600'),
(479, 'webservice_xmlrpc', 'version', '2015111600'),
(480, 'repository_alfresco', 'version', '2015111600'),
(481, 'repository_areafiles', 'version', '2015111600'),
(483, 'areafiles', 'enablecourseinstances', '0'),
(484, 'areafiles', 'enableuserinstances', '0'),
(485, 'repository_boxnet', 'version', '2015111600'),
(486, 'repository_coursefiles', 'version', '2015111600'),
(487, 'repository_dropbox', 'version', '2015111600'),
(488, 'repository_equella', 'version', '2015111600'),
(489, 'repository_filesystem', 'version', '2015111600'),
(490, 'repository_flickr', 'version', '2015111600'),
(491, 'repository_flickr_public', 'version', '2015111600'),
(492, 'repository_googledocs', 'version', '2015111600'),
(493, 'repository_local', 'version', '2015111600'),
(495, 'local', 'enablecourseinstances', '0'),
(496, 'local', 'enableuserinstances', '0'),
(497, 'repository_merlot', 'version', '2015111600'),
(498, 'repository_picasa', 'version', '2015111600'),
(499, 'repository_recent', 'version', '2015111600'),
(501, 'recent', 'enablecourseinstances', '0'),
(502, 'recent', 'enableuserinstances', '0'),
(503, 'repository_s3', 'version', '2015111600'),
(504, 'repository_skydrive', 'version', '2015111600'),
(505, 'repository_upload', 'version', '2015111600'),
(507, 'upload', 'enablecourseinstances', '0'),
(508, 'upload', 'enableuserinstances', '0'),
(509, 'repository_url', 'version', '2015111600'),
(511, 'url', 'enablecourseinstances', '0'),
(512, 'url', 'enableuserinstances', '0'),
(513, 'repository_user', 'version', '2015111600'),
(515, 'user', 'enablecourseinstances', '0'),
(516, 'user', 'enableuserinstances', '0'),
(517, 'repository_webdav', 'version', '2015111600'),
(518, 'repository_wikimedia', 'version', '2015111600'),
(520, 'wikimedia', 'enablecourseinstances', '0'),
(521, 'wikimedia', 'enableuserinstances', '0'),
(522, 'repository_youtube', 'version', '2015111600'),
(524, 'portfolio_boxnet', 'version', '2015111600'),
(525, 'portfolio_download', 'version', '2015111600'),
(526, 'portfolio_flickr', 'version', '2015111600'),
(527, 'portfolio_googledocs', 'version', '2015111600'),
(528, 'portfolio_mahara', 'version', '2015111600'),
(529, 'portfolio_picasa', 'version', '2015111600'),
(530, 'qbehaviour_adaptive', 'version', '2015111600'),
(531, 'qbehaviour_adaptivenopenalty', 'version', '2015111600'),
(532, 'qbehaviour_deferredcbm', 'version', '2015111600'),
(533, 'qbehaviour_deferredfeedback', 'version', '2015111600'),
(534, 'qbehaviour_immediatecbm', 'version', '2015111600'),
(535, 'qbehaviour_immediatefeedback', 'version', '2015111600'),
(536, 'qbehaviour_informationitem', 'version', '2015111600'),
(537, 'qbehaviour_interactive', 'version', '2015111600'),
(538, 'qbehaviour_interactivecountback', 'version', '2015111600'),
(539, 'qbehaviour_manualgraded', 'version', '2015111600'),
(541, 'question', 'disabledbehaviours', 'manualgraded'),
(542, 'qbehaviour_missing', 'version', '2015111600'),
(543, 'qformat_aiken', 'version', '2015111600'),
(544, 'qformat_blackboard_six', 'version', '2015111600'),
(545, 'qformat_examview', 'version', '2015111600'),
(546, 'qformat_gift', 'version', '2015111600'),
(547, 'qformat_missingword', 'version', '2015111600'),
(548, 'qformat_multianswer', 'version', '2015111600'),
(549, 'qformat_webct', 'version', '2015111600'),
(550, 'qformat_xhtml', 'version', '2015111600'),
(551, 'qformat_xml', 'version', '2015111600'),
(552, 'tool_assignmentupgrade', 'version', '2015111600'),
(553, 'tool_availabilityconditions', 'version', '2015111600'),
(554, 'tool_behat', 'version', '2015111600'),
(555, 'tool_capability', 'version', '2015111600'),
(556, 'tool_customlang', 'version', '2015111600'),
(558, 'tool_dbtransfer', 'version', '2015111600'),
(559, 'tool_filetypes', 'version', '2015111600'),
(560, 'tool_generator', 'version', '2015111600'),
(561, 'tool_health', 'version', '2015111600'),
(562, 'tool_innodb', 'version', '2015111600'),
(563, 'tool_installaddon', 'version', '2015111600'),
(564, 'tool_langimport', 'version', '2015111600'),
(565, 'tool_log', 'version', '2015111600'),
(567, 'tool_log', 'enabled_stores', 'logstore_standard'),
(568, 'tool_messageinbound', 'version', '2015111600'),
(569, 'message', 'airnotifier_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(570, 'message', 'email_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(571, 'message', 'jabber_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(572, 'message', 'popup_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(573, 'message', 'message_provider_tool_messageinbound_invalidrecipienthandler_loggedin', 'email'),
(574, 'message', 'message_provider_tool_messageinbound_invalidrecipienthandler_loggedoff', 'email'),
(575, 'message', 'airnotifier_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(576, 'message', 'email_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(577, 'message', 'jabber_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(578, 'message', 'popup_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(579, 'message', 'message_provider_tool_messageinbound_messageprocessingerror_loggedin', 'email'),
(580, 'message', 'message_provider_tool_messageinbound_messageprocessingerror_loggedoff', 'email'),
(581, 'message', 'airnotifier_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(582, 'message', 'email_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(583, 'message', 'jabber_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(584, 'message', 'popup_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(585, 'message', 'message_provider_tool_messageinbound_messageprocessingsuccess_loggedin', 'email'),
(586, 'message', 'message_provider_tool_messageinbound_messageprocessingsuccess_loggedoff', 'email'),
(587, 'tool_monitor', 'version', '2015111600'),
(588, 'message', 'airnotifier_provider_tool_monitor_notification_permitted', 'permitted'),
(589, 'message', 'email_provider_tool_monitor_notification_permitted', 'permitted'),
(590, 'message', 'jabber_provider_tool_monitor_notification_permitted', 'permitted'),
(591, 'message', 'popup_provider_tool_monitor_notification_permitted', 'permitted'),
(592, 'message', 'message_provider_tool_monitor_notification_loggedin', 'email'),
(593, 'message', 'message_provider_tool_monitor_notification_loggedoff', 'email'),
(594, 'tool_multilangupgrade', 'version', '2015111600'),
(595, 'tool_phpunit', 'version', '2015111600'),
(596, 'tool_profiling', 'version', '2015111600'),
(597, 'tool_replace', 'version', '2015111600'),
(598, 'tool_spamcleaner', 'version', '2015111600'),
(599, 'tool_task', 'version', '2015111600'),
(600, 'tool_templatelibrary', 'version', '2015111600'),
(601, 'tool_unsuproles', 'version', '2015111600'),
(603, 'tool_uploadcourse', 'version', '2015111600'),
(604, 'tool_uploaduser', 'version', '2015111600'),
(605, 'tool_xmldb', 'version', '2015111600'),
(606, 'cachestore_file', 'version', '2015111600'),
(607, 'cachestore_memcache', 'version', '2015111600'),
(608, 'cachestore_memcached', 'version', '2015111600'),
(609, 'cachestore_mongodb', 'version', '2015111600'),
(610, 'cachestore_session', 'version', '2015111600'),
(611, 'cachestore_static', 'version', '2015111600'),
(612, 'cachelock_file', 'version', '2015111600'),
(613, 'theme_base', 'version', '2015111600'),
(614, 'theme_bootstrapbase', 'version', '2015111600'),
(615, 'theme_canvas', 'version', '2015111600'),
(616, 'theme_clean', 'version', '2015111600'),
(617, 'theme_more', 'version', '2015111600'),
(619, 'assignsubmission_comments', 'version', '2015111600'),
(621, 'assignsubmission_file', 'sortorder', '1'),
(622, 'assignsubmission_comments', 'sortorder', '2'),
(623, 'assignsubmission_onlinetext', 'sortorder', '0'),
(624, 'assignsubmission_file', 'version', '2015111600'),
(625, 'assignsubmission_onlinetext', 'version', '2015111600'),
(627, 'assignfeedback_comments', 'version', '2015111600'),
(629, 'assignfeedback_comments', 'sortorder', '0'),
(630, 'assignfeedback_editpdf', 'sortorder', '1'),
(631, 'assignfeedback_file', 'sortorder', '3'),
(632, 'assignfeedback_offline', 'sortorder', '2'),
(633, 'assignfeedback_editpdf', 'version', '2015111600'),
(635, 'assignfeedback_file', 'version', '2015111600'),
(637, 'assignfeedback_offline', 'version', '2015111600'),
(638, 'assignment_offline', 'version', '2015111600'),
(639, 'assignment_online', 'version', '2015111600'),
(640, 'assignment_upload', 'version', '2015111600'),
(641, 'assignment_uploadsingle', 'version', '2015111600'),
(642, 'booktool_exportimscp', 'version', '2015111600'),
(643, 'booktool_importhtml', 'version', '2015111600'),
(644, 'booktool_print', 'version', '2015111600'),
(645, 'datafield_checkbox', 'version', '2015111600'),
(646, 'datafield_date', 'version', '2015111600'),
(647, 'datafield_file', 'version', '2015111600'),
(648, 'datafield_latlong', 'version', '2015111600'),
(649, 'datafield_menu', 'version', '2015111600'),
(650, 'datafield_multimenu', 'version', '2015111600'),
(651, 'datafield_number', 'version', '2015111600'),
(652, 'datafield_picture', 'version', '2015111600'),
(653, 'datafield_radiobutton', 'version', '2015111600'),
(654, 'datafield_text', 'version', '2015111600'),
(655, 'datafield_textarea', 'version', '2015111600'),
(656, 'datafield_url', 'version', '2015111600'),
(657, 'datapreset_imagegallery', 'version', '2015111600'),
(658, 'ltiservice_memberships', 'version', '2015111600'),
(659, 'ltiservice_profile', 'version', '2015111600'),
(660, 'ltiservice_toolproxy', 'version', '2015111600'),
(661, 'ltiservice_toolsettings', 'version', '2015111600'),
(662, 'quiz_grading', 'version', '2015111600'),
(664, 'quiz_overview', 'version', '2015111600'),
(666, 'quiz_responses', 'version', '2015111600'),
(668, 'quiz_statistics', 'version', '2015111600'),
(670, 'quizaccess_delaybetweenattempts', 'version', '2015111600'),
(671, 'quizaccess_ipaddress', 'version', '2015111600'),
(672, 'quizaccess_numattempts', 'version', '2015111600'),
(673, 'quizaccess_openclosedate', 'version', '2015111600'),
(674, 'quizaccess_password', 'version', '2015111600'),
(675, 'quizaccess_safebrowser', 'version', '2015111600'),
(676, 'quizaccess_securewindow', 'version', '2015111600'),
(677, 'quizaccess_timelimit', 'version', '2015111600'),
(678, 'scormreport_basic', 'version', '2015111600'),
(679, 'scormreport_graphs', 'version', '2015111600'),
(680, 'scormreport_interactions', 'version', '2015111600'),
(681, 'scormreport_objectives', 'version', '2015111600'),
(682, 'workshopform_accumulative', 'version', '2015111600'),
(684, 'workshopform_comments', 'version', '2015111600'),
(686, 'workshopform_numerrors', 'version', '2015111600'),
(688, 'workshopform_rubric', 'version', '2015111600'),
(690, 'workshopallocation_manual', 'version', '2015111600'),
(691, 'workshopallocation_random', 'version', '2015111600'),
(692, 'workshopallocation_scheduled', 'version', '2015111600'),
(693, 'workshopeval_best', 'version', '2015111600'),
(694, 'atto_accessibilitychecker', 'version', '2015111600'),
(695, 'atto_accessibilityhelper', 'version', '2015111600'),
(696, 'atto_align', 'version', '2015111600'),
(697, 'atto_backcolor', 'version', '2015111600'),
(698, 'atto_bold', 'version', '2015111600'),
(699, 'atto_charmap', 'version', '2015111600'),
(700, 'atto_clear', 'version', '2015111600'),
(701, 'atto_collapse', 'version', '2015111600'),
(702, 'atto_emoticon', 'version', '2015111600'),
(703, 'atto_equation', 'version', '2015111600'),
(704, 'atto_fontcolor', 'version', '2015111600'),
(705, 'atto_html', 'version', '2015111600'),
(706, 'atto_image', 'version', '2015111600'),
(707, 'atto_indent', 'version', '2015111600'),
(708, 'atto_italic', 'version', '2015111600'),
(709, 'atto_link', 'version', '2015111600'),
(710, 'atto_managefiles', 'version', '2015111600'),
(711, 'atto_media', 'version', '2015111600'),
(712, 'atto_noautolink', 'version', '2015111600'),
(713, 'atto_orderedlist', 'version', '2015111600'),
(714, 'atto_rtl', 'version', '2015111600'),
(715, 'atto_strike', 'version', '2015111600'),
(716, 'atto_subscript', 'version', '2015111600'),
(717, 'atto_superscript', 'version', '2015111600'),
(718, 'atto_table', 'version', '2015111600'),
(719, 'atto_title', 'version', '2015111600'),
(720, 'atto_underline', 'version', '2015111600'),
(721, 'atto_undo', 'version', '2015111600'),
(722, 'atto_unorderedlist', 'version', '2015111600'),
(723, 'tinymce_ctrlhelp', 'version', '2015111600'),
(724, 'tinymce_managefiles', 'version', '2015111600'),
(725, 'tinymce_moodleemoticon', 'version', '2015111600'),
(726, 'tinymce_moodleimage', 'version', '2015111600'),
(727, 'tinymce_moodlemedia', 'version', '2015111600'),
(728, 'tinymce_moodlenolink', 'version', '2015111600'),
(729, 'tinymce_pdw', 'version', '2015111600'),
(730, 'tinymce_spellchecker', 'version', '2015111600'),
(732, 'tinymce_wrap', 'version', '2015111600'),
(733, 'logstore_database', 'version', '2015111600'),
(734, 'logstore_legacy', 'version', '2015111600'),
(735, 'logstore_standard', 'version', '2015111600'),
(736, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments'),
(737, 'assign', 'showrecentsubmissions', '0'),
(738, 'assign', 'submissionreceipts', '1'),
(739, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.'),
(740, 'assign', 'alwaysshowdescription', '1'),
(741, 'assign', 'alwaysshowdescription_adv', ''),
(742, 'assign', 'alwaysshowdescription_locked', ''),
(743, 'assign', 'allowsubmissionsfromdate', '0'),
(744, 'assign', 'allowsubmissionsfromdate_enabled', '1'),
(745, 'assign', 'allowsubmissionsfromdate_adv', ''),
(746, 'assign', 'duedate', '604800'),
(747, 'assign', 'duedate_enabled', '1'),
(748, 'assign', 'duedate_adv', ''),
(749, 'assign', 'cutoffdate', '1209600'),
(750, 'assign', 'cutoffdate_enabled', ''),
(751, 'assign', 'cutoffdate_adv', ''),
(752, 'assign', 'submissiondrafts', '0'),
(753, 'assign', 'submissiondrafts_adv', ''),
(754, 'assign', 'submissiondrafts_locked', ''),
(755, 'assign', 'requiresubmissionstatement', '0'),
(756, 'assign', 'requiresubmissionstatement_adv', ''),
(757, 'assign', 'requiresubmissionstatement_locked', ''),
(758, 'assign', 'attemptreopenmethod', 'none'),
(759, 'assign', 'attemptreopenmethod_adv', ''),
(760, 'assign', 'attemptreopenmethod_locked', ''),
(761, 'assign', 'maxattempts', '-1'),
(762, 'assign', 'maxattempts_adv', ''),
(763, 'assign', 'maxattempts_locked', ''),
(764, 'assign', 'teamsubmission', '0'),
(765, 'assign', 'teamsubmission_adv', ''),
(766, 'assign', 'teamsubmission_locked', ''),
(767, 'assign', 'preventsubmissionnotingroup', '0'),
(768, 'assign', 'preventsubmissionnotingroup_adv', ''),
(769, 'assign', 'preventsubmissionnotingroup_locked', ''),
(770, 'assign', 'requireallteammemberssubmit', '0'),
(771, 'assign', 'requireallteammemberssubmit_adv', ''),
(772, 'assign', 'requireallteammemberssubmit_locked', ''),
(773, 'assign', 'teamsubmissiongroupingid', ''),
(774, 'assign', 'teamsubmissiongroupingid_adv', ''),
(775, 'assign', 'sendnotifications', '0'),
(776, 'assign', 'sendnotifications_adv', ''),
(777, 'assign', 'sendnotifications_locked', ''),
(778, 'assign', 'sendlatenotifications', '0'),
(779, 'assign', 'sendlatenotifications_adv', ''),
(780, 'assign', 'sendlatenotifications_locked', ''),
(781, 'assign', 'sendstudentnotifications', '1'),
(782, 'assign', 'sendstudentnotifications_adv', ''),
(783, 'assign', 'sendstudentnotifications_locked', ''),
(784, 'assign', 'blindmarking', '0'),
(785, 'assign', 'blindmarking_adv', ''),
(786, 'assign', 'blindmarking_locked', ''),
(787, 'assign', 'markingworkflow', '0'),
(788, 'assign', 'markingworkflow_adv', ''),
(789, 'assign', 'markingworkflow_locked', ''),
(790, 'assign', 'markingallocation', '0'),
(791, 'assign', 'markingallocation_adv', ''),
(792, 'assign', 'markingallocation_locked', ''),
(793, 'assignsubmission_file', 'default', '1'),
(794, 'assignsubmission_file', 'maxfiles', '20'),
(795, 'assignsubmission_file', 'maxbytes', '1048576'),
(796, 'assignsubmission_onlinetext', 'default', '0'),
(797, 'assignfeedback_comments', 'default', '1'),
(798, 'assignfeedback_comments', 'inline', '0'),
(799, 'assignfeedback_comments', 'inline_adv', ''),
(800, 'assignfeedback_comments', 'inline_locked', ''),
(801, 'assignfeedback_editpdf', 'stamps', ''),
(802, 'assignfeedback_file', 'default', '0'),
(803, 'assignfeedback_offline', 'default', '0'),
(804, 'book', 'numberingoptions', '0,1,2,3'),
(805, 'book', 'navoptions', '0,1,2'),
(806, 'book', 'numbering', '1'),
(807, 'book', 'navstyle', '1'),
(808, 'folder', 'showexpanded', '1'),
(809, 'imscp', 'keepold', '1'),
(810, 'imscp', 'keepold_adv', ''),
(811, 'label', 'dndmedia', '1'),
(812, 'label', 'dndresizewidth', '400'),
(813, 'label', 'dndresizeheight', '400'),
(814, 'page', 'displayoptions', '5'),
(815, 'page', 'printheading', '1'),
(816, 'page', 'printintro', '0'),
(817, 'page', 'display', '5'),
(818, 'page', 'popupwidth', '620'),
(819, 'page', 'popupheight', '450'),
(820, 'quiz', 'timelimit', '0'),
(821, 'quiz', 'timelimit_adv', ''),
(822, 'quiz', 'overduehandling', 'autosubmit'),
(823, 'quiz', 'overduehandling_adv', ''),
(824, 'quiz', 'graceperiod', '86400'),
(825, 'quiz', 'graceperiod_adv', ''),
(826, 'quiz', 'graceperiodmin', '60'),
(827, 'quiz', 'attempts', '0'),
(828, 'quiz', 'attempts_adv', ''),
(829, 'quiz', 'grademethod', '1'),
(830, 'quiz', 'grademethod_adv', ''),
(831, 'quiz', 'maximumgrade', '10'),
(832, 'quiz', 'questionsperpage', '1'),
(833, 'quiz', 'questionsperpage_adv', ''),
(834, 'quiz', 'navmethod', 'free'),
(835, 'quiz', 'navmethod_adv', '1'),
(836, 'quiz', 'shuffleanswers', '1'),
(837, 'quiz', 'shuffleanswers_adv', ''),
(838, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(839, 'quiz', 'canredoquestions', '0'),
(840, 'quiz', 'canredoquestions_adv', '1'),
(841, 'quiz', 'attemptonlast', '0'),
(842, 'quiz', 'attemptonlast_adv', '1'),
(843, 'quiz', 'reviewattempt', '69904'),
(844, 'quiz', 'reviewcorrectness', '69904'),
(845, 'quiz', 'reviewmarks', '69904'),
(846, 'quiz', 'reviewspecificfeedback', '69904'),
(847, 'quiz', 'reviewgeneralfeedback', '69904'),
(848, 'quiz', 'reviewrightanswer', '69904'),
(849, 'quiz', 'reviewoverallfeedback', '4368'),
(850, 'quiz', 'showuserpicture', '0'),
(851, 'quiz', 'showuserpicture_adv', ''),
(852, 'quiz', 'decimalpoints', '2'),
(853, 'quiz', 'decimalpoints_adv', ''),
(854, 'quiz', 'questiondecimalpoints', '-1'),
(855, 'quiz', 'questiondecimalpoints_adv', '1'),
(856, 'quiz', 'showblocks', '0'),
(857, 'quiz', 'showblocks_adv', '1'),
(858, 'quiz', 'password', ''),
(859, 'quiz', 'password_adv', ''),
(860, 'quiz', 'subnet', ''),
(861, 'quiz', 'subnet_adv', '1'),
(862, 'quiz', 'delay1', '0'),
(863, 'quiz', 'delay1_adv', '1'),
(864, 'quiz', 'delay2', '0'),
(865, 'quiz', 'delay2_adv', '1'),
(866, 'quiz', 'browsersecurity', '-'),
(867, 'quiz', 'browsersecurity_adv', '1'),
(868, 'quiz', 'initialnumfeedbacks', '2'),
(869, 'quiz', 'autosaveperiod', '60'),
(870, 'resource', 'framesize', '130'),
(871, 'resource', 'displayoptions', '0,1,4,5,6'),
(872, 'resource', 'printintro', '1'),
(873, 'resource', 'display', '0'),
(874, 'resource', 'showsize', '0'),
(875, 'resource', 'showtype', '0'),
(876, 'resource', 'showdate', '0'),
(877, 'resource', 'popupwidth', '620'),
(878, 'resource', 'popupheight', '450'),
(879, 'resource', 'filterfiles', '0'),
(880, 'scorm', 'displaycoursestructure', '0'),
(881, 'scorm', 'displaycoursestructure_adv', ''),
(882, 'scorm', 'popup', '0'),
(883, 'scorm', 'popup_adv', ''),
(884, 'scorm', 'displayactivityname', '1'),
(885, 'scorm', 'framewidth', '100'),
(886, 'scorm', 'framewidth_adv', '1'),
(887, 'scorm', 'frameheight', '500'),
(888, 'scorm', 'frameheight_adv', '1'),
(889, 'scorm', 'winoptgrp_adv', '1'),
(890, 'scorm', 'scrollbars', '0'),
(891, 'scorm', 'directories', '0'),
(892, 'scorm', 'location', '0'),
(893, 'scorm', 'menubar', '0'),
(894, 'scorm', 'toolbar', '0'),
(895, 'scorm', 'status', '0'),
(896, 'scorm', 'skipview', '0'),
(897, 'scorm', 'skipview_adv', '1'),
(898, 'scorm', 'hidebrowse', '0'),
(899, 'scorm', 'hidebrowse_adv', '1'),
(900, 'scorm', 'hidetoc', '0'),
(901, 'scorm', 'hidetoc_adv', '1'),
(902, 'scorm', 'nav', '1'),
(903, 'scorm', 'nav_adv', '1'),
(904, 'scorm', 'navpositionleft', '-100'),
(905, 'scorm', 'navpositionleft_adv', '1'),
(906, 'scorm', 'navpositiontop', '-100'),
(907, 'scorm', 'navpositiontop_adv', '1'),
(908, 'scorm', 'collapsetocwinsize', '767'),
(909, 'scorm', 'collapsetocwinsize_adv', '1'),
(910, 'scorm', 'displayattemptstatus', '1'),
(911, 'scorm', 'displayattemptstatus_adv', ''),
(912, 'scorm', 'grademethod', '1'),
(913, 'scorm', 'maxgrade', '100'),
(914, 'scorm', 'maxattempt', '0'),
(915, 'scorm', 'whatgrade', '0'),
(916, 'scorm', 'forcecompleted', '0'),
(917, 'scorm', 'forcenewattempt', '0'),
(918, 'scorm', 'autocommit', '0'),
(919, 'scorm', 'lastattemptlock', '0'),
(920, 'scorm', 'auto', '0'),
(921, 'scorm', 'updatefreq', '0'),
(922, 'scorm', 'scorm12standard', '1'),
(923, 'scorm', 'allowtypeexternal', '0'),
(924, 'scorm', 'allowtypelocalsync', '0'),
(925, 'scorm', 'allowtypeexternalaicc', '0'),
(926, 'scorm', 'allowaicchacp', '0'),
(927, 'scorm', 'aicchacptimeout', '30'),
(928, 'scorm', 'aicchacpkeepsessiondata', '1'),
(929, 'scorm', 'aiccuserid', '1'),
(930, 'scorm', 'forcejavascript', '1'),
(931, 'scorm', 'allowapidebug', '0'),
(932, 'scorm', 'apidebugmask', '.*'),
(933, 'scorm', 'protectpackagedownloads', '0'),
(934, 'url', 'framesize', '130'),
(935, 'url', 'secretphrase', ''),
(936, 'url', 'rolesinparams', '0'),
(937, 'url', 'displayoptions', '0,1,5,6'),
(938, 'url', 'printintro', '1'),
(939, 'url', 'display', '0'),
(940, 'url', 'popupwidth', '620'),
(941, 'url', 'popupheight', '450'),
(942, 'workshop', 'grade', '80'),
(943, 'workshop', 'gradinggrade', '20'),
(944, 'workshop', 'gradedecimals', '0'),
(945, 'workshop', 'maxbytes', '0'),
(946, 'workshop', 'strategy', 'accumulative'),
(947, 'workshop', 'examplesmode', '0'),
(948, 'workshopallocation_random', 'numofreviews', '5'),
(949, 'workshopform_numerrors', 'grade0', 'No'),
(950, 'workshopform_numerrors', 'grade1', 'Yes'),
(951, 'workshopeval_best', 'comparison', '5'),
(952, 'block_course_overview', 'defaultmaxcourses', '10'),
(953, 'block_course_overview', 'forcedefaultmaxcourses', '0'),
(954, 'block_course_overview', 'showchildren', '0'),
(955, 'block_course_overview', 'showwelcomearea', '0'),
(956, 'block_course_overview', 'showcategories', '0'),
(957, 'block_section_links', 'numsections1', '22'),
(958, 'block_section_links', 'incby1', '2'),
(959, 'block_section_links', 'numsections2', '40'),
(960, 'block_section_links', 'incby2', '5'),
(961, 'block_tag_youtube', 'apikey', ''),
(962, 'format_singleactivity', 'activitytype', 'forum'),
(963, 'enrol_cohort', 'roleid', '5'),
(964, 'enrol_cohort', 'unenrolaction', '0'),
(965, 'enrol_database', 'dbtype', ''),
(966, 'enrol_database', 'dbhost', 'localhost'),
(967, 'enrol_database', 'dbuser', ''),
(968, 'enrol_database', 'dbpass', ''),
(969, 'enrol_database', 'dbname', ''),
(970, 'enrol_database', 'dbencoding', 'utf-8'),
(971, 'enrol_database', 'dbsetupsql', ''),
(972, 'enrol_database', 'dbsybasequoting', '0'),
(973, 'enrol_database', 'debugdb', '0'),
(974, 'enrol_database', 'localcoursefield', 'idnumber'),
(975, 'enrol_database', 'localuserfield', 'idnumber'),
(976, 'enrol_database', 'localrolefield', 'shortname'),
(977, 'enrol_database', 'localcategoryfield', 'id'),
(978, 'enrol_database', 'remoteenroltable', ''),
(979, 'enrol_database', 'remotecoursefield', ''),
(980, 'enrol_database', 'remoteuserfield', ''),
(981, 'enrol_database', 'remoterolefield', ''),
(982, 'enrol_database', 'remoteotheruserfield', ''),
(983, 'enrol_database', 'defaultrole', '5'),
(984, 'enrol_database', 'ignorehiddencourses', '0'),
(985, 'enrol_database', 'unenrolaction', '0'),
(986, 'enrol_database', 'newcoursetable', ''),
(987, 'enrol_database', 'newcoursefullname', 'fullname'),
(988, 'enrol_database', 'newcourseshortname', 'shortname'),
(989, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(990, 'enrol_database', 'newcoursecategory', ''),
(991, 'enrol_database', 'defaultcategory', '1'),
(992, 'enrol_database', 'templatecourse', ''),
(993, 'enrol_flatfile', 'location', ''),
(994, 'enrol_flatfile', 'encoding', 'UTF-8'),
(995, 'enrol_flatfile', 'mailstudents', '0'),
(996, 'enrol_flatfile', 'mailteachers', '0'),
(997, 'enrol_flatfile', 'mailadmins', '0'),
(998, 'enrol_flatfile', 'unenrolaction', '3'),
(999, 'enrol_flatfile', 'expiredaction', '3'),
(1000, 'enrol_guest', 'requirepassword', '0'),
(1001, 'enrol_guest', 'usepasswordpolicy', '0'),
(1002, 'enrol_guest', 'showhint', '0'),
(1003, 'enrol_guest', 'defaultenrol', '1'),
(1004, 'enrol_guest', 'status', '1'),
(1005, 'enrol_guest', 'status_adv', ''),
(1006, 'enrol_imsenterprise', 'imsfilelocation', ''),
(1007, 'enrol_imsenterprise', 'logtolocation', ''),
(1008, 'enrol_imsenterprise', 'mailadmins', '0'),
(1009, 'enrol_imsenterprise', 'createnewusers', '0'),
(1010, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(1011, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(1012, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(1013, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(1014, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(1015, 'enrol_imsenterprise', 'imsrolemap02', '3');
INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1016, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(1017, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(1018, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(1019, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(1020, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(1021, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(1022, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(1023, 'enrol_imsenterprise', 'createnewcourses', '0'),
(1024, 'enrol_imsenterprise', 'createnewcategories', '0'),
(1025, 'enrol_imsenterprise', 'imsunenrol', '0'),
(1026, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode'),
(1027, 'enrol_imsenterprise', 'imscoursemapfullname', 'short'),
(1028, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore'),
(1029, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(1030, 'enrol_imsenterprise', 'imscapitafix', '0'),
(1031, 'enrol_manual', 'expiredaction', '1'),
(1032, 'enrol_manual', 'expirynotifyhour', '6'),
(1033, 'enrol_manual', 'defaultenrol', '1'),
(1034, 'enrol_manual', 'status', '0'),
(1035, 'enrol_manual', 'roleid', '5'),
(1036, 'enrol_manual', 'enrolstart', '4'),
(1037, 'enrol_manual', 'enrolperiod', '0'),
(1038, 'enrol_manual', 'expirynotify', '0'),
(1039, 'enrol_manual', 'expirythreshold', '86400'),
(1040, 'enrol_meta', 'nosyncroleids', ''),
(1041, 'enrol_meta', 'syncall', '1'),
(1042, 'enrol_meta', 'unenrolaction', '3'),
(1043, 'enrol_meta', 'coursesort', 'sortorder'),
(1044, 'enrol_mnet', 'roleid', '5'),
(1045, 'enrol_mnet', 'roleid_adv', '1'),
(1046, 'enrol_paypal', 'paypalbusiness', ''),
(1047, 'enrol_paypal', 'mailstudents', '0'),
(1048, 'enrol_paypal', 'mailteachers', '0'),
(1049, 'enrol_paypal', 'mailadmins', '0'),
(1050, 'enrol_paypal', 'expiredaction', '3'),
(1051, 'enrol_paypal', 'status', '1'),
(1052, 'enrol_paypal', 'cost', '0'),
(1053, 'enrol_paypal', 'currency', 'USD'),
(1054, 'enrol_paypal', 'roleid', '5'),
(1055, 'enrol_paypal', 'enrolperiod', '0'),
(1056, 'enrol_self', 'requirepassword', '0'),
(1057, 'enrol_self', 'usepasswordpolicy', '0'),
(1058, 'enrol_self', 'showhint', '0'),
(1059, 'enrol_self', 'expiredaction', '1'),
(1060, 'enrol_self', 'expirynotifyhour', '6'),
(1061, 'enrol_self', 'defaultenrol', '1'),
(1062, 'enrol_self', 'status', '1'),
(1063, 'enrol_self', 'newenrols', '1'),
(1064, 'enrol_self', 'groupkey', '0'),
(1065, 'enrol_self', 'roleid', '5'),
(1066, 'enrol_self', 'enrolperiod', '0'),
(1067, 'enrol_self', 'expirynotify', '0'),
(1068, 'enrol_self', 'expirythreshold', '86400'),
(1069, 'enrol_self', 'longtimenosee', '0'),
(1070, 'enrol_self', 'maxenrolled', '0'),
(1071, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(1072, 'filter_emoticon', 'formats', '1,4,0'),
(1073, 'filter_mathjaxloader', 'httpurl', 'http://cdn.mathjax.org/mathjax/2.5-latest/MathJax.js'),
(1074, 'filter_mathjaxloader', 'httpsurl', 'https://cdn.mathjax.org/mathjax/2.5-latest/MathJax.js'),
(1075, 'filter_mathjaxloader', 'texfiltercompatibility', '0'),
(1076, 'filter_mathjaxloader', 'mathjaxconfig', '\nMathJax.Hub.Config({\n    config: ["Accessible.js", "Safe.js"],\n    errorSettings: { message: ["!"] },\n    skipStartupTypeset: true,\n    messageStyle: "none"\n});\n'),
(1077, 'filter_mathjaxloader', 'additionaldelimiters', ''),
(1078, 'filter_tex', 'latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(1079, 'filter_tex', 'latexbackground', '#FFFFFF'),
(1080, 'filter_tex', 'density', '120'),
(1081, 'filter_tex', 'pathlatex', '/usr/bin/latex'),
(1082, 'filter_tex', 'pathdvips', '/usr/bin/dvips'),
(1083, 'filter_tex', 'pathconvert', '/usr/bin/convert'),
(1084, 'filter_tex', 'pathdvisvgm', '/usr/bin/dvisvgm'),
(1085, 'filter_tex', 'pathmimetex', ''),
(1086, 'filter_tex', 'convertformat', 'gif'),
(1087, 'filter_urltolink', 'formats', '0'),
(1088, 'filter_urltolink', 'embedimages', '1'),
(1089, 'logstore_database', 'dbdriver', ''),
(1090, 'logstore_database', 'dbhost', ''),
(1091, 'logstore_database', 'dbuser', ''),
(1092, 'logstore_database', 'dbpass', ''),
(1093, 'logstore_database', 'dbname', ''),
(1094, 'logstore_database', 'dbtable', ''),
(1095, 'logstore_database', 'dbpersist', '0'),
(1096, 'logstore_database', 'dbsocket', ''),
(1097, 'logstore_database', 'dbport', ''),
(1098, 'logstore_database', 'dbschema', ''),
(1099, 'logstore_database', 'dbcollation', ''),
(1100, 'logstore_database', 'buffersize', '50'),
(1101, 'logstore_database', 'logguests', '0'),
(1102, 'logstore_database', 'includelevels', '1,2,0'),
(1103, 'logstore_database', 'includeactions', 'c,r,u,d'),
(1104, 'logstore_legacy', 'loglegacy', '0'),
(1105, 'logstore_standard', 'logguests', '1'),
(1106, 'logstore_standard', 'loglifetime', '0'),
(1107, 'logstore_standard', 'buffersize', '50'),
(1108, 'editor_atto', 'toolbar', 'collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html'),
(1109, 'editor_atto', 'autosavefrequency', '60'),
(1110, 'atto_collapse', 'showgroups', '5'),
(1111, 'atto_equation', 'librarygroup1', '\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n'),
(1112, 'atto_equation', 'librarygroup2', '\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n'),
(1113, 'atto_equation', 'librarygroup3', '\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n'),
(1114, 'atto_equation', 'librarygroup4', '\n\\sum{a,b}\n\\sqrt[a]{b+c}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n\\frac{a}{b+c}\n\\vec{a}\n\\binom {a} {b}\n{a \\brack b}\n{a \\brace b}\n'),
(1115, 'atto_table', 'allowborders', '0'),
(1116, 'atto_table', 'allowbackgroundcolour', '0'),
(1117, 'atto_table', 'allowwidth', '0'),
(1118, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),
(1119, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),
(1120, 'editor_tinymce', 'customconfig', ''),
(1121, 'tinymce_moodleemoticon', 'requireemoticon', '1'),
(1122, 'tinymce_spellchecker', 'spellengine', ''),
(1123, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
(1124, 'enrol_ldap', 'objectclass', '(objectClass=*)'),
(1125, 'core_plugin', 'recentfetch', '1458106521'),
(1126, 'core_plugin', 'recentresponse', '{"status":"OK","provider":"https:\\/\\/download.moodle.org\\/api\\/1.3\\/updates.php","apiver":"1.3","timegenerated":1458106521,"ticket":"JUM5JTkxOSVGODglODlwJTdEJUUwJTkwJUQ5JUQxJUIzZ0ElQjQlMUQlQzklOTglQUYlNUUwJUM5JTdGJTdCJUI4JUZBJTE5aiVBN3QlMEIlOEJBJTFCJTg1JTdCJTg5JTg5TA==","forbranch":"3.0","forversion":"2015111603","updates":{"core":[{"version":2015111603,"release":"3.0.3 (Build: 20160314)","branch":"3.0","maturity":200,"url":"https:\\/\\/download.moodle.org","download":"https:\\/\\/download.moodle.org\\/download.php\\/direct\\/stable30\\/moodle-3.0.3.zip"},{"version":2016031000,"release":"3.1dev (Build: 20160310)","branch":"3.1","maturity":50,"url":"https:\\/\\/download.moodle.org","download":"https:\\/\\/download.moodle.org\\/download.php\\/direct\\/moodle\\/moodle-latest.zip"}]}}'),
(1193, 'block_kaplan_plugin', 'version', '2016031500'),
(1194, 'hub', 'site_name_httphubmoodleorg', 'Kaplan Tech Test'),
(1195, 'hub', 'site_description_httphubmoodleorg', 'Kaplan Tech Test Phase'),
(1196, 'hub', 'site_contactname_httphubmoodleorg', 'Admin User'),
(1197, 'hub', 'site_contactemail_httphubmoodleorg', 'admin@moodle.com'),
(1198, 'hub', 'site_contactphone_httphubmoodleorg', ''),
(1199, 'hub', 'site_imageurl_httphubmoodleorg', ''),
(1200, 'hub', 'site_privacy_httphubmoodleorg', 'notdisplayed'),
(1201, 'hub', 'site_address_httphubmoodleorg', ''),
(1202, 'hub', 'site_region_httphubmoodleorg', '-'),
(1203, 'hub', 'site_country_httphubmoodleorg', 'IN'),
(1204, 'hub', 'site_language_httphubmoodleorg', 'en'),
(1205, 'hub', 'site_geolocation_httphubmoodleorg', ''),
(1206, 'hub', 'site_contactable_httphubmoodleorg', '0'),
(1207, 'hub', 'site_emailalert_httphubmoodleorg', '1'),
(1208, 'hub', 'site_coursesnumber_httphubmoodleorg', '1'),
(1209, 'hub', 'site_usersnumber_httphubmoodleorg', '1'),
(1210, 'hub', 'site_roleassignmentsnumber_httphubmoodleorg', '1'),
(1211, 'hub', 'site_postsnumber_httphubmoodleorg', '1'),
(1212, 'hub', 'site_questionsnumber_httphubmoodleorg', '1'),
(1213, 'hub', 'site_resourcesnumber_httphubmoodleorg', '1'),
(1214, 'hub', 'site_badges_httphubmoodleorg', '1'),
(1215, 'hub', 'site_issuedbadges_httphubmoodleorg', '1'),
(1216, 'hub', 'site_modulenumberaverage_httphubmoodleorg', '1'),
(1217, 'hub', 'site_participantnumberaverage_httphubmoodleorg', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context`
--

CREATE TABLE IF NOT EXISTS `mdl_context` (
  `id` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='one of these must be set';

--
-- Dumping data for table `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/2/6', 3),
(7, 80, 2, '/1/2/7', 3),
(8, 80, 3, '/1/2/8', 3),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/14', 2),
(15, 80, 10, '/1/15', 2),
(16, 80, 11, '/1/16', 2),
(17, 80, 12, '/1/17', 2),
(18, 80, 13, '/1/5/18', 3),
(19, 80, 14, '/1/5/19', 3),
(20, 80, 15, '/1/5/20', 3),
(21, 80, 16, '/1/5/21', 3),
(22, 80, 17, '/1/5/22', 3),
(23, 80, 18, '/1/5/23', 3),
(24, 50, 2, '/1/3/24', 3),
(25, 80, 19, '/1/3/24/25', 4),
(26, 80, 20, '/1/3/24/26', 4),
(27, 80, 21, '/1/3/24/27', 4),
(28, 80, 22, '/1/3/24/28', 4),
(29, 70, 1, '/1/3/24/29', 4),
(35, 80, 28, '/1/3/24/35', 4),
(53, 30, 3, '/1/53', 2),
(54, 50, 3, '/1/3/54', 3),
(55, 80, 46, '/1/3/54/55', 4),
(56, 80, 47, '/1/3/54/56', 4),
(57, 80, 48, '/1/3/54/57', 4),
(58, 80, 49, '/1/3/54/58', 4),
(59, 70, 2, '/1/3/54/59', 4),
(93, 80, 83, '/1/53/93', 3),
(94, 80, 84, '/1/53/94', 3),
(95, 80, 85, '/1/53/95', 3),
(96, 80, 86, '/1/53/96', 3),
(97, 80, 87, '/1/53/97', 3),
(98, 80, 88, '/1/53/98', 3),
(113, 80, 103, '/1/5/113', 3),
(114, 80, 104, '/1/53/114', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context_temp`
--

CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by build_context_path() in upgrade and cron to keep con';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course`
--

CREATE TABLE IF NOT EXISTS `mdl_course` (
  `id` bigint(10) NOT NULL,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `calendartype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Central course table';

--
-- Dumping data for table `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `newsitems`, `startdate`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `calendartype`, `theme`, `timecreated`, `timemodified`, `requested`, `enablecompletion`, `completionnotify`, `cacherev`) VALUES
(1, 0, 1, 'Moodle', 'Moodle', '', '', 0, 'site', 1, 3, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1458047378, 1458048111, 0, 0, 0, 1458190253),
(2, 1, 10002, 'Test', 'test', '', '', 1, 'weeks', 1, 5, 1458086400, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1458048226, 1458048226, 0, 0, 0, 1458190253),
(3, 1, 10001, 'Test 1', 'test1', '', '', 1, 'weeks', 1, 5, 1458172800, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1458139090, 1458139090, 0, 0, 0, 1458190253);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course categories';

--
-- Dumping data for table `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Miscellaneous', NULL, NULL, 0, 0, 10000, 2, 1, 1, 1458047378, 1, '/1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completions`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion records';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion aggregation methods for criteria';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion criteria';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion user records';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_format_options`
--

CREATE TABLE IF NOT EXISTS `mdl_course_format_options` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores format-specific options for the course or course sect';

--
-- Dumping data for table `mdl_course_format_options`
--

INSERT INTO `mdl_course_format_options` (`id`, `courseid`, `format`, `sectionid`, `name`, `value`) VALUES
(1, 1, 'site', 0, 'numsections', '1'),
(2, 2, 'weeks', 0, 'numsections', '10'),
(3, 2, 'weeks', 0, 'hiddensections', '0'),
(4, 2, 'weeks', 0, 'coursedisplay', '0'),
(5, 3, 'weeks', 0, 'numsections', '10'),
(6, 3, 'weeks', 0, 'hiddensections', '0'),
(7, 3, 'weeks', 0, 'coursedisplay', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  `availability` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course_modules table retrofitted from MySQL';

--
-- Dumping data for table `mdl_course_modules`
--

INSERT INTO `mdl_course_modules` (`id`, `course`, `module`, `instance`, `section`, `idnumber`, `added`, `score`, `indent`, `visible`, `visibleold`, `groupmode`, `groupingid`, `completion`, `completiongradeitemnumber`, `completionview`, `completionexpected`, `showdescription`, `availability`) VALUES
(1, 2, 9, 1, 1, NULL, 1458048233, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL),
(2, 3, 9, 2, 14, NULL, 1458139135, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_completion`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the completion state (completed or not completed, etc';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_published`
--

CREATE TABLE IF NOT EXISTS `mdl_course_published` (
  `id` bigint(10) NOT NULL,
  `huburl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about how and when an local courses were publish';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_request`
--

CREATE TABLE IF NOT EXISTS `mdl_course_request` (
  `id` bigint(10) NOT NULL,
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext COLLATE utf8_unicode_ci NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course requests';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availability` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to define the sections for each course';

--
-- Dumping data for table `mdl_course_sections`
--

INSERT INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`, `availability`) VALUES
(1, 2, 0, NULL, '', 1, '1', 1, NULL),
(2, 2, 1, NULL, '', 1, '', 1, NULL),
(3, 2, 2, NULL, '', 1, '', 1, NULL),
(4, 2, 3, NULL, '', 1, '', 1, NULL),
(5, 2, 4, NULL, '', 1, '', 1, NULL),
(6, 2, 5, NULL, '', 1, '', 1, NULL),
(7, 2, 6, NULL, '', 1, '', 1, NULL),
(8, 2, 7, NULL, '', 1, '', 1, NULL),
(9, 2, 8, NULL, '', 1, '', 1, NULL),
(10, 2, 9, NULL, '', 1, '', 1, NULL),
(11, 2, 10, NULL, '', 1, '', 1, NULL),
(12, 1, 0, NULL, '', 1, '', 1, NULL),
(13, 1, 1, NULL, '', 1, '', 1, NULL),
(14, 3, 0, NULL, '', 1, '2', 1, NULL),
(15, 3, 1, NULL, '', 1, '', 1, NULL),
(16, 3, 2, NULL, '', 1, '', 1, NULL),
(17, 3, 3, NULL, '', 1, '', 1, NULL),
(18, 3, 4, NULL, '', 1, '', 1, NULL),
(19, 3, 5, NULL, '', 1, '', 1, NULL),
(20, 3, 6, NULL, '', 1, '', 1, NULL),
(21, 3, 7, NULL, '', 1, '', 1, NULL),
(22, 3, 8, NULL, '', 1, '', 1, NULL),
(23, 3, 9, NULL, '', 1, '', 1, NULL),
(24, 3, 10, NULL, '', 1, '', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data`
--

CREATE TABLE IF NOT EXISTS `mdl_data` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplateheader` longtext COLLATE utf8_unicode_ci,
  `listtemplatefooter` longtext COLLATE utf8_unicode_ci,
  `addtemplate` longtext COLLATE utf8_unicode_ci,
  `rsstemplate` longtext COLLATE utf8_unicode_ci,
  `rsstitletemplate` longtext COLLATE utf8_unicode_ci,
  `csstemplate` longtext COLLATE utf8_unicode_ci,
  `jstemplate` longtext COLLATE utf8_unicode_ci,
  `asearchtemplate` longtext COLLATE utf8_unicode_ci,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `manageapproved` smallint(4) NOT NULL DEFAULT '1',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all database activities';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_content`
--

CREATE TABLE IF NOT EXISTS `mdl_data_content` (
  `id` bigint(10) NOT NULL,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `content1` longtext COLLATE utf8_unicode_ci,
  `content2` longtext COLLATE utf8_unicode_ci,
  `content3` longtext COLLATE utf8_unicode_ci,
  `content4` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the content introduced in each record/fields';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
  `id` bigint(10) NOT NULL,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  `param6` longtext COLLATE utf8_unicode_ci,
  `param7` longtext COLLATE utf8_unicode_ci,
  `param8` longtext COLLATE utf8_unicode_ci,
  `param9` longtext COLLATE utf8_unicode_ci,
  `param10` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every field available';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_records`
--

CREATE TABLE IF NOT EXISTS `mdl_data_records` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every record introduced';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_editor_atto_autosave`
--

CREATE TABLE IF NOT EXISTS `mdl_editor_atto_autosave` (
  `id` bigint(10) NOT NULL,
  `elementid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `pagehash` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `drafttext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `draftid` bigint(10) DEFAULT NULL,
  `pageinstance` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Draft text that is auto-saved every 5 seconds while an edito';

--
-- Dumping data for table `mdl_editor_atto_autosave`
--

INSERT INTO `mdl_editor_atto_autosave` (`id`, `elementid`, `contextid`, `pagehash`, `userid`, `drafttext`, `draftid`, `pageinstance`, `timemodified`) VALUES
(1, 'id_s__auth_instructions', 1, '7d2fa27a7d67dfa30b05df1b6b38802e4db3379c', 2, '', -1, 'yui_3_17_2_1_1458095273050_167', 1458095274),
(2, 'id_summary_editor', 3, 'eccd794270cde55319a6cfbd4daee02e37533c9a', 2, '', 624570112, 'yui_3_17_2_1_1458113427203_355', 1458113429),
(3, 'id_description_editor', 1, '72304f588dcdcdf0b9a10ffe35d76a9ef714ce2d', 2, '', 811106377, 'yui_3_17_2_1_1458113877027_186', 1458113878),
(6, 'id_s_theme_clean_footnote', 1, '312e4b3b66b16a0fc970620d3399e14692822561', 2, '', -1, 'yui_3_17_2_1_1458141689267_190', 1458141690),
(7, 'id_description_editor', 5, '86b37e9b6eef7d2fa5365af4223e07357dbf735b', 2, '', 93454888, 'yui_3_17_2_1_1458188429538_303', 1458188430),
(8, 'id_description_editor', 1, 'c9f5648354e87d788cc38f79a25a7321cc0a89c1', 2, '', -1, 'yui_3_17_2_1_1458188383627_264', 1458188384);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol` (
  `id` bigint(10) NOT NULL,
  `enrol` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar3` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext COLLATE utf8_unicode_ci,
  `customtext2` longtext COLLATE utf8_unicode_ci,
  `customtext3` longtext COLLATE utf8_unicode_ci,
  `customtext4` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Instances of enrolment plugins used in courses, fields marke';

--
-- Dumping data for table `mdl_enrol`
--

INSERT INTO `mdl_enrol` (`id`, `enrol`, `status`, `courseid`, `sortorder`, `name`, `enrolperiod`, `enrolstartdate`, `enrolenddate`, `expirynotify`, `expirythreshold`, `notifyall`, `password`, `cost`, `currency`, `roleid`, `customint1`, `customint2`, `customint3`, `customint4`, `customint5`, `customint6`, `customint7`, `customint8`, `customchar1`, `customchar2`, `customchar3`, `customdec1`, `customdec2`, `customtext1`, `customtext2`, `customtext3`, `customtext4`, `timecreated`, `timemodified`) VALUES
(1, 'manual', 0, 2, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1458048226, 1458048226),
(2, 'guest', 1, 2, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1458048226, 1458048226),
(3, 'self', 1, 2, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1458048226, 1458048226),
(4, 'manual', 0, 3, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1458139091, 1458139091),
(5, 'guest', 1, 3, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1458139091, 1458139091),
(6, 'self', 1, 3, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1458139092, 1458139092);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_flatfile`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL,
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='enrol_flatfile table retrofitted from MySQL';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_paypal`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL,
  `business` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reason_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about PayPal transactions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event`
--

CREATE TABLE IF NOT EXISTS `mdl_event` (
  `id` bigint(10) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For everything with a time associated to it';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
  `id` bigint(10) NOT NULL,
  `eventname` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfunction` longtext COLLATE utf8_unicode_ci,
  `schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing which components requests what typ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
  `id` bigint(10) NOT NULL,
  `eventdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  `stackdump` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing queued events. It stores only one ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is the list of queued handlers for processing. The even';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks subscriptions to remote calendars.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
  `id` bigint(10) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `methodname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capabilities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='list of all external functions';

--
-- Dumping data for table `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`) VALUES
(1, 'core_cohort_create_cohorts', 'core_cohort_external', 'create_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(2, 'core_cohort_delete_cohorts', 'core_cohort_external', 'delete_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(3, 'core_cohort_get_cohorts', 'core_cohort_external', 'get_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(4, 'core_cohort_update_cohorts', 'core_cohort_external', 'update_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(5, 'core_cohort_add_cohort_members', 'core_cohort_external', 'add_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(6, 'core_cohort_delete_cohort_members', 'core_cohort_external', 'delete_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(7, 'core_cohort_get_cohort_members', 'core_cohort_external', 'get_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(8, 'core_comment_get_comments', 'core_comment_external', 'get_comments', NULL, 'moodle', 'moodle/comment:view'),
(9, 'core_grades_get_grades', 'core_grades_external', 'get_grades', NULL, 'moodle', 'moodle/grade:view, moodle/grade:viewall, moodle/grade:viewhidden'),
(10, 'core_grades_update_grades', 'core_grades_external', 'update_grades', NULL, 'moodle', ''),
(11, 'moodle_group_create_groups', 'moodle_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(12, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(13, 'moodle_group_get_groups', 'moodle_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(14, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(15, 'moodle_group_get_course_groups', 'moodle_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(16, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(17, 'moodle_group_delete_groups', 'moodle_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(18, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(19, 'moodle_group_get_groupmembers', 'moodle_group_external', 'get_groupmembers', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(20, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(21, 'moodle_group_add_groupmembers', 'moodle_group_external', 'add_groupmembers', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(22, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(23, 'moodle_group_delete_groupmembers', 'moodle_group_external', 'delete_groupmembers', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(24, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(25, 'core_group_create_groupings', 'core_group_external', 'create_groupings', 'group/externallib.php', 'moodle', ''),
(26, 'core_group_update_groupings', 'core_group_external', 'update_groupings', 'group/externallib.php', 'moodle', ''),
(27, 'core_group_get_groupings', 'core_group_external', 'get_groupings', 'group/externallib.php', 'moodle', ''),
(28, 'core_group_get_course_groupings', 'core_group_external', 'get_course_groupings', 'group/externallib.php', 'moodle', ''),
(29, 'core_group_delete_groupings', 'core_group_external', 'delete_groupings', 'group/externallib.php', 'moodle', ''),
(30, 'core_group_assign_grouping', 'core_group_external', 'assign_grouping', 'group/externallib.php', 'moodle', ''),
(31, 'core_group_unassign_grouping', 'core_group_external', 'unassign_grouping', 'group/externallib.php', 'moodle', ''),
(32, 'core_group_get_course_user_groups', 'core_group_external', 'get_course_user_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(33, 'core_group_get_activity_allowed_groups', 'core_group_external', 'get_activity_allowed_groups', 'group/externallib.php', 'moodle', ''),
(34, 'core_group_get_activity_groupmode', 'core_group_external', 'get_activity_groupmode', 'group/externallib.php', 'moodle', ''),
(35, 'core_notes_get_course_notes', 'core_notes_external', 'get_course_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view'),
(36, 'moodle_file_get_files', 'moodle_file_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(37, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(38, 'moodle_file_upload', 'moodle_file_external', 'upload', 'files/externallib.php', 'moodle', ''),
(39, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(40, 'moodle_user_create_users', 'moodle_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(41, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(42, 'core_user_get_users', 'core_user_external', 'get_users', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(43, 'moodle_user_get_users_by_id', 'moodle_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(44, 'core_user_get_users_by_field', 'core_user_external', 'get_users_by_field', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(45, 'core_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(46, 'moodle_user_get_users_by_courseid', 'moodle_user_external', 'get_users_by_courseid', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(47, 'moodle_user_get_course_participants_by_id', 'moodle_user_external', 'get_course_participants_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(48, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(49, 'moodle_user_delete_users', 'moodle_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(50, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(51, 'moodle_user_update_users', 'moodle_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(52, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(53, 'core_user_add_user_device', 'core_user_external', 'add_user_device', 'user/externallib.php', 'moodle', ''),
(54, 'core_user_remove_user_device', 'core_user_external', 'remove_user_device', 'user/externallib.php', 'moodle', ''),
(55, 'core_user_view_user_list', 'core_user_external', 'view_user_list', 'user/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(56, 'core_user_view_user_profile', 'core_user_external', 'view_user_profile', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails'),
(57, 'core_user_add_user_private_files', 'core_user_external', 'add_user_private_files', 'user/externallib.php', 'moodle', 'moodle/user:manageownfiles'),
(58, 'core_enrol_get_enrolled_users_with_capability', 'core_enrol_external', 'get_enrolled_users_with_capability', 'enrol/externallib.php', 'moodle', ''),
(59, 'moodle_enrol_get_enrolled_users', 'moodle_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),
(60, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(61, 'moodle_enrol_get_users_courses', 'moodle_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(62, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(63, 'core_enrol_get_course_enrolment_methods', 'core_enrol_external', 'get_course_enrolment_methods', 'enrol/externallib.php', 'moodle', ''),
(64, 'moodle_role_assign', 'moodle_enrol_external', 'role_assign', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(65, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(66, 'moodle_role_unassign', 'moodle_enrol_external', 'role_unassign', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(67, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(68, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:viewhiddencourses'),
(69, 'moodle_course_get_courses', 'moodle_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(70, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(71, 'core_course_search_courses', 'core_course_external', 'search_courses', 'course/externallib.php', 'moodle', ''),
(72, 'moodle_course_create_courses', 'moodle_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(73, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(74, 'core_course_delete_courses', 'core_course_external', 'delete_courses', 'course/externallib.php', 'moodle', 'moodle/course:delete'),
(75, 'core_course_delete_modules', 'core_course_external', 'delete_modules', 'course/externallib.php', 'moodle', 'moodle/course:manageactivities'),
(76, 'core_course_duplicate_course', 'core_course_external', 'duplicate_course', 'course/externallib.php', 'moodle', 'moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),
(77, 'core_course_update_courses', 'core_course_external', 'update_courses', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:changecategory,moodle/course:changefullname,moodle/course:changeshortname,moodle/course:changeidnumber,moodle/course:changesummary,moodle/course:visibility'),
(78, 'core_course_view_course', 'core_course_external', 'view_course', 'course/externallib.php', 'moodle', ''),
(79, 'core_course_get_course_module', 'core_course_external', 'get_course_module', 'course/externallib.php', 'moodle', ''),
(80, 'core_course_get_course_module_by_instance', 'core_course_external', 'get_course_module_by_instance', 'course/externallib.php', 'moodle', ''),
(81, 'core_course_get_categories', 'core_course_external', 'get_categories', 'course/externallib.php', 'moodle', 'moodle/category:viewhiddencategories'),
(82, 'core_course_create_categories', 'core_course_external', 'create_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(83, 'core_course_update_categories', 'core_course_external', 'update_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(84, 'core_course_delete_categories', 'core_course_external', 'delete_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(85, 'core_course_import_course', 'core_course_external', 'import_course', 'course/externallib.php', 'moodle', 'moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),
(86, 'moodle_message_send_instantmessages', 'moodle_message_external', 'send_instantmessages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(87, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(88, 'core_message_create_contacts', 'core_message_external', 'create_contacts', 'message/externallib.php', 'moodle', ''),
(89, 'core_message_delete_contacts', 'core_message_external', 'delete_contacts', 'message/externallib.php', 'moodle', ''),
(90, 'core_message_block_contacts', 'core_message_external', 'block_contacts', 'message/externallib.php', 'moodle', ''),
(91, 'core_message_unblock_contacts', 'core_message_external', 'unblock_contacts', 'message/externallib.php', 'moodle', ''),
(92, 'core_message_get_contacts', 'core_message_external', 'get_contacts', 'message/externallib.php', 'moodle', ''),
(93, 'core_message_search_contacts', 'core_message_external', 'search_contacts', 'message/externallib.php', 'moodle', ''),
(94, 'core_message_get_messages', 'core_message_external', 'get_messages', 'message/externallib.php', 'moodle', ''),
(95, 'core_message_get_blocked_users', 'core_message_external', 'get_blocked_users', 'message/externallib.php', 'moodle', ''),
(96, 'core_message_mark_message_read', 'core_message_external', 'mark_message_read', 'message/externallib.php', 'moodle', ''),
(97, 'moodle_notes_create_notes', 'moodle_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(98, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(99, 'core_notes_delete_notes', 'core_notes_external', 'delete_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(100, 'core_notes_get_notes', 'core_notes_external', 'get_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view'),
(101, 'core_notes_update_notes', 'core_notes_external', 'update_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(102, 'core_notes_view_notes', 'core_notes_external', 'view_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view'),
(103, 'core_grading_get_definitions', 'core_grading_external', 'get_definitions', NULL, 'moodle', ''),
(104, 'core_grade_get_definitions', 'core_grade_external', 'get_definitions', 'grade/externallib.php', 'moodle', ''),
(105, 'core_grading_save_definitions', 'core_grading_external', 'save_definitions', NULL, 'moodle', ''),
(106, 'core_grading_get_gradingform_instances', 'core_grading_external', 'get_gradingform_instances', NULL, 'moodle', ''),
(107, 'moodle_webservice_get_siteinfo', 'moodle_webservice_external', 'get_siteinfo', 'webservice/externallib.php', 'moodle', ''),
(108, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(109, 'core_get_string', 'core_external', 'get_string', 'lib/external/externallib.php', 'moodle', ''),
(110, 'core_get_strings', 'core_external', 'get_strings', 'lib/external/externallib.php', 'moodle', ''),
(111, 'core_get_component_strings', 'core_external', 'get_component_strings', 'lib/external/externallib.php', 'moodle', ''),
(112, 'core_calendar_delete_calendar_events', 'core_calendar_external', 'delete_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(113, 'core_calendar_get_calendar_events', 'core_calendar_external', 'get_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(114, 'core_calendar_create_calendar_events', 'core_calendar_external', 'create_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(115, 'core_output_load_template', 'core\\output\\external', 'load_template', NULL, 'moodle', ''),
(116, 'core_completion_update_activity_completion_status_manually', 'core_completion_external', 'update_activity_completion_status_manually', NULL, 'moodle', ''),
(117, 'core_completion_mark_course_self_completed', 'core_completion_external', 'mark_course_self_completed', NULL, 'moodle', ''),
(118, 'core_completion_get_activities_completion_status', 'core_completion_external', 'get_activities_completion_status', NULL, 'moodle', ''),
(119, 'core_completion_get_course_completion_status', 'core_completion_external', 'get_course_completion_status', NULL, 'moodle', 'report/completion:view'),
(120, 'core_rating_get_item_ratings', 'core_rating_external', 'get_item_ratings', NULL, 'moodle', 'moodle/rating:view'),
(121, 'core_tag_update_tags', 'core_tag_external', 'update_tags', NULL, 'moodle', ''),
(122, 'core_tag_get_tags', 'core_tag_external', 'get_tags', NULL, 'moodle', ''),
(123, 'mod_assign_get_grades', 'mod_assign_external', 'get_grades', 'mod/assign/externallib.php', 'mod_assign', ''),
(124, 'mod_assign_get_assignments', 'mod_assign_external', 'get_assignments', 'mod/assign/externallib.php', 'mod_assign', ''),
(125, 'mod_assign_get_submissions', 'mod_assign_external', 'get_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(126, 'mod_assign_get_user_flags', 'mod_assign_external', 'get_user_flags', 'mod/assign/externallib.php', 'mod_assign', ''),
(127, 'mod_assign_set_user_flags', 'mod_assign_external', 'set_user_flags', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:grade'),
(128, 'mod_assign_get_user_mappings', 'mod_assign_external', 'get_user_mappings', 'mod/assign/externallib.php', 'mod_assign', ''),
(129, 'mod_assign_revert_submissions_to_draft', 'mod_assign_external', 'revert_submissions_to_draft', 'mod/assign/externallib.php', 'mod_assign', ''),
(130, 'mod_assign_lock_submissions', 'mod_assign_external', 'lock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(131, 'mod_assign_unlock_submissions', 'mod_assign_external', 'unlock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(132, 'mod_assign_save_submission', 'mod_assign_external', 'save_submission', 'mod/assign/externallib.php', 'mod_assign', ''),
(133, 'mod_assign_submit_for_grading', 'mod_assign_external', 'submit_for_grading', 'mod/assign/externallib.php', 'mod_assign', ''),
(134, 'mod_assign_save_grade', 'mod_assign_external', 'save_grade', 'mod/assign/externallib.php', 'mod_assign', ''),
(135, 'mod_assign_save_grades', 'mod_assign_external', 'save_grades', 'mod/assign/externallib.php', 'mod_assign', ''),
(136, 'mod_assign_save_user_extensions', 'mod_assign_external', 'save_user_extensions', 'mod/assign/externallib.php', 'mod_assign', ''),
(137, 'mod_assign_reveal_identities', 'mod_assign_external', 'reveal_identities', 'mod/assign/externallib.php', 'mod_assign', ''),
(138, 'mod_assign_view_grading_table', 'mod_assign_external', 'view_grading_table', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view, mod/assign:viewgrades'),
(139, 'mod_book_view_book', 'mod_book_external', 'view_book', NULL, 'mod_book', 'mod/book:read'),
(140, 'mod_book_get_books_by_courses', 'mod_book_external', 'get_books_by_courses', NULL, 'mod_book', ''),
(141, 'mod_chat_login_user', 'mod_chat_external', 'login_user', NULL, 'mod_chat', 'mod/chat:chat'),
(142, 'mod_chat_get_chat_users', 'mod_chat_external', 'get_chat_users', NULL, 'mod_chat', 'mod/chat:chat'),
(143, 'mod_chat_send_chat_message', 'mod_chat_external', 'send_chat_message', NULL, 'mod_chat', 'mod/chat:chat'),
(144, 'mod_chat_get_chat_latest_messages', 'mod_chat_external', 'get_chat_latest_messages', NULL, 'mod_chat', 'mod/chat:chat'),
(145, 'mod_chat_view_chat', 'mod_chat_external', 'view_chat', NULL, 'mod_chat', 'mod/chat:chat'),
(146, 'mod_chat_get_chats_by_courses', 'mod_chat_external', 'get_chats_by_courses', NULL, 'mod_chat', ''),
(147, 'mod_choice_get_choice_results', 'mod_choice_external', 'get_choice_results', NULL, 'mod_choice', ''),
(148, 'mod_choice_get_choice_options', 'mod_choice_external', 'get_choice_options', NULL, 'mod_choice', 'mod/choice:choose'),
(149, 'mod_choice_submit_choice_response', 'mod_choice_external', 'submit_choice_response', NULL, 'mod_choice', 'mod/choice:choose'),
(150, 'mod_choice_view_choice', 'mod_choice_external', 'view_choice', NULL, 'mod_choice', ''),
(151, 'mod_choice_get_choices_by_courses', 'mod_choice_external', 'get_choices_by_courses', NULL, 'mod_choice', ''),
(152, 'mod_choice_delete_choice_responses', 'mod_choice_external', 'delete_choice_responses', NULL, 'mod_choice', 'mod/choice:choose'),
(153, 'mod_data_get_databases_by_courses', 'mod_data_external', 'get_databases_by_courses', NULL, 'mod_data', 'mod/data:viewentry'),
(154, 'mod_folder_view_folder', 'mod_folder_external', 'view_folder', NULL, 'mod_folder', 'mod/folder:view'),
(155, 'mod_forum_get_forums_by_courses', 'mod_forum_external', 'get_forums_by_courses', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion'),
(156, 'mod_forum_get_forum_discussions', 'mod_forum_external', 'get_forum_discussions', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(157, 'mod_forum_get_forum_discussion_posts', 'mod_forum_external', 'get_forum_discussion_posts', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(158, 'mod_forum_get_forum_discussions_paginated', 'mod_forum_external', 'get_forum_discussions_paginated', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(159, 'mod_forum_view_forum', 'mod_forum_external', 'view_forum', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion'),
(160, 'mod_forum_view_forum_discussion', 'mod_forum_external', 'view_forum_discussion', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion'),
(161, 'mod_forum_add_discussion_post', 'mod_forum_external', 'add_discussion_post', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:replypost'),
(162, 'mod_forum_add_discussion', 'mod_forum_external', 'add_discussion', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:startdiscussion'),
(163, 'mod_imscp_view_imscp', 'mod_imscp_external', 'view_imscp', NULL, 'mod_imscp', 'mod/imscp:view'),
(164, 'mod_imscp_get_imscps_by_courses', 'mod_imscp_external', 'get_imscps_by_courses', NULL, 'mod_imscp', 'moodle/imscp:view'),
(165, 'mod_lti_get_tool_launch_data', 'mod_lti_external', 'get_tool_launch_data', NULL, 'mod_lti', 'mod/lti:view'),
(166, 'mod_lti_get_ltis_by_courses', 'mod_lti_external', 'get_ltis_by_courses', NULL, 'mod_lti', 'mod/lti:view'),
(167, 'mod_lti_view_lti', 'mod_lti_external', 'view_lti', NULL, 'mod_lti', 'mod/lti:view'),
(168, 'mod_page_view_page', 'mod_page_external', 'view_page', NULL, 'mod_page', 'mod/page:view'),
(169, 'mod_resource_view_resource', 'mod_resource_external', 'view_resource', NULL, 'mod_resource', 'mod/resource:view'),
(170, 'mod_scorm_view_scorm', 'mod_scorm_external', 'view_scorm', NULL, 'mod_scorm', ''),
(171, 'mod_scorm_get_scorm_attempt_count', 'mod_scorm_external', 'get_scorm_attempt_count', NULL, 'mod_scorm', ''),
(172, 'mod_scorm_get_scorm_scoes', 'mod_scorm_external', 'get_scorm_scoes', NULL, 'mod_scorm', ''),
(173, 'mod_scorm_get_scorm_user_data', 'mod_scorm_external', 'get_scorm_user_data', NULL, 'mod_scorm', ''),
(174, 'mod_scorm_insert_scorm_tracks', 'mod_scorm_external', 'insert_scorm_tracks', NULL, 'mod_scorm', 'mod/scorm:savetrack'),
(175, 'mod_scorm_get_scorm_sco_tracks', 'mod_scorm_external', 'get_scorm_sco_tracks', NULL, 'mod_scorm', ''),
(176, 'mod_scorm_get_scorms_by_courses', 'mod_scorm_external', 'get_scorms_by_courses', NULL, 'mod_scorm', ''),
(177, 'mod_survey_get_surveys_by_courses', 'mod_survey_external', 'get_surveys_by_courses', NULL, 'mod_survey', ''),
(178, 'mod_survey_view_survey', 'mod_survey_external', 'view_survey', NULL, 'mod_survey', 'mod/survey:participate'),
(179, 'mod_survey_get_questions', 'mod_survey_external', 'get_questions', NULL, 'mod_survey', 'mod/survey:participate'),
(180, 'mod_survey_submit_answers', 'mod_survey_external', 'submit_answers', NULL, 'mod_survey', 'mod/survey:participate'),
(181, 'mod_url_view_url', 'mod_url_external', 'view_url', NULL, 'mod_url', 'mod/url:view'),
(182, 'moodle_enrol_manual_enrol_users', 'moodle_enrol_manual_external', 'manual_enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(183, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(184, 'enrol_manual_unenrol_users', 'enrol_manual_external', 'unenrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:unenrol'),
(185, 'enrol_self_get_instance_info', 'enrol_self_external', 'get_instance_info', 'enrol/self/externallib.php', 'enrol_self', ''),
(186, 'enrol_self_enrol_user', 'enrol_self_external', 'enrol_user', 'enrol/self/externallib.php', 'enrol_self', ''),
(187, 'message_airnotifier_is_system_configured', 'message_airnotifier_external', 'is_system_configured', 'message/output/airnotifier/externallib.php', 'message_airnotifier', ''),
(188, 'message_airnotifier_are_notification_preferences_configured', 'message_airnotifier_external', 'are_notification_preferences_configured', 'message/output/airnotifier/externallib.php', 'message_airnotifier', ''),
(189, 'gradereport_user_get_grades_table', 'gradereport_user_external', 'get_grades_table', 'grade/report/user/externallib.php', 'gradereport_user', 'gradereport/user:view'),
(190, 'gradereport_user_view_grade_report', 'gradereport_user_external', 'view_grade_report', 'grade/report/user/externallib.php', 'gradereport_user', 'gradereport/user:view'),
(191, 'tool_templatelibrary_list_templates', 'tool_templatelibrary\\external', 'list_templates', NULL, 'tool_templatelibrary', ''),
(192, 'tool_templatelibrary_load_canonical_template', 'tool_templatelibrary\\external', 'load_canonical_template', NULL, 'tool_templatelibrary', ''),
(311, 'block_kaplan_plugin_get_users_custom', 'block_kaplan_plugin_external', 'get_users_custom', 'blocks/kaplan_plugin/externallib.php', 'block_kaplan_plugin', ''),
(312, 'block_kaplan_plugin_get_courses_custom', 'block_kaplan_plugin_external', 'get_courses_custom', 'blocks/kaplan_plugin/externallib.php', 'block_kaplan_plugin', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services` (
  `id` bigint(10) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='built in and custom external services';

--
-- Dumping data for table `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`, `uploadfiles`) VALUES
(1, 'Moodle mobile web service', 1, NULL, 0, 'moodle', 1458047382, 1458066926, 'moodle_mobile_app', 1, 1),
(71, 'Custom Users and Courses Functions', 1, NULL, 0, 'block_kaplan_plugin', 1458190252, NULL, 'get_users_courses_custom', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lists functions available in each service group';

--
-- Dumping data for table `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'moodle_enrol_get_users_courses'),
(2, 1, 'moodle_enrol_get_enrolled_users'),
(3, 1, 'moodle_user_get_users_by_id'),
(4, 1, 'moodle_webservice_get_siteinfo'),
(5, 1, 'moodle_notes_create_notes'),
(6, 1, 'moodle_user_get_course_participants_by_id'),
(7, 1, 'moodle_user_get_users_by_courseid'),
(8, 1, 'moodle_message_send_instantmessages'),
(9, 1, 'core_course_get_contents'),
(10, 1, 'core_get_component_strings'),
(11, 1, 'core_user_add_user_device'),
(12, 1, 'core_calendar_get_calendar_events'),
(13, 1, 'core_enrol_get_users_courses'),
(14, 1, 'core_enrol_get_enrolled_users'),
(15, 1, 'core_enrol_get_course_enrolment_methods'),
(16, 1, 'enrol_self_enrol_user'),
(17, 1, 'core_user_get_users_by_id'),
(18, 1, 'core_webservice_get_site_info'),
(19, 1, 'core_notes_create_notes'),
(20, 1, 'core_user_get_course_user_profiles'),
(21, 1, 'core_message_send_instant_messages'),
(22, 1, 'mod_assign_get_grades'),
(23, 1, 'mod_assign_get_assignments'),
(24, 1, 'mod_assign_get_submissions'),
(25, 1, 'mod_assign_get_user_flags'),
(26, 1, 'mod_assign_set_user_flags'),
(27, 1, 'mod_assign_get_user_mappings'),
(28, 1, 'mod_assign_revert_submissions_to_draft'),
(29, 1, 'mod_assign_lock_submissions'),
(30, 1, 'mod_assign_unlock_submissions'),
(31, 1, 'mod_assign_save_submission'),
(32, 1, 'mod_assign_submit_for_grading'),
(33, 1, 'mod_assign_save_grade'),
(34, 1, 'mod_assign_save_user_extensions'),
(35, 1, 'mod_assign_reveal_identities'),
(36, 1, 'message_airnotifier_is_system_configured'),
(37, 1, 'message_airnotifier_are_notification_preferences_configured'),
(38, 1, 'core_grades_update_grades'),
(39, 1, 'mod_forum_get_forums_by_courses'),
(40, 1, 'mod_forum_get_forum_discussions_paginated'),
(41, 1, 'mod_forum_get_forum_discussion_posts'),
(42, 1, 'mod_forum_add_discussion_post'),
(43, 1, 'mod_forum_add_discussion'),
(44, 1, 'core_files_get_files'),
(45, 1, 'core_message_get_messages'),
(46, 1, 'core_message_create_contacts'),
(47, 1, 'core_message_delete_contacts'),
(48, 1, 'core_message_block_contacts'),
(49, 1, 'core_message_unblock_contacts'),
(50, 1, 'core_message_get_contacts'),
(51, 1, 'core_message_search_contacts'),
(52, 1, 'core_message_get_blocked_users'),
(53, 1, 'gradereport_user_get_grades_table'),
(54, 1, 'core_group_get_course_user_groups'),
(55, 1, 'core_group_get_activity_allowed_groups'),
(56, 1, 'core_group_get_activity_groupmode'),
(57, 1, 'core_user_remove_user_device'),
(58, 1, 'core_course_get_courses'),
(59, 1, 'core_completion_update_activity_completion_status_manually'),
(60, 1, 'core_completion_mark_course_self_completed'),
(61, 1, 'mod_data_get_databases_by_courses'),
(62, 1, 'core_comment_get_comments'),
(63, 1, 'mod_forum_view_forum'),
(64, 1, 'core_course_view_course'),
(65, 1, 'core_course_search_courses'),
(66, 1, 'core_course_get_course_module'),
(67, 1, 'core_course_get_course_module_by_instance'),
(68, 1, 'core_completion_get_activities_completion_status'),
(69, 1, 'core_notes_get_course_notes'),
(70, 1, 'core_completion_get_course_completion_status'),
(71, 1, 'core_user_view_user_list'),
(72, 1, 'core_message_mark_message_read'),
(73, 1, 'core_notes_view_notes'),
(74, 1, 'core_notes_delete_notes'),
(75, 1, 'mod_forum_view_forum_discussion'),
(76, 1, 'core_user_view_user_profile'),
(77, 1, 'gradereport_user_view_grade_report'),
(78, 1, 'core_rating_get_item_ratings'),
(79, 1, 'mod_url_view_url'),
(80, 1, 'core_user_get_users_by_field'),
(81, 1, 'core_user_add_user_private_files'),
(82, 1, 'mod_assign_view_grading_table'),
(83, 1, 'mod_scorm_view_scorm'),
(84, 1, 'mod_scorm_get_scorm_scoes'),
(85, 1, 'mod_scorm_get_scorm_user_data'),
(86, 1, 'mod_scorm_insert_scorm_tracks'),
(87, 1, 'mod_scorm_get_scorm_sco_tracks'),
(88, 1, 'mod_scorm_get_scorm_attempt_count'),
(89, 1, 'mod_scorm_get_scorms_by_courses'),
(90, 1, 'mod_survey_get_surveys_by_courses'),
(91, 1, 'mod_survey_view_survey'),
(92, 1, 'mod_survey_get_questions'),
(93, 1, 'mod_survey_submit_answers'),
(94, 1, 'mod_page_view_page'),
(95, 1, 'mod_resource_view_resource'),
(96, 1, 'mod_folder_view_folder'),
(97, 1, 'mod_chat_login_user'),
(98, 1, 'mod_chat_get_chat_users'),
(99, 1, 'mod_chat_send_chat_message'),
(100, 1, 'mod_chat_get_chat_latest_messages'),
(101, 1, 'mod_chat_view_chat'),
(102, 1, 'mod_chat_get_chats_by_courses'),
(103, 1, 'mod_book_view_book'),
(104, 1, 'mod_book_get_books_by_courses'),
(105, 1, 'mod_choice_get_choice_results'),
(106, 1, 'mod_choice_get_choice_options'),
(107, 1, 'mod_choice_submit_choice_response'),
(108, 1, 'mod_choice_view_choice'),
(109, 1, 'mod_choice_get_choices_by_courses'),
(110, 1, 'mod_choice_delete_choice_responses'),
(111, 1, 'mod_lti_get_tool_launch_data'),
(112, 1, 'mod_lti_get_ltis_by_courses'),
(113, 1, 'mod_lti_view_lti'),
(114, 1, 'mod_imscp_view_imscp'),
(115, 1, 'mod_imscp_get_imscps_by_courses'),
(238, 71, 'block_kaplan_plugin_get_users_custom'),
(239, 71, 'block_kaplan_plugin_get_courses_custom');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_users`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
  `id` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='users allowed to use services with restricted users flag';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_tokens`
--

CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
  `id` bigint(10) NOT NULL,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Security tokens for accessing of external services';

--
-- Dumping data for table `mdl_external_tokens`
--

INSERT INTO `mdl_external_tokens` (`id`, `token`, `tokentype`, `userid`, `externalserviceid`, `sid`, `contextid`, `creatorid`, `iprestriction`, `validuntil`, `timecreated`, `lastaccess`) VALUES
(1, 'f9c3f923b7253fae41d0c25d4f6ef5bb', 0, 2, 1, NULL, 1, 2, NULL, 1465325275, 1458067675, 1458134268),
(21, 'f9a0febc6002fed26a356315f701de14', 0, 2, 71, NULL, 1, 2, NULL, 0, 1458190279, 1458190324);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_after_submit` longtext COLLATE utf8_unicode_ci NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all feedbacks';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completed`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completedtmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_item`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) NOT NULL,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `presentation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `typ` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback_items';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback sitecourse map';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_template`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='templates of feedbackstructures';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_tracking`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_tracking` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback trackingdata';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_value`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
  `id` bigint(10) NOT NULL,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completeds';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_valuetmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completedstmp';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files`
--

CREATE TABLE IF NOT EXISTS `mdl_files` (
  `id` bigint(10) NOT NULL,
  `contenthash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='description of files, content is stored in sha1 file pool';

--
-- Dumping data for table `mdl_files`
--

INSERT INTO `mdl_files` (`id`, `contenthash`, `pathnamehash`, `contextid`, `component`, `filearea`, `itemid`, `filepath`, `filename`, `userid`, `filesize`, `mimetype`, `status`, `source`, `author`, `license`, `timecreated`, `timemodified`, `sortorder`, `referencefileid`) VALUES
(1, '41cfeee5884a43a4650a851f4f85e7b28316fcc9', 'a48e186a2cc853a9e94e9305f4e9bc086391212d', 1, 'theme_more', 'backgroundimage', 0, '/', 'background.jpg', 2, 4451, 'image/jpeg', 0, NULL, NULL, NULL, 1458047426, 1458047426, 0, NULL),
(2, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'd1da7ab1bb9c08a926037367bf8ce9a838034ead', 1, 'theme_more', 'backgroundimage', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1458047426, 1458047426, 0, NULL),
(3, 'fb262df98d67c4e2a5c9802403821e00cf2992af', '508e674d49c30d4fde325fe6c7f6fd3d56b247e1', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'smile.png', 2, 1600, 'image/png', 0, NULL, NULL, NULL, 1458047427, 1458047427, 0, NULL),
(4, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '70b7cdade7b4e27d4e83f0cdaad10d6a3c0cccb5', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1458047427, 1458047427, 0, NULL),
(5, 'a4f146f120e7e00d21291b924e26aaabe9f4297a', '68317eab56c67d32aeaee5acf509a0c4aa828b6b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'sad.png', 2, 1702, 'image/png', 0, NULL, NULL, NULL, 1458047427, 1458047427, 0, NULL),
(6, '33957e31ba9c763a74638b825f0a9154acf475e1', '695a55ff780e61c9e59428aa425430b0d6bde53b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'tick.png', 2, 1187, 'image/png', 0, NULL, NULL, NULL, 1458047427, 1458047427, 0, NULL),
(7, 'd613d55f37bb76d38d4ffb4b7b83e6c694778c30', '373e63af262a9b8466ba8632551520be793c37ff', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'cross.png', 2, 1230, 'image/png', 0, NULL, NULL, NULL, 1458047427, 1458047427, 0, NULL),
(8, '68e630d23ce8dde46dd7746e83e216260c8e5f89', '7eb78d40990f0b57325bde1eab37e422a62b04b0', 5, 'user', 'draft', 725180350, '/', 'wstemplate.zip', 2, 10801, 'application/zip', 0, 'O:8:"stdClass":1:{s:6:"source";s:34:"moodle-local_wstemplate-master.zip";}', 'Admin User', 'allrightsreserved', 1458106459, 1458106459, 0, NULL),
(9, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '648eb72274e0a8eb9f4d448ae61336bebb8b8808', 5, 'user', 'draft', 725180350, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1458106459, 1458106459, 0, NULL),
(10, 'db5f2dad6b1ab2c2765ee1b4633682b91af005f6', 'f15ecd4404d18cb8df37186d3983175c84cb3520', 5, 'user', 'draft', 989579208, '/', 'notags.csv', 2, 1217687, 'text/csv', 0, 'O:8:"stdClass":1:{s:6:"source";s:10:"notags.csv";}', 'Admin User', 'allrightsreserved', 1458127427, 1458127427, 0, NULL),
(11, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '199777cdce68af8c69a0952c5d3d951c48164163', 5, 'user', 'draft', 989579208, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1458127427, 1458127427, 0, NULL),
(13, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'a30b51d1b7fe96885f4b6a30bfa3d174132fbf74', 5, 'user', 'private', 0, '/', '.', 2, 0, 'document/unknown', 0, NULL, NULL, NULL, 1458127427, 1458148869, 0, NULL),
(14, 'db5f2dad6b1ab2c2765ee1b4633682b91af005f6', '6a68813a3d2595208040a668890791864660d320', 5, 'user', 'draft', 713221445, '/', 'notags.csv', 2, 1217687, 'text/csv', 0, 'O:8:"stdClass":2:{s:6:"source";s:10:"notags.csv";s:8:"original";s:208:"YTo2OntzOjk6ImNvbnRleHRpZCI7aTo1O3M6OToiY29tcG9uZW50IjtzOjQ6InVzZXIiO3M6NjoiaXRlbWlkIjtpOjA7czo4OiJmaWxlYXJlYSI7czo3OiJwcml2YXRlIjtzOjg6ImZpbGVwYXRoIjtzOjE6Ii8iO3M6ODoiZmlsZW5hbWUiO3M6MTA6Im5vdGFncy5jc3YiO30=";}', 'Admin User', 'allrightsreserved', 1458127427, 1458127429, 0, NULL),
(15, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'f192516e0b2a5821d6bb3f24feadf5b290a1cd78', 5, 'user', 'draft', 713221445, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1458132805, 1458132805, 0, NULL),
(17, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '17a21e8587a194d7c205f9fc8322b1ef57411bdc', 5, 'user', 'draft', 448612956, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1458148824, 1458148824, 0, NULL),
(19, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '94d9c3a54948452be725421b9fe311b19befb75b', 5, 'user', 'draft', 65969040, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1458148869, 1458148869, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files_reference`
--

CREATE TABLE IF NOT EXISTS `mdl_files_reference` (
  `id` bigint(10) NOT NULL,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext COLLATE utf8_unicode_ci,
  `referencehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store files references';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_active`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
  `id` bigint(10) NOT NULL,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores information about which filters are active in which c';

--
-- Dumping data for table `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'activitynames', 1, 1, 2),
(2, 'mathjaxloader', 1, 1, 1),
(3, 'mediaplugin', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_config`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
  `id` bigint(10) NOT NULL,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores per-context configuration settings for filters which ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_folder`
--

CREATE TABLE IF NOT EXISTS `mdl_folder` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one folder resource';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum`
--

CREATE TABLE IF NOT EXISTS `mdl_forum` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums contain and structure discussion';

--
-- Dumping data for table `mdl_forum`
--

INSERT INTO `mdl_forum` (`id`, `course`, `type`, `name`, `intro`, `introformat`, `assessed`, `assesstimestart`, `assesstimefinish`, `scale`, `maxbytes`, `maxattachments`, `forcesubscribe`, `trackingtype`, `rsstype`, `rssarticles`, `timemodified`, `warnafter`, `blockafter`, `blockperiod`, `completiondiscussions`, `completionreplies`, `completionposts`, `displaywordcount`) VALUES
(1, 2, 'news', 'News forum', 'General news and announcements', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1458048233, 0, 0, 0, 0, 0, 0, 0),
(2, 3, 'news', 'News forum', 'General news and announcements', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1458139135, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_digests`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_digests` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of user mail delivery preferences for each forum';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums are composed of discussions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussion_subs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussion_subs` (
  `id` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `discussion` bigint(10) NOT NULL,
  `preference` bigint(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users may choose to subscribe and unsubscribe from specific ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_posts`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
  `id` bigint(10) NOT NULL,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All posts are stored in this table';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping track of posts that will be mailed in digest for';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_read`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users read posts';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of who is subscribed to what forum';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_track_prefs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users untracked forums';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossaries';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_alias`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='entries alias';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all categories for glossary entries';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `definition` longtext COLLATE utf8_unicode_ci NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossary entries';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='categories of each glossary entry';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_formats`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `popupformatname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `showtabs` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultmode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaulthook` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortkey` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting of the display formats';

--
-- Dumping data for table `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `showtabs`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, 'standard,category,date', '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, 'standard', '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, 'standard,category,date,author', '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, 'standard,category,date,author', '', '', '', ''),
(5, 'faq', 'faq', 1, 1, 'standard,category,date,author', '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, 'standard,category,date,author', '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, 'standard,category,date', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about categories, used for grou';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_categories';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
  `id` bigint(10) NOT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `aggregationstatus` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `aggregationweight` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='grade_grades  This table keeps individual grades for each us';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_newitem`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='temporary table for storing new grade_item names from grade ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_values`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  `importonlyfeedback` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary table for importing grades';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about gradeable items (ie colum';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_items';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_letters`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Repository for grade letters, for courses and other moodle e';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes the outcomes used in the system. An out';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores what outcomes are used in what courses.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='gradebook settings';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='frequently used comments used in marking guide';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext COLLATE utf8_unicode_ci,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the criteria grid.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the guide is filled by a particular r';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the rubric grid.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the rubric is filled by a particular ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the columns of the rubric grid.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_areas`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_areas` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `areaname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `activemethod` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Identifies gradable areas where advanced grading can happen.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the basic information about an advanced grading for';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_instances` (
  `id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading form instance is an assessment record for one gradab';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A grouping is a collection of groups. WAS: groups_groupings';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a grouping to a group (note, groups can be in multiple ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groups` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents a group.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups_members`
--

CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
  `id` bigint(10) NOT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a group.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_imscp`
--

CREATE TABLE IF NOT EXISTS `mdl_imscp` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one imscp resource';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_label`
--

CREATE TABLE IF NOT EXISTS `mdl_label` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines labels';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionendreached` tinyint(1) DEFAULT '0',
  `completiontimespent` bigint(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext COLLATE utf8_unicode_ci,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_answers';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext COLLATE utf8_unicode_ci,
  `timeseen` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_attempts';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_branch`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='branches for each lesson/user';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_grades';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_overrides` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `available` bigint(10) DEFAULT NULL,
  `deadline` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `review` smallint(3) DEFAULT NULL,
  `maxattempts` smallint(3) DEFAULT NULL,
  `retake` smallint(3) DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to lesson settings.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contents` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_pages';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_timer`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lesson timer for each lesson';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_license`
--

CREATE TABLE IF NOT EXISTS `mdl_license` (
  `id` bigint(10) NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` longtext COLLATE utf8_unicode_ci,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='store licenses used by moodle';

--
-- Dumping data for table `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nc/3.0/', 1, 2013051500),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lock_db`
--

CREATE TABLE IF NOT EXISTS `mdl_lock_db` (
  `id` bigint(10) NOT NULL,
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) DEFAULT NULL,
  `owner` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores active and inactive lock types for db locking method.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log`
--

CREATE TABLE IF NOT EXISTS `mdl_log` (
  `id` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Every action is logged as far as possible';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_logstore_standard_log`
--

CREATE TABLE IF NOT EXISTS `mdl_logstore_standard_log` (
  `id` bigint(10) NOT NULL,
  `eventname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `objecttable` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `objectid` bigint(10) DEFAULT NULL,
  `crud` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `edulevel` tinyint(1) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `relateduserid` bigint(10) DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `other` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `origin` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realuserid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=591 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Standard log table';

--
-- Dumping data for table `mdl_logstore_standard_log`
--

INSERT INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
(1, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1458048023, 'web', '127.0.0.1', NULL),
(2, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 5, 30, 2, 2, 0, 2, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1458048083, 'web', '127.0.0.1', NULL),
(3, '\\core\\event\\user_updated', 'core', 'updated', 'user', 'user', 2, 'u', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1458048083, 'web', '127.0.0.1', NULL),
(4, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1458048117, 'web', '127.0.0.1', NULL),
(5, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"ir8otkf4ftsq0eekcab2uri3r4";}', 1458048124, 'web', '127.0.0.1', NULL),
(6, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1458048125, 'web', '127.0.0.1', NULL),
(7, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1458048138, 'web', '127.0.0.1', NULL),
(8, '\\core\\event\\course_created', 'core', 'created', 'course', 'course', 2, 'c', 1, 24, 50, 2, 2, 2, NULL, 0, 'a:2:{s:9:"shortname";s:4:"test";s:8:"fullname";s:4:"Test";}', 1458048226, 'web', '127.0.0.1', NULL),
(9, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 1, 'c', 0, 24, 50, 2, 2, 2, NULL, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1458048226, 'web', '127.0.0.1', NULL),
(10, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 2, 'c', 0, 24, 50, 2, 2, 2, NULL, 0, 'a:1:{s:5:"enrol";s:5:"guest";}', 1458048226, 'web', '127.0.0.1', NULL),
(11, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 3, 'c', 0, 24, 50, 2, 2, 2, NULL, 0, 'a:1:{s:5:"enrol";s:4:"self";}', 1458048226, 'web', '127.0.0.1', NULL),
(12, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458048234, 'web', '127.0.0.1', NULL),
(13, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458048234, 'web', '127.0.0.1', NULL),
(14, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458048240, 'web', '127.0.0.1', NULL),
(15, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458048251, 'web', '127.0.0.1', NULL),
(16, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458048255, 'web', '127.0.0.1', NULL),
(17, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1458058199, 'web', '127.0.0.1', NULL),
(18, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458058199, 'web', '127.0.0.1', NULL),
(19, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458058226, 'web', '127.0.0.1', NULL),
(20, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458062981, 'web', '127.0.0.1', NULL),
(21, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458062999, 'web', '127.0.0.1', NULL),
(22, '\\core\\event\\webservice_service_created', 'core', 'created', 'webservice_service', 'external_services', 2, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458063571, 'web', '127.0.0.1', NULL),
(23, '\\core\\event\\webservice_service_deleted', 'core', 'deleted', 'webservice_service', 'external_services', 2, 'd', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458063657, 'web', '127.0.0.1', NULL),
(24, '\\core\\event\\webservice_service_created', 'core', 'created', 'webservice_service', 'external_services', 3, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458063683, 'web', '127.0.0.1', NULL),
(25, '\\core\\event\\webservice_service_deleted', 'core', 'deleted', 'webservice_service', 'external_services', 3, 'd', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458063773, 'web', '127.0.0.1', NULL),
(26, '\\core\\event\\user_login_failed', 'core', 'failed', 'user_login', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:2:{s:8:"username";s:5:"admin";s:6:"reason";i:3;}', 1458066373, 'web', '127.0.0.1', NULL),
(27, '\\core\\event\\webservice_token_created', 'core', 'created', 'webservice_token', 'external_tokens', 1, 'c', 0, 1, 10, 0, 2, 0, 2, 0, 'a:1:{s:4:"auto";b:1;}', 1458067675, 'web', '127.0.0.1', NULL),
(28, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458067676, 'web', '127.0.0.1', NULL),
(29, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458068307, 'web', '127.0.0.1', NULL),
(30, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458068310, 'web', '127.0.0.1', NULL),
(31, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458068409, 'web', '127.0.0.1', NULL),
(32, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458068413, 'web', '127.0.0.1', NULL),
(33, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1458094136, 'web', '127.0.0.1', NULL),
(34, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1458094178, 'web', '127.0.0.1', NULL),
(35, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1458094190, 'web', '127.0.0.1', NULL),
(36, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458094215, 'web', '127.0.0.1', NULL),
(37, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458094285, 'web', '127.0.0.1', NULL),
(38, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458095001, 'web', '127.0.0.1', NULL),
(39, '\\core\\event\\webservice_service_created', 'core', 'created', 'webservice_service', 'external_services', 10, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458095930, 'web', '127.0.0.1', NULL),
(40, '\\core\\event\\webservice_service_deleted', 'core', 'deleted', 'webservice_service', 'external_services', 10, 'd', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458096016, 'web', '127.0.0.1', NULL),
(41, '\\core\\event\\webservice_service_created', 'core', 'created', 'webservice_service', 'external_services', 12, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458096585, 'web', '127.0.0.1', NULL),
(42, '\\core\\event\\webservice_service_updated', 'core', 'updated', 'webservice_service', 'external_services', 12, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458096662, 'web', '127.0.0.1', NULL),
(43, '\\core\\event\\webservice_service_updated', 'core', 'updated', 'webservice_service', 'external_services', 12, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458096688, 'web', '127.0.0.1', NULL),
(44, '\\core\\event\\webservice_service_deleted', 'core', 'deleted', 'webservice_service', 'external_services', 12, 'd', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458099834, 'web', '127.0.0.1', NULL),
(45, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458100028, 'web', '127.0.0.1', NULL),
(46, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458100030, 'web', '127.0.0.1', NULL),
(47, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458100032, 'web', '127.0.0.1', NULL),
(48, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458100293, 'ws', '127.0.0.1', NULL),
(49, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458100334, 'web', '127.0.0.1', NULL),
(50, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458100335, 'web', '127.0.0.1', NULL),
(51, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458100335, 'web', '127.0.0.1', NULL),
(52, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458100343, 'web', '127.0.0.1', NULL),
(53, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458100366, 'ws', '127.0.0.1', NULL),
(54, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458100369, 'ws', '127.0.0.1', NULL),
(55, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458100670, 'web', '127.0.0.1', NULL),
(56, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458100699, 'web', '127.0.0.1', NULL),
(57, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458100705, 'web', '127.0.0.1', NULL),
(58, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458100713, 'web', '127.0.0.1', NULL),
(59, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458100713, 'web', '127.0.0.1', NULL),
(60, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458100925, 'ws', '127.0.0.1', NULL),
(61, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458100925, 'ws', '127.0.0.1', NULL),
(62, '\\core\\event\\webservice_login_failed', 'core', 'failed', 'webservice_login', NULL, NULL, 'r', 0, 1, 10, 0, 0, 0, NULL, 0, 'a:2:{s:6:"method";i:1;s:6:"reason";s:13:"invalid_token";}', 1458101084, 'ws', '127.0.0.1', NULL),
(63, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458101200, 'web', '127.0.0.1', NULL),
(64, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458101203, 'web', '127.0.0.1', NULL),
(65, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458101212, 'ws', '127.0.0.1', NULL),
(66, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458101221, 'ws', '127.0.0.1', NULL),
(67, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458101279, 'ws', '127.0.0.1', NULL),
(68, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458101286, 'ws', '127.0.0.1', NULL),
(69, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458101310, 'ws', '127.0.0.1', NULL),
(70, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458101541, 'web', '127.0.0.1', NULL),
(71, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458101616, 'ws', '127.0.0.1', NULL),
(72, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458101636, 'ws', '127.0.0.1', NULL),
(73, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458101650, 'ws', '127.0.0.1', NULL),
(74, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458101809, 'web', '127.0.0.1', NULL),
(75, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458101811, 'web', '127.0.0.1', NULL),
(76, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458101878, 'ws', '127.0.0.1', NULL),
(77, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458101881, 'ws', '127.0.0.1', NULL),
(78, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458102205, 'ws', '127.0.0.1', NULL),
(79, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458102205, 'ws', '127.0.0.1', NULL),
(80, '\\core\\event\\webservice_service_created', 'core', 'created', 'webservice_service', 'external_services', 14, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458102721, 'web', '127.0.0.1', NULL),
(81, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 3, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458102785, 'web', '127.0.0.1', NULL),
(82, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458102822, 'ws', '127.0.0.1', NULL),
(83, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458102822, 'ws', '127.0.0.1', NULL),
(84, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458102893, 'ws', '127.0.0.1', NULL),
(85, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458102895, 'ws', '127.0.0.1', NULL),
(86, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458103780, 'web', '127.0.0.1', NULL),
(87, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 4, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458103847, 'web', '127.0.0.1', NULL),
(88, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458103944, 'web', '127.0.0.1', NULL),
(89, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458103952, 'web', '127.0.0.1', NULL),
(90, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458103952, 'web', '127.0.0.1', NULL),
(91, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458103961, 'web', '127.0.0.1', NULL),
(92, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458104202, 'ws', '127.0.0.1', NULL),
(93, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 5, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458104591, 'web', '127.0.0.1', NULL),
(94, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 5, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458105690, 'web', '127.0.0.1', NULL),
(95, '\\report_loglive\\event\\report_viewed', 'report_loglive', 'viewed', 'report', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458105931, 'web', '127.0.0.1', NULL),
(96, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1458106063, 'web', '127.0.0.1', NULL),
(97, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1458106073, 'web', '127.0.0.1', NULL),
(98, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458106708, 'ws', '127.0.0.1', NULL),
(99, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458106766, 'ws', '127.0.0.1', NULL),
(100, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 5, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458107160, 'web', '127.0.0.1', NULL),
(101, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458107222, 'web', '127.0.0.1', NULL),
(102, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458107225, 'web', '127.0.0.1', NULL),
(103, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458107342, 'ws', '127.0.0.1', NULL),
(104, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458107401, 'ws', '127.0.0.1', NULL),
(105, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458108198, 'ws', '127.0.0.1', NULL),
(106, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458108222, 'ws', '127.0.0.1', NULL),
(107, '\\core\\event\\webservice_service_deleted', 'core', 'deleted', 'webservice_service', 'external_services', 14, 'd', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458108272, 'web', '127.0.0.1', NULL),
(108, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458108714, 'ws', '127.0.0.1', NULL),
(109, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109137, 'ws', '127.0.0.1', NULL),
(110, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109142, 'ws', '127.0.0.1', NULL),
(111, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109175, 'ws', '127.0.0.1', NULL),
(112, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109185, 'ws', '127.0.0.1', NULL),
(113, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109263, 'ws', '127.0.0.1', NULL),
(114, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109578, 'ws', '127.0.0.1', NULL),
(115, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109586, 'ws', '127.0.0.1', NULL),
(116, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109645, 'ws', '127.0.0.1', NULL),
(117, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109672, 'ws', '127.0.0.1', NULL),
(118, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109673, 'ws', '127.0.0.1', NULL),
(119, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109675, 'ws', '127.0.0.1', NULL),
(120, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109700, 'ws', '127.0.0.1', NULL),
(121, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109734, 'ws', '127.0.0.1', NULL),
(122, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109735, 'ws', '127.0.0.1', NULL),
(123, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109768, 'ws', '127.0.0.1', NULL),
(124, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109783, 'ws', '127.0.0.1', NULL),
(125, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109785, 'ws', '127.0.0.1', NULL),
(126, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109911, 'ws', '127.0.0.1', NULL),
(127, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458109912, 'ws', '127.0.0.1', NULL),
(128, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458110081, 'ws', '127.0.0.1', NULL),
(129, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458110280, 'ws', '127.0.0.1', NULL),
(130, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458110440, 'ws', '127.0.0.1', NULL),
(131, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458110570, 'ws', '127.0.0.1', NULL),
(132, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458110598, 'ws', '127.0.0.1', NULL),
(133, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458110716, 'ws', '127.0.0.1', NULL),
(134, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458110743, 'ws', '127.0.0.1', NULL),
(135, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458110808, 'ws', '127.0.0.1', NULL),
(136, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458111010, 'ws', '127.0.0.1', NULL),
(137, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458111210, 'web', '127.0.0.1', NULL),
(138, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458111237, 'ws', '127.0.0.1', NULL),
(139, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458113238, 'ws', '127.0.0.1', NULL),
(140, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458113274, 'ws', '127.0.0.1', NULL),
(141, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458113349, 'ws', '127.0.0.1', NULL),
(142, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458113363, 'web', '127.0.0.1', NULL),
(143, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458113386, 'web', '127.0.0.1', NULL),
(144, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458113391, 'web', '127.0.0.1', NULL),
(145, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458113416, 'web', '127.0.0.1', NULL),
(146, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458113492, 'web', '127.0.0.1', NULL),
(147, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 24, 50, 2, 2, 2, 2, 0, 'a:3:{s:8:"courseid";s:1:"2";s:15:"courseshortname";s:4:"test";s:14:"coursefullname";s:4:"Test";}', 1458113502, 'web', '127.0.0.1', NULL),
(148, '\\core\\event\\notes_viewed', 'core', 'viewed', 'notes', NULL, NULL, 'r', 0, 24, 50, 2, 2, 2, 0, 0, 'N;', 1458113511, 'web', '127.0.0.1', NULL),
(149, '\\core\\event\\blog_entries_viewed', 'core', 'viewed', 'blog_entries', NULL, NULL, 'r', 2, 1, 10, 0, 2, 0, NULL, 0, 'a:8:{s:7:"entryid";N;s:5:"tagid";N;s:6:"userid";N;s:5:"modid";N;s:7:"groupid";N;s:6:"search";N;s:9:"fromstart";i:0;s:8:"courseid";s:1:"2";}', 1458113518, 'web', '127.0.0.1', NULL),
(150, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458113565, 'ws', '127.0.0.1', NULL),
(151, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458114060, 'web', '127.0.0.1', NULL),
(152, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458114101, 'web', '127.0.0.1', NULL),
(153, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458114109, 'web', '127.0.0.1', NULL),
(154, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458114110, 'web', '127.0.0.1', NULL),
(155, '\\core\\event\\user_enrolment_created', 'core', 'created', 'user_enrolment', 'user_enrolments', 1, 'c', 0, 24, 50, 2, 2, 2, 2, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1458114202, 'web', '127.0.0.1', NULL),
(156, '\\core\\event\\role_assigned', 'core', 'assigned', 'role', 'role', 5, 'c', 0, 24, 50, 2, 2, 2, 2, 0, 'a:3:{s:2:"id";i:1;s:9:"component";s:0:"";s:6:"itemid";i:0;}', 1458114202, 'web', '127.0.0.1', NULL),
(157, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458114233, 'ws', '127.0.0.1', NULL),
(158, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458115148, 'ws', '127.0.0.1', NULL),
(159, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458115148, 'ws', '127.0.0.1', NULL),
(160, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458115470, 'ws', '127.0.0.1', NULL),
(161, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458115470, 'ws', '127.0.0.1', NULL),
(162, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458115546, 'ws', '127.0.0.1', NULL),
(163, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458115546, 'ws', '127.0.0.1', NULL),
(164, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458115883, 'ws', '127.0.0.1', NULL),
(165, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458115883, 'ws', '127.0.0.1', NULL),
(166, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458115996, 'ws', '127.0.0.1', NULL),
(167, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458115997, 'ws', '127.0.0.1', NULL),
(168, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458116328, 'ws', '127.0.0.1', NULL),
(169, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458116328, 'ws', '127.0.0.1', NULL),
(170, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458116841, 'ws', '127.0.0.1', NULL),
(171, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458116841, 'ws', '127.0.0.1', NULL),
(172, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458117564, 'ws', '127.0.0.1', NULL),
(173, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458117564, 'ws', '127.0.0.1', NULL),
(174, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1458117755, 'web', '127.0.0.1', NULL),
(175, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118267, 'ws', '127.0.0.1', NULL),
(176, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118268, 'ws', '127.0.0.1', NULL),
(177, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118290, 'ws', '127.0.0.1', NULL),
(178, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118290, 'ws', '127.0.0.1', NULL),
(179, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118332, 'ws', '127.0.0.1', NULL),
(180, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118332, 'ws', '127.0.0.1', NULL),
(181, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118481, 'ws', '127.0.0.1', NULL),
(182, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118481, 'ws', '127.0.0.1', NULL),
(183, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118683, 'ws', '127.0.0.1', NULL),
(184, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118683, 'ws', '127.0.0.1', NULL),
(185, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118711, 'ws', '127.0.0.1', NULL),
(186, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118711, 'ws', '127.0.0.1', NULL),
(187, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118740, 'ws', '127.0.0.1', NULL),
(188, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458118740, 'ws', '127.0.0.1', NULL),
(189, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119363, 'ws', '127.0.0.1', NULL),
(190, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119363, 'ws', '127.0.0.1', NULL),
(191, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119371, 'ws', '127.0.0.1', NULL),
(192, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119371, 'ws', '127.0.0.1', NULL),
(193, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119419, 'ws', '127.0.0.1', NULL),
(194, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119419, 'ws', '127.0.0.1', NULL),
(195, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119448, 'ws', '127.0.0.1', NULL),
(196, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119448, 'ws', '127.0.0.1', NULL),
(197, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119490, 'ws', '127.0.0.1', NULL),
(198, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119490, 'ws', '127.0.0.1', NULL),
(199, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119495, 'ws', '127.0.0.1', NULL),
(200, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119495, 'ws', '127.0.0.1', NULL),
(201, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119777, 'ws', '127.0.0.1', NULL),
(202, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119777, 'ws', '127.0.0.1', NULL),
(203, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119863, 'ws', '127.0.0.1', NULL),
(204, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458119863, 'ws', '127.0.0.1', NULL),
(205, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458120454, 'ws', '127.0.0.1', NULL),
(206, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458120454, 'ws', '127.0.0.1', NULL),
(207, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458120664, 'ws', '127.0.0.1', NULL),
(208, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458120677, 'ws', '127.0.0.1', NULL),
(209, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458120684, 'ws', '127.0.0.1', NULL),
(210, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458120701, 'ws', '127.0.0.1', NULL),
(211, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458120743, 'ws', '127.0.0.1', NULL),
(212, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458120746, 'ws', '127.0.0.1', NULL),
(213, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458120747, 'ws', '127.0.0.1', NULL),
(214, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458120757, 'ws', '127.0.0.1', NULL),
(215, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458120757, 'ws', '127.0.0.1', NULL),
(216, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458120805, 'web', '127.0.0.1', NULL),
(217, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 1, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458120808, 'web', '127.0.0.1', NULL),
(218, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 6, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458120838, 'web', '127.0.0.1', NULL),
(219, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458120849, 'ws', '127.0.0.1', NULL),
(220, '\\core\\event\\webservice_login_failed', 'core', 'failed', 'webservice_login', NULL, NULL, 'r', 0, 1, 10, 0, 0, 0, NULL, 0, 'a:2:{s:6:"method";i:1;s:6:"reason";s:13:"invalid_token";}', 1458123392, 'ws', '127.0.0.1', NULL),
(221, '\\core\\event\\webservice_login_failed', 'core', 'failed', 'webservice_login', NULL, NULL, 'r', 0, 1, 10, 0, 0, 0, NULL, 0, 'a:2:{s:6:"method";i:1;s:6:"reason";s:13:"invalid_token";}', 1458123392, 'ws', '127.0.0.1', NULL),
(222, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1458132766, 'web', '127.0.0.1', NULL),
(223, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458133034, 'web', '127.0.0.1', NULL),
(224, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134109, 'ws', '127.0.0.1', NULL),
(225, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134109, 'ws', '127.0.0.1', NULL),
(226, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134122, 'ws', '127.0.0.1', NULL),
(227, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134122, 'ws', '127.0.0.1', NULL),
(228, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134129, 'ws', '127.0.0.1', NULL),
(229, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134130, 'ws', '127.0.0.1', NULL),
(230, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134174, 'ws', '127.0.0.1', NULL),
(231, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134174, 'ws', '127.0.0.1', NULL),
(232, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134224, 'ws', '127.0.0.1', NULL),
(233, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134225, 'ws', '127.0.0.1', NULL),
(234, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134234, 'ws', '127.0.0.1', NULL),
(235, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134234, 'ws', '127.0.0.1', NULL),
(236, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134265, 'ws', '127.0.0.1', NULL),
(237, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134269, 'ws', '127.0.0.1', NULL),
(238, '\\core\\event\\webservice_token_sent', 'core', 'sent', 'webservice_token', 'external_tokens', 7, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1458134308, 'web', '127.0.0.1', NULL),
(239, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134328, 'ws', '127.0.0.1', NULL),
(240, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134328, 'ws', '127.0.0.1', NULL),
(241, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134671, 'ws', '127.0.0.1', NULL),
(242, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134671, 'ws', '127.0.0.1', NULL),
(243, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134697, 'ws', '127.0.0.1', NULL),
(244, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134697, 'ws', '127.0.0.1', NULL),
(245, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134713, 'ws', '127.0.0.1', NULL),
(246, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134713, 'ws', '127.0.0.1', NULL),
(247, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134760, 'ws', '127.0.0.1', NULL),
(248, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134760, 'ws', '127.0.0.1', NULL),
(249, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134793, 'ws', '127.0.0.1', NULL),
(250, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134793, 'ws', '127.0.0.1', NULL),
(251, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134811, 'ws', '127.0.0.1', NULL);
INSERT INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
(252, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134811, 'ws', '127.0.0.1', NULL),
(253, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134822, 'ws', '127.0.0.1', NULL),
(254, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134822, 'ws', '127.0.0.1', NULL),
(255, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134906, 'ws', '127.0.0.1', NULL),
(256, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458134906, 'ws', '127.0.0.1', NULL),
(257, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458135004, 'ws', '127.0.0.1', NULL),
(258, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458135005, 'ws', '127.0.0.1', NULL),
(259, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458135006, 'ws', '127.0.0.1', NULL),
(260, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458135006, 'ws', '127.0.0.1', NULL),
(261, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458135242, 'ws', '127.0.0.1', NULL),
(262, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458135243, 'ws', '127.0.0.1', NULL),
(263, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458135894, 'ws', '127.0.0.1', NULL),
(264, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458135894, 'ws', '127.0.0.1', NULL),
(265, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458137981, 'ws', '127.0.0.1', NULL),
(266, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458137982, 'ws', '127.0.0.1', NULL),
(267, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458138243, 'ws', '127.0.0.1', NULL),
(268, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458138243, 'ws', '127.0.0.1', NULL),
(269, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458138297, 'ws', '127.0.0.1', NULL),
(270, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458138297, 'ws', '127.0.0.1', NULL),
(271, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458138564, 'ws', '127.0.0.1', NULL),
(272, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458138564, 'ws', '127.0.0.1', NULL),
(273, '\\core\\event\\user_created', 'core', 'created', 'user', 'user', 3, 'c', 0, 53, 30, 3, 2, 0, 3, 0, 'N;', 1458138667, 'web', '127.0.0.1', NULL),
(274, '\\core\\event\\user_enrolment_created', 'core', 'created', 'user_enrolment', 'user_enrolments', 2, 'c', 0, 24, 50, 2, 2, 2, 3, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1458138725, 'web', '127.0.0.1', NULL),
(275, '\\core\\event\\role_assigned', 'core', 'assigned', 'role', 'role', 5, 'c', 0, 24, 50, 2, 2, 2, 3, 0, 'a:3:{s:2:"id";i:2;s:9:"component";s:0:"";s:6:"itemid";i:0;}', 1458138725, 'web', '127.0.0.1', NULL),
(276, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458138735, 'ws', '127.0.0.1', NULL),
(277, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458138736, 'ws', '127.0.0.1', NULL),
(278, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458138741, 'ws', '127.0.0.1', NULL),
(279, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458138741, 'ws', '127.0.0.1', NULL),
(280, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458138839, 'ws', '127.0.0.1', NULL),
(281, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458138839, 'ws', '127.0.0.1', NULL),
(282, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 24, 50, 2, 2, 2, NULL, 0, 'N;', 1458139049, 'web', '127.0.0.1', NULL),
(283, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458139070, 'web', '127.0.0.1', NULL),
(284, '\\core\\event\\course_created', 'core', 'created', 'course', 'course', 3, 'c', 1, 54, 50, 3, 2, 3, NULL, 0, 'a:2:{s:9:"shortname";s:5:"test1";s:8:"fullname";s:6:"Test 1";}', 1458139091, 'web', '127.0.0.1', NULL),
(285, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 4, 'c', 0, 54, 50, 3, 2, 3, NULL, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1458139091, 'web', '127.0.0.1', NULL),
(286, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 5, 'c', 0, 54, 50, 3, 2, 3, NULL, 0, 'a:1:{s:5:"enrol";s:5:"guest";}', 1458139092, 'web', '127.0.0.1', NULL),
(287, '\\core\\event\\enrol_instance_created', 'core', 'created', 'enrol_instance', 'enrol', 6, 'c', 0, 54, 50, 3, 2, 3, NULL, 0, 'a:1:{s:5:"enrol";s:4:"self";}', 1458139092, 'web', '127.0.0.1', NULL),
(288, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139096, 'ws', '127.0.0.1', NULL),
(289, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139096, 'ws', '127.0.0.1', NULL),
(290, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 54, 50, 3, 2, 3, NULL, 0, 'N;', 1458139136, 'web', '127.0.0.1', NULL),
(291, '\\core\\event\\user_enrolment_created', 'core', 'created', 'user_enrolment', 'user_enrolments', 3, 'c', 0, 54, 50, 3, 2, 3, 2, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1458139190, 'web', '127.0.0.1', NULL),
(292, '\\core\\event\\role_assigned', 'core', 'assigned', 'role', 'role', 5, 'c', 0, 54, 50, 3, 2, 3, 2, 0, 'a:3:{s:2:"id";i:3;s:9:"component";s:0:"";s:6:"itemid";i:0;}', 1458139190, 'web', '127.0.0.1', NULL),
(293, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139196, 'ws', '127.0.0.1', NULL),
(294, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139196, 'ws', '127.0.0.1', NULL),
(295, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139282, 'ws', '127.0.0.1', NULL),
(296, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139282, 'ws', '127.0.0.1', NULL),
(297, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139325, 'ws', '127.0.0.1', NULL),
(298, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139325, 'ws', '127.0.0.1', NULL),
(299, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139393, 'ws', '127.0.0.1', NULL),
(300, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139394, 'ws', '127.0.0.1', NULL),
(301, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139572, 'ws', '127.0.0.1', NULL),
(302, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139572, 'ws', '127.0.0.1', NULL),
(303, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139678, 'ws', '127.0.0.1', NULL),
(304, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139678, 'ws', '127.0.0.1', NULL),
(305, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139695, 'ws', '127.0.0.1', NULL),
(306, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139695, 'ws', '127.0.0.1', NULL),
(307, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139721, 'ws', '127.0.0.1', NULL),
(308, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139721, 'ws', '127.0.0.1', NULL),
(309, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139788, 'ws', '127.0.0.1', NULL),
(310, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139788, 'ws', '127.0.0.1', NULL),
(311, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139885, 'ws', '127.0.0.1', NULL),
(312, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139885, 'ws', '127.0.0.1', NULL),
(313, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139989, 'ws', '127.0.0.1', NULL),
(314, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458139989, 'ws', '127.0.0.1', NULL),
(315, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140018, 'ws', '127.0.0.1', NULL),
(316, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140018, 'ws', '127.0.0.1', NULL),
(317, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140049, 'ws', '127.0.0.1', NULL),
(318, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140049, 'ws', '127.0.0.1', NULL),
(319, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140112, 'ws', '127.0.0.1', NULL),
(320, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140112, 'ws', '127.0.0.1', NULL),
(321, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140226, 'ws', '127.0.0.1', NULL),
(322, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140227, 'ws', '127.0.0.1', NULL),
(323, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140259, 'ws', '127.0.0.1', NULL),
(324, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140259, 'ws', '127.0.0.1', NULL),
(325, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140322, 'ws', '127.0.0.1', NULL),
(326, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140322, 'ws', '127.0.0.1', NULL),
(327, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140329, 'ws', '127.0.0.1', NULL),
(328, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140329, 'ws', '127.0.0.1', NULL),
(329, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140635, 'ws', '127.0.0.1', NULL),
(330, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140636, 'ws', '127.0.0.1', NULL),
(331, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140645, 'ws', '127.0.0.1', NULL),
(332, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140645, 'ws', '127.0.0.1', NULL),
(333, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140733, 'ws', '127.0.0.1', NULL),
(334, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140733, 'ws', '127.0.0.1', NULL),
(335, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140800, 'ws', '127.0.0.1', NULL),
(336, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140800, 'ws', '127.0.0.1', NULL),
(337, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140877, 'ws', '127.0.0.1', NULL),
(338, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140878, 'ws', '127.0.0.1', NULL),
(339, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140907, 'ws', '127.0.0.1', NULL),
(340, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458140907, 'ws', '127.0.0.1', NULL),
(341, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458141014, 'ws', '127.0.0.1', NULL),
(342, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458141014, 'ws', '127.0.0.1', NULL),
(343, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458141056, 'ws', '127.0.0.1', NULL),
(344, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458141056, 'ws', '127.0.0.1', NULL),
(345, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458141809, 'ws', '127.0.0.1', NULL),
(346, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458141809, 'ws', '127.0.0.1', NULL),
(347, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458141851, 'ws', '127.0.0.1', NULL),
(348, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458141851, 'ws', '127.0.0.1', NULL),
(349, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458146860, 'ws', '127.0.0.1', NULL),
(350, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458146861, 'ws', '127.0.0.1', NULL),
(351, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"3pfo3qtc2947898ml0mr5b8163";}', 1458151829, 'web', '127.0.0.1', NULL),
(352, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1458151829, 'web', '127.0.0.1', NULL),
(353, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:8:"username";s:6:"seadon";}', 1458151840, 'web', '127.0.0.1', NULL),
(354, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458151868, 'web', '127.0.0.1', NULL),
(355, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458151894, 'web', '127.0.0.1', NULL),
(356, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458152188, 'ws', '127.0.0.1', NULL),
(357, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458152188, 'ws', '127.0.0.1', NULL),
(358, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458152251, 'ws', '127.0.0.1', NULL),
(359, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458152251, 'ws', '127.0.0.1', NULL),
(360, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458152412, 'ws', '127.0.0.1', NULL),
(361, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458152412, 'ws', '127.0.0.1', NULL),
(362, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458152558, 'ws', '127.0.0.1', NULL),
(363, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458152558, 'ws', '127.0.0.1', NULL),
(364, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458152751, 'ws', '127.0.0.1', NULL),
(365, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458152751, 'ws', '127.0.0.1', NULL),
(366, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458153091, 'ws', '127.0.0.1', NULL),
(367, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458153091, 'ws', '127.0.0.1', NULL),
(368, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458153212, 'ws', '127.0.0.1', NULL),
(369, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458153213, 'ws', '127.0.0.1', NULL),
(370, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458153404, 'web', '127.0.0.1', NULL),
(371, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458153410, 'web', '127.0.0.1', NULL),
(372, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458153410, 'web', '127.0.0.1', NULL),
(373, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458153424, 'web', '127.0.0.1', NULL),
(374, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458153478, 'web', '127.0.0.1', NULL),
(375, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458153487, 'web', '127.0.0.1', NULL),
(376, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458153554, 'web', '127.0.0.1', NULL),
(377, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458153699, 'web', '127.0.0.1', NULL),
(378, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1458180702, 'web', '127.0.0.1', NULL),
(379, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1458181005, 'web', '127.0.0.1', NULL),
(380, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181016, 'ws', '127.0.0.1', NULL),
(381, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181016, 'ws', '127.0.0.1', NULL),
(382, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181018, 'ws', '127.0.0.1', NULL),
(383, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181018, 'ws', '127.0.0.1', NULL),
(384, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181180, 'ws', '127.0.0.1', NULL),
(385, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181180, 'ws', '127.0.0.1', NULL),
(386, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1458181203, 'web', '127.0.0.1', NULL),
(387, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181210, 'ws', '127.0.0.1', NULL),
(388, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181210, 'ws', '127.0.0.1', NULL),
(389, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181212, 'ws', '127.0.0.1', NULL),
(390, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181212, 'ws', '127.0.0.1', NULL),
(391, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181238, 'ws', '127.0.0.1', NULL),
(392, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181238, 'ws', '127.0.0.1', NULL),
(393, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181243, 'ws', '127.0.0.1', NULL),
(394, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181243, 'ws', '127.0.0.1', NULL),
(395, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181264, 'ws', '127.0.0.1', NULL),
(396, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181264, 'ws', '127.0.0.1', NULL),
(397, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1458181270, 'web', '127.0.0.1', NULL),
(398, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:8:"username";s:6:"seadon";}', 1458181301, 'web', '127.0.0.1', NULL),
(399, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458181301, 'web', '127.0.0.1', NULL),
(400, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181385, 'ws', '127.0.0.1', NULL),
(401, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181385, 'ws', '127.0.0.1', NULL),
(402, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458181394, 'web', '127.0.0.1', NULL),
(403, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181410, 'ws', '127.0.0.1', NULL),
(404, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181410, 'ws', '127.0.0.1', NULL),
(405, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1458181422, 'web', '127.0.0.1', NULL),
(406, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458181517, 'web', '127.0.0.1', NULL),
(407, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458181689, 'web', '127.0.0.1', NULL),
(408, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458181737, 'web', '127.0.0.1', NULL),
(409, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181749, 'ws', '127.0.0.1', NULL),
(410, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181749, 'ws', '127.0.0.1', NULL),
(411, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181922, 'ws', '127.0.0.1', NULL),
(412, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458181922, 'ws', '127.0.0.1', NULL),
(413, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458181930, 'web', '127.0.0.1', NULL),
(414, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458182208, 'web', '127.0.0.1', NULL),
(415, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182321, 'ws', '127.0.0.1', NULL),
(416, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182321, 'ws', '127.0.0.1', NULL),
(417, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458182328, 'web', '127.0.0.1', NULL),
(418, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458182499, 'web', '127.0.0.1', NULL),
(419, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182541, 'ws', '127.0.0.1', NULL),
(420, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182541, 'ws', '127.0.0.1', NULL),
(421, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182562, 'ws', '127.0.0.1', NULL),
(422, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182562, 'ws', '127.0.0.1', NULL),
(423, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182625, 'ws', '127.0.0.1', NULL),
(424, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182625, 'ws', '127.0.0.1', NULL),
(425, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182627, 'ws', '127.0.0.1', NULL),
(426, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182627, 'ws', '127.0.0.1', NULL),
(427, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182632, 'ws', '127.0.0.1', NULL),
(428, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182632, 'ws', '127.0.0.1', NULL),
(429, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182647, 'ws', '127.0.0.1', NULL),
(430, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182647, 'ws', '127.0.0.1', NULL),
(431, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182665, 'ws', '127.0.0.1', NULL),
(432, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182665, 'ws', '127.0.0.1', NULL),
(433, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182673, 'ws', '127.0.0.1', NULL),
(434, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182673, 'ws', '127.0.0.1', NULL),
(435, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182692, 'ws', '127.0.0.1', NULL),
(436, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182692, 'ws', '127.0.0.1', NULL),
(437, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182712, 'ws', '127.0.0.1', NULL),
(438, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182712, 'ws', '127.0.0.1', NULL),
(439, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182719, 'ws', '127.0.0.1', NULL),
(440, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182719, 'ws', '127.0.0.1', NULL),
(441, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182754, 'ws', '127.0.0.1', NULL),
(442, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182754, 'ws', '127.0.0.1', NULL),
(443, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182780, 'ws', '127.0.0.1', NULL),
(444, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182780, 'ws', '127.0.0.1', NULL),
(445, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182812, 'ws', '127.0.0.1', NULL),
(446, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182812, 'ws', '127.0.0.1', NULL),
(447, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182834, 'ws', '127.0.0.1', NULL),
(448, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182834, 'ws', '127.0.0.1', NULL),
(449, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182860, 'ws', '127.0.0.1', NULL),
(450, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182860, 'ws', '127.0.0.1', NULL),
(451, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182948, 'ws', '127.0.0.1', NULL),
(452, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182948, 'ws', '127.0.0.1', NULL),
(453, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182976, 'ws', '127.0.0.1', NULL),
(454, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458182976, 'ws', '127.0.0.1', NULL),
(455, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458183047, 'ws', '127.0.0.1', NULL),
(456, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458183048, 'ws', '127.0.0.1', NULL),
(457, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458183052, 'web', '127.0.0.1', NULL),
(458, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458183139, 'web', '127.0.0.1', NULL),
(459, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1458186465, 'web', '127.0.0.1', NULL),
(460, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458186469, 'ws', '127.0.0.1', NULL),
(461, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458186469, 'ws', '127.0.0.1', NULL),
(462, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:8:"username";s:6:"seadon";}', 1458186482, 'web', '127.0.0.1', NULL),
(463, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186500, 'web', '127.0.0.1', NULL),
(464, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186516, 'web', '127.0.0.1', NULL),
(465, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186520, 'web', '127.0.0.1', NULL),
(466, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186612, 'web', '127.0.0.1', NULL),
(467, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186639, 'web', '127.0.0.1', NULL),
(468, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186644, 'web', '127.0.0.1', NULL),
(469, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186650, 'web', '127.0.0.1', NULL),
(470, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186667, 'web', '127.0.0.1', NULL),
(471, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186674, 'web', '127.0.0.1', NULL),
(472, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"h3cqibr3fglke5rogq0fltk125";}', 1458186677, 'web', '127.0.0.1', NULL),
(473, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1458186677, 'web', '127.0.0.1', NULL),
(474, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1458186689, 'web', '127.0.0.1', NULL),
(475, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458186725, 'ws', '127.0.0.1', NULL),
(476, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458186725, 'ws', '127.0.0.1', NULL),
(477, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186766, 'web', '127.0.0.1', NULL),
(478, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186779, 'web', '127.0.0.1', NULL),
(479, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186792, 'web', '127.0.0.1', NULL),
(480, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186846, 'web', '127.0.0.1', NULL),
(481, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458186872, 'web', '127.0.0.1', NULL),
(482, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458186885, 'web', '127.0.0.1', NULL),
(483, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458186919, 'web', '127.0.0.1', NULL),
(484, '\\core\\event\\webservice_login_failed', 'core', 'failed', 'webservice_login', NULL, NULL, 'r', 0, 1, 10, 0, 0, 0, NULL, 0, 'a:2:{s:6:"method";i:1;s:6:"reason";s:13:"invalid_token";}', 1458186996, 'ws', '127.0.0.1', NULL),
(485, '\\core\\event\\webservice_login_failed', 'core', 'failed', 'webservice_login', NULL, NULL, 'r', 0, 1, 10, 0, 0, 0, NULL, 0, 'a:2:{s:6:"method";i:1;s:6:"reason";s:13:"invalid_token";}', 1458186996, 'ws', '127.0.0.1', NULL),
(486, '\\core\\event\\webservice_login_failed', 'core', 'failed', 'webservice_login', NULL, NULL, 'r', 0, 1, 10, 0, 0, 0, NULL, 0, 'a:2:{s:6:"method";i:1;s:6:"reason";s:13:"invalid_token";}', 1458187006, 'ws', '127.0.0.1', NULL),
(487, '\\core\\event\\webservice_login_failed', 'core', 'failed', 'webservice_login', NULL, NULL, 'r', 0, 1, 10, 0, 0, 0, NULL, 0, 'a:2:{s:6:"method";i:1;s:6:"reason";s:13:"invalid_token";}', 1458187006, 'ws', '127.0.0.1', NULL),
(488, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187078, 'ws', '127.0.0.1', NULL),
(489, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187078, 'ws', '127.0.0.1', NULL),
(490, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187104, 'ws', '127.0.0.1', NULL),
(491, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187104, 'ws', '127.0.0.1', NULL),
(492, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187114, 'ws', '127.0.0.1', NULL),
(493, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187114, 'ws', '127.0.0.1', NULL),
(494, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187124, 'ws', '127.0.0.1', NULL),
(495, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187124, 'ws', '127.0.0.1', NULL),
(496, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187145, 'ws', '127.0.0.1', NULL),
(497, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187145, 'ws', '127.0.0.1', NULL),
(498, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187173, 'ws', '127.0.0.1', NULL),
(499, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187173, 'ws', '127.0.0.1', NULL);
INSERT INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
(500, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187225, 'ws', '127.0.0.1', NULL),
(501, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187225, 'ws', '127.0.0.1', NULL),
(502, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458187295, 'web', '127.0.0.1', NULL),
(503, '\\core\\event\\webservice_login_failed', 'core', 'failed', 'webservice_login', NULL, NULL, 'r', 0, 1, 10, 0, 0, 0, NULL, 0, 'a:2:{s:6:"method";i:1;s:6:"reason";s:13:"invalid_token";}', 1458187378, 'ws', '127.0.0.1', NULL),
(504, '\\core\\event\\webservice_login_failed', 'core', 'failed', 'webservice_login', NULL, NULL, 'r', 0, 1, 10, 0, 0, 0, NULL, 0, 'a:2:{s:6:"method";i:1;s:6:"reason";s:13:"invalid_token";}', 1458187378, 'ws', '127.0.0.1', NULL),
(505, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187410, 'ws', '127.0.0.1', NULL),
(506, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187410, 'ws', '127.0.0.1', NULL),
(507, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187487, 'ws', '127.0.0.1', NULL),
(508, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187487, 'ws', '127.0.0.1', NULL),
(509, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187541, 'ws', '127.0.0.1', NULL),
(510, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187541, 'ws', '127.0.0.1', NULL),
(511, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187545, 'ws', '127.0.0.1', NULL),
(512, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187546, 'ws', '127.0.0.1', NULL),
(513, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187555, 'ws', '127.0.0.1', NULL),
(514, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187555, 'ws', '127.0.0.1', NULL),
(515, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458187562, 'web', '127.0.0.1', NULL),
(516, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1458187567, 'web', '127.0.0.1', NULL),
(517, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187731, 'ws', '127.0.0.1', NULL),
(518, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458187731, 'ws', '127.0.0.1', NULL),
(519, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188079, 'ws', '127.0.0.1', NULL),
(520, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188079, 'ws', '127.0.0.1', NULL),
(521, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188111, 'ws', '127.0.0.1', NULL),
(522, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188111, 'ws', '127.0.0.1', NULL),
(523, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188135, 'ws', '127.0.0.1', NULL),
(524, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188135, 'ws', '127.0.0.1', NULL),
(525, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188190, 'ws', '127.0.0.1', NULL),
(526, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188190, 'ws', '127.0.0.1', NULL),
(527, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188214, 'ws', '127.0.0.1', NULL),
(528, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188214, 'ws', '127.0.0.1', NULL),
(529, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1458188327, 'web', '127.0.0.1', NULL),
(530, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458188354, 'web', '127.0.0.1', NULL),
(531, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1458188425, 'web', '127.0.0.1', NULL),
(532, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188460, 'ws', '127.0.0.1', NULL),
(533, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188461, 'ws', '127.0.0.1', NULL),
(534, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188587, 'ws', '127.0.0.1', NULL),
(535, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188587, 'ws', '127.0.0.1', NULL),
(536, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188781, 'ws', '127.0.0.1', NULL),
(537, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188781, 'ws', '127.0.0.1', NULL),
(538, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188875, 'ws', '127.0.0.1', NULL),
(539, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188875, 'ws', '127.0.0.1', NULL),
(540, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188963, 'ws', '127.0.0.1', NULL),
(541, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188963, 'ws', '127.0.0.1', NULL),
(542, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188981, 'ws', '127.0.0.1', NULL),
(543, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458188981, 'ws', '127.0.0.1', NULL),
(544, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189012, 'ws', '127.0.0.1', NULL),
(545, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189012, 'ws', '127.0.0.1', NULL),
(546, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189066, 'ws', '127.0.0.1', NULL),
(547, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189066, 'ws', '127.0.0.1', NULL),
(548, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189098, 'ws', '127.0.0.1', NULL),
(549, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189098, 'ws', '127.0.0.1', NULL),
(550, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189231, 'ws', '127.0.0.1', NULL),
(551, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189231, 'ws', '127.0.0.1', NULL),
(552, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189390, 'ws', '127.0.0.1', NULL),
(553, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189390, 'ws', '127.0.0.1', NULL),
(554, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189407, 'ws', '127.0.0.1', NULL),
(555, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189407, 'ws', '127.0.0.1', NULL),
(556, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189409, 'ws', '127.0.0.1', NULL),
(557, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189409, 'ws', '127.0.0.1', NULL),
(558, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189410, 'ws', '127.0.0.1', NULL),
(559, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189410, 'ws', '127.0.0.1', NULL),
(560, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189513, 'ws', '127.0.0.1', NULL),
(561, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189513, 'ws', '127.0.0.1', NULL),
(562, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189529, 'ws', '127.0.0.1', NULL),
(563, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189529, 'ws', '127.0.0.1', NULL),
(564, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189547, 'ws', '127.0.0.1', NULL),
(565, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189547, 'ws', '127.0.0.1', NULL),
(566, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189624, 'ws', '127.0.0.1', NULL),
(567, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189624, 'ws', '127.0.0.1', NULL),
(568, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189626, 'ws', '127.0.0.1', NULL),
(569, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189626, 'ws', '127.0.0.1', NULL),
(570, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189714, 'ws', '127.0.0.1', NULL),
(571, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189714, 'ws', '127.0.0.1', NULL),
(572, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189739, 'ws', '127.0.0.1', NULL),
(573, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189739, 'ws', '127.0.0.1', NULL),
(574, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189798, 'ws', '127.0.0.1', NULL),
(575, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189799, 'ws', '127.0.0.1', NULL),
(576, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189815, 'ws', '127.0.0.1', NULL),
(577, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189815, 'ws', '127.0.0.1', NULL),
(578, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189843, 'ws', '127.0.0.1', NULL),
(579, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189843, 'ws', '127.0.0.1', NULL),
(580, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189935, 'ws', '127.0.0.1', NULL),
(581, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458189935, 'ws', '127.0.0.1', NULL),
(582, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458190095, 'ws', '127.0.0.1', NULL),
(583, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458190095, 'ws', '127.0.0.1', NULL),
(584, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458190324, 'ws', '127.0.0.1', NULL),
(585, '\\core\\event\\webservice_function_called', 'core', 'called', 'webservice_function', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"function";s:7:"unknown";}', 1458190324, 'ws', '127.0.0.1', NULL),
(586, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"djub9mdp2ailgc4780fi8qip60";}', 1458190396, 'web', '127.0.0.1', NULL),
(587, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1458190396, 'web', '127.0.0.1', NULL),
(588, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:8:"username";s:6:"seadon";}', 1458190731, 'web', '127.0.0.1', NULL),
(589, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"jqr89qi8l5umd17fq2pqhldda0";}', 1458190793, 'web', '127.0.0.1', NULL),
(590, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1458190793, 'web', '127.0.0.1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_display`
--

CREATE TABLE IF NOT EXISTS `mdl_log_display` (
  `id` bigint(10) NOT NULL,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mtable` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For a particular module/action, specifies a moodle table/fie';

--
-- Dumping data for table `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'course', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(2, 'course', 'view', 'course', 'fullname', 'moodle'),
(3, 'course', 'view section', 'course_sections', 'name', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'hide', 'course', 'fullname', 'moodle'),
(6, 'course', 'show', 'course', 'fullname', 'moodle'),
(7, 'course', 'move', 'course', 'fullname', 'moodle'),
(8, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(9, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(10, 'course', 'report log', 'course', 'fullname', 'moodle'),
(11, 'course', 'report live', 'course', 'fullname', 'moodle'),
(12, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(13, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(14, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(15, 'category', 'add', 'course_categories', 'name', 'moodle'),
(16, 'category', 'hide', 'course_categories', 'name', 'moodle'),
(17, 'category', 'move', 'course_categories', 'name', 'moodle'),
(18, 'category', 'show', 'course_categories', 'name', 'moodle'),
(19, 'category', 'update', 'course_categories', 'name', 'moodle'),
(20, 'message', 'write', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(21, 'message', 'read', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(22, 'message', 'add contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(23, 'message', 'remove contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(24, 'message', 'block contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(25, 'message', 'unblock contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(26, 'group', 'view', 'groups', 'name', 'moodle'),
(27, 'tag', 'update', 'tag', 'name', 'moodle'),
(28, 'tag', 'flag', 'tag', 'name', 'moodle'),
(29, 'user', 'view', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(30, 'assign', 'add', 'assign', 'name', 'mod_assign'),
(31, 'assign', 'delete mod', 'assign', 'name', 'mod_assign'),
(32, 'assign', 'download all submissions', 'assign', 'name', 'mod_assign'),
(33, 'assign', 'grade submission', 'assign', 'name', 'mod_assign'),
(34, 'assign', 'lock submission', 'assign', 'name', 'mod_assign'),
(35, 'assign', 'reveal identities', 'assign', 'name', 'mod_assign'),
(36, 'assign', 'revert submission to draft', 'assign', 'name', 'mod_assign'),
(37, 'assign', 'set marking workflow state', 'assign', 'name', 'mod_assign'),
(38, 'assign', 'submission statement accepted', 'assign', 'name', 'mod_assign'),
(39, 'assign', 'submit', 'assign', 'name', 'mod_assign'),
(40, 'assign', 'submit for grading', 'assign', 'name', 'mod_assign'),
(41, 'assign', 'unlock submission', 'assign', 'name', 'mod_assign'),
(42, 'assign', 'update', 'assign', 'name', 'mod_assign'),
(43, 'assign', 'upload', 'assign', 'name', 'mod_assign'),
(44, 'assign', 'view', 'assign', 'name', 'mod_assign'),
(45, 'assign', 'view all', 'course', 'fullname', 'mod_assign'),
(46, 'assign', 'view confirm submit assignment form', 'assign', 'name', 'mod_assign'),
(47, 'assign', 'view grading form', 'assign', 'name', 'mod_assign'),
(48, 'assign', 'view submission', 'assign', 'name', 'mod_assign'),
(49, 'assign', 'view submission grading table', 'assign', 'name', 'mod_assign'),
(50, 'assign', 'view submit assignment form', 'assign', 'name', 'mod_assign'),
(51, 'assign', 'view feedback', 'assign', 'name', 'mod_assign'),
(52, 'assign', 'view batch set marking workflow state', 'assign', 'name', 'mod_assign'),
(53, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(54, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(55, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(56, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(57, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(58, 'book', 'add', 'book', 'name', 'mod_book'),
(59, 'book', 'update', 'book', 'name', 'mod_book'),
(60, 'book', 'view', 'book', 'name', 'mod_book'),
(61, 'book', 'add chapter', 'book_chapters', 'title', 'mod_book'),
(62, 'book', 'update chapter', 'book_chapters', 'title', 'mod_book'),
(63, 'book', 'view chapter', 'book_chapters', 'title', 'mod_book'),
(64, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(65, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(66, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(67, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(68, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(69, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(70, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(71, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(72, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(73, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(74, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(75, 'data', 'view', 'data', 'name', 'mod_data'),
(76, 'data', 'add', 'data', 'name', 'mod_data'),
(77, 'data', 'update', 'data', 'name', 'mod_data'),
(78, 'data', 'record delete', 'data', 'name', 'mod_data'),
(79, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(80, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(81, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(82, 'data', 'templates def', 'data', 'name', 'mod_data'),
(83, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(84, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(85, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(86, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(87, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(88, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(89, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(90, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(91, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(92, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(93, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(94, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(95, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(96, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(97, 'forum', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'mod_forum'),
(98, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(99, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(100, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(101, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(102, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(103, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(104, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(105, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(106, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(107, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(108, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(109, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(110, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(111, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(112, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(113, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(114, 'glossary', 'disapprove entry', 'glossary', 'name', 'mod_glossary'),
(115, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(116, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(117, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(118, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(119, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(120, 'label', 'add', 'label', 'name', 'mod_label'),
(121, 'label', 'update', 'label', 'name', 'mod_label'),
(122, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(123, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(124, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(125, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(126, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(127, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(128, 'page', 'view', 'page', 'name', 'mod_page'),
(129, 'page', 'view all', 'page', 'name', 'mod_page'),
(130, 'page', 'update', 'page', 'name', 'mod_page'),
(131, 'page', 'add', 'page', 'name', 'mod_page'),
(132, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(133, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(134, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(135, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(136, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(137, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(138, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(139, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(140, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(141, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(142, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(143, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(144, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(145, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(146, 'quiz', 'view summary', 'quiz', 'name', 'mod_quiz'),
(147, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(148, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(149, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(150, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(151, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(152, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(153, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(154, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(155, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(156, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(157, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(158, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(159, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(160, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(161, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(162, 'url', 'view', 'url', 'name', 'mod_url'),
(163, 'url', 'view all', 'url', 'name', 'mod_url'),
(164, 'url', 'update', 'url', 'name', 'mod_url'),
(165, 'url', 'add', 'url', 'name', 'mod_url'),
(166, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(167, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(168, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(169, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(170, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(171, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(172, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(173, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(174, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(175, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(176, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(177, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(178, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(179, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(180, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(181, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(182, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(183, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(184, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop'),
(185, 'book', 'exportimscp', 'book', 'name', 'booktool_exportimscp'),
(186, 'book', 'print', 'book', 'name', 'booktool_print'),
(187, 'book', 'print chapter', 'book_chapters', 'title', 'booktool_print');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_queries`
--

CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
  `id` bigint(10) NOT NULL,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sqlparams` longtext COLLATE utf8_unicode_ci,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Logged database queries.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti`
--

CREATE TABLE IF NOT EXISTS `mdl_lti` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `securetoolurl` longtext COLLATE utf8_unicode_ci,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '100',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains Basic LTI activities instances';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_submission` (
  `id` bigint(10) NOT NULL,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of individual submissions for LTI activities.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_tool_proxies`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_tool_proxies` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Tool Provider',
  `regurl` longtext COLLATE utf8_unicode_ci,
  `state` tinyint(2) NOT NULL DEFAULT '1',
  `guid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendorcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capabilityoffered` longtext COLLATE utf8_unicode_ci NOT NULL,
  `serviceoffered` longtext COLLATE utf8_unicode_ci NOT NULL,
  `toolproxy` longtext COLLATE utf8_unicode_ci,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='LTI tool proxy registrations';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_tool_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_tool_settings` (
  `id` bigint(10) NOT NULL,
  `toolproxyid` bigint(10) NOT NULL,
  `course` bigint(10) DEFAULT NULL,
  `coursemoduleid` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='LTI tool setting values';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tooldomain` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `toolproxyid` bigint(10) DEFAULT NULL,
  `enabledcapability` longtext COLLATE utf8_unicode_ci,
  `parameter` longtext COLLATE utf8_unicode_ci,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI pre-configured activities';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types_config`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI types configuration';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message`
--

CREATE TABLE IF NOT EXISTS `mdl_message` (
  `id` bigint(10) NOT NULL,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all unread messages';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_messageinbound_datakeys`
--

CREATE TABLE IF NOT EXISTS `mdl_messageinbound_datakeys` (
  `id` bigint(10) NOT NULL,
  `handler` bigint(10) NOT NULL,
  `datavalue` bigint(10) NOT NULL,
  `datakey` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `expires` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Inbound Message data item secret keys.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_messageinbound_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_messageinbound_handlers` (
  `id` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultexpiration` bigint(10) NOT NULL DEFAULT '86400',
  `validateaddress` tinyint(1) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Inbound Message Handler definitions.';

--
-- Dumping data for table `mdl_messageinbound_handlers`
--

INSERT INTO `mdl_messageinbound_handlers` (`id`, `component`, `classname`, `defaultexpiration`, `validateaddress`, `enabled`) VALUES
(1, 'core', '\\core\\message\\inbound\\private_files_handler', 0, 1, 0),
(2, 'mod_forum', '\\mod_forum\\message\\inbound\\reply_handler', 604800, 1, 0),
(3, 'tool_messageinbound', '\\tool_messageinbound\\message\\inbound\\invalid_recipient_handler', 604800, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_messageinbound_messagelist`
--

CREATE TABLE IF NOT EXISTS `mdl_messageinbound_messagelist` (
  `id` bigint(10) NOT NULL,
  `messageid` longtext COLLATE utf8_unicode_ci NOT NULL,
  `userid` bigint(10) NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A list of message IDs for existing replies';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_airnotifier_devices`
--

CREATE TABLE IF NOT EXISTS `mdl_message_airnotifier_devices` (
  `id` bigint(10) NOT NULL,
  `userdeviceid` bigint(10) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store information about the devices registered in Airnotifie';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_contacts`
--

CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Maintains lists of relationships between users';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_processors`
--

CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
  `id` bigint(10) NOT NULL,
  `name` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of message output plugins';

--
-- Dumping data for table `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'airnotifier', 0),
(2, 'email', 1),
(3, 'jabber', 1),
(4, 'popup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_providers`
--

CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
  `id` bigint(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores the message providers (modules and core sy';

--
-- Dumping data for table `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'availableupdate', 'moodle', 'moodle/site:config'),
(4, 'instantmessage', 'moodle', NULL),
(5, 'backup', 'moodle', 'moodle/site:config'),
(6, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(7, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(8, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(9, 'badgerecipientnotice', 'moodle', 'moodle/badges:earnbadge'),
(10, 'badgecreatornotice', 'moodle', NULL),
(11, 'assign_notification', 'mod_assign', NULL),
(12, 'assignment_updates', 'mod_assignment', NULL),
(13, 'submission', 'mod_feedback', NULL),
(14, 'message', 'mod_feedback', NULL),
(15, 'posts', 'mod_forum', NULL),
(16, 'graded_essay', 'mod_lesson', NULL),
(17, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(18, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(19, 'attempt_overdue', 'mod_quiz', 'mod/quiz:emailwarnoverdue'),
(20, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(21, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(22, 'expiry_notification', 'enrol_manual', NULL),
(23, 'paypal_enrolment', 'enrol_paypal', NULL),
(24, 'expiry_notification', 'enrol_self', NULL),
(25, 'invalidrecipienthandler', 'tool_messageinbound', NULL),
(26, 'messageprocessingerror', 'tool_messageinbound', NULL),
(27, 'messageprocessingsuccess', 'tool_messageinbound', NULL),
(28, 'notification', 'tool_monitor', 'tool/monitor:subscribe');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_read`
--

CREATE TABLE IF NOT EXISTS `mdl_message_read` (
  `id` bigint(10) NOT NULL,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all messages that have been read';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_working`
--

CREATE TABLE IF NOT EXISTS `mdl_message_working` (
  `id` bigint(10) NOT NULL,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the messages and processors that need to be proces';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information fetched via XML-RPC about courses on ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information about enrolments of our local users i';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_application`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
  `id` bigint(10) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about applications on remote hosts';

--
-- Dumping data for table `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
  `id` bigint(10) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  `sslverification` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the local and remote hosts for RPC';

--
-- Dumping data for table `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`, `sslverification`) VALUES
(1, 0, 'http://localhost/moodle', '127.0.0.1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1, 0),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host2service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the services for a given host';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_log`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
  `id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes functions that might be called remotely';

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext COLLATE utf8_unicode_ci NOT NULL,
  `profile` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Functions or methods that we may publish or subscribe to';

--
-- Dumping data for table `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:18:"User Agent string.";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:35:"SHA1 hash of user agent to look for";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user''s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:75:"Assoc array of courses following the structure of mnetservice_enrol_courses";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:35:"SHA1 hash of user agent to look for";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for ''All hosts'', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:14:"user details {";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can''t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"of our local course";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:5:"array";s:11:"description";s:58:"comma separated list of role shortnames (or array of them)";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
  `id` bigint(10) NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apiversion` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A service is a group of functions';

--
-- Dumping data for table `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_session`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'allow'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users by host permitted (or not) to login from a remote prov';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_modules` (
  `id` bigint(10) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='modules available in the site';

--
-- Dumping data for table `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assign', 60, 0, '', 1),
(2, 'assignment', 60, 0, '', 0),
(3, 'book', 0, 0, '', 1),
(4, 'chat', 300, 0, '', 1),
(5, 'choice', 0, 0, '', 1),
(6, 'data', 0, 0, '', 1),
(7, 'feedback', 0, 0, '', 0),
(8, 'folder', 0, 0, '', 1),
(9, 'forum', 0, 0, '', 1),
(10, 'glossary', 0, 0, '', 1),
(11, 'imscp', 0, 0, '', 1),
(12, 'label', 0, 0, '', 1),
(13, 'lesson', 0, 0, '', 1),
(14, 'lti', 0, 0, '', 1),
(15, 'page', 0, 0, '', 1),
(16, 'quiz', 60, 0, '', 1),
(17, 'resource', 0, 0, '', 1),
(18, 'scorm', 300, 0, '', 1),
(19, 'survey', 0, 0, '', 1),
(20, 'url', 0, 0, '', 1),
(21, 'wiki', 0, 0, '', 1),
(22, 'workshop', 60, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_my_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra user pages for the My Moodle system';

--
-- Dumping data for table `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0),
(3, 2, '__default', 1, 0),
(4, 2, '__default', 0, 0),
(5, 3, '__default', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_page`
--

CREATE TABLE IF NOT EXISTS `mdl_page` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one page and its config data';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL,
  `plugin` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='base table (not including config data) for instances of port';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='config for portfolio plugin instances';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_user`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data for portfolio instances.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_log`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_sha1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `continueurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='log of portfolio transfers (used to later check for duplicat';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maps mahara tokens to transfer ids';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_tempdata`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  `queued` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores temporary data for portfolio exports. the id of this ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_post`
--

CREATE TABLE IF NOT EXISTS `mdl_post` (
  `id` bigint(10) NOT NULL,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `uniquehash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishstate` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Generic post table to hold data blog entries etc in differen';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_profiling`
--

CREATE TABLE IF NOT EXISTS `mdl_profiling` (
  `id` bigint(10) NOT NULL,
  `runid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the results of all the profiling runs';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddimageortext`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_ddimageortext` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines drag and drop (text or images onto a background imag';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddimageortext_drags`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_ddimageortext_drags` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `draggroup` bigint(10) NOT NULL DEFAULT '0',
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `label` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Images to drag. Actual file names are not stored here we use';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddimageortext_drops`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_ddimageortext_drops` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `xleft` bigint(10) NOT NULL DEFAULT '0',
  `ytop` bigint(10) NOT NULL DEFAULT '0',
  `choice` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Drop boxes';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddmarker`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_ddmarker` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  `showmisplaced` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines drag and drop (text or images onto a background imag';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddmarker_drags`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_ddmarker_drags` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `noofdrags` bigint(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Labels for markers to drag.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddmarker_drops`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_ddmarker_drops` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `shape` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coords` longtext COLLATE utf8_unicode_ci NOT NULL,
  `choice` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='drop regions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_essay_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'editor',
  `responserequired` tinyint(2) NOT NULL DEFAULT '1',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `attachmentsrequired` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext COLLATE utf8_unicode_ci,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext COLLATE utf8_unicode_ci,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra options for essay questions.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines the question-type specific options for matching ques';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The subquestions that make up a matching question';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_multichoice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_multichoice_options` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multiple choice questions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_randomsamatch_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_randomsamatch_options` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  `subcats` tinyint(2) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about a random short-answer matching question';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for short answer questions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question`
--

CREATE TABLE IF NOT EXISTS `mdl_question` (
  `id` bigint(10) NOT NULL,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The questions themselves';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Answers, with a fractional grade (0-1) and feedback';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
  `id` bigint(10) NOT NULL,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext COLLATE utf8_unicode_ci,
  `rightanswer` longtext COLLATE utf8_unicode_ci,
  `responsesummary` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each row here corresponds to an attempt at one question, as ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_steps`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores one step in in a question attempt. As well as the dat';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_step_data`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each question_attempt_step has an associative array of the d';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext COLLATE utf8_unicode_ci,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Categories are for grouping questions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_datasets`
--

CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Many-many relation between questions and dataset definitions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Organises and stores properties for dataset items';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_items`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Individual dataset items';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_ddwtos`
--

CREATE TABLE IF NOT EXISTS `mdl_question_ddwtos` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines drag and drop (words into sentences) questions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_gapselect`
--

CREATE TABLE IF NOT EXISTS `mdl_question_gapselect` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines select missing words questions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_hints`
--

CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the the part of the question definition that gives di';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multianswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multianswer questions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for numerical questions.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type numerical This table is also u';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_units`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Optional unit options for numerical questions. This table is';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_response_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_question_response_analysis` (
  `id` bigint(10) NOT NULL,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `whichtries` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `subqid` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `response` longtext COLLATE utf8_unicode_ci,
  `credit` decimal(15,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Analysis of student responses given to questions.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_response_count`
--

CREATE TABLE IF NOT EXISTS `mdl_question_response_count` (
  `id` bigint(10) NOT NULL,
  `analysisid` bigint(10) NOT NULL,
  `try` bigint(10) NOT NULL,
  `rcount` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Count for each responses for each try at a question.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_question_statistics` (
  `id` bigint(10) NOT NULL,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext COLLATE utf8_unicode_ci,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext COLLATE utf8_unicode_ci,
  `randomguessscore` decimal(12,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Statistics for individual questions used in an activity.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_truefalse`
--

CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for True-False questions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_usages`
--

CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table''s main purpose it to assign a unique id to each a';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `canredoquestions` smallint(4) NOT NULL DEFAULT '0',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'free',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  `completionattemptsexhausted` tinyint(1) DEFAULT '0',
  `completionpass` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The settings for each quiz.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores users attempts at quizzes.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Feedback given to students based on which grade band their o';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the overall grade for each user on the quiz, based on';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to quiz settings on a per-user and per-group b';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table records which question attempts need regrading an';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_reports`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the installed quiz reports and their display order';

--
-- Dumping data for table `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `capability`) VALUES
(1, 'grading', 6000, 'mod/quiz:grade'),
(2, 'overview', 10000, NULL),
(3, 'responses', 9000, NULL),
(4, 'statistics', 8000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_sections` (
  `id` bigint(10) NOT NULL,
  `quizid` bigint(10) NOT NULL,
  `firstslot` bigint(10) NOT NULL,
  `heading` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores sections of a quiz with section name (heading), from ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_slots`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_slots` (
  `id` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `page` bigint(10) NOT NULL,
  `requireprevious` smallint(4) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `maxmark` decimal(12,7) NOT NULL DEFAULT '0.0000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the question used in a quiz, with the order, and for ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `whichattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `highestattemptscount` bigint(10) NOT NULL,
  `lastattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table to cache results from analysis done in statistics repo';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_rating`
--

CREATE TABLE IF NOT EXISTS `mdl_rating` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ratingarea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle ratings';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_registration_hubs`
--

CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hubname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `huburl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='hub where the site is registered on with their associated to';

--
-- Dumping data for table `mdl_registration_hubs`
--

INSERT INTO `mdl_registration_hubs` (`id`, `token`, `hubname`, `huburl`, `confirmed`, `secret`, `timemodified`) VALUES
(1, 'ebLwAmOP1OVNrFkV9F9wokRthgU7zng6localhost', 'Moodle.org', 'http://hub.moodle.org', 0, 'ebLwAmOP1OVNrFkV9F9wokRthgU7zng6localhost', 1458190523);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository`
--

CREATE TABLE IF NOT EXISTS `mdl_repository` (
  `id` bigint(10) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';

--
-- Dumping data for table `mdl_repository`
--

INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'areafiles', 1, 1),
(2, 'local', 1, 2),
(3, 'recent', 1, 3),
(4, 'upload', 1, 4),
(5, 'url', 1, 5),
(6, 'user', 1, 6),
(7, 'wikimedia', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';

--
-- Dumping data for table `mdl_repository_instances`
--

INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 1, 0, 1, NULL, NULL, 1458047418, 1458047418, 0),
(2, '', 2, 0, 1, NULL, NULL, 1458047419, 1458047419, 0),
(3, '', 3, 0, 1, NULL, NULL, 1458047419, 1458047419, 0),
(4, '', 4, 0, 1, NULL, NULL, 1458047419, 1458047419, 0),
(5, '', 5, 0, 1, NULL, NULL, 1458047419, 1458047419, 0),
(6, '', 6, 0, 1, NULL, NULL, 1458047419, 1458047419, 0),
(7, '', 7, 0, 1, NULL, NULL, 1458047419, 1458047419, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The config for intances';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource`
--

CREATE TABLE IF NOT EXISTS `mdl_resource` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one resource and its config data';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource_old`
--

CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `popup` longtext COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='backup of all old resource instances from 1.9';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role`
--

CREATE TABLE IF NOT EXISTS `mdl_role` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle roles';

--
-- Dumping data for table `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, '', 'manager', '', 1, 'manager'),
(2, '', 'coursecreator', '', 2, 'coursecreator'),
(3, '', 'editingteacher', '', 3, 'editingteacher'),
(4, '', 'teacher', '', 4, 'teacher'),
(5, '', 'student', '', 5, 'student'),
(6, '', 'guest', '', 6, 'guest'),
(7, '', 'user', '', 7, 'user'),
(8, '', 'frontpage', '', 8, 'frontpage');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can assign what role';

--
-- Dumping data for table `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_override`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can override what role';

--
-- Dumping data for table `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_switch`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores which which other roles a user is allowed ';

--
-- Dumping data for table `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_assignments`
--

CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
  `id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='assigning roles in different context';

--
-- Dumping data for table `mdl_role_assignments`
--

INSERT INTO `mdl_role_assignments` (`id`, `roleid`, `contextid`, `userid`, `timemodified`, `modifierid`, `component`, `itemid`, `sortorder`) VALUES
(1, 5, 24, 2, 1458114202, 2, '', 0, 0),
(2, 5, 24, 3, 1458138725, 2, '', 0, 0),
(3, 5, 54, 2, 1458139190, 2, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=1370 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='permission has to be signed, overriding a capability for a p';

--
-- Dumping data for table `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:readallmessages', 1, 1458047378, 0),
(2, 1, 3, 'moodle/site:readallmessages', 1, 1458047378, 0),
(3, 1, 1, 'moodle/site:deleteanymessage', 1, 1458047378, 0),
(4, 1, 1, 'moodle/site:sendmessage', 1, 1458047378, 0),
(5, 1, 7, 'moodle/site:sendmessage', 1, 1458047378, 0),
(6, 1, 7, 'moodle/site:deleteownmessage', 1, 1458047378, 0),
(7, 1, 1, 'moodle/site:approvecourse', 1, 1458047378, 0),
(8, 1, 3, 'moodle/backup:backupcourse', 1, 1458047378, 0),
(9, 1, 1, 'moodle/backup:backupcourse', 1, 1458047378, 0),
(10, 1, 3, 'moodle/backup:backupsection', 1, 1458047378, 0),
(11, 1, 1, 'moodle/backup:backupsection', 1, 1458047378, 0),
(12, 1, 3, 'moodle/backup:backupactivity', 1, 1458047378, 0),
(13, 1, 1, 'moodle/backup:backupactivity', 1, 1458047378, 0),
(14, 1, 3, 'moodle/backup:backuptargethub', 1, 1458047378, 0),
(15, 1, 1, 'moodle/backup:backuptargethub', 1, 1458047378, 0),
(16, 1, 3, 'moodle/backup:backuptargetimport', 1, 1458047378, 0),
(17, 1, 1, 'moodle/backup:backuptargetimport', 1, 1458047378, 0),
(18, 1, 3, 'moodle/backup:downloadfile', 1, 1458047378, 0),
(19, 1, 1, 'moodle/backup:downloadfile', 1, 1458047378, 0),
(20, 1, 3, 'moodle/backup:configure', 1, 1458047378, 0),
(21, 1, 1, 'moodle/backup:configure', 1, 1458047378, 0),
(22, 1, 1, 'moodle/backup:userinfo', 1, 1458047378, 0),
(23, 1, 1, 'moodle/backup:anonymise', 1, 1458047378, 0),
(24, 1, 3, 'moodle/restore:restorecourse', 1, 1458047378, 0),
(25, 1, 1, 'moodle/restore:restorecourse', 1, 1458047378, 0),
(26, 1, 3, 'moodle/restore:restoresection', 1, 1458047378, 0),
(27, 1, 1, 'moodle/restore:restoresection', 1, 1458047378, 0),
(28, 1, 3, 'moodle/restore:restoreactivity', 1, 1458047378, 0),
(29, 1, 1, 'moodle/restore:restoreactivity', 1, 1458047378, 0),
(30, 1, 3, 'moodle/restore:restoretargethub', 1, 1458047378, 0),
(31, 1, 1, 'moodle/restore:restoretargethub', 1, 1458047378, 0),
(32, 1, 3, 'moodle/restore:restoretargetimport', 1, 1458047378, 0),
(33, 1, 1, 'moodle/restore:restoretargetimport', 1, 1458047378, 0),
(34, 1, 3, 'moodle/restore:uploadfile', 1, 1458047378, 0),
(35, 1, 1, 'moodle/restore:uploadfile', 1, 1458047378, 0),
(36, 1, 3, 'moodle/restore:configure', 1, 1458047378, 0),
(37, 1, 1, 'moodle/restore:configure', 1, 1458047378, 0),
(38, 1, 2, 'moodle/restore:rolldates', 1, 1458047378, 0),
(39, 1, 1, 'moodle/restore:rolldates', 1, 1458047378, 0),
(40, 1, 1, 'moodle/restore:userinfo', 1, 1458047378, 0),
(41, 1, 1, 'moodle/restore:createuser', 1, 1458047378, 0),
(42, 1, 3, 'moodle/site:manageblocks', 1, 1458047378, 0),
(43, 1, 1, 'moodle/site:manageblocks', 1, 1458047378, 0),
(44, 1, 4, 'moodle/site:accessallgroups', 1, 1458047378, 0),
(45, 1, 3, 'moodle/site:accessallgroups', 1, 1458047378, 0),
(46, 1, 1, 'moodle/site:accessallgroups', 1, 1458047378, 0),
(47, 1, 4, 'moodle/site:viewfullnames', 1, 1458047378, 0),
(48, 1, 3, 'moodle/site:viewfullnames', 1, 1458047378, 0),
(49, 1, 1, 'moodle/site:viewfullnames', 1, 1458047378, 0),
(50, 1, 4, 'moodle/site:viewuseridentity', 1, 1458047378, 0),
(51, 1, 3, 'moodle/site:viewuseridentity', 1, 1458047378, 0),
(52, 1, 1, 'moodle/site:viewuseridentity', 1, 1458047378, 0),
(53, 1, 4, 'moodle/site:viewreports', 1, 1458047378, 0),
(54, 1, 3, 'moodle/site:viewreports', 1, 1458047378, 0),
(55, 1, 1, 'moodle/site:viewreports', 1, 1458047378, 0),
(56, 1, 3, 'moodle/site:trustcontent', 1, 1458047378, 0),
(57, 1, 1, 'moodle/site:trustcontent', 1, 1458047378, 0),
(58, 1, 1, 'moodle/site:uploadusers', 1, 1458047378, 0),
(59, 1, 3, 'moodle/filter:manage', 1, 1458047378, 0),
(60, 1, 1, 'moodle/filter:manage', 1, 1458047378, 0),
(61, 1, 1, 'moodle/user:create', 1, 1458047378, 0),
(62, 1, 1, 'moodle/user:delete', 1, 1458047378, 0),
(63, 1, 1, 'moodle/user:update', 1, 1458047378, 0),
(64, 1, 6, 'moodle/user:viewdetails', 1, 1458047378, 0),
(65, 1, 5, 'moodle/user:viewdetails', 1, 1458047378, 0),
(66, 1, 4, 'moodle/user:viewdetails', 1, 1458047378, 0),
(67, 1, 3, 'moodle/user:viewdetails', 1, 1458047378, 0),
(68, 1, 1, 'moodle/user:viewdetails', 1, 1458047378, 0),
(69, 1, 1, 'moodle/user:viewalldetails', 1, 1458047378, 0),
(70, 1, 1, 'moodle/user:viewlastip', 1, 1458047378, 0),
(71, 1, 4, 'moodle/user:viewhiddendetails', 1, 1458047378, 0),
(72, 1, 3, 'moodle/user:viewhiddendetails', 1, 1458047378, 0),
(73, 1, 1, 'moodle/user:viewhiddendetails', 1, 1458047378, 0),
(74, 1, 1, 'moodle/user:loginas', 1, 1458047378, 0),
(75, 1, 1, 'moodle/user:managesyspages', 1, 1458047378, 0),
(76, 1, 7, 'moodle/user:manageownblocks', 1, 1458047378, 0),
(77, 1, 7, 'moodle/user:manageownfiles', 1, 1458047378, 0),
(78, 1, 1, 'moodle/my:configsyspages', 1, 1458047379, 0),
(79, 1, 3, 'moodle/role:assign', 1, 1458047379, 0),
(80, 1, 1, 'moodle/role:assign', 1, 1458047379, 0),
(81, 1, 4, 'moodle/role:review', 1, 1458047379, 0),
(82, 1, 3, 'moodle/role:review', 1, 1458047379, 0),
(83, 1, 1, 'moodle/role:review', 1, 1458047379, 0),
(84, 1, 1, 'moodle/role:override', 1, 1458047379, 0),
(85, 1, 3, 'moodle/role:safeoverride', 1, 1458047379, 0),
(86, 1, 1, 'moodle/role:manage', 1, 1458047379, 0),
(87, 1, 3, 'moodle/role:switchroles', 1, 1458047379, 0),
(88, 1, 1, 'moodle/role:switchroles', 1, 1458047379, 0),
(89, 1, 1, 'moodle/category:manage', 1, 1458047379, 0),
(90, 1, 2, 'moodle/category:viewhiddencategories', 1, 1458047379, 0),
(91, 1, 1, 'moodle/category:viewhiddencategories', 1, 1458047379, 0),
(92, 1, 1, 'moodle/cohort:manage', 1, 1458047379, 0),
(93, 1, 1, 'moodle/cohort:assign', 1, 1458047379, 0),
(94, 1, 3, 'moodle/cohort:view', 1, 1458047379, 0),
(95, 1, 1, 'moodle/cohort:view', 1, 1458047379, 0),
(96, 1, 2, 'moodle/course:create', 1, 1458047379, 0),
(97, 1, 1, 'moodle/course:create', 1, 1458047379, 0),
(98, 1, 7, 'moodle/course:request', 1, 1458047379, 0),
(99, 1, 1, 'moodle/course:delete', 1, 1458047379, 0),
(100, 1, 3, 'moodle/course:update', 1, 1458047379, 0),
(101, 1, 1, 'moodle/course:update', 1, 1458047379, 0),
(102, 1, 1, 'moodle/course:view', 1, 1458047379, 0),
(103, 1, 3, 'moodle/course:enrolreview', 1, 1458047379, 0),
(104, 1, 1, 'moodle/course:enrolreview', 1, 1458047379, 0),
(105, 1, 3, 'moodle/course:enrolconfig', 1, 1458047379, 0),
(106, 1, 1, 'moodle/course:enrolconfig', 1, 1458047379, 0),
(107, 1, 3, 'moodle/course:reviewotherusers', 1, 1458047379, 0),
(108, 1, 1, 'moodle/course:reviewotherusers', 1, 1458047379, 0),
(109, 1, 4, 'moodle/course:bulkmessaging', 1, 1458047379, 0),
(110, 1, 3, 'moodle/course:bulkmessaging', 1, 1458047379, 0),
(111, 1, 1, 'moodle/course:bulkmessaging', 1, 1458047379, 0),
(112, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1458047379, 0),
(113, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1458047379, 0),
(114, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1458047379, 0),
(115, 1, 2, 'moodle/course:viewhiddencourses', 1, 1458047379, 0),
(116, 1, 4, 'moodle/course:viewhiddencourses', 1, 1458047379, 0),
(117, 1, 3, 'moodle/course:viewhiddencourses', 1, 1458047379, 0),
(118, 1, 1, 'moodle/course:viewhiddencourses', 1, 1458047379, 0),
(119, 1, 3, 'moodle/course:visibility', 1, 1458047379, 0),
(120, 1, 1, 'moodle/course:visibility', 1, 1458047379, 0),
(121, 1, 3, 'moodle/course:managefiles', 1, 1458047379, 0),
(122, 1, 1, 'moodle/course:managefiles', 1, 1458047379, 0),
(123, 1, 3, 'moodle/course:manageactivities', 1, 1458047379, 0),
(124, 1, 1, 'moodle/course:manageactivities', 1, 1458047379, 0),
(125, 1, 3, 'moodle/course:activityvisibility', 1, 1458047379, 0),
(126, 1, 1, 'moodle/course:activityvisibility', 1, 1458047379, 0),
(127, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1458047379, 0),
(128, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1458047379, 0),
(129, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1458047379, 0),
(130, 1, 5, 'moodle/course:viewparticipants', 1, 1458047379, 0),
(131, 1, 4, 'moodle/course:viewparticipants', 1, 1458047379, 0),
(132, 1, 3, 'moodle/course:viewparticipants', 1, 1458047379, 0),
(133, 1, 1, 'moodle/course:viewparticipants', 1, 1458047379, 0),
(134, 1, 3, 'moodle/course:changefullname', 1, 1458047379, 0),
(135, 1, 1, 'moodle/course:changefullname', 1, 1458047379, 0),
(136, 1, 3, 'moodle/course:changeshortname', 1, 1458047379, 0),
(137, 1, 1, 'moodle/course:changeshortname', 1, 1458047379, 0),
(138, 1, 3, 'moodle/course:changeidnumber', 1, 1458047379, 0),
(139, 1, 1, 'moodle/course:changeidnumber', 1, 1458047379, 0),
(140, 1, 3, 'moodle/course:changecategory', 1, 1458047379, 0),
(141, 1, 1, 'moodle/course:changecategory', 1, 1458047379, 0),
(142, 1, 3, 'moodle/course:changesummary', 1, 1458047379, 0),
(143, 1, 1, 'moodle/course:changesummary', 1, 1458047379, 0),
(144, 1, 1, 'moodle/site:viewparticipants', 1, 1458047379, 0),
(145, 1, 5, 'moodle/course:isincompletionreports', 1, 1458047379, 0),
(146, 1, 5, 'moodle/course:viewscales', 1, 1458047379, 0),
(147, 1, 4, 'moodle/course:viewscales', 1, 1458047379, 0),
(148, 1, 3, 'moodle/course:viewscales', 1, 1458047379, 0),
(149, 1, 1, 'moodle/course:viewscales', 1, 1458047379, 0),
(150, 1, 3, 'moodle/course:managescales', 1, 1458047379, 0),
(151, 1, 1, 'moodle/course:managescales', 1, 1458047379, 0),
(152, 1, 3, 'moodle/course:managegroups', 1, 1458047379, 0),
(153, 1, 1, 'moodle/course:managegroups', 1, 1458047379, 0),
(154, 1, 3, 'moodle/course:reset', 1, 1458047379, 0),
(155, 1, 1, 'moodle/course:reset', 1, 1458047379, 0),
(156, 1, 3, 'moodle/course:viewsuspendedusers', 1, 1458047379, 0),
(157, 1, 1, 'moodle/course:viewsuspendedusers', 1, 1458047379, 0),
(158, 1, 1, 'moodle/course:tag', 1, 1458047379, 0),
(159, 1, 3, 'moodle/course:tag', 1, 1458047379, 0),
(160, 1, 6, 'moodle/blog:view', 1, 1458047379, 0),
(161, 1, 7, 'moodle/blog:view', 1, 1458047379, 0),
(162, 1, 5, 'moodle/blog:view', 1, 1458047379, 0),
(163, 1, 4, 'moodle/blog:view', 1, 1458047379, 0),
(164, 1, 3, 'moodle/blog:view', 1, 1458047379, 0),
(165, 1, 1, 'moodle/blog:view', 1, 1458047379, 0),
(166, 1, 6, 'moodle/blog:search', 1, 1458047379, 0),
(167, 1, 7, 'moodle/blog:search', 1, 1458047379, 0),
(168, 1, 5, 'moodle/blog:search', 1, 1458047379, 0),
(169, 1, 4, 'moodle/blog:search', 1, 1458047379, 0),
(170, 1, 3, 'moodle/blog:search', 1, 1458047379, 0),
(171, 1, 1, 'moodle/blog:search', 1, 1458047379, 0),
(172, 1, 1, 'moodle/blog:viewdrafts', 1, 1458047379, 0),
(173, 1, 7, 'moodle/blog:create', 1, 1458047379, 0),
(174, 1, 1, 'moodle/blog:create', 1, 1458047379, 0),
(175, 1, 4, 'moodle/blog:manageentries', 1, 1458047379, 0),
(176, 1, 3, 'moodle/blog:manageentries', 1, 1458047379, 0),
(177, 1, 1, 'moodle/blog:manageentries', 1, 1458047379, 0),
(178, 1, 5, 'moodle/blog:manageexternal', 1, 1458047379, 0),
(179, 1, 7, 'moodle/blog:manageexternal', 1, 1458047379, 0),
(180, 1, 4, 'moodle/blog:manageexternal', 1, 1458047379, 0),
(181, 1, 3, 'moodle/blog:manageexternal', 1, 1458047379, 0),
(182, 1, 1, 'moodle/blog:manageexternal', 1, 1458047379, 0),
(183, 1, 7, 'moodle/calendar:manageownentries', 1, 1458047379, 0),
(184, 1, 1, 'moodle/calendar:manageownentries', 1, 1458047379, 0),
(185, 1, 4, 'moodle/calendar:managegroupentries', 1, 1458047379, 0),
(186, 1, 3, 'moodle/calendar:managegroupentries', 1, 1458047379, 0),
(187, 1, 1, 'moodle/calendar:managegroupentries', 1, 1458047379, 0),
(188, 1, 4, 'moodle/calendar:manageentries', 1, 1458047379, 0),
(189, 1, 3, 'moodle/calendar:manageentries', 1, 1458047379, 0),
(190, 1, 1, 'moodle/calendar:manageentries', 1, 1458047379, 0),
(191, 1, 1, 'moodle/user:editprofile', 1, 1458047379, 0),
(192, 1, 6, 'moodle/user:editownprofile', -1000, 1458047379, 0),
(193, 1, 7, 'moodle/user:editownprofile', 1, 1458047379, 0),
(194, 1, 1, 'moodle/user:editownprofile', 1, 1458047379, 0),
(195, 1, 6, 'moodle/user:changeownpassword', -1000, 1458047379, 0),
(196, 1, 7, 'moodle/user:changeownpassword', 1, 1458047379, 0),
(197, 1, 1, 'moodle/user:changeownpassword', 1, 1458047379, 0),
(198, 1, 5, 'moodle/user:readuserposts', 1, 1458047379, 0),
(199, 1, 4, 'moodle/user:readuserposts', 1, 1458047379, 0),
(200, 1, 3, 'moodle/user:readuserposts', 1, 1458047379, 0),
(201, 1, 1, 'moodle/user:readuserposts', 1, 1458047379, 0),
(202, 1, 5, 'moodle/user:readuserblogs', 1, 1458047379, 0),
(203, 1, 4, 'moodle/user:readuserblogs', 1, 1458047379, 0),
(204, 1, 3, 'moodle/user:readuserblogs', 1, 1458047379, 0),
(205, 1, 1, 'moodle/user:readuserblogs', 1, 1458047379, 0),
(206, 1, 1, 'moodle/user:editmessageprofile', 1, 1458047379, 0),
(207, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1458047379, 0),
(208, 1, 7, 'moodle/user:editownmessageprofile', 1, 1458047379, 0),
(209, 1, 1, 'moodle/user:editownmessageprofile', 1, 1458047379, 0),
(210, 1, 3, 'moodle/question:managecategory', 1, 1458047379, 0),
(211, 1, 1, 'moodle/question:managecategory', 1, 1458047379, 0),
(212, 1, 3, 'moodle/question:add', 1, 1458047379, 0),
(213, 1, 1, 'moodle/question:add', 1, 1458047379, 0),
(214, 1, 3, 'moodle/question:editmine', 1, 1458047379, 0),
(215, 1, 1, 'moodle/question:editmine', 1, 1458047379, 0),
(216, 1, 3, 'moodle/question:editall', 1, 1458047379, 0),
(217, 1, 1, 'moodle/question:editall', 1, 1458047379, 0),
(218, 1, 3, 'moodle/question:viewmine', 1, 1458047379, 0),
(219, 1, 1, 'moodle/question:viewmine', 1, 1458047379, 0),
(220, 1, 3, 'moodle/question:viewall', 1, 1458047379, 0),
(221, 1, 1, 'moodle/question:viewall', 1, 1458047379, 0),
(222, 1, 3, 'moodle/question:usemine', 1, 1458047379, 0),
(223, 1, 1, 'moodle/question:usemine', 1, 1458047379, 0),
(224, 1, 3, 'moodle/question:useall', 1, 1458047379, 0),
(225, 1, 1, 'moodle/question:useall', 1, 1458047379, 0),
(226, 1, 3, 'moodle/question:movemine', 1, 1458047379, 0),
(227, 1, 1, 'moodle/question:movemine', 1, 1458047379, 0),
(228, 1, 3, 'moodle/question:moveall', 1, 1458047379, 0),
(229, 1, 1, 'moodle/question:moveall', 1, 1458047379, 0),
(230, 1, 1, 'moodle/question:config', 1, 1458047379, 0),
(231, 1, 5, 'moodle/question:flag', 1, 1458047379, 0),
(232, 1, 4, 'moodle/question:flag', 1, 1458047379, 0),
(233, 1, 3, 'moodle/question:flag', 1, 1458047379, 0),
(234, 1, 1, 'moodle/question:flag', 1, 1458047379, 0),
(235, 1, 4, 'moodle/site:doclinks', 1, 1458047379, 0),
(236, 1, 3, 'moodle/site:doclinks', 1, 1458047379, 0),
(237, 1, 1, 'moodle/site:doclinks', 1, 1458047379, 0),
(238, 1, 3, 'moodle/course:sectionvisibility', 1, 1458047379, 0),
(239, 1, 1, 'moodle/course:sectionvisibility', 1, 1458047379, 0),
(240, 1, 3, 'moodle/course:useremail', 1, 1458047379, 0),
(241, 1, 1, 'moodle/course:useremail', 1, 1458047379, 0),
(242, 1, 3, 'moodle/course:viewhiddensections', 1, 1458047379, 0),
(243, 1, 1, 'moodle/course:viewhiddensections', 1, 1458047379, 0),
(244, 1, 3, 'moodle/course:setcurrentsection', 1, 1458047379, 0),
(245, 1, 1, 'moodle/course:setcurrentsection', 1, 1458047379, 0),
(246, 1, 3, 'moodle/course:movesections', 1, 1458047379, 0),
(247, 1, 1, 'moodle/course:movesections', 1, 1458047379, 0),
(248, 1, 4, 'moodle/grade:viewall', 1, 1458047379, 0),
(249, 1, 3, 'moodle/grade:viewall', 1, 1458047379, 0),
(250, 1, 1, 'moodle/grade:viewall', 1, 1458047380, 0),
(251, 1, 5, 'moodle/grade:view', 1, 1458047380, 0),
(252, 1, 4, 'moodle/grade:viewhidden', 1, 1458047380, 0),
(253, 1, 3, 'moodle/grade:viewhidden', 1, 1458047380, 0),
(254, 1, 1, 'moodle/grade:viewhidden', 1, 1458047380, 0),
(255, 1, 3, 'moodle/grade:import', 1, 1458047380, 0),
(256, 1, 1, 'moodle/grade:import', 1, 1458047380, 0),
(257, 1, 4, 'moodle/grade:export', 1, 1458047380, 0),
(258, 1, 3, 'moodle/grade:export', 1, 1458047380, 0),
(259, 1, 1, 'moodle/grade:export', 1, 1458047380, 0),
(260, 1, 3, 'moodle/grade:manage', 1, 1458047380, 0),
(261, 1, 1, 'moodle/grade:manage', 1, 1458047380, 0),
(262, 1, 3, 'moodle/grade:edit', 1, 1458047380, 0),
(263, 1, 1, 'moodle/grade:edit', 1, 1458047380, 0),
(264, 1, 3, 'moodle/grade:managegradingforms', 1, 1458047380, 0),
(265, 1, 1, 'moodle/grade:managegradingforms', 1, 1458047380, 0),
(266, 1, 1, 'moodle/grade:sharegradingforms', 1, 1458047380, 0),
(267, 1, 1, 'moodle/grade:managesharedforms', 1, 1458047380, 0),
(268, 1, 3, 'moodle/grade:manageoutcomes', 1, 1458047380, 0),
(269, 1, 1, 'moodle/grade:manageoutcomes', 1, 1458047380, 0),
(270, 1, 3, 'moodle/grade:manageletters', 1, 1458047380, 0),
(271, 1, 1, 'moodle/grade:manageletters', 1, 1458047380, 0),
(272, 1, 3, 'moodle/grade:hide', 1, 1458047380, 0),
(273, 1, 1, 'moodle/grade:hide', 1, 1458047380, 0),
(274, 1, 3, 'moodle/grade:lock', 1, 1458047380, 0),
(275, 1, 1, 'moodle/grade:lock', 1, 1458047380, 0),
(276, 1, 3, 'moodle/grade:unlock', 1, 1458047380, 0),
(277, 1, 1, 'moodle/grade:unlock', 1, 1458047380, 0),
(278, 1, 7, 'moodle/my:manageblocks', 1, 1458047380, 0),
(279, 1, 4, 'moodle/notes:view', 1, 1458047380, 0),
(280, 1, 3, 'moodle/notes:view', 1, 1458047380, 0),
(281, 1, 1, 'moodle/notes:view', 1, 1458047380, 0),
(282, 1, 4, 'moodle/notes:manage', 1, 1458047380, 0),
(283, 1, 3, 'moodle/notes:manage', 1, 1458047380, 0),
(284, 1, 1, 'moodle/notes:manage', 1, 1458047380, 0),
(285, 1, 1, 'moodle/tag:manage', 1, 1458047380, 0),
(286, 1, 1, 'moodle/tag:edit', 1, 1458047380, 0),
(287, 1, 7, 'moodle/tag:flag', 1, 1458047380, 0),
(288, 1, 4, 'moodle/tag:editblocks', 1, 1458047380, 0),
(289, 1, 3, 'moodle/tag:editblocks', 1, 1458047380, 0),
(290, 1, 1, 'moodle/tag:editblocks', 1, 1458047380, 0),
(291, 1, 6, 'moodle/block:view', 1, 1458047380, 0),
(292, 1, 7, 'moodle/block:view', 1, 1458047380, 0),
(293, 1, 5, 'moodle/block:view', 1, 1458047380, 0),
(294, 1, 4, 'moodle/block:view', 1, 1458047380, 0),
(295, 1, 3, 'moodle/block:view', 1, 1458047380, 0),
(296, 1, 3, 'moodle/block:edit', 1, 1458047380, 0),
(297, 1, 1, 'moodle/block:edit', 1, 1458047380, 0),
(298, 1, 7, 'moodle/portfolio:export', 1, 1458047380, 0),
(299, 1, 5, 'moodle/portfolio:export', 1, 1458047380, 0),
(300, 1, 4, 'moodle/portfolio:export', 1, 1458047380, 0),
(301, 1, 3, 'moodle/portfolio:export', 1, 1458047380, 0),
(302, 1, 8, 'moodle/comment:view', 1, 1458047380, 0),
(303, 1, 6, 'moodle/comment:view', 1, 1458047380, 0),
(304, 1, 7, 'moodle/comment:view', 1, 1458047380, 0),
(305, 1, 5, 'moodle/comment:view', 1, 1458047380, 0),
(306, 1, 4, 'moodle/comment:view', 1, 1458047380, 0),
(307, 1, 3, 'moodle/comment:view', 1, 1458047380, 0),
(308, 1, 1, 'moodle/comment:view', 1, 1458047380, 0),
(309, 1, 7, 'moodle/comment:post', 1, 1458047380, 0),
(310, 1, 5, 'moodle/comment:post', 1, 1458047380, 0),
(311, 1, 4, 'moodle/comment:post', 1, 1458047380, 0),
(312, 1, 3, 'moodle/comment:post', 1, 1458047380, 0),
(313, 1, 1, 'moodle/comment:post', 1, 1458047380, 0),
(314, 1, 3, 'moodle/comment:delete', 1, 1458047380, 0),
(315, 1, 1, 'moodle/comment:delete', 1, 1458047380, 0),
(316, 1, 1, 'moodle/webservice:createtoken', 1, 1458047380, 0),
(317, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1458047380, 0),
(318, 1, 7, 'moodle/rating:view', 1, 1458047380, 0),
(319, 1, 5, 'moodle/rating:view', 1, 1458047380, 0),
(320, 1, 4, 'moodle/rating:view', 1, 1458047380, 0),
(321, 1, 3, 'moodle/rating:view', 1, 1458047380, 0),
(322, 1, 1, 'moodle/rating:view', 1, 1458047380, 0),
(323, 1, 7, 'moodle/rating:viewany', 1, 1458047381, 0),
(324, 1, 5, 'moodle/rating:viewany', 1, 1458047381, 0),
(325, 1, 4, 'moodle/rating:viewany', 1, 1458047381, 0),
(326, 1, 3, 'moodle/rating:viewany', 1, 1458047381, 0),
(327, 1, 1, 'moodle/rating:viewany', 1, 1458047381, 0),
(328, 1, 7, 'moodle/rating:viewall', 1, 1458047381, 0),
(329, 1, 5, 'moodle/rating:viewall', 1, 1458047381, 0),
(330, 1, 4, 'moodle/rating:viewall', 1, 1458047381, 0),
(331, 1, 3, 'moodle/rating:viewall', 1, 1458047381, 0),
(332, 1, 1, 'moodle/rating:viewall', 1, 1458047381, 0),
(333, 1, 7, 'moodle/rating:rate', 1, 1458047381, 0),
(334, 1, 5, 'moodle/rating:rate', 1, 1458047381, 0),
(335, 1, 4, 'moodle/rating:rate', 1, 1458047381, 0),
(336, 1, 3, 'moodle/rating:rate', 1, 1458047381, 0),
(337, 1, 1, 'moodle/rating:rate', 1, 1458047381, 0),
(338, 1, 1, 'moodle/course:publish', 1, 1458047381, 0),
(339, 1, 4, 'moodle/course:markcomplete', 1, 1458047381, 0),
(340, 1, 3, 'moodle/course:markcomplete', 1, 1458047381, 0),
(341, 1, 1, 'moodle/course:markcomplete', 1, 1458047381, 0),
(342, 1, 1, 'moodle/community:add', 1, 1458047381, 0),
(343, 1, 4, 'moodle/community:add', 1, 1458047381, 0),
(344, 1, 3, 'moodle/community:add', 1, 1458047381, 0),
(345, 1, 1, 'moodle/community:download', 1, 1458047381, 0),
(346, 1, 3, 'moodle/community:download', 1, 1458047381, 0),
(347, 1, 1, 'moodle/badges:manageglobalsettings', 1, 1458047381, 0),
(348, 1, 7, 'moodle/badges:viewbadges', 1, 1458047381, 0),
(349, 1, 7, 'moodle/badges:manageownbadges', 1, 1458047381, 0),
(350, 1, 7, 'moodle/badges:viewotherbadges', 1, 1458047381, 0),
(351, 1, 7, 'moodle/badges:earnbadge', 1, 1458047381, 0),
(352, 1, 1, 'moodle/badges:createbadge', 1, 1458047381, 0),
(353, 1, 3, 'moodle/badges:createbadge', 1, 1458047381, 0),
(354, 1, 1, 'moodle/badges:deletebadge', 1, 1458047381, 0),
(355, 1, 3, 'moodle/badges:deletebadge', 1, 1458047381, 0),
(356, 1, 1, 'moodle/badges:configuredetails', 1, 1458047381, 0),
(357, 1, 3, 'moodle/badges:configuredetails', 1, 1458047381, 0),
(358, 1, 1, 'moodle/badges:configurecriteria', 1, 1458047381, 0),
(359, 1, 3, 'moodle/badges:configurecriteria', 1, 1458047381, 0),
(360, 1, 1, 'moodle/badges:configuremessages', 1, 1458047381, 0),
(361, 1, 3, 'moodle/badges:configuremessages', 1, 1458047381, 0),
(362, 1, 1, 'moodle/badges:awardbadge', 1, 1458047381, 0),
(363, 1, 4, 'moodle/badges:awardbadge', 1, 1458047381, 0),
(364, 1, 3, 'moodle/badges:awardbadge', 1, 1458047381, 0),
(365, 1, 1, 'moodle/badges:viewawarded', 1, 1458047381, 0),
(366, 1, 4, 'moodle/badges:viewawarded', 1, 1458047381, 0),
(367, 1, 3, 'moodle/badges:viewawarded', 1, 1458047381, 0),
(368, 1, 6, 'mod/assign:view', 1, 1458047393, 0),
(369, 1, 5, 'mod/assign:view', 1, 1458047393, 0),
(370, 1, 4, 'mod/assign:view', 1, 1458047393, 0),
(371, 1, 3, 'mod/assign:view', 1, 1458047393, 0),
(372, 1, 1, 'mod/assign:view', 1, 1458047393, 0),
(373, 1, 5, 'mod/assign:submit', 1, 1458047393, 0),
(374, 1, 4, 'mod/assign:grade', 1, 1458047393, 0),
(375, 1, 3, 'mod/assign:grade', 1, 1458047393, 0),
(376, 1, 1, 'mod/assign:grade', 1, 1458047393, 0),
(377, 1, 4, 'mod/assign:exportownsubmission', 1, 1458047393, 0),
(378, 1, 3, 'mod/assign:exportownsubmission', 1, 1458047393, 0),
(379, 1, 1, 'mod/assign:exportownsubmission', 1, 1458047393, 0),
(380, 1, 5, 'mod/assign:exportownsubmission', 1, 1458047393, 0),
(381, 1, 3, 'mod/assign:addinstance', 1, 1458047393, 0),
(382, 1, 1, 'mod/assign:addinstance', 1, 1458047393, 0),
(383, 1, 4, 'mod/assign:grantextension', 1, 1458047393, 0),
(384, 1, 3, 'mod/assign:grantextension', 1, 1458047393, 0),
(385, 1, 1, 'mod/assign:grantextension', 1, 1458047393, 0),
(386, 1, 3, 'mod/assign:revealidentities', 1, 1458047393, 0),
(387, 1, 1, 'mod/assign:revealidentities', 1, 1458047393, 0),
(388, 1, 3, 'mod/assign:reviewgrades', 1, 1458047393, 0),
(389, 1, 1, 'mod/assign:reviewgrades', 1, 1458047393, 0),
(390, 1, 3, 'mod/assign:releasegrades', 1, 1458047393, 0),
(391, 1, 1, 'mod/assign:releasegrades', 1, 1458047394, 0),
(392, 1, 3, 'mod/assign:managegrades', 1, 1458047394, 0),
(393, 1, 1, 'mod/assign:managegrades', 1, 1458047394, 0),
(394, 1, 3, 'mod/assign:manageallocations', 1, 1458047394, 0),
(395, 1, 1, 'mod/assign:manageallocations', 1, 1458047394, 0),
(396, 1, 3, 'mod/assign:viewgrades', 1, 1458047394, 0),
(397, 1, 1, 'mod/assign:viewgrades', 1, 1458047394, 0),
(398, 1, 4, 'mod/assign:viewgrades', 1, 1458047394, 0),
(399, 1, 1, 'mod/assign:viewblinddetails', 1, 1458047394, 0),
(400, 1, 4, 'mod/assign:receivegradernotifications', 1, 1458047394, 0),
(401, 1, 3, 'mod/assign:receivegradernotifications', 1, 1458047394, 0),
(402, 1, 1, 'mod/assign:receivegradernotifications', 1, 1458047394, 0),
(403, 1, 6, 'mod/assignment:view', 1, 1458047394, 0),
(404, 1, 5, 'mod/assignment:view', 1, 1458047394, 0),
(405, 1, 4, 'mod/assignment:view', 1, 1458047394, 0),
(406, 1, 3, 'mod/assignment:view', 1, 1458047394, 0),
(407, 1, 1, 'mod/assignment:view', 1, 1458047394, 0),
(408, 1, 3, 'mod/assignment:addinstance', 1, 1458047394, 0),
(409, 1, 1, 'mod/assignment:addinstance', 1, 1458047394, 0),
(410, 1, 5, 'mod/assignment:submit', 1, 1458047394, 0),
(411, 1, 4, 'mod/assignment:grade', 1, 1458047394, 0),
(412, 1, 3, 'mod/assignment:grade', 1, 1458047394, 0),
(413, 1, 1, 'mod/assignment:grade', 1, 1458047394, 0),
(414, 1, 4, 'mod/assignment:exportownsubmission', 1, 1458047394, 0),
(415, 1, 3, 'mod/assignment:exportownsubmission', 1, 1458047394, 0),
(416, 1, 1, 'mod/assignment:exportownsubmission', 1, 1458047394, 0),
(417, 1, 5, 'mod/assignment:exportownsubmission', 1, 1458047394, 0),
(418, 1, 3, 'mod/book:addinstance', 1, 1458047394, 0),
(419, 1, 1, 'mod/book:addinstance', 1, 1458047394, 0),
(420, 1, 6, 'mod/book:read', 1, 1458047394, 0),
(421, 1, 8, 'mod/book:read', 1, 1458047394, 0),
(422, 1, 5, 'mod/book:read', 1, 1458047394, 0),
(423, 1, 4, 'mod/book:read', 1, 1458047394, 0),
(424, 1, 3, 'mod/book:read', 1, 1458047394, 0),
(425, 1, 1, 'mod/book:read', 1, 1458047394, 0),
(426, 1, 4, 'mod/book:viewhiddenchapters', 1, 1458047394, 0),
(427, 1, 3, 'mod/book:viewhiddenchapters', 1, 1458047394, 0),
(428, 1, 1, 'mod/book:viewhiddenchapters', 1, 1458047394, 0),
(429, 1, 3, 'mod/book:edit', 1, 1458047394, 0),
(430, 1, 1, 'mod/book:edit', 1, 1458047394, 0),
(431, 1, 3, 'mod/chat:addinstance', 1, 1458047394, 0),
(432, 1, 1, 'mod/chat:addinstance', 1, 1458047394, 0),
(433, 1, 5, 'mod/chat:chat', 1, 1458047394, 0),
(434, 1, 4, 'mod/chat:chat', 1, 1458047394, 0),
(435, 1, 3, 'mod/chat:chat', 1, 1458047394, 0),
(436, 1, 1, 'mod/chat:chat', 1, 1458047394, 0),
(437, 1, 5, 'mod/chat:readlog', 1, 1458047394, 0),
(438, 1, 4, 'mod/chat:readlog', 1, 1458047394, 0),
(439, 1, 3, 'mod/chat:readlog', 1, 1458047394, 0),
(440, 1, 1, 'mod/chat:readlog', 1, 1458047394, 0),
(441, 1, 4, 'mod/chat:deletelog', 1, 1458047394, 0),
(442, 1, 3, 'mod/chat:deletelog', 1, 1458047394, 0),
(443, 1, 1, 'mod/chat:deletelog', 1, 1458047394, 0),
(444, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1458047394, 0),
(445, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1458047394, 0),
(446, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1458047394, 0),
(447, 1, 4, 'mod/chat:exportsession', 1, 1458047394, 0),
(448, 1, 3, 'mod/chat:exportsession', 1, 1458047394, 0),
(449, 1, 1, 'mod/chat:exportsession', 1, 1458047394, 0),
(450, 1, 3, 'mod/choice:addinstance', 1, 1458047394, 0),
(451, 1, 1, 'mod/choice:addinstance', 1, 1458047394, 0),
(452, 1, 5, 'mod/choice:choose', 1, 1458047394, 0),
(453, 1, 4, 'mod/choice:choose', 1, 1458047394, 0),
(454, 1, 3, 'mod/choice:choose', 1, 1458047394, 0),
(455, 1, 4, 'mod/choice:readresponses', 1, 1458047394, 0),
(456, 1, 3, 'mod/choice:readresponses', 1, 1458047394, 0),
(457, 1, 1, 'mod/choice:readresponses', 1, 1458047394, 0),
(458, 1, 4, 'mod/choice:deleteresponses', 1, 1458047394, 0),
(459, 1, 3, 'mod/choice:deleteresponses', 1, 1458047394, 0),
(460, 1, 1, 'mod/choice:deleteresponses', 1, 1458047394, 0),
(461, 1, 4, 'mod/choice:downloadresponses', 1, 1458047394, 0),
(462, 1, 3, 'mod/choice:downloadresponses', 1, 1458047394, 0),
(463, 1, 1, 'mod/choice:downloadresponses', 1, 1458047394, 0),
(464, 1, 3, 'mod/data:addinstance', 1, 1458047395, 0),
(465, 1, 1, 'mod/data:addinstance', 1, 1458047395, 0),
(466, 1, 8, 'mod/data:viewentry', 1, 1458047395, 0),
(467, 1, 6, 'mod/data:viewentry', 1, 1458047395, 0),
(468, 1, 5, 'mod/data:viewentry', 1, 1458047395, 0),
(469, 1, 4, 'mod/data:viewentry', 1, 1458047395, 0),
(470, 1, 3, 'mod/data:viewentry', 1, 1458047395, 0),
(471, 1, 1, 'mod/data:viewentry', 1, 1458047395, 0),
(472, 1, 5, 'mod/data:writeentry', 1, 1458047395, 0),
(473, 1, 4, 'mod/data:writeentry', 1, 1458047395, 0),
(474, 1, 3, 'mod/data:writeentry', 1, 1458047395, 0),
(475, 1, 1, 'mod/data:writeentry', 1, 1458047395, 0),
(476, 1, 5, 'mod/data:comment', 1, 1458047395, 0),
(477, 1, 4, 'mod/data:comment', 1, 1458047395, 0),
(478, 1, 3, 'mod/data:comment', 1, 1458047395, 0),
(479, 1, 1, 'mod/data:comment', 1, 1458047395, 0),
(480, 1, 4, 'mod/data:rate', 1, 1458047395, 0),
(481, 1, 3, 'mod/data:rate', 1, 1458047395, 0),
(482, 1, 1, 'mod/data:rate', 1, 1458047395, 0),
(483, 1, 4, 'mod/data:viewrating', 1, 1458047395, 0),
(484, 1, 3, 'mod/data:viewrating', 1, 1458047395, 0),
(485, 1, 1, 'mod/data:viewrating', 1, 1458047395, 0),
(486, 1, 4, 'mod/data:viewanyrating', 1, 1458047395, 0),
(487, 1, 3, 'mod/data:viewanyrating', 1, 1458047395, 0),
(488, 1, 1, 'mod/data:viewanyrating', 1, 1458047395, 0),
(489, 1, 4, 'mod/data:viewallratings', 1, 1458047395, 0),
(490, 1, 3, 'mod/data:viewallratings', 1, 1458047395, 0),
(491, 1, 1, 'mod/data:viewallratings', 1, 1458047395, 0),
(492, 1, 4, 'mod/data:approve', 1, 1458047395, 0),
(493, 1, 3, 'mod/data:approve', 1, 1458047395, 0),
(494, 1, 1, 'mod/data:approve', 1, 1458047395, 0),
(495, 1, 4, 'mod/data:manageentries', 1, 1458047395, 0),
(496, 1, 3, 'mod/data:manageentries', 1, 1458047395, 0),
(497, 1, 1, 'mod/data:manageentries', 1, 1458047395, 0),
(498, 1, 4, 'mod/data:managecomments', 1, 1458047395, 0),
(499, 1, 3, 'mod/data:managecomments', 1, 1458047395, 0),
(500, 1, 1, 'mod/data:managecomments', 1, 1458047395, 0),
(501, 1, 3, 'mod/data:managetemplates', 1, 1458047395, 0),
(502, 1, 1, 'mod/data:managetemplates', 1, 1458047395, 0),
(503, 1, 4, 'mod/data:viewalluserpresets', 1, 1458047395, 0),
(504, 1, 3, 'mod/data:viewalluserpresets', 1, 1458047395, 0),
(505, 1, 1, 'mod/data:viewalluserpresets', 1, 1458047395, 0),
(506, 1, 1, 'mod/data:manageuserpresets', 1, 1458047395, 0),
(507, 1, 1, 'mod/data:exportentry', 1, 1458047395, 0),
(508, 1, 4, 'mod/data:exportentry', 1, 1458047395, 0),
(509, 1, 3, 'mod/data:exportentry', 1, 1458047395, 0),
(510, 1, 1, 'mod/data:exportownentry', 1, 1458047395, 0),
(511, 1, 4, 'mod/data:exportownentry', 1, 1458047395, 0),
(512, 1, 3, 'mod/data:exportownentry', 1, 1458047395, 0),
(513, 1, 5, 'mod/data:exportownentry', 1, 1458047395, 0),
(514, 1, 1, 'mod/data:exportallentries', 1, 1458047395, 0),
(515, 1, 4, 'mod/data:exportallentries', 1, 1458047395, 0),
(516, 1, 3, 'mod/data:exportallentries', 1, 1458047395, 0),
(517, 1, 1, 'mod/data:exportuserinfo', 1, 1458047395, 0),
(518, 1, 4, 'mod/data:exportuserinfo', 1, 1458047395, 0),
(519, 1, 3, 'mod/data:exportuserinfo', 1, 1458047395, 0),
(520, 1, 3, 'mod/feedback:addinstance', 1, 1458047395, 0),
(521, 1, 1, 'mod/feedback:addinstance', 1, 1458047395, 0),
(522, 1, 6, 'mod/feedback:view', 1, 1458047395, 0),
(523, 1, 5, 'mod/feedback:view', 1, 1458047395, 0),
(524, 1, 4, 'mod/feedback:view', 1, 1458047395, 0),
(525, 1, 3, 'mod/feedback:view', 1, 1458047395, 0),
(526, 1, 1, 'mod/feedback:view', 1, 1458047395, 0),
(527, 1, 5, 'mod/feedback:complete', 1, 1458047395, 0),
(528, 1, 5, 'mod/feedback:viewanalysepage', 1, 1458047395, 0),
(529, 1, 3, 'mod/feedback:viewanalysepage', 1, 1458047395, 0),
(530, 1, 1, 'mod/feedback:viewanalysepage', 1, 1458047395, 0),
(531, 1, 3, 'mod/feedback:deletesubmissions', 1, 1458047395, 0),
(532, 1, 1, 'mod/feedback:deletesubmissions', 1, 1458047395, 0),
(533, 1, 1, 'mod/feedback:mapcourse', 1, 1458047395, 0),
(534, 1, 3, 'mod/feedback:edititems', 1, 1458047395, 0),
(535, 1, 1, 'mod/feedback:edititems', 1, 1458047395, 0),
(536, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1458047395, 0),
(537, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1458047395, 0),
(538, 1, 3, 'mod/feedback:createpublictemplate', 1, 1458047395, 0),
(539, 1, 1, 'mod/feedback:createpublictemplate', 1, 1458047395, 0),
(540, 1, 3, 'mod/feedback:deletetemplate', 1, 1458047395, 0),
(541, 1, 1, 'mod/feedback:deletetemplate', 1, 1458047395, 0),
(542, 1, 4, 'mod/feedback:viewreports', 1, 1458047395, 0),
(543, 1, 3, 'mod/feedback:viewreports', 1, 1458047395, 0),
(544, 1, 1, 'mod/feedback:viewreports', 1, 1458047395, 0),
(545, 1, 4, 'mod/feedback:receivemail', 1, 1458047395, 0),
(546, 1, 3, 'mod/feedback:receivemail', 1, 1458047395, 0),
(547, 1, 3, 'mod/folder:addinstance', 1, 1458047395, 0),
(548, 1, 1, 'mod/folder:addinstance', 1, 1458047395, 0),
(549, 1, 6, 'mod/folder:view', 1, 1458047395, 0),
(550, 1, 7, 'mod/folder:view', 1, 1458047395, 0),
(551, 1, 3, 'mod/folder:managefiles', 1, 1458047395, 0),
(552, 1, 3, 'mod/forum:addinstance', 1, 1458047396, 0),
(553, 1, 1, 'mod/forum:addinstance', 1, 1458047396, 0),
(554, 1, 8, 'mod/forum:viewdiscussion', 1, 1458047396, 0),
(555, 1, 6, 'mod/forum:viewdiscussion', 1, 1458047396, 0),
(556, 1, 5, 'mod/forum:viewdiscussion', 1, 1458047396, 0),
(557, 1, 4, 'mod/forum:viewdiscussion', 1, 1458047396, 0),
(558, 1, 3, 'mod/forum:viewdiscussion', 1, 1458047396, 0),
(559, 1, 1, 'mod/forum:viewdiscussion', 1, 1458047396, 0),
(560, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1458047396, 0),
(561, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1458047396, 0),
(562, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1458047396, 0),
(563, 1, 5, 'mod/forum:startdiscussion', 1, 1458047396, 0),
(564, 1, 4, 'mod/forum:startdiscussion', 1, 1458047396, 0),
(565, 1, 3, 'mod/forum:startdiscussion', 1, 1458047396, 0),
(566, 1, 1, 'mod/forum:startdiscussion', 1, 1458047396, 0),
(567, 1, 5, 'mod/forum:replypost', 1, 1458047396, 0),
(568, 1, 4, 'mod/forum:replypost', 1, 1458047396, 0),
(569, 1, 3, 'mod/forum:replypost', 1, 1458047396, 0),
(570, 1, 1, 'mod/forum:replypost', 1, 1458047396, 0),
(571, 1, 4, 'mod/forum:addnews', 1, 1458047396, 0),
(572, 1, 3, 'mod/forum:addnews', 1, 1458047396, 0),
(573, 1, 1, 'mod/forum:addnews', 1, 1458047396, 0),
(574, 1, 4, 'mod/forum:replynews', 1, 1458047396, 0),
(575, 1, 3, 'mod/forum:replynews', 1, 1458047396, 0),
(576, 1, 1, 'mod/forum:replynews', 1, 1458047396, 0),
(577, 1, 5, 'mod/forum:viewrating', 1, 1458047396, 0),
(578, 1, 4, 'mod/forum:viewrating', 1, 1458047396, 0),
(579, 1, 3, 'mod/forum:viewrating', 1, 1458047396, 0),
(580, 1, 1, 'mod/forum:viewrating', 1, 1458047396, 0),
(581, 1, 4, 'mod/forum:viewanyrating', 1, 1458047396, 0),
(582, 1, 3, 'mod/forum:viewanyrating', 1, 1458047396, 0),
(583, 1, 1, 'mod/forum:viewanyrating', 1, 1458047396, 0),
(584, 1, 4, 'mod/forum:viewallratings', 1, 1458047396, 0),
(585, 1, 3, 'mod/forum:viewallratings', 1, 1458047396, 0),
(586, 1, 1, 'mod/forum:viewallratings', 1, 1458047396, 0),
(587, 1, 4, 'mod/forum:rate', 1, 1458047396, 0),
(588, 1, 3, 'mod/forum:rate', 1, 1458047396, 0),
(589, 1, 1, 'mod/forum:rate', 1, 1458047396, 0),
(590, 1, 5, 'mod/forum:createattachment', 1, 1458047396, 0),
(591, 1, 4, 'mod/forum:createattachment', 1, 1458047396, 0),
(592, 1, 3, 'mod/forum:createattachment', 1, 1458047396, 0),
(593, 1, 1, 'mod/forum:createattachment', 1, 1458047396, 0),
(594, 1, 5, 'mod/forum:deleteownpost', 1, 1458047396, 0),
(595, 1, 4, 'mod/forum:deleteownpost', 1, 1458047396, 0),
(596, 1, 3, 'mod/forum:deleteownpost', 1, 1458047396, 0),
(597, 1, 1, 'mod/forum:deleteownpost', 1, 1458047396, 0),
(598, 1, 4, 'mod/forum:deleteanypost', 1, 1458047396, 0),
(599, 1, 3, 'mod/forum:deleteanypost', 1, 1458047396, 0),
(600, 1, 1, 'mod/forum:deleteanypost', 1, 1458047396, 0),
(601, 1, 4, 'mod/forum:splitdiscussions', 1, 1458047396, 0),
(602, 1, 3, 'mod/forum:splitdiscussions', 1, 1458047396, 0),
(603, 1, 1, 'mod/forum:splitdiscussions', 1, 1458047396, 0),
(604, 1, 4, 'mod/forum:movediscussions', 1, 1458047396, 0),
(605, 1, 3, 'mod/forum:movediscussions', 1, 1458047396, 0),
(606, 1, 1, 'mod/forum:movediscussions', 1, 1458047396, 0),
(607, 1, 4, 'mod/forum:editanypost', 1, 1458047396, 0),
(608, 1, 3, 'mod/forum:editanypost', 1, 1458047396, 0),
(609, 1, 1, 'mod/forum:editanypost', 1, 1458047396, 0),
(610, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1458047396, 0),
(611, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1458047396, 0),
(612, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1458047396, 0),
(613, 1, 4, 'mod/forum:viewsubscribers', 1, 1458047396, 0),
(614, 1, 3, 'mod/forum:viewsubscribers', 1, 1458047396, 0),
(615, 1, 1, 'mod/forum:viewsubscribers', 1, 1458047396, 0),
(616, 1, 4, 'mod/forum:managesubscriptions', 1, 1458047396, 0),
(617, 1, 3, 'mod/forum:managesubscriptions', 1, 1458047396, 0),
(618, 1, 1, 'mod/forum:managesubscriptions', 1, 1458047396, 0),
(619, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1458047396, 0),
(620, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1458047396, 0),
(621, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1458047396, 0),
(622, 1, 4, 'mod/forum:exportdiscussion', 1, 1458047396, 0),
(623, 1, 3, 'mod/forum:exportdiscussion', 1, 1458047396, 0),
(624, 1, 1, 'mod/forum:exportdiscussion', 1, 1458047396, 0),
(625, 1, 4, 'mod/forum:exportpost', 1, 1458047396, 0),
(626, 1, 3, 'mod/forum:exportpost', 1, 1458047396, 0),
(627, 1, 1, 'mod/forum:exportpost', 1, 1458047396, 0),
(628, 1, 4, 'mod/forum:exportownpost', 1, 1458047396, 0),
(629, 1, 3, 'mod/forum:exportownpost', 1, 1458047396, 0),
(630, 1, 1, 'mod/forum:exportownpost', 1, 1458047396, 0),
(631, 1, 5, 'mod/forum:exportownpost', 1, 1458047396, 0),
(632, 1, 4, 'mod/forum:addquestion', 1, 1458047396, 0),
(633, 1, 3, 'mod/forum:addquestion', 1, 1458047396, 0),
(634, 1, 1, 'mod/forum:addquestion', 1, 1458047396, 0),
(635, 1, 5, 'mod/forum:allowforcesubscribe', 1, 1458047396, 0),
(636, 1, 4, 'mod/forum:allowforcesubscribe', 1, 1458047396, 0),
(637, 1, 3, 'mod/forum:allowforcesubscribe', 1, 1458047396, 0),
(638, 1, 8, 'mod/forum:allowforcesubscribe', 1, 1458047396, 0),
(639, 1, 4, 'mod/forum:canposttomygroups', 1, 1458047396, 0),
(640, 1, 3, 'mod/forum:canposttomygroups', 1, 1458047396, 0),
(641, 1, 1, 'mod/forum:canposttomygroups', 1, 1458047396, 0),
(642, 1, 3, 'mod/glossary:addinstance', 1, 1458047396, 0),
(643, 1, 1, 'mod/glossary:addinstance', 1, 1458047396, 0),
(644, 1, 8, 'mod/glossary:view', 1, 1458047396, 0),
(645, 1, 6, 'mod/glossary:view', 1, 1458047396, 0),
(646, 1, 5, 'mod/glossary:view', 1, 1458047396, 0),
(647, 1, 4, 'mod/glossary:view', 1, 1458047396, 0),
(648, 1, 3, 'mod/glossary:view', 1, 1458047396, 0),
(649, 1, 1, 'mod/glossary:view', 1, 1458047396, 0),
(650, 1, 5, 'mod/glossary:write', 1, 1458047396, 0),
(651, 1, 4, 'mod/glossary:write', 1, 1458047396, 0),
(652, 1, 3, 'mod/glossary:write', 1, 1458047396, 0),
(653, 1, 1, 'mod/glossary:write', 1, 1458047396, 0),
(654, 1, 4, 'mod/glossary:manageentries', 1, 1458047396, 0),
(655, 1, 3, 'mod/glossary:manageentries', 1, 1458047396, 0),
(656, 1, 1, 'mod/glossary:manageentries', 1, 1458047396, 0),
(657, 1, 4, 'mod/glossary:managecategories', 1, 1458047396, 0),
(658, 1, 3, 'mod/glossary:managecategories', 1, 1458047396, 0),
(659, 1, 1, 'mod/glossary:managecategories', 1, 1458047396, 0),
(660, 1, 5, 'mod/glossary:comment', 1, 1458047396, 0),
(661, 1, 4, 'mod/glossary:comment', 1, 1458047396, 0),
(662, 1, 3, 'mod/glossary:comment', 1, 1458047396, 0),
(663, 1, 1, 'mod/glossary:comment', 1, 1458047396, 0),
(664, 1, 4, 'mod/glossary:managecomments', 1, 1458047396, 0),
(665, 1, 3, 'mod/glossary:managecomments', 1, 1458047396, 0),
(666, 1, 1, 'mod/glossary:managecomments', 1, 1458047396, 0),
(667, 1, 4, 'mod/glossary:import', 1, 1458047396, 0),
(668, 1, 3, 'mod/glossary:import', 1, 1458047396, 0),
(669, 1, 1, 'mod/glossary:import', 1, 1458047396, 0),
(670, 1, 4, 'mod/glossary:export', 1, 1458047396, 0),
(671, 1, 3, 'mod/glossary:export', 1, 1458047396, 0),
(672, 1, 1, 'mod/glossary:export', 1, 1458047396, 0),
(673, 1, 4, 'mod/glossary:approve', 1, 1458047396, 0),
(674, 1, 3, 'mod/glossary:approve', 1, 1458047397, 0),
(675, 1, 1, 'mod/glossary:approve', 1, 1458047397, 0),
(676, 1, 4, 'mod/glossary:rate', 1, 1458047397, 0),
(677, 1, 3, 'mod/glossary:rate', 1, 1458047397, 0),
(678, 1, 1, 'mod/glossary:rate', 1, 1458047397, 0),
(679, 1, 4, 'mod/glossary:viewrating', 1, 1458047397, 0),
(680, 1, 3, 'mod/glossary:viewrating', 1, 1458047397, 0),
(681, 1, 1, 'mod/glossary:viewrating', 1, 1458047397, 0),
(682, 1, 4, 'mod/glossary:viewanyrating', 1, 1458047397, 0),
(683, 1, 3, 'mod/glossary:viewanyrating', 1, 1458047397, 0),
(684, 1, 1, 'mod/glossary:viewanyrating', 1, 1458047397, 0),
(685, 1, 4, 'mod/glossary:viewallratings', 1, 1458047397, 0),
(686, 1, 3, 'mod/glossary:viewallratings', 1, 1458047397, 0),
(687, 1, 1, 'mod/glossary:viewallratings', 1, 1458047397, 0),
(688, 1, 4, 'mod/glossary:exportentry', 1, 1458047397, 0),
(689, 1, 3, 'mod/glossary:exportentry', 1, 1458047397, 0),
(690, 1, 1, 'mod/glossary:exportentry', 1, 1458047397, 0),
(691, 1, 4, 'mod/glossary:exportownentry', 1, 1458047397, 0),
(692, 1, 3, 'mod/glossary:exportownentry', 1, 1458047397, 0),
(693, 1, 1, 'mod/glossary:exportownentry', 1, 1458047397, 0),
(694, 1, 5, 'mod/glossary:exportownentry', 1, 1458047397, 0),
(695, 1, 6, 'mod/imscp:view', 1, 1458047398, 0),
(696, 1, 7, 'mod/imscp:view', 1, 1458047398, 0),
(697, 1, 3, 'mod/imscp:addinstance', 1, 1458047398, 0),
(698, 1, 1, 'mod/imscp:addinstance', 1, 1458047398, 0),
(699, 1, 3, 'mod/label:addinstance', 1, 1458047398, 0),
(700, 1, 1, 'mod/label:addinstance', 1, 1458047398, 0),
(701, 1, 3, 'mod/lesson:addinstance', 1, 1458047399, 0),
(702, 1, 1, 'mod/lesson:addinstance', 1, 1458047399, 0),
(703, 1, 3, 'mod/lesson:edit', 1, 1458047399, 0),
(704, 1, 1, 'mod/lesson:edit', 1, 1458047399, 0),
(705, 1, 4, 'mod/lesson:grade', 1, 1458047399, 0),
(706, 1, 3, 'mod/lesson:grade', 1, 1458047399, 0),
(707, 1, 1, 'mod/lesson:grade', 1, 1458047399, 0),
(708, 1, 4, 'mod/lesson:viewreports', 1, 1458047399, 0),
(709, 1, 3, 'mod/lesson:viewreports', 1, 1458047399, 0),
(710, 1, 1, 'mod/lesson:viewreports', 1, 1458047399, 0),
(711, 1, 4, 'mod/lesson:manage', 1, 1458047399, 0),
(712, 1, 3, 'mod/lesson:manage', 1, 1458047399, 0),
(713, 1, 1, 'mod/lesson:manage', 1, 1458047399, 0),
(714, 1, 3, 'mod/lesson:manageoverrides', 1, 1458047399, 0),
(715, 1, 1, 'mod/lesson:manageoverrides', 1, 1458047399, 0),
(716, 1, 5, 'mod/lti:view', 1, 1458047400, 0),
(717, 1, 4, 'mod/lti:view', 1, 1458047400, 0),
(718, 1, 3, 'mod/lti:view', 1, 1458047400, 0),
(719, 1, 1, 'mod/lti:view', 1, 1458047400, 0),
(720, 1, 3, 'mod/lti:addinstance', 1, 1458047400, 0),
(721, 1, 1, 'mod/lti:addinstance', 1, 1458047400, 0),
(722, 1, 4, 'mod/lti:manage', 1, 1458047400, 0),
(723, 1, 3, 'mod/lti:manage', 1, 1458047400, 0),
(724, 1, 1, 'mod/lti:manage', 1, 1458047400, 0),
(725, 1, 3, 'mod/lti:addcoursetool', 1, 1458047400, 0),
(726, 1, 1, 'mod/lti:addcoursetool', 1, 1458047401, 0),
(727, 1, 3, 'mod/lti:requesttooladd', 1, 1458047401, 0),
(728, 1, 1, 'mod/lti:requesttooladd', 1, 1458047401, 0),
(729, 1, 6, 'mod/page:view', 1, 1458047401, 0),
(730, 1, 7, 'mod/page:view', 1, 1458047401, 0),
(731, 1, 3, 'mod/page:addinstance', 1, 1458047401, 0),
(732, 1, 1, 'mod/page:addinstance', 1, 1458047401, 0),
(733, 1, 6, 'mod/quiz:view', 1, 1458047401, 0),
(734, 1, 5, 'mod/quiz:view', 1, 1458047401, 0),
(735, 1, 4, 'mod/quiz:view', 1, 1458047401, 0),
(736, 1, 3, 'mod/quiz:view', 1, 1458047401, 0),
(737, 1, 1, 'mod/quiz:view', 1, 1458047401, 0),
(738, 1, 3, 'mod/quiz:addinstance', 1, 1458047401, 0),
(739, 1, 1, 'mod/quiz:addinstance', 1, 1458047401, 0),
(740, 1, 5, 'mod/quiz:attempt', 1, 1458047401, 0),
(741, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1458047401, 0),
(742, 1, 3, 'mod/quiz:manage', 1, 1458047401, 0),
(743, 1, 1, 'mod/quiz:manage', 1, 1458047401, 0),
(744, 1, 3, 'mod/quiz:manageoverrides', 1, 1458047401, 0),
(745, 1, 1, 'mod/quiz:manageoverrides', 1, 1458047401, 0),
(746, 1, 4, 'mod/quiz:preview', 1, 1458047401, 0),
(747, 1, 3, 'mod/quiz:preview', 1, 1458047401, 0),
(748, 1, 1, 'mod/quiz:preview', 1, 1458047401, 0),
(749, 1, 4, 'mod/quiz:grade', 1, 1458047401, 0),
(750, 1, 3, 'mod/quiz:grade', 1, 1458047401, 0),
(751, 1, 1, 'mod/quiz:grade', 1, 1458047401, 0),
(752, 1, 4, 'mod/quiz:regrade', 1, 1458047401, 0),
(753, 1, 3, 'mod/quiz:regrade', 1, 1458047401, 0),
(754, 1, 1, 'mod/quiz:regrade', 1, 1458047401, 0),
(755, 1, 4, 'mod/quiz:viewreports', 1, 1458047401, 0),
(756, 1, 3, 'mod/quiz:viewreports', 1, 1458047401, 0),
(757, 1, 1, 'mod/quiz:viewreports', 1, 1458047401, 0),
(758, 1, 3, 'mod/quiz:deleteattempts', 1, 1458047401, 0),
(759, 1, 1, 'mod/quiz:deleteattempts', 1, 1458047401, 0),
(760, 1, 6, 'mod/resource:view', 1, 1458047402, 0),
(761, 1, 7, 'mod/resource:view', 1, 1458047402, 0),
(762, 1, 3, 'mod/resource:addinstance', 1, 1458047402, 0),
(763, 1, 1, 'mod/resource:addinstance', 1, 1458047402, 0),
(764, 1, 3, 'mod/scorm:addinstance', 1, 1458047402, 0),
(765, 1, 1, 'mod/scorm:addinstance', 1, 1458047402, 0),
(766, 1, 4, 'mod/scorm:viewreport', 1, 1458047402, 0),
(767, 1, 3, 'mod/scorm:viewreport', 1, 1458047402, 0),
(768, 1, 1, 'mod/scorm:viewreport', 1, 1458047402, 0),
(769, 1, 5, 'mod/scorm:skipview', 1, 1458047402, 0),
(770, 1, 5, 'mod/scorm:savetrack', 1, 1458047402, 0),
(771, 1, 4, 'mod/scorm:savetrack', 1, 1458047402, 0),
(772, 1, 3, 'mod/scorm:savetrack', 1, 1458047402, 0),
(773, 1, 1, 'mod/scorm:savetrack', 1, 1458047402, 0),
(774, 1, 5, 'mod/scorm:viewscores', 1, 1458047402, 0),
(775, 1, 4, 'mod/scorm:viewscores', 1, 1458047402, 0),
(776, 1, 3, 'mod/scorm:viewscores', 1, 1458047402, 0),
(777, 1, 1, 'mod/scorm:viewscores', 1, 1458047402, 0),
(778, 1, 4, 'mod/scorm:deleteresponses', 1, 1458047402, 0),
(779, 1, 3, 'mod/scorm:deleteresponses', 1, 1458047402, 0),
(780, 1, 1, 'mod/scorm:deleteresponses', 1, 1458047402, 0),
(781, 1, 3, 'mod/survey:addinstance', 1, 1458047402, 0),
(782, 1, 1, 'mod/survey:addinstance', 1, 1458047402, 0),
(783, 1, 5, 'mod/survey:participate', 1, 1458047402, 0),
(784, 1, 4, 'mod/survey:participate', 1, 1458047402, 0),
(785, 1, 3, 'mod/survey:participate', 1, 1458047402, 0),
(786, 1, 1, 'mod/survey:participate', 1, 1458047402, 0),
(787, 1, 4, 'mod/survey:readresponses', 1, 1458047402, 0),
(788, 1, 3, 'mod/survey:readresponses', 1, 1458047402, 0),
(789, 1, 1, 'mod/survey:readresponses', 1, 1458047402, 0),
(790, 1, 4, 'mod/survey:download', 1, 1458047402, 0),
(791, 1, 3, 'mod/survey:download', 1, 1458047402, 0),
(792, 1, 1, 'mod/survey:download', 1, 1458047402, 0),
(793, 1, 6, 'mod/url:view', 1, 1458047403, 0),
(794, 1, 7, 'mod/url:view', 1, 1458047403, 0),
(795, 1, 3, 'mod/url:addinstance', 1, 1458047403, 0),
(796, 1, 1, 'mod/url:addinstance', 1, 1458047403, 0),
(797, 1, 3, 'mod/wiki:addinstance', 1, 1458047403, 0),
(798, 1, 1, 'mod/wiki:addinstance', 1, 1458047403, 0),
(799, 1, 6, 'mod/wiki:viewpage', 1, 1458047403, 0),
(800, 1, 5, 'mod/wiki:viewpage', 1, 1458047403, 0),
(801, 1, 4, 'mod/wiki:viewpage', 1, 1458047403, 0),
(802, 1, 3, 'mod/wiki:viewpage', 1, 1458047403, 0),
(803, 1, 1, 'mod/wiki:viewpage', 1, 1458047403, 0),
(804, 1, 5, 'mod/wiki:editpage', 1, 1458047403, 0),
(805, 1, 4, 'mod/wiki:editpage', 1, 1458047403, 0),
(806, 1, 3, 'mod/wiki:editpage', 1, 1458047403, 0),
(807, 1, 1, 'mod/wiki:editpage', 1, 1458047403, 0),
(808, 1, 5, 'mod/wiki:createpage', 1, 1458047403, 0),
(809, 1, 4, 'mod/wiki:createpage', 1, 1458047403, 0),
(810, 1, 3, 'mod/wiki:createpage', 1, 1458047403, 0),
(811, 1, 1, 'mod/wiki:createpage', 1, 1458047403, 0),
(812, 1, 5, 'mod/wiki:viewcomment', 1, 1458047403, 0),
(813, 1, 4, 'mod/wiki:viewcomment', 1, 1458047403, 0),
(814, 1, 3, 'mod/wiki:viewcomment', 1, 1458047403, 0),
(815, 1, 1, 'mod/wiki:viewcomment', 1, 1458047403, 0),
(816, 1, 5, 'mod/wiki:editcomment', 1, 1458047403, 0),
(817, 1, 4, 'mod/wiki:editcomment', 1, 1458047403, 0),
(818, 1, 3, 'mod/wiki:editcomment', 1, 1458047403, 0),
(819, 1, 1, 'mod/wiki:editcomment', 1, 1458047403, 0),
(820, 1, 4, 'mod/wiki:managecomment', 1, 1458047403, 0),
(821, 1, 3, 'mod/wiki:managecomment', 1, 1458047403, 0),
(822, 1, 1, 'mod/wiki:managecomment', 1, 1458047403, 0),
(823, 1, 4, 'mod/wiki:managefiles', 1, 1458047403, 0),
(824, 1, 3, 'mod/wiki:managefiles', 1, 1458047403, 0),
(825, 1, 1, 'mod/wiki:managefiles', 1, 1458047403, 0),
(826, 1, 4, 'mod/wiki:overridelock', 1, 1458047403, 0),
(827, 1, 3, 'mod/wiki:overridelock', 1, 1458047403, 0),
(828, 1, 1, 'mod/wiki:overridelock', 1, 1458047403, 0),
(829, 1, 4, 'mod/wiki:managewiki', 1, 1458047403, 0),
(830, 1, 3, 'mod/wiki:managewiki', 1, 1458047403, 0),
(831, 1, 1, 'mod/wiki:managewiki', 1, 1458047403, 0),
(832, 1, 6, 'mod/workshop:view', 1, 1458047403, 0),
(833, 1, 5, 'mod/workshop:view', 1, 1458047403, 0),
(834, 1, 4, 'mod/workshop:view', 1, 1458047403, 0),
(835, 1, 3, 'mod/workshop:view', 1, 1458047403, 0),
(836, 1, 1, 'mod/workshop:view', 1, 1458047403, 0),
(837, 1, 3, 'mod/workshop:addinstance', 1, 1458047403, 0),
(838, 1, 1, 'mod/workshop:addinstance', 1, 1458047403, 0),
(839, 1, 4, 'mod/workshop:switchphase', 1, 1458047403, 0),
(840, 1, 3, 'mod/workshop:switchphase', 1, 1458047403, 0),
(841, 1, 1, 'mod/workshop:switchphase', 1, 1458047403, 0),
(842, 1, 3, 'mod/workshop:editdimensions', 1, 1458047403, 0),
(843, 1, 1, 'mod/workshop:editdimensions', 1, 1458047403, 0),
(844, 1, 5, 'mod/workshop:submit', 1, 1458047403, 0),
(845, 1, 5, 'mod/workshop:peerassess', 1, 1458047403, 0),
(846, 1, 4, 'mod/workshop:manageexamples', 1, 1458047403, 0),
(847, 1, 3, 'mod/workshop:manageexamples', 1, 1458047403, 0),
(848, 1, 1, 'mod/workshop:manageexamples', 1, 1458047403, 0),
(849, 1, 4, 'mod/workshop:allocate', 1, 1458047403, 0),
(850, 1, 3, 'mod/workshop:allocate', 1, 1458047403, 0),
(851, 1, 1, 'mod/workshop:allocate', 1, 1458047403, 0),
(852, 1, 4, 'mod/workshop:publishsubmissions', 1, 1458047403, 0),
(853, 1, 3, 'mod/workshop:publishsubmissions', 1, 1458047403, 0),
(854, 1, 1, 'mod/workshop:publishsubmissions', 1, 1458047403, 0),
(855, 1, 5, 'mod/workshop:viewauthornames', 1, 1458047403, 0),
(856, 1, 4, 'mod/workshop:viewauthornames', 1, 1458047403, 0),
(857, 1, 3, 'mod/workshop:viewauthornames', 1, 1458047403, 0),
(858, 1, 1, 'mod/workshop:viewauthornames', 1, 1458047403, 0),
(859, 1, 4, 'mod/workshop:viewreviewernames', 1, 1458047403, 0),
(860, 1, 3, 'mod/workshop:viewreviewernames', 1, 1458047403, 0),
(861, 1, 1, 'mod/workshop:viewreviewernames', 1, 1458047403, 0),
(862, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1458047403, 0),
(863, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1458047403, 0),
(864, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1458047403, 0),
(865, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1458047403, 0),
(866, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1458047403, 0),
(867, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1458047403, 0),
(868, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1458047403, 0),
(869, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1458047403, 0),
(870, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1458047403, 0),
(871, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1458047403, 0),
(872, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1458047403, 0),
(873, 1, 4, 'mod/workshop:viewallassessments', 1, 1458047403, 0),
(874, 1, 3, 'mod/workshop:viewallassessments', 1, 1458047403, 0),
(875, 1, 1, 'mod/workshop:viewallassessments', 1, 1458047403, 0),
(876, 1, 4, 'mod/workshop:overridegrades', 1, 1458047403, 0),
(877, 1, 3, 'mod/workshop:overridegrades', 1, 1458047403, 0),
(878, 1, 1, 'mod/workshop:overridegrades', 1, 1458047403, 0),
(879, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1458047403, 0),
(880, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1458047403, 0),
(881, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1458047403, 0),
(882, 1, 1, 'enrol/category:config', 1, 1458047405, 0),
(883, 1, 3, 'enrol/category:config', 1, 1458047405, 0),
(884, 1, 3, 'enrol/cohort:config', 1, 1458047405, 0),
(885, 1, 1, 'enrol/cohort:config', 1, 1458047405, 0),
(886, 1, 1, 'enrol/cohort:unenrol', 1, 1458047405, 0),
(887, 1, 1, 'enrol/database:unenrol', 1, 1458047405, 0),
(888, 1, 1, 'enrol/database:config', 1, 1458047405, 0),
(889, 1, 3, 'enrol/database:config', 1, 1458047405, 0),
(890, 1, 1, 'enrol/guest:config', 1, 1458047405, 0),
(891, 1, 3, 'enrol/guest:config', 1, 1458047405, 0),
(892, 1, 1, 'enrol/imsenterprise:config', 1, 1458047405, 0),
(893, 1, 3, 'enrol/imsenterprise:config', 1, 1458047405, 0),
(894, 1, 1, 'enrol/ldap:manage', 1, 1458047405, 0);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(895, 1, 1, 'enrol/manual:config', 1, 1458047405, 0),
(896, 1, 1, 'enrol/manual:enrol', 1, 1458047405, 0),
(897, 1, 3, 'enrol/manual:enrol', 1, 1458047405, 0),
(898, 1, 1, 'enrol/manual:manage', 1, 1458047405, 0),
(899, 1, 3, 'enrol/manual:manage', 1, 1458047405, 0),
(900, 1, 1, 'enrol/manual:unenrol', 1, 1458047405, 0),
(901, 1, 3, 'enrol/manual:unenrol', 1, 1458047405, 0),
(902, 1, 1, 'enrol/meta:config', 1, 1458047405, 0),
(903, 1, 3, 'enrol/meta:config', 1, 1458047405, 0),
(904, 1, 1, 'enrol/meta:selectaslinked', 1, 1458047405, 0),
(905, 1, 1, 'enrol/meta:unenrol', 1, 1458047405, 0),
(906, 1, 1, 'enrol/mnet:config', 1, 1458047405, 0),
(907, 1, 3, 'enrol/mnet:config', 1, 1458047405, 0),
(908, 1, 1, 'enrol/paypal:config', 1, 1458047406, 0),
(909, 1, 1, 'enrol/paypal:manage', 1, 1458047406, 0),
(910, 1, 3, 'enrol/paypal:manage', 1, 1458047406, 0),
(911, 1, 1, 'enrol/paypal:unenrol', 1, 1458047406, 0),
(912, 1, 3, 'enrol/self:config', 1, 1458047406, 0),
(913, 1, 1, 'enrol/self:config', 1, 1458047406, 0),
(914, 1, 3, 'enrol/self:manage', 1, 1458047406, 0),
(915, 1, 1, 'enrol/self:manage', 1, 1458047406, 0),
(916, 1, 1, 'enrol/self:holdkey', -1000, 1458047406, 0),
(917, 1, 5, 'enrol/self:unenrolself', 1, 1458047406, 0),
(918, 1, 3, 'enrol/self:unenrol', 1, 1458047406, 0),
(919, 1, 1, 'enrol/self:unenrol', 1, 1458047406, 0),
(920, 1, 7, 'message/airnotifier:managedevice', 1, 1458047406, 0),
(921, 1, 3, 'block/activity_modules:addinstance', 1, 1458047406, 0),
(922, 1, 1, 'block/activity_modules:addinstance', 1, 1458047406, 0),
(923, 1, 3, 'block/activity_results:addinstance', 1, 1458047406, 0),
(924, 1, 1, 'block/activity_results:addinstance', 1, 1458047406, 0),
(925, 1, 7, 'block/admin_bookmarks:myaddinstance', 1, 1458047407, 0),
(926, 1, 3, 'block/admin_bookmarks:addinstance', 1, 1458047407, 0),
(927, 1, 1, 'block/admin_bookmarks:addinstance', 1, 1458047407, 0),
(928, 1, 3, 'block/badges:addinstance', 1, 1458047407, 0),
(929, 1, 1, 'block/badges:addinstance', 1, 1458047407, 0),
(930, 1, 7, 'block/badges:myaddinstance', 1, 1458047407, 0),
(931, 1, 3, 'block/blog_menu:addinstance', 1, 1458047407, 0),
(932, 1, 1, 'block/blog_menu:addinstance', 1, 1458047407, 0),
(933, 1, 3, 'block/blog_recent:addinstance', 1, 1458047407, 0),
(934, 1, 1, 'block/blog_recent:addinstance', 1, 1458047407, 0),
(935, 1, 3, 'block/blog_tags:addinstance', 1, 1458047407, 0),
(936, 1, 1, 'block/blog_tags:addinstance', 1, 1458047407, 0),
(937, 1, 7, 'block/calendar_month:myaddinstance', 1, 1458047407, 0),
(938, 1, 3, 'block/calendar_month:addinstance', 1, 1458047407, 0),
(939, 1, 1, 'block/calendar_month:addinstance', 1, 1458047407, 0),
(940, 1, 7, 'block/calendar_upcoming:myaddinstance', 1, 1458047407, 0),
(941, 1, 3, 'block/calendar_upcoming:addinstance', 1, 1458047407, 0),
(942, 1, 1, 'block/calendar_upcoming:addinstance', 1, 1458047407, 0),
(943, 1, 7, 'block/comments:myaddinstance', 1, 1458047407, 0),
(944, 1, 3, 'block/comments:addinstance', 1, 1458047407, 0),
(945, 1, 1, 'block/comments:addinstance', 1, 1458047407, 0),
(946, 1, 7, 'block/community:myaddinstance', 1, 1458047407, 0),
(947, 1, 3, 'block/community:addinstance', 1, 1458047407, 0),
(948, 1, 1, 'block/community:addinstance', 1, 1458047407, 0),
(949, 1, 3, 'block/completionstatus:addinstance', 1, 1458047407, 0),
(950, 1, 1, 'block/completionstatus:addinstance', 1, 1458047407, 0),
(951, 1, 7, 'block/course_list:myaddinstance', 1, 1458047407, 0),
(952, 1, 3, 'block/course_list:addinstance', 1, 1458047407, 0),
(953, 1, 1, 'block/course_list:addinstance', 1, 1458047407, 0),
(954, 1, 7, 'block/course_overview:myaddinstance', 1, 1458047407, 0),
(955, 1, 3, 'block/course_overview:addinstance', 1, 1458047407, 0),
(956, 1, 1, 'block/course_overview:addinstance', 1, 1458047407, 0),
(957, 1, 3, 'block/course_summary:addinstance', 1, 1458047407, 0),
(958, 1, 1, 'block/course_summary:addinstance', 1, 1458047407, 0),
(959, 1, 3, 'block/feedback:addinstance', 1, 1458047408, 0),
(960, 1, 1, 'block/feedback:addinstance', 1, 1458047408, 0),
(961, 1, 7, 'block/glossary_random:myaddinstance', 1, 1458047408, 0),
(962, 1, 3, 'block/glossary_random:addinstance', 1, 1458047408, 0),
(963, 1, 1, 'block/glossary_random:addinstance', 1, 1458047408, 0),
(964, 1, 7, 'block/html:myaddinstance', 1, 1458047408, 0),
(965, 1, 3, 'block/html:addinstance', 1, 1458047408, 0),
(966, 1, 1, 'block/html:addinstance', 1, 1458047408, 0),
(967, 1, 3, 'block/login:addinstance', 1, 1458047408, 0),
(968, 1, 1, 'block/login:addinstance', 1, 1458047408, 0),
(969, 1, 7, 'block/mentees:myaddinstance', 1, 1458047408, 0),
(970, 1, 3, 'block/mentees:addinstance', 1, 1458047408, 0),
(971, 1, 1, 'block/mentees:addinstance', 1, 1458047408, 0),
(972, 1, 7, 'block/messages:myaddinstance', 1, 1458047408, 0),
(973, 1, 3, 'block/messages:addinstance', 1, 1458047408, 0),
(974, 1, 1, 'block/messages:addinstance', 1, 1458047408, 0),
(975, 1, 7, 'block/mnet_hosts:myaddinstance', 1, 1458047408, 0),
(976, 1, 3, 'block/mnet_hosts:addinstance', 1, 1458047408, 0),
(977, 1, 1, 'block/mnet_hosts:addinstance', 1, 1458047408, 0),
(978, 1, 7, 'block/myprofile:myaddinstance', 1, 1458047408, 0),
(979, 1, 3, 'block/myprofile:addinstance', 1, 1458047408, 0),
(980, 1, 1, 'block/myprofile:addinstance', 1, 1458047408, 0),
(981, 1, 7, 'block/navigation:myaddinstance', 1, 1458047408, 0),
(982, 1, 3, 'block/navigation:addinstance', 1, 1458047408, 0),
(983, 1, 1, 'block/navigation:addinstance', 1, 1458047408, 0),
(984, 1, 7, 'block/news_items:myaddinstance', 1, 1458047408, 0),
(985, 1, 3, 'block/news_items:addinstance', 1, 1458047408, 0),
(986, 1, 1, 'block/news_items:addinstance', 1, 1458047408, 0),
(987, 1, 7, 'block/online_users:myaddinstance', 1, 1458047408, 0),
(988, 1, 3, 'block/online_users:addinstance', 1, 1458047408, 0),
(989, 1, 1, 'block/online_users:addinstance', 1, 1458047408, 0),
(990, 1, 7, 'block/online_users:viewlist', 1, 1458047408, 0),
(991, 1, 6, 'block/online_users:viewlist', 1, 1458047408, 0),
(992, 1, 5, 'block/online_users:viewlist', 1, 1458047408, 0),
(993, 1, 4, 'block/online_users:viewlist', 1, 1458047408, 0),
(994, 1, 3, 'block/online_users:viewlist', 1, 1458047409, 0),
(995, 1, 1, 'block/online_users:viewlist', 1, 1458047409, 0),
(996, 1, 3, 'block/participants:addinstance', 1, 1458047409, 0),
(997, 1, 1, 'block/participants:addinstance', 1, 1458047409, 0),
(998, 1, 7, 'block/private_files:myaddinstance', 1, 1458047409, 0),
(999, 1, 3, 'block/private_files:addinstance', 1, 1458047409, 0),
(1000, 1, 1, 'block/private_files:addinstance', 1, 1458047409, 0),
(1001, 1, 3, 'block/quiz_results:addinstance', 1, 1458047410, 0),
(1002, 1, 1, 'block/quiz_results:addinstance', 1, 1458047410, 0),
(1003, 1, 3, 'block/recent_activity:addinstance', 1, 1458047410, 0),
(1004, 1, 1, 'block/recent_activity:addinstance', 1, 1458047410, 0),
(1005, 1, 7, 'block/recent_activity:viewaddupdatemodule', 1, 1458047410, 0),
(1006, 1, 7, 'block/recent_activity:viewdeletemodule', 1, 1458047410, 0),
(1007, 1, 7, 'block/rss_client:myaddinstance', 1, 1458047410, 0),
(1008, 1, 3, 'block/rss_client:addinstance', 1, 1458047411, 0),
(1009, 1, 1, 'block/rss_client:addinstance', 1, 1458047411, 0),
(1010, 1, 4, 'block/rss_client:manageownfeeds', 1, 1458047411, 0),
(1011, 1, 3, 'block/rss_client:manageownfeeds', 1, 1458047411, 0),
(1012, 1, 1, 'block/rss_client:manageownfeeds', 1, 1458047411, 0),
(1013, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1458047411, 0),
(1014, 1, 3, 'block/search_forums:addinstance', 1, 1458047411, 0),
(1015, 1, 1, 'block/search_forums:addinstance', 1, 1458047411, 0),
(1016, 1, 3, 'block/section_links:addinstance', 1, 1458047411, 0),
(1017, 1, 1, 'block/section_links:addinstance', 1, 1458047411, 0),
(1018, 1, 3, 'block/selfcompletion:addinstance', 1, 1458047411, 0),
(1019, 1, 1, 'block/selfcompletion:addinstance', 1, 1458047411, 0),
(1020, 1, 7, 'block/settings:myaddinstance', 1, 1458047412, 0),
(1021, 1, 3, 'block/settings:addinstance', 1, 1458047412, 0),
(1022, 1, 1, 'block/settings:addinstance', 1, 1458047412, 0),
(1023, 1, 3, 'block/site_main_menu:addinstance', 1, 1458047412, 0),
(1024, 1, 1, 'block/site_main_menu:addinstance', 1, 1458047412, 0),
(1025, 1, 3, 'block/social_activities:addinstance', 1, 1458047412, 0),
(1026, 1, 1, 'block/social_activities:addinstance', 1, 1458047412, 0),
(1027, 1, 3, 'block/tag_flickr:addinstance', 1, 1458047413, 0),
(1028, 1, 1, 'block/tag_flickr:addinstance', 1, 1458047413, 0),
(1029, 1, 3, 'block/tag_youtube:addinstance', 1, 1458047413, 0),
(1030, 1, 1, 'block/tag_youtube:addinstance', 1, 1458047413, 0),
(1031, 1, 7, 'block/tags:myaddinstance', 1, 1458047413, 0),
(1032, 1, 3, 'block/tags:addinstance', 1, 1458047413, 0),
(1033, 1, 1, 'block/tags:addinstance', 1, 1458047413, 0),
(1034, 1, 4, 'report/completion:view', 1, 1458047415, 0),
(1035, 1, 3, 'report/completion:view', 1, 1458047415, 0),
(1036, 1, 1, 'report/completion:view', 1, 1458047415, 0),
(1037, 1, 4, 'report/courseoverview:view', 1, 1458047416, 0),
(1038, 1, 3, 'report/courseoverview:view', 1, 1458047416, 0),
(1039, 1, 1, 'report/courseoverview:view', 1, 1458047416, 0),
(1040, 1, 4, 'report/log:view', 1, 1458047416, 0),
(1041, 1, 3, 'report/log:view', 1, 1458047416, 0),
(1042, 1, 1, 'report/log:view', 1, 1458047416, 0),
(1043, 1, 4, 'report/log:viewtoday', 1, 1458047416, 0),
(1044, 1, 3, 'report/log:viewtoday', 1, 1458047416, 0),
(1045, 1, 1, 'report/log:viewtoday', 1, 1458047416, 0),
(1046, 1, 4, 'report/loglive:view', 1, 1458047416, 0),
(1047, 1, 3, 'report/loglive:view', 1, 1458047416, 0),
(1048, 1, 1, 'report/loglive:view', 1, 1458047416, 0),
(1049, 1, 4, 'report/outline:view', 1, 1458047416, 0),
(1050, 1, 3, 'report/outline:view', 1, 1458047416, 0),
(1051, 1, 1, 'report/outline:view', 1, 1458047416, 0),
(1052, 1, 4, 'report/participation:view', 1, 1458047416, 0),
(1053, 1, 3, 'report/participation:view', 1, 1458047416, 0),
(1054, 1, 1, 'report/participation:view', 1, 1458047416, 0),
(1055, 1, 1, 'report/performance:view', 1, 1458047417, 0),
(1056, 1, 4, 'report/progress:view', 1, 1458047417, 0),
(1057, 1, 3, 'report/progress:view', 1, 1458047417, 0),
(1058, 1, 1, 'report/progress:view', 1, 1458047417, 0),
(1059, 1, 1, 'report/security:view', 1, 1458047417, 0),
(1060, 1, 4, 'report/stats:view', 1, 1458047417, 0),
(1061, 1, 3, 'report/stats:view', 1, 1458047417, 0),
(1062, 1, 1, 'report/stats:view', 1, 1458047417, 0),
(1063, 1, 6, 'report/usersessions:manageownsessions', -1000, 1458047417, 0),
(1064, 1, 7, 'report/usersessions:manageownsessions', 1, 1458047417, 0),
(1065, 1, 1, 'report/usersessions:manageownsessions', 1, 1458047417, 0),
(1066, 1, 4, 'gradeexport/ods:view', 1, 1458047417, 0),
(1067, 1, 3, 'gradeexport/ods:view', 1, 1458047417, 0),
(1068, 1, 1, 'gradeexport/ods:view', 1, 1458047417, 0),
(1069, 1, 1, 'gradeexport/ods:publish', 1, 1458047417, 0),
(1070, 1, 4, 'gradeexport/txt:view', 1, 1458047417, 0),
(1071, 1, 3, 'gradeexport/txt:view', 1, 1458047417, 0),
(1072, 1, 1, 'gradeexport/txt:view', 1, 1458047417, 0),
(1073, 1, 1, 'gradeexport/txt:publish', 1, 1458047417, 0),
(1074, 1, 4, 'gradeexport/xls:view', 1, 1458047417, 0),
(1075, 1, 3, 'gradeexport/xls:view', 1, 1458047417, 0),
(1076, 1, 1, 'gradeexport/xls:view', 1, 1458047417, 0),
(1077, 1, 1, 'gradeexport/xls:publish', 1, 1458047417, 0),
(1078, 1, 4, 'gradeexport/xml:view', 1, 1458047417, 0),
(1079, 1, 3, 'gradeexport/xml:view', 1, 1458047417, 0),
(1080, 1, 1, 'gradeexport/xml:view', 1, 1458047417, 0),
(1081, 1, 1, 'gradeexport/xml:publish', 1, 1458047417, 0),
(1082, 1, 3, 'gradeimport/csv:view', 1, 1458047417, 0),
(1083, 1, 1, 'gradeimport/csv:view', 1, 1458047417, 0),
(1084, 1, 3, 'gradeimport/direct:view', 1, 1458047417, 0),
(1085, 1, 1, 'gradeimport/direct:view', 1, 1458047417, 0),
(1086, 1, 3, 'gradeimport/xml:view', 1, 1458047417, 0),
(1087, 1, 1, 'gradeimport/xml:view', 1, 1458047417, 0),
(1088, 1, 1, 'gradeimport/xml:publish', 1, 1458047417, 0),
(1089, 1, 4, 'gradereport/grader:view', 1, 1458047417, 0),
(1090, 1, 3, 'gradereport/grader:view', 1, 1458047417, 0),
(1091, 1, 1, 'gradereport/grader:view', 1, 1458047417, 0),
(1092, 1, 4, 'gradereport/history:view', 1, 1458047417, 0),
(1093, 1, 3, 'gradereport/history:view', 1, 1458047417, 0),
(1094, 1, 1, 'gradereport/history:view', 1, 1458047417, 0),
(1095, 1, 4, 'gradereport/outcomes:view', 1, 1458047418, 0),
(1096, 1, 3, 'gradereport/outcomes:view', 1, 1458047418, 0),
(1097, 1, 1, 'gradereport/outcomes:view', 1, 1458047418, 0),
(1098, 1, 5, 'gradereport/overview:view', 1, 1458047418, 0),
(1099, 1, 1, 'gradereport/overview:view', 1, 1458047418, 0),
(1100, 1, 3, 'gradereport/singleview:view', 1, 1458047418, 0),
(1101, 1, 1, 'gradereport/singleview:view', 1, 1458047418, 0),
(1102, 1, 5, 'gradereport/user:view', 1, 1458047418, 0),
(1103, 1, 4, 'gradereport/user:view', 1, 1458047418, 0),
(1104, 1, 3, 'gradereport/user:view', 1, 1458047418, 0),
(1105, 1, 1, 'gradereport/user:view', 1, 1458047418, 0),
(1106, 1, 7, 'repository/alfresco:view', 1, 1458047418, 0),
(1107, 1, 7, 'repository/areafiles:view', 1, 1458047418, 0),
(1108, 1, 7, 'repository/boxnet:view', 1, 1458047418, 0),
(1109, 1, 2, 'repository/coursefiles:view', 1, 1458047418, 0),
(1110, 1, 4, 'repository/coursefiles:view', 1, 1458047418, 0),
(1111, 1, 3, 'repository/coursefiles:view', 1, 1458047418, 0),
(1112, 1, 1, 'repository/coursefiles:view', 1, 1458047418, 0),
(1113, 1, 7, 'repository/dropbox:view', 1, 1458047418, 0),
(1114, 1, 7, 'repository/equella:view', 1, 1458047418, 0),
(1115, 1, 2, 'repository/filesystem:view', 1, 1458047419, 0),
(1116, 1, 4, 'repository/filesystem:view', 1, 1458047419, 0),
(1117, 1, 3, 'repository/filesystem:view', 1, 1458047419, 0),
(1118, 1, 1, 'repository/filesystem:view', 1, 1458047419, 0),
(1119, 1, 7, 'repository/flickr:view', 1, 1458047419, 0),
(1120, 1, 7, 'repository/flickr_public:view', 1, 1458047419, 0),
(1121, 1, 7, 'repository/googledocs:view', 1, 1458047419, 0),
(1122, 1, 2, 'repository/local:view', 1, 1458047419, 0),
(1123, 1, 4, 'repository/local:view', 1, 1458047419, 0),
(1124, 1, 3, 'repository/local:view', 1, 1458047419, 0),
(1125, 1, 1, 'repository/local:view', 1, 1458047419, 0),
(1126, 1, 7, 'repository/merlot:view', 1, 1458047419, 0),
(1127, 1, 7, 'repository/picasa:view', 1, 1458047419, 0),
(1128, 1, 7, 'repository/recent:view', 1, 1458047419, 0),
(1129, 1, 7, 'repository/s3:view', 1, 1458047419, 0),
(1130, 1, 7, 'repository/skydrive:view', 1, 1458047419, 0),
(1131, 1, 7, 'repository/upload:view', 1, 1458047419, 0),
(1132, 1, 7, 'repository/url:view', 1, 1458047419, 0),
(1133, 1, 7, 'repository/user:view', 1, 1458047419, 0),
(1134, 1, 2, 'repository/webdav:view', 1, 1458047419, 0),
(1135, 1, 4, 'repository/webdav:view', 1, 1458047419, 0),
(1136, 1, 3, 'repository/webdav:view', 1, 1458047419, 0),
(1137, 1, 1, 'repository/webdav:view', 1, 1458047419, 0),
(1138, 1, 7, 'repository/wikimedia:view', 1, 1458047419, 0),
(1139, 1, 7, 'repository/youtube:view', 1, 1458047420, 0),
(1140, 1, 1, 'tool/customlang:view', 1, 1458047424, 0),
(1141, 1, 1, 'tool/customlang:edit', 1, 1458047424, 0),
(1142, 1, 4, 'tool/monitor:subscribe', 1, 1458047425, 0),
(1143, 1, 3, 'tool/monitor:subscribe', 1, 1458047425, 0),
(1144, 1, 1, 'tool/monitor:subscribe', 1, 1458047425, 0),
(1145, 1, 4, 'tool/monitor:managerules', 1, 1458047425, 0),
(1146, 1, 3, 'tool/monitor:managerules', 1, 1458047425, 0),
(1147, 1, 1, 'tool/monitor:managerules', 1, 1458047425, 0),
(1148, 1, 1, 'tool/monitor:managetool', 1, 1458047425, 0),
(1149, 1, 1, 'tool/uploaduser:uploaduserpictures', 1, 1458047426, 0),
(1150, 1, 3, 'booktool/importhtml:import', 1, 1458047428, 0),
(1151, 1, 1, 'booktool/importhtml:import', 1, 1458047428, 0),
(1152, 1, 6, 'booktool/print:print', 1, 1458047428, 0),
(1153, 1, 8, 'booktool/print:print', 1, 1458047428, 0),
(1154, 1, 5, 'booktool/print:print', 1, 1458047428, 0),
(1155, 1, 4, 'booktool/print:print', 1, 1458047428, 0),
(1156, 1, 3, 'booktool/print:print', 1, 1458047428, 0),
(1157, 1, 1, 'booktool/print:print', 1, 1458047428, 0),
(1158, 1, 4, 'quiz/grading:viewstudentnames', 1, 1458047429, 0),
(1159, 1, 3, 'quiz/grading:viewstudentnames', 1, 1458047429, 0),
(1160, 1, 1, 'quiz/grading:viewstudentnames', 1, 1458047429, 0),
(1161, 1, 4, 'quiz/grading:viewidnumber', 1, 1458047429, 0),
(1162, 1, 3, 'quiz/grading:viewidnumber', 1, 1458047429, 0),
(1163, 1, 1, 'quiz/grading:viewidnumber', 1, 1458047429, 0),
(1164, 1, 4, 'quiz/statistics:view', 1, 1458047429, 0),
(1165, 1, 3, 'quiz/statistics:view', 1, 1458047429, 0),
(1166, 1, 1, 'quiz/statistics:view', 1, 1458047429, 0),
(1176, 1, 7, 'webservice/xmlrpc:use', 1, 1458066926, 2),
(1177, 1, 7, 'webservice/rest:use', 1, 1458066926, 2),
(1367, 1, 7, 'block/kaplan_plugin:myaddinstance', 1, 1458190252, 2),
(1368, 1, 3, 'block/kaplan_plugin:addinstance', 1, 1458190252, 2),
(1369, 1, 1, 'block/kaplan_plugin:addinstance', 1, 1458190252, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_context_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists which roles can be assigned at which context levels. T';

--
-- Dumping data for table `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(10, 5, 50),
(7, 3, 70),
(9, 4, 70),
(11, 5, 70);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_names`
--

CREATE TABLE IF NOT EXISTS `mdl_role_names` (
  `id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='role names in native strings';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_sortorder`
--

CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='sort order of course managers in a course';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale`
--

CREATE TABLE IF NOT EXISTS `mdl_scale` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines grading scales';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale_history`
--

CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scormtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '0',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '0',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint(10) DEFAULT '-100',
  `navpositiontop` bigint(10) DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  `displayactivityname` smallint(4) NOT NULL DEFAULT '1',
  `autocommit` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each table is one SCORM module and its configuration';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_aicc_session`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scormstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sessiontime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by AICC HACP to store session information';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organization` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `launch` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scormtype` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each SCO part of the SCORM module';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_data`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains variable data get from packages';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_track`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to track SCOes';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective mapinfo description';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_objective`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective description';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `action` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule condition';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule conditions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_sessions` (
  `id` bigint(10) NOT NULL,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Database based session storage - now recommended';

--
-- Dumping data for table `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(24, 0, '2q4nh3bcrk7ipet7imuu674hd0', 2, NULL, 1458186689, 1458190657, '127.0.0.1', '127.0.0.1'),
(27, 0, '08afo0i4uho0np26qosh4e2qq0', 0, NULL, 1458190793, 1458190793, '127.0.0.1', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to accumulate daily stats';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate daily stats per course/user';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats per course/user';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats per course/user';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey`
--

CREATE TABLE IF NOT EXISTS `mdl_survey` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one SURVEY module with its configuration';

--
-- Dumping data for table `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='text about each survey submission';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answer2` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the answers to each questions filled by the users';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_questions`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
  `id` bigint(10) NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shorttext` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `multi` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the questions conforming one survey';

--
-- Dumping data for table `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag`
--

CREATE TABLE IF NOT EXISTS `mdl_tag` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tagtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tag table - this generic table will replace the old "tags" t';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_correlation`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The rationale for the ''tag_correlation'' table is performance';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
  `id` bigint(10) NOT NULL,
  `tagid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `contextid` bigint(10) DEFAULT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tag_instance table holds the information of associations bet';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_task_adhoc`
--

CREATE TABLE IF NOT EXISTS `mdl_task_adhoc` (
  `id` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nextruntime` bigint(10) NOT NULL,
  `faildelay` bigint(10) DEFAULT NULL,
  `customdata` longtext COLLATE utf8_unicode_ci,
  `blocking` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of adhoc tasks waiting to run.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_task_scheduled`
--

CREATE TABLE IF NOT EXISTS `mdl_task_scheduled` (
  `id` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastruntime` bigint(10) DEFAULT NULL,
  `nextruntime` bigint(10) DEFAULT NULL,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  `minute` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hour` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `day` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `month` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dayofweek` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `faildelay` bigint(10) DEFAULT NULL,
  `customised` tinyint(2) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of scheduled tasks to be run by cron.';

--
-- Dumping data for table `mdl_task_scheduled`
--

INSERT INTO `mdl_task_scheduled` (`id`, `component`, `classname`, `lastruntime`, `nextruntime`, `blocking`, `minute`, `hour`, `day`, `month`, `dayofweek`, `faildelay`, `customised`, `disabled`) VALUES
(1, 'moodle', '\\core\\task\\session_cleanup_task', 0, 1458047400, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(2, 'moodle', '\\core\\task\\delete_unconfirmed_users_task', 0, 1458048600, 0, '0', '*', '*', '*', '*', 0, 0, 0),
(3, 'moodle', '\\core\\task\\delete_incomplete_users_task', 0, 1458048900, 0, '5', '*', '*', '*', '*', 0, 0, 0),
(4, 'moodle', '\\core\\task\\backup_cleanup_task', 0, 1458049200, 0, '10', '*', '*', '*', '*', 0, 0, 0),
(5, 'moodle', '\\core\\task\\tag_cron_task', 0, 1458049800, 0, '20', '*', '*', '*', '*', 0, 0, 0),
(6, 'moodle', '\\core\\task\\context_cleanup_task', 0, 1458050100, 0, '25', '*', '*', '*', '*', 0, 0, 0),
(7, 'moodle', '\\core\\task\\cache_cleanup_task', 0, 1458050400, 0, '30', '*', '*', '*', '*', 0, 0, 0),
(8, 'moodle', '\\core\\task\\messaging_cleanup_task', 0, 1458050700, 0, '35', '*', '*', '*', '*', 0, 0, 0),
(9, 'moodle', '\\core\\task\\send_new_user_passwords_task', 0, 1458047400, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(10, 'moodle', '\\core\\task\\send_failed_login_notifications_task', 0, 1458047400, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(11, 'moodle', '\\core\\task\\create_contexts_task', 0, 1458066600, 1, '0', '0', '*', '*', '*', 0, 0, 0),
(12, 'moodle', '\\core\\task\\legacy_plugin_cron_task', 0, 1458047400, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(13, 'moodle', '\\core\\task\\grade_cron_task', 0, 1458047400, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(14, 'moodle', '\\core\\task\\events_cron_task', 0, 1458047400, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(15, 'moodle', '\\core\\task\\completion_regular_task', 0, 1458047400, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(16, 'moodle', '\\core\\task\\completion_daily_task', 0, 1458120600, 0, '0', '15', '*', '*', '*', 0, 0, 0),
(17, 'moodle', '\\core\\task\\portfolio_cron_task', 0, 1458047400, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(18, 'moodle', '\\core\\task\\plagiarism_cron_task', 0, 1458047400, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(19, 'moodle', '\\core\\task\\calendar_cron_task', 0, 1458047400, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(20, 'moodle', '\\core\\task\\blog_cron_task', 0, 1458047400, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(21, 'moodle', '\\core\\task\\question_cron_task', 0, 1458047400, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(22, 'moodle', '\\core\\task\\registration_cron_task', 0, 1458607440, 0, '14', '6', '*', '*', '2', 0, 0, 0),
(23, 'moodle', '\\core\\task\\check_for_updates_task', 0, 1458052200, 0, '0', '*/2', '*', '*', '*', 0, 0, 0),
(24, 'moodle', '\\core\\task\\cache_cron_task', 0, 1458048000, 0, '50', '*', '*', '*', '*', 0, 0, 0),
(25, 'moodle', '\\core\\task\\automated_backup_task', 0, 1458048000, 0, '50', '*', '*', '*', '*', 0, 0, 0),
(26, 'moodle', '\\core\\task\\badges_cron_task', 0, 1458047400, 0, '*/5', '*', '*', '*', '*', 0, 0, 0),
(27, 'moodle', '\\core\\task\\file_temp_cleanup_task', 0, 1458048300, 0, '55', '*/6', '*', '*', '*', 0, 0, 0),
(28, 'moodle', '\\core\\task\\file_trash_cleanup_task', 0, 1458048300, 0, '55', '*/6', '*', '*', '*', 0, 0, 0),
(29, 'moodle', '\\core\\task\\stats_cron_task', 0, 1458048600, 0, '0', '*', '*', '*', '*', 0, 0, 0),
(30, 'moodle', '\\core\\task\\password_reset_cleanup_task', 0, 1458066600, 0, '0', '*/6', '*', '*', '*', 0, 0, 0),
(31, 'mod_forum', '\\mod_forum\\task\\cron_task', 0, 1458047400, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(32, 'auth_cas', '\\auth_cas\\task\\sync_task', 0, 1458066600, 0, '0', '0', '*', '*', '*', 0, 0, 1),
(33, 'auth_ldap', '\\auth_ldap\\task\\sync_task', 0, 1458066600, 0, '0', '0', '*', '*', '*', 0, 0, 1),
(34, 'enrol_flatfile', '\\enrol_flatfile\\task\\flatfile_sync_task', 0, 1458049500, 0, '15', '*', '*', '*', '*', 0, 0, 0),
(35, 'enrol_imsenterprise', '\\enrol_imsenterprise\\task\\cron_task', 0, 1458049200, 0, '10', '*', '*', '*', '*', 0, 0, 0),
(36, 'editor_atto', '\\editor_atto\\task\\autosave_cleanup_task', 0, 1458322980, 0, '13', '23', '*', '*', '5', 0, 0, 0),
(37, 'tool_langimport', '\\tool_langimport\\task\\update_langpacks_task', 0, 1458081600, 0, '10', '4', '*', '*', '*', 0, 0, 0),
(38, 'tool_messageinbound', '\\tool_messageinbound\\task\\pickup_task', 0, 1458047460, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(39, 'tool_messageinbound', '\\tool_messageinbound\\task\\cleanup_task', 0, 1458073500, 0, '55', '1', '*', '*', '*', 0, 0, 0),
(40, 'tool_monitor', '\\tool_monitor\\task\\clean_events', 0, 1458047460, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(41, 'logstore_legacy', '\\logstore_legacy\\task\\cleanup_task', 0, 1458085200, 0, '10', '5', '*', '*', '*', 0, 0, 0),
(42, 'logstore_standard', '\\logstore_standard\\task\\cleanup_task', 0, 1458082080, 0, '18', '4', '*', '*', '*', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL,
  `lang` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `original` longtext COLLATE utf8_unicode_ci NOT NULL,
  `master` longtext COLLATE utf8_unicode_ci,
  `local` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the working checkout of all strings and their custo';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang_components`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the list of all installed plugins that provide thei';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_events`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_events` (
  `id` bigint(10) NOT NULL,
  `eventname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `link` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A table that keeps a log of events related to subscriptions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_history`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_history` (
  `id` bigint(10) NOT NULL,
  `sid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timesent` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store history of message notifications sent';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_rules`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_rules` (
  `id` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(1) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `plugin` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `eventname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `template` longtext COLLATE utf8_unicode_ci NOT NULL,
  `templateformat` tinyint(1) NOT NULL,
  `frequency` smallint(4) NOT NULL,
  `timewindow` mediumint(5) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store rules';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_subscriptions` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `ruleid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastnotificationsent` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store user subscriptions to various rules';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_upgrade_log`
--

CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetversion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `details` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1291 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Upgrade logging';

--
-- Dumping data for table `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2015111603', '2015111603', 'Upgrade savepoint reached', NULL, '', 0, 1458047381),
(2, 0, 'core', '2015111603', '2015111603', 'Core installed', NULL, '', 0, 1458047392),
(3, 0, 'availability_completion', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047392),
(4, 0, 'availability_completion', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047392),
(5, 0, 'availability_completion', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047392),
(6, 0, 'availability_date', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047392),
(7, 0, 'availability_date', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047392),
(8, 0, 'availability_date', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047392),
(9, 0, 'availability_grade', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047392),
(10, 0, 'availability_grade', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047392),
(11, 0, 'availability_grade', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047392),
(12, 0, 'availability_group', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047392),
(13, 0, 'availability_group', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047392),
(14, 0, 'availability_group', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047392),
(15, 0, 'availability_grouping', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047392),
(16, 0, 'availability_grouping', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047392),
(17, 0, 'availability_grouping', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047392),
(18, 0, 'availability_profile', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047392),
(19, 0, 'availability_profile', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047392),
(20, 0, 'availability_profile', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047392),
(21, 0, 'qtype_calculated', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047392),
(22, 0, 'qtype_calculated', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047392),
(23, 0, 'qtype_calculated', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047392),
(24, 0, 'qtype_calculatedmulti', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047392),
(25, 0, 'qtype_calculatedmulti', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047392),
(26, 0, 'qtype_calculatedmulti', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047392),
(27, 0, 'qtype_calculatedsimple', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047392),
(28, 0, 'qtype_calculatedsimple', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047392),
(29, 0, 'qtype_calculatedsimple', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047392),
(30, 0, 'qtype_ddimageortext', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047392),
(31, 0, 'qtype_ddimageortext', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(32, 0, 'qtype_ddimageortext', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(33, 0, 'qtype_ddmarker', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(34, 0, 'qtype_ddmarker', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(35, 0, 'qtype_ddmarker', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(36, 0, 'qtype_ddwtos', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(37, 0, 'qtype_ddwtos', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(38, 0, 'qtype_ddwtos', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(39, 0, 'qtype_description', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(40, 0, 'qtype_description', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(41, 0, 'qtype_description', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(42, 0, 'qtype_essay', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(43, 0, 'qtype_essay', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(44, 0, 'qtype_essay', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(45, 0, 'qtype_gapselect', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(46, 0, 'qtype_gapselect', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(47, 0, 'qtype_gapselect', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(48, 0, 'qtype_match', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(49, 0, 'qtype_match', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(50, 0, 'qtype_match', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(51, 0, 'qtype_missingtype', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(52, 0, 'qtype_missingtype', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(53, 0, 'qtype_missingtype', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(54, 0, 'qtype_multianswer', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(55, 0, 'qtype_multianswer', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(56, 0, 'qtype_multianswer', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(57, 0, 'qtype_multichoice', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(58, 0, 'qtype_multichoice', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(59, 0, 'qtype_multichoice', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(60, 0, 'qtype_numerical', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(61, 0, 'qtype_numerical', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(62, 0, 'qtype_numerical', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(63, 0, 'qtype_random', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(64, 0, 'qtype_random', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(65, 0, 'qtype_random', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(66, 0, 'qtype_randomsamatch', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(67, 0, 'qtype_randomsamatch', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(68, 0, 'qtype_randomsamatch', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(69, 0, 'qtype_shortanswer', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(70, 0, 'qtype_shortanswer', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(71, 0, 'qtype_shortanswer', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(72, 0, 'qtype_truefalse', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(73, 0, 'qtype_truefalse', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(74, 0, 'qtype_truefalse', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047393),
(75, 0, 'mod_assign', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047393),
(76, 0, 'mod_assign', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047393),
(77, 0, 'mod_assign', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047394),
(78, 0, 'mod_assignment', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047394),
(79, 0, 'mod_assignment', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047394),
(80, 0, 'mod_assignment', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047394),
(81, 0, 'mod_book', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047394),
(82, 0, 'mod_book', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047394),
(83, 0, 'mod_book', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047394),
(84, 0, 'mod_chat', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047394),
(85, 0, 'mod_chat', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047394),
(86, 0, 'mod_chat', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047394),
(87, 0, 'mod_choice', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047394),
(88, 0, 'mod_choice', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047394),
(89, 0, 'mod_choice', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047394),
(90, 0, 'mod_data', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047395),
(91, 0, 'mod_data', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047395),
(92, 0, 'mod_data', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047395),
(93, 0, 'mod_feedback', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047395),
(94, 0, 'mod_feedback', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047395),
(95, 0, 'mod_feedback', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047395),
(96, 0, 'mod_folder', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047395),
(97, 0, 'mod_folder', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047395),
(98, 0, 'mod_folder', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047395),
(99, 0, 'mod_forum', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047395),
(100, 0, 'mod_forum', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047396),
(101, 0, 'mod_forum', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047396),
(102, 0, 'mod_glossary', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047396),
(103, 0, 'mod_glossary', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047396),
(104, 0, 'mod_glossary', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047397),
(105, 0, 'mod_imscp', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047397),
(106, 0, 'mod_imscp', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047397),
(107, 0, 'mod_imscp', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047398),
(108, 0, 'mod_label', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047398),
(109, 0, 'mod_label', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047398),
(110, 0, 'mod_label', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047399),
(111, 0, 'mod_lesson', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047399),
(112, 0, 'mod_lesson', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047399),
(113, 0, 'mod_lesson', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047400),
(114, 0, 'mod_lti', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047400),
(115, 0, 'mod_lti', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047400),
(116, 0, 'mod_lti', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047401),
(117, 0, 'mod_page', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047401),
(118, 0, 'mod_page', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047401),
(119, 0, 'mod_page', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047401),
(120, 0, 'mod_quiz', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047401),
(121, 0, 'mod_quiz', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047401),
(122, 0, 'mod_quiz', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047401),
(123, 0, 'mod_resource', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047401),
(124, 0, 'mod_resource', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047402),
(125, 0, 'mod_resource', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047402),
(126, 0, 'mod_scorm', NULL, '2015111601', 'Starting plugin installation', NULL, '', 0, 1458047402),
(127, 0, 'mod_scorm', '2015111601', '2015111601', 'Upgrade savepoint reached', NULL, '', 0, 1458047402),
(128, 0, 'mod_scorm', '2015111601', '2015111601', 'Plugin installed', NULL, '', 0, 1458047402),
(129, 0, 'mod_survey', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047402),
(130, 0, 'mod_survey', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047402),
(131, 0, 'mod_survey', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047402),
(132, 0, 'mod_url', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047402),
(133, 0, 'mod_url', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047403),
(134, 0, 'mod_url', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047403),
(135, 0, 'mod_wiki', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047403),
(136, 0, 'mod_wiki', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047403),
(137, 0, 'mod_wiki', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047403),
(138, 0, 'mod_workshop', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047403),
(139, 0, 'mod_workshop', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047403),
(140, 0, 'mod_workshop', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047403),
(141, 0, 'auth_cas', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047403),
(142, 0, 'auth_cas', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047403),
(143, 0, 'auth_cas', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047403),
(144, 0, 'auth_db', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047403),
(145, 0, 'auth_db', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047403),
(146, 0, 'auth_db', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(147, 0, 'auth_email', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(148, 0, 'auth_email', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(149, 0, 'auth_email', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(150, 0, 'auth_fc', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(151, 0, 'auth_fc', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(152, 0, 'auth_fc', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(153, 0, 'auth_imap', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(154, 0, 'auth_imap', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(155, 0, 'auth_imap', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(156, 0, 'auth_ldap', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(157, 0, 'auth_ldap', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(158, 0, 'auth_ldap', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(159, 0, 'auth_manual', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(160, 0, 'auth_manual', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(161, 0, 'auth_manual', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(162, 0, 'auth_mnet', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(163, 0, 'auth_mnet', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(164, 0, 'auth_mnet', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(165, 0, 'auth_nntp', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(166, 0, 'auth_nntp', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(167, 0, 'auth_nntp', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(168, 0, 'auth_nologin', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(169, 0, 'auth_nologin', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(170, 0, 'auth_nologin', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(171, 0, 'auth_none', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(172, 0, 'auth_none', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(173, 0, 'auth_none', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(174, 0, 'auth_pam', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(175, 0, 'auth_pam', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(176, 0, 'auth_pam', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(177, 0, 'auth_pop3', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(178, 0, 'auth_pop3', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(179, 0, 'auth_pop3', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(180, 0, 'auth_radius', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(181, 0, 'auth_radius', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(182, 0, 'auth_radius', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(183, 0, 'auth_shibboleth', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(184, 0, 'auth_shibboleth', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(185, 0, 'auth_shibboleth', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(186, 0, 'auth_webservice', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(187, 0, 'auth_webservice', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(188, 0, 'auth_webservice', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047404),
(189, 0, 'calendartype_gregorian', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047404),
(190, 0, 'calendartype_gregorian', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047404),
(191, 0, 'calendartype_gregorian', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047405),
(192, 0, 'enrol_category', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047405),
(193, 0, 'enrol_category', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047405),
(194, 0, 'enrol_category', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047405),
(195, 0, 'enrol_cohort', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047405),
(196, 0, 'enrol_cohort', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047405),
(197, 0, 'enrol_cohort', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047405),
(198, 0, 'enrol_database', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047405),
(199, 0, 'enrol_database', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047405),
(200, 0, 'enrol_database', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047405),
(201, 0, 'enrol_flatfile', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047405),
(202, 0, 'enrol_flatfile', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047405),
(203, 0, 'enrol_flatfile', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047405),
(204, 0, 'enrol_guest', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047405),
(205, 0, 'enrol_guest', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047405),
(206, 0, 'enrol_guest', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047405),
(207, 0, 'enrol_imsenterprise', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047405),
(208, 0, 'enrol_imsenterprise', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047405),
(209, 0, 'enrol_imsenterprise', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047405),
(210, 0, 'enrol_ldap', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047405),
(211, 0, 'enrol_ldap', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047405),
(212, 0, 'enrol_ldap', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047405),
(213, 0, 'enrol_manual', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047405),
(214, 0, 'enrol_manual', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047405),
(215, 0, 'enrol_manual', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047405),
(216, 0, 'enrol_meta', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047405),
(217, 0, 'enrol_meta', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047405),
(218, 0, 'enrol_meta', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047405),
(219, 0, 'enrol_mnet', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047405),
(220, 0, 'enrol_mnet', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047405),
(221, 0, 'enrol_mnet', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047405),
(222, 0, 'enrol_paypal', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047406),
(223, 0, 'enrol_paypal', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047406),
(224, 0, 'enrol_paypal', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047406),
(225, 0, 'enrol_self', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047406),
(226, 0, 'enrol_self', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047406),
(227, 0, 'enrol_self', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047406),
(228, 0, 'message_airnotifier', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047406),
(229, 0, 'message_airnotifier', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047406),
(230, 0, 'message_airnotifier', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047406),
(231, 0, 'message_email', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047406),
(232, 0, 'message_email', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047406),
(233, 0, 'message_email', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047406),
(234, 0, 'message_jabber', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047406),
(235, 0, 'message_jabber', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047406),
(236, 0, 'message_jabber', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047406),
(237, 0, 'message_popup', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047406),
(238, 0, 'message_popup', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047406),
(239, 0, 'message_popup', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047406),
(240, 0, 'block_activity_modules', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047406),
(241, 0, 'block_activity_modules', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047406),
(242, 0, 'block_activity_modules', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047406),
(243, 0, 'block_activity_results', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047406),
(244, 0, 'block_activity_results', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047406),
(245, 0, 'block_activity_results', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(246, 0, 'block_admin_bookmarks', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(247, 0, 'block_admin_bookmarks', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047407),
(248, 0, 'block_admin_bookmarks', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(249, 0, 'block_badges', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(250, 0, 'block_badges', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047407),
(251, 0, 'block_badges', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(252, 0, 'block_blog_menu', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(253, 0, 'block_blog_menu', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047407),
(254, 0, 'block_blog_menu', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(255, 0, 'block_blog_recent', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(256, 0, 'block_blog_recent', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047407),
(257, 0, 'block_blog_recent', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(258, 0, 'block_blog_tags', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(259, 0, 'block_blog_tags', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047407),
(260, 0, 'block_blog_tags', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(261, 0, 'block_calendar_month', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(262, 0, 'block_calendar_month', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047407),
(263, 0, 'block_calendar_month', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(264, 0, 'block_calendar_upcoming', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(265, 0, 'block_calendar_upcoming', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047407),
(266, 0, 'block_calendar_upcoming', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(267, 0, 'block_comments', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(268, 0, 'block_comments', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047407),
(269, 0, 'block_comments', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(270, 0, 'block_community', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(271, 0, 'block_community', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047407),
(272, 0, 'block_community', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(273, 0, 'block_completionstatus', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(274, 0, 'block_completionstatus', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047407),
(275, 0, 'block_completionstatus', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(276, 0, 'block_course_list', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(277, 0, 'block_course_list', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047407),
(278, 0, 'block_course_list', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(279, 0, 'block_course_overview', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(280, 0, 'block_course_overview', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047407),
(281, 0, 'block_course_overview', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(282, 0, 'block_course_summary', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(283, 0, 'block_course_summary', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047407),
(284, 0, 'block_course_summary', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047407),
(285, 0, 'block_feedback', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047407),
(286, 0, 'block_feedback', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047408),
(287, 0, 'block_feedback', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047408),
(288, 0, 'block_glossary_random', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047408),
(289, 0, 'block_glossary_random', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047408),
(290, 0, 'block_glossary_random', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047408),
(291, 0, 'block_html', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047408),
(292, 0, 'block_html', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047408),
(293, 0, 'block_html', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047408),
(294, 0, 'block_login', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047408),
(295, 0, 'block_login', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047408),
(296, 0, 'block_login', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047408),
(297, 0, 'block_mentees', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047408),
(298, 0, 'block_mentees', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047408),
(299, 0, 'block_mentees', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047408),
(300, 0, 'block_messages', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047408),
(301, 0, 'block_messages', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047408),
(302, 0, 'block_messages', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047408),
(303, 0, 'block_mnet_hosts', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047408),
(304, 0, 'block_mnet_hosts', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047408),
(305, 0, 'block_mnet_hosts', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047408),
(306, 0, 'block_myprofile', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047408),
(307, 0, 'block_myprofile', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047408),
(308, 0, 'block_myprofile', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047408),
(309, 0, 'block_navigation', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047408),
(310, 0, 'block_navigation', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047408),
(311, 0, 'block_navigation', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047408),
(312, 0, 'block_news_items', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047408),
(313, 0, 'block_news_items', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047408),
(314, 0, 'block_news_items', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047408),
(315, 0, 'block_online_users', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047408),
(316, 0, 'block_online_users', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047408),
(317, 0, 'block_online_users', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047409),
(318, 0, 'block_participants', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047409),
(319, 0, 'block_participants', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047409),
(320, 0, 'block_participants', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047409),
(321, 0, 'block_private_files', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047409),
(322, 0, 'block_private_files', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047409),
(323, 0, 'block_private_files', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047409),
(324, 0, 'block_quiz_results', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047409),
(325, 0, 'block_quiz_results', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047410),
(326, 0, 'block_quiz_results', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047410),
(327, 0, 'block_recent_activity', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047410),
(328, 0, 'block_recent_activity', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047410),
(329, 0, 'block_recent_activity', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047410),
(330, 0, 'block_rss_client', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047410),
(331, 0, 'block_rss_client', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047410),
(332, 0, 'block_rss_client', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047411),
(333, 0, 'block_search_forums', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047411),
(334, 0, 'block_search_forums', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047411),
(335, 0, 'block_search_forums', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047411),
(336, 0, 'block_section_links', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047411),
(337, 0, 'block_section_links', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047411),
(338, 0, 'block_section_links', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047411),
(339, 0, 'block_selfcompletion', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047411),
(340, 0, 'block_selfcompletion', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047411),
(341, 0, 'block_selfcompletion', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047412),
(342, 0, 'block_settings', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047412),
(343, 0, 'block_settings', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047412),
(344, 0, 'block_settings', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047412),
(345, 0, 'block_site_main_menu', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047412),
(346, 0, 'block_site_main_menu', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047412),
(347, 0, 'block_site_main_menu', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047412),
(348, 0, 'block_social_activities', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047412),
(349, 0, 'block_social_activities', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047412),
(350, 0, 'block_social_activities', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047413),
(351, 0, 'block_tag_flickr', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047413),
(352, 0, 'block_tag_flickr', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047413),
(353, 0, 'block_tag_flickr', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047413),
(354, 0, 'block_tag_youtube', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047413),
(355, 0, 'block_tag_youtube', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047413),
(356, 0, 'block_tag_youtube', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047413),
(357, 0, 'block_tags', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047413),
(358, 0, 'block_tags', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047413),
(359, 0, 'block_tags', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047413),
(360, 0, 'filter_activitynames', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047413),
(361, 0, 'filter_activitynames', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047413),
(362, 0, 'filter_activitynames', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047413),
(363, 0, 'filter_algebra', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047413),
(364, 0, 'filter_algebra', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047413),
(365, 0, 'filter_algebra', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047413),
(366, 0, 'filter_censor', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047413),
(367, 0, 'filter_censor', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047413),
(368, 0, 'filter_censor', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047413),
(369, 0, 'filter_data', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047413),
(370, 0, 'filter_data', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047413),
(371, 0, 'filter_data', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047413),
(372, 0, 'filter_emailprotect', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047413),
(373, 0, 'filter_emailprotect', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047413),
(374, 0, 'filter_emailprotect', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047413),
(375, 0, 'filter_emoticon', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047413),
(376, 0, 'filter_emoticon', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047413),
(377, 0, 'filter_emoticon', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047413),
(378, 0, 'filter_glossary', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047413),
(379, 0, 'filter_glossary', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047413),
(380, 0, 'filter_glossary', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047414),
(381, 0, 'filter_mathjaxloader', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047414),
(382, 0, 'filter_mathjaxloader', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047414),
(383, 0, 'filter_mathjaxloader', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047414),
(384, 0, 'filter_mediaplugin', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047414),
(385, 0, 'filter_mediaplugin', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047414),
(386, 0, 'filter_mediaplugin', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047414),
(387, 0, 'filter_multilang', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047414),
(388, 0, 'filter_multilang', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047414),
(389, 0, 'filter_multilang', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047414),
(390, 0, 'filter_tex', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047414),
(391, 0, 'filter_tex', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047414),
(392, 0, 'filter_tex', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047414),
(393, 0, 'filter_tidy', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047414),
(394, 0, 'filter_tidy', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047414),
(395, 0, 'filter_tidy', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047414),
(396, 0, 'filter_urltolink', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047414),
(397, 0, 'filter_urltolink', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047414),
(398, 0, 'filter_urltolink', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047414),
(399, 0, 'editor_atto', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047414),
(400, 0, 'editor_atto', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047414),
(401, 0, 'editor_atto', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047414),
(402, 0, 'editor_textarea', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047414),
(403, 0, 'editor_textarea', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047414),
(404, 0, 'editor_textarea', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047415),
(405, 0, 'editor_tinymce', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047415),
(406, 0, 'editor_tinymce', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047415),
(407, 0, 'editor_tinymce', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047415),
(408, 0, 'format_singleactivity', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047415),
(409, 0, 'format_singleactivity', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047415),
(410, 0, 'format_singleactivity', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047415),
(411, 0, 'format_social', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047415),
(412, 0, 'format_social', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047415),
(413, 0, 'format_social', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047415),
(414, 0, 'format_topics', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047415),
(415, 0, 'format_topics', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047415),
(416, 0, 'format_topics', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047415),
(417, 0, 'format_weeks', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047415),
(418, 0, 'format_weeks', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047415),
(419, 0, 'format_weeks', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047415),
(420, 0, 'profilefield_checkbox', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047415),
(421, 0, 'profilefield_checkbox', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047415),
(422, 0, 'profilefield_checkbox', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047415),
(423, 0, 'profilefield_datetime', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047415),
(424, 0, 'profilefield_datetime', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047415),
(425, 0, 'profilefield_datetime', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047415),
(426, 0, 'profilefield_menu', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047415),
(427, 0, 'profilefield_menu', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047415),
(428, 0, 'profilefield_menu', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047415),
(429, 0, 'profilefield_text', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047415),
(430, 0, 'profilefield_text', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047415),
(431, 0, 'profilefield_text', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047415),
(432, 0, 'profilefield_textarea', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047415),
(433, 0, 'profilefield_textarea', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047415),
(434, 0, 'profilefield_textarea', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047415),
(435, 0, 'report_backups', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047415),
(436, 0, 'report_backups', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047415),
(437, 0, 'report_backups', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047415),
(438, 0, 'report_completion', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047415),
(439, 0, 'report_completion', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047415),
(440, 0, 'report_completion', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047415),
(441, 0, 'report_configlog', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047416),
(442, 0, 'report_configlog', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047416),
(443, 0, 'report_configlog', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047416),
(444, 0, 'report_courseoverview', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047416),
(445, 0, 'report_courseoverview', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047416),
(446, 0, 'report_courseoverview', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047416),
(447, 0, 'report_eventlist', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047416),
(448, 0, 'report_eventlist', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047416),
(449, 0, 'report_eventlist', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047416),
(450, 0, 'report_log', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047416),
(451, 0, 'report_log', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047416),
(452, 0, 'report_log', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047416),
(453, 0, 'report_loglive', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047416),
(454, 0, 'report_loglive', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047416),
(455, 0, 'report_loglive', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047416),
(456, 0, 'report_outline', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047416),
(457, 0, 'report_outline', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047416),
(458, 0, 'report_outline', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047416),
(459, 0, 'report_participation', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047416),
(460, 0, 'report_participation', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047416),
(461, 0, 'report_participation', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047416),
(462, 0, 'report_performance', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047416),
(463, 0, 'report_performance', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(464, 0, 'report_performance', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(465, 0, 'report_progress', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417),
(466, 0, 'report_progress', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(467, 0, 'report_progress', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(468, 0, 'report_questioninstances', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417),
(469, 0, 'report_questioninstances', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(470, 0, 'report_questioninstances', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(471, 0, 'report_security', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417),
(472, 0, 'report_security', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(473, 0, 'report_security', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(474, 0, 'report_stats', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417),
(475, 0, 'report_stats', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(476, 0, 'report_stats', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(477, 0, 'report_usersessions', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417),
(478, 0, 'report_usersessions', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(479, 0, 'report_usersessions', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(480, 0, 'gradeexport_ods', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(481, 0, 'gradeexport_ods', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(482, 0, 'gradeexport_ods', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(483, 0, 'gradeexport_txt', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417),
(484, 0, 'gradeexport_txt', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(485, 0, 'gradeexport_txt', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(486, 0, 'gradeexport_xls', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417),
(487, 0, 'gradeexport_xls', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(488, 0, 'gradeexport_xls', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(489, 0, 'gradeexport_xml', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417),
(490, 0, 'gradeexport_xml', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(491, 0, 'gradeexport_xml', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(492, 0, 'gradeimport_csv', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417),
(493, 0, 'gradeimport_csv', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(494, 0, 'gradeimport_csv', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(495, 0, 'gradeimport_direct', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417),
(496, 0, 'gradeimport_direct', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(497, 0, 'gradeimport_direct', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(498, 0, 'gradeimport_xml', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417),
(499, 0, 'gradeimport_xml', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(500, 0, 'gradeimport_xml', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(501, 0, 'gradereport_grader', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417),
(502, 0, 'gradereport_grader', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(503, 0, 'gradereport_grader', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047417),
(504, 0, 'gradereport_history', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047417),
(505, 0, 'gradereport_history', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047417),
(506, 0, 'gradereport_history', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(507, 0, 'gradereport_outcomes', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(508, 0, 'gradereport_outcomes', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(509, 0, 'gradereport_outcomes', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(510, 0, 'gradereport_overview', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(511, 0, 'gradereport_overview', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(512, 0, 'gradereport_overview', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(513, 0, 'gradereport_singleview', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(514, 0, 'gradereport_singleview', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(515, 0, 'gradereport_singleview', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(516, 0, 'gradereport_user', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(517, 0, 'gradereport_user', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(518, 0, 'gradereport_user', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(519, 0, 'gradingform_guide', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(520, 0, 'gradingform_guide', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(521, 0, 'gradingform_guide', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(522, 0, 'gradingform_rubric', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(523, 0, 'gradingform_rubric', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(524, 0, 'gradingform_rubric', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(525, 0, 'mnetservice_enrol', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(526, 0, 'mnetservice_enrol', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(527, 0, 'mnetservice_enrol', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(528, 0, 'webservice_amf', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(529, 0, 'webservice_amf', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(530, 0, 'webservice_amf', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(531, 0, 'webservice_rest', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(532, 0, 'webservice_rest', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(533, 0, 'webservice_rest', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(534, 0, 'webservice_soap', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(535, 0, 'webservice_soap', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(536, 0, 'webservice_soap', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(537, 0, 'webservice_xmlrpc', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(538, 0, 'webservice_xmlrpc', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(539, 0, 'webservice_xmlrpc', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(540, 0, 'repository_alfresco', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(541, 0, 'repository_alfresco', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(542, 0, 'repository_alfresco', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(543, 0, 'repository_areafiles', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(544, 0, 'repository_areafiles', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(545, 0, 'repository_areafiles', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(546, 0, 'repository_boxnet', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(547, 0, 'repository_boxnet', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(548, 0, 'repository_boxnet', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(549, 0, 'repository_coursefiles', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(550, 0, 'repository_coursefiles', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(551, 0, 'repository_coursefiles', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(552, 0, 'repository_dropbox', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(553, 0, 'repository_dropbox', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(554, 0, 'repository_dropbox', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047418),
(555, 0, 'repository_equella', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047418),
(556, 0, 'repository_equella', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047418),
(557, 0, 'repository_equella', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(558, 0, 'repository_filesystem', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(559, 0, 'repository_filesystem', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(560, 0, 'repository_filesystem', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(561, 0, 'repository_flickr', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(562, 0, 'repository_flickr', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(563, 0, 'repository_flickr', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(564, 0, 'repository_flickr_public', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(565, 0, 'repository_flickr_public', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(566, 0, 'repository_flickr_public', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(567, 0, 'repository_googledocs', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(568, 0, 'repository_googledocs', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(569, 0, 'repository_googledocs', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(570, 0, 'repository_local', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(571, 0, 'repository_local', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(572, 0, 'repository_local', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(573, 0, 'repository_merlot', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(574, 0, 'repository_merlot', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(575, 0, 'repository_merlot', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(576, 0, 'repository_picasa', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(577, 0, 'repository_picasa', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(578, 0, 'repository_picasa', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(579, 0, 'repository_recent', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(580, 0, 'repository_recent', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(581, 0, 'repository_recent', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(582, 0, 'repository_s3', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(583, 0, 'repository_s3', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(584, 0, 'repository_s3', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(585, 0, 'repository_skydrive', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(586, 0, 'repository_skydrive', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(587, 0, 'repository_skydrive', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(588, 0, 'repository_upload', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(589, 0, 'repository_upload', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(590, 0, 'repository_upload', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(591, 0, 'repository_url', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(592, 0, 'repository_url', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(593, 0, 'repository_url', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(594, 0, 'repository_user', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(595, 0, 'repository_user', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(596, 0, 'repository_user', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(597, 0, 'repository_webdav', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(598, 0, 'repository_webdav', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(599, 0, 'repository_webdav', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(600, 0, 'repository_wikimedia', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(601, 0, 'repository_wikimedia', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(602, 0, 'repository_wikimedia', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047419),
(603, 0, 'repository_youtube', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047419),
(604, 0, 'repository_youtube', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047419),
(605, 0, 'repository_youtube', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(606, 0, 'portfolio_boxnet', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(607, 0, 'portfolio_boxnet', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(608, 0, 'portfolio_boxnet', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(609, 0, 'portfolio_download', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(610, 0, 'portfolio_download', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(611, 0, 'portfolio_download', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(612, 0, 'portfolio_flickr', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(613, 0, 'portfolio_flickr', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(614, 0, 'portfolio_flickr', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(615, 0, 'portfolio_googledocs', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(616, 0, 'portfolio_googledocs', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(617, 0, 'portfolio_googledocs', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(618, 0, 'portfolio_mahara', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(619, 0, 'portfolio_mahara', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(620, 0, 'portfolio_mahara', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(621, 0, 'portfolio_picasa', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(622, 0, 'portfolio_picasa', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(623, 0, 'portfolio_picasa', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(624, 0, 'qbehaviour_adaptive', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(625, 0, 'qbehaviour_adaptive', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(626, 0, 'qbehaviour_adaptive', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(627, 0, 'qbehaviour_adaptivenopenalty', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(628, 0, 'qbehaviour_adaptivenopenalty', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(629, 0, 'qbehaviour_adaptivenopenalty', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(630, 0, 'qbehaviour_deferredcbm', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(631, 0, 'qbehaviour_deferredcbm', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(632, 0, 'qbehaviour_deferredcbm', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(633, 0, 'qbehaviour_deferredfeedback', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(634, 0, 'qbehaviour_deferredfeedback', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(635, 0, 'qbehaviour_deferredfeedback', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(636, 0, 'qbehaviour_immediatecbm', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(637, 0, 'qbehaviour_immediatecbm', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(638, 0, 'qbehaviour_immediatecbm', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(639, 0, 'qbehaviour_immediatefeedback', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(640, 0, 'qbehaviour_immediatefeedback', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(641, 0, 'qbehaviour_immediatefeedback', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(642, 0, 'qbehaviour_informationitem', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(643, 0, 'qbehaviour_informationitem', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(644, 0, 'qbehaviour_informationitem', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(645, 0, 'qbehaviour_interactive', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(646, 0, 'qbehaviour_interactive', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(647, 0, 'qbehaviour_interactive', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(648, 0, 'qbehaviour_interactivecountback', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(649, 0, 'qbehaviour_interactivecountback', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(650, 0, 'qbehaviour_interactivecountback', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(651, 0, 'qbehaviour_manualgraded', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047420),
(652, 0, 'qbehaviour_manualgraded', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047420),
(653, 0, 'qbehaviour_manualgraded', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047420),
(654, 0, 'qbehaviour_missing', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047421),
(655, 0, 'qbehaviour_missing', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047421),
(656, 0, 'qbehaviour_missing', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047421),
(657, 0, 'qformat_aiken', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047421),
(658, 0, 'qformat_aiken', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047421),
(659, 0, 'qformat_aiken', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047421),
(660, 0, 'qformat_blackboard_six', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047421),
(661, 0, 'qformat_blackboard_six', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047421),
(662, 0, 'qformat_blackboard_six', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047421),
(663, 0, 'qformat_examview', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047421),
(664, 0, 'qformat_examview', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047421),
(665, 0, 'qformat_examview', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047421),
(666, 0, 'qformat_gift', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047421),
(667, 0, 'qformat_gift', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047421),
(668, 0, 'qformat_gift', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047421),
(669, 0, 'qformat_missingword', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047421),
(670, 0, 'qformat_missingword', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047421),
(671, 0, 'qformat_missingword', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047422),
(672, 0, 'qformat_multianswer', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047422),
(673, 0, 'qformat_multianswer', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047422),
(674, 0, 'qformat_multianswer', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047422),
(675, 0, 'qformat_webct', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047422),
(676, 0, 'qformat_webct', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047422),
(677, 0, 'qformat_webct', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047422),
(678, 0, 'qformat_xhtml', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047422),
(679, 0, 'qformat_xhtml', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047422),
(680, 0, 'qformat_xhtml', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047422),
(681, 0, 'qformat_xml', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047422),
(682, 0, 'qformat_xml', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047422),
(683, 0, 'qformat_xml', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047422),
(684, 0, 'tool_assignmentupgrade', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047422),
(685, 0, 'tool_assignmentupgrade', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047422),
(686, 0, 'tool_assignmentupgrade', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047423),
(687, 0, 'tool_availabilityconditions', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047423),
(688, 0, 'tool_availabilityconditions', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047423),
(689, 0, 'tool_availabilityconditions', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047423),
(690, 0, 'tool_behat', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047423),
(691, 0, 'tool_behat', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047423),
(692, 0, 'tool_behat', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047423),
(693, 0, 'tool_capability', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047423),
(694, 0, 'tool_capability', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047423),
(695, 0, 'tool_capability', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047423),
(696, 0, 'tool_customlang', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047423),
(697, 0, 'tool_customlang', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047424),
(698, 0, 'tool_customlang', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047424),
(699, 0, 'tool_dbtransfer', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047424),
(700, 0, 'tool_dbtransfer', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047424),
(701, 0, 'tool_dbtransfer', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047424),
(702, 0, 'tool_filetypes', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047424),
(703, 0, 'tool_filetypes', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047424),
(704, 0, 'tool_filetypes', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047424),
(705, 0, 'tool_generator', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047425),
(706, 0, 'tool_generator', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047425),
(707, 0, 'tool_generator', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047425),
(708, 0, 'tool_health', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047425),
(709, 0, 'tool_health', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047425),
(710, 0, 'tool_health', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047425),
(711, 0, 'tool_innodb', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047425),
(712, 0, 'tool_innodb', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047425),
(713, 0, 'tool_innodb', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047425),
(714, 0, 'tool_installaddon', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047425),
(715, 0, 'tool_installaddon', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047425),
(716, 0, 'tool_installaddon', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047425),
(717, 0, 'tool_langimport', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047425),
(718, 0, 'tool_langimport', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047425),
(719, 0, 'tool_langimport', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047425),
(720, 0, 'tool_log', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047425),
(721, 0, 'tool_log', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047425),
(722, 0, 'tool_log', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047425),
(723, 0, 'tool_messageinbound', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047425),
(724, 0, 'tool_messageinbound', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047425),
(725, 0, 'tool_messageinbound', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047425),
(726, 0, 'tool_monitor', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047425),
(727, 0, 'tool_monitor', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047425),
(728, 0, 'tool_monitor', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047425),
(729, 0, 'tool_multilangupgrade', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047425),
(730, 0, 'tool_multilangupgrade', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047425),
(731, 0, 'tool_multilangupgrade', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047425),
(732, 0, 'tool_phpunit', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047425),
(733, 0, 'tool_phpunit', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047425),
(734, 0, 'tool_phpunit', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047425),
(735, 0, 'tool_profiling', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047425),
(736, 0, 'tool_profiling', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047425),
(737, 0, 'tool_profiling', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047425),
(738, 0, 'tool_replace', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047425),
(739, 0, 'tool_replace', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047425),
(740, 0, 'tool_replace', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047425),
(741, 0, 'tool_spamcleaner', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047425),
(742, 0, 'tool_spamcleaner', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047425),
(743, 0, 'tool_spamcleaner', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(744, 0, 'tool_task', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(745, 0, 'tool_task', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(746, 0, 'tool_task', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(747, 0, 'tool_templatelibrary', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(748, 0, 'tool_templatelibrary', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(749, 0, 'tool_templatelibrary', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(750, 0, 'tool_unsuproles', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(751, 0, 'tool_unsuproles', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(752, 0, 'tool_unsuproles', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(753, 0, 'tool_uploadcourse', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(754, 0, 'tool_uploadcourse', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(755, 0, 'tool_uploadcourse', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(756, 0, 'tool_uploaduser', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(757, 0, 'tool_uploaduser', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(758, 0, 'tool_uploaduser', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(759, 0, 'tool_xmldb', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(760, 0, 'tool_xmldb', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(761, 0, 'tool_xmldb', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(762, 0, 'cachestore_file', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(763, 0, 'cachestore_file', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(764, 0, 'cachestore_file', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(765, 0, 'cachestore_memcache', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(766, 0, 'cachestore_memcache', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(767, 0, 'cachestore_memcache', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(768, 0, 'cachestore_memcached', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(769, 0, 'cachestore_memcached', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(770, 0, 'cachestore_memcached', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(771, 0, 'cachestore_mongodb', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(772, 0, 'cachestore_mongodb', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(773, 0, 'cachestore_mongodb', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(774, 0, 'cachestore_session', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(775, 0, 'cachestore_session', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(776, 0, 'cachestore_session', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(777, 0, 'cachestore_static', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(778, 0, 'cachestore_static', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(779, 0, 'cachestore_static', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(780, 0, 'cachelock_file', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(781, 0, 'cachelock_file', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(782, 0, 'cachelock_file', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(783, 0, 'theme_base', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(784, 0, 'theme_base', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(785, 0, 'theme_base', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(786, 0, 'theme_bootstrapbase', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(787, 0, 'theme_bootstrapbase', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(788, 0, 'theme_bootstrapbase', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(789, 0, 'theme_canvas', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(790, 0, 'theme_canvas', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(791, 0, 'theme_canvas', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(792, 0, 'theme_clean', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(793, 0, 'theme_clean', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(794, 0, 'theme_clean', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(795, 0, 'theme_more', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(796, 0, 'theme_more', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(797, 0, 'theme_more', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047426),
(798, 0, 'assignsubmission_comments', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047426),
(799, 0, 'assignsubmission_comments', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047426),
(800, 0, 'assignsubmission_comments', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047427),
(801, 0, 'assignsubmission_file', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047427),
(802, 0, 'assignsubmission_file', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047427),
(803, 0, 'assignsubmission_file', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047427),
(804, 0, 'assignsubmission_onlinetext', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047427),
(805, 0, 'assignsubmission_onlinetext', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047427),
(806, 0, 'assignsubmission_onlinetext', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047427),
(807, 0, 'assignfeedback_comments', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047427),
(808, 0, 'assignfeedback_comments', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047427),
(809, 0, 'assignfeedback_comments', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047427),
(810, 0, 'assignfeedback_editpdf', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047427),
(811, 0, 'assignfeedback_editpdf', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047427),
(812, 0, 'assignfeedback_editpdf', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047427),
(813, 0, 'assignfeedback_file', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047427),
(814, 0, 'assignfeedback_file', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047427),
(815, 0, 'assignfeedback_file', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047427),
(816, 0, 'assignfeedback_offline', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047427),
(817, 0, 'assignfeedback_offline', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047427),
(818, 0, 'assignfeedback_offline', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047427),
(819, 0, 'assignment_offline', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047427),
(820, 0, 'assignment_offline', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047427),
(821, 0, 'assignment_offline', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047427),
(822, 0, 'assignment_online', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047427),
(823, 0, 'assignment_online', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047427),
(824, 0, 'assignment_online', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047427),
(825, 0, 'assignment_upload', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047427),
(826, 0, 'assignment_upload', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047427),
(827, 0, 'assignment_upload', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047427),
(828, 0, 'assignment_uploadsingle', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047427),
(829, 0, 'assignment_uploadsingle', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047427),
(830, 0, 'assignment_uploadsingle', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047427),
(831, 0, 'booktool_exportimscp', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047427),
(832, 0, 'booktool_exportimscp', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047427),
(833, 0, 'booktool_exportimscp', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047428),
(834, 0, 'booktool_importhtml', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047428),
(835, 0, 'booktool_importhtml', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047428),
(836, 0, 'booktool_importhtml', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047428),
(837, 0, 'booktool_print', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047428),
(838, 0, 'booktool_print', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047428),
(839, 0, 'booktool_print', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047428),
(840, 0, 'datafield_checkbox', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047428),
(841, 0, 'datafield_checkbox', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047428),
(842, 0, 'datafield_checkbox', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047428),
(843, 0, 'datafield_date', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047428),
(844, 0, 'datafield_date', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047428),
(845, 0, 'datafield_date', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047428),
(846, 0, 'datafield_file', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047428),
(847, 0, 'datafield_file', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047428),
(848, 0, 'datafield_file', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047428),
(849, 0, 'datafield_latlong', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047428),
(850, 0, 'datafield_latlong', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047428),
(851, 0, 'datafield_latlong', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047428),
(852, 0, 'datafield_menu', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047428),
(853, 0, 'datafield_menu', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047428),
(854, 0, 'datafield_menu', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047428),
(855, 0, 'datafield_multimenu', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047428),
(856, 0, 'datafield_multimenu', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047428),
(857, 0, 'datafield_multimenu', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047428),
(858, 0, 'datafield_number', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047428),
(859, 0, 'datafield_number', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047428),
(860, 0, 'datafield_number', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047428),
(861, 0, 'datafield_picture', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047428),
(862, 0, 'datafield_picture', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047428),
(863, 0, 'datafield_picture', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(864, 0, 'datafield_radiobutton', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(865, 0, 'datafield_radiobutton', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(866, 0, 'datafield_radiobutton', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(867, 0, 'datafield_text', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(868, 0, 'datafield_text', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(869, 0, 'datafield_text', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(870, 0, 'datafield_textarea', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(871, 0, 'datafield_textarea', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(872, 0, 'datafield_textarea', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(873, 0, 'datafield_url', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(874, 0, 'datafield_url', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(875, 0, 'datafield_url', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(876, 0, 'datapreset_imagegallery', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(877, 0, 'datapreset_imagegallery', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(878, 0, 'datapreset_imagegallery', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(879, 0, 'ltiservice_memberships', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(880, 0, 'ltiservice_memberships', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(881, 0, 'ltiservice_memberships', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(882, 0, 'ltiservice_profile', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(883, 0, 'ltiservice_profile', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(884, 0, 'ltiservice_profile', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(885, 0, 'ltiservice_toolproxy', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(886, 0, 'ltiservice_toolproxy', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(887, 0, 'ltiservice_toolproxy', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(888, 0, 'ltiservice_toolsettings', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(889, 0, 'ltiservice_toolsettings', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(890, 0, 'ltiservice_toolsettings', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(891, 0, 'quiz_grading', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(892, 0, 'quiz_grading', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(893, 0, 'quiz_grading', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(894, 0, 'quiz_overview', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(895, 0, 'quiz_overview', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(896, 0, 'quiz_overview', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(897, 0, 'quiz_responses', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(898, 0, 'quiz_responses', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(899, 0, 'quiz_responses', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(900, 0, 'quiz_statistics', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(901, 0, 'quiz_statistics', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(902, 0, 'quiz_statistics', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(903, 0, 'quizaccess_delaybetweenattempts', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(904, 0, 'quizaccess_delaybetweenattempts', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(905, 0, 'quizaccess_delaybetweenattempts', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(906, 0, 'quizaccess_ipaddress', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(907, 0, 'quizaccess_ipaddress', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(908, 0, 'quizaccess_ipaddress', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047429),
(909, 0, 'quizaccess_numattempts', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047429),
(910, 0, 'quizaccess_numattempts', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047429),
(911, 0, 'quizaccess_numattempts', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(912, 0, 'quizaccess_openclosedate', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430),
(913, 0, 'quizaccess_openclosedate', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(914, 0, 'quizaccess_openclosedate', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(915, 0, 'quizaccess_password', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430),
(916, 0, 'quizaccess_password', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(917, 0, 'quizaccess_password', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(918, 0, 'quizaccess_safebrowser', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430),
(919, 0, 'quizaccess_safebrowser', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(920, 0, 'quizaccess_safebrowser', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(921, 0, 'quizaccess_securewindow', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430),
(922, 0, 'quizaccess_securewindow', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(923, 0, 'quizaccess_securewindow', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(924, 0, 'quizaccess_timelimit', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430),
(925, 0, 'quizaccess_timelimit', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(926, 0, 'quizaccess_timelimit', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(927, 0, 'scormreport_basic', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430),
(928, 0, 'scormreport_basic', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(929, 0, 'scormreport_basic', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(930, 0, 'scormreport_graphs', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430),
(931, 0, 'scormreport_graphs', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(932, 0, 'scormreport_graphs', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(933, 0, 'scormreport_interactions', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430),
(934, 0, 'scormreport_interactions', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(935, 0, 'scormreport_interactions', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(936, 0, 'scormreport_objectives', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430),
(937, 0, 'scormreport_objectives', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(938, 0, 'scormreport_objectives', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(939, 0, 'workshopform_accumulative', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430),
(940, 0, 'workshopform_accumulative', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(941, 0, 'workshopform_accumulative', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(942, 0, 'workshopform_comments', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430),
(943, 0, 'workshopform_comments', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(944, 0, 'workshopform_comments', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(945, 0, 'workshopform_numerrors', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(946, 0, 'workshopform_numerrors', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(947, 0, 'workshopform_numerrors', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(948, 0, 'workshopform_rubric', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430),
(949, 0, 'workshopform_rubric', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(950, 0, 'workshopform_rubric', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(951, 0, 'workshopallocation_manual', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047430),
(952, 0, 'workshopallocation_manual', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047430),
(953, 0, 'workshopallocation_manual', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047430),
(954, 0, 'workshopallocation_random', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(955, 0, 'workshopallocation_random', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(956, 0, 'workshopallocation_random', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(957, 0, 'workshopallocation_scheduled', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(958, 0, 'workshopallocation_scheduled', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(959, 0, 'workshopallocation_scheduled', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(960, 0, 'workshopeval_best', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(961, 0, 'workshopeval_best', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(962, 0, 'workshopeval_best', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(963, 0, 'atto_accessibilitychecker', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(964, 0, 'atto_accessibilitychecker', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(965, 0, 'atto_accessibilitychecker', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(966, 0, 'atto_accessibilityhelper', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(967, 0, 'atto_accessibilityhelper', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(968, 0, 'atto_accessibilityhelper', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(969, 0, 'atto_align', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(970, 0, 'atto_align', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(971, 0, 'atto_align', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(972, 0, 'atto_backcolor', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(973, 0, 'atto_backcolor', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(974, 0, 'atto_backcolor', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(975, 0, 'atto_bold', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(976, 0, 'atto_bold', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(977, 0, 'atto_bold', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(978, 0, 'atto_charmap', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(979, 0, 'atto_charmap', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(980, 0, 'atto_charmap', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(981, 0, 'atto_clear', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(982, 0, 'atto_clear', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(983, 0, 'atto_clear', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(984, 0, 'atto_collapse', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(985, 0, 'atto_collapse', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(986, 0, 'atto_collapse', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(987, 0, 'atto_emoticon', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(988, 0, 'atto_emoticon', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(989, 0, 'atto_emoticon', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(990, 0, 'atto_equation', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(991, 0, 'atto_equation', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(992, 0, 'atto_equation', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(993, 0, 'atto_fontcolor', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(994, 0, 'atto_fontcolor', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(995, 0, 'atto_fontcolor', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(996, 0, 'atto_html', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(997, 0, 'atto_html', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047431),
(998, 0, 'atto_html', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047431),
(999, 0, 'atto_image', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047431),
(1000, 0, 'atto_image', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1001, 0, 'atto_image', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1002, 0, 'atto_indent', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1003, 0, 'atto_indent', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1004, 0, 'atto_indent', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1005, 0, 'atto_italic', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1006, 0, 'atto_italic', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1007, 0, 'atto_italic', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1008, 0, 'atto_link', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1009, 0, 'atto_link', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1010, 0, 'atto_link', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1011, 0, 'atto_managefiles', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1012, 0, 'atto_managefiles', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1013, 0, 'atto_managefiles', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1014, 0, 'atto_media', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1015, 0, 'atto_media', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1016, 0, 'atto_media', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1017, 0, 'atto_noautolink', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1018, 0, 'atto_noautolink', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1019, 0, 'atto_noautolink', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1020, 0, 'atto_orderedlist', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1021, 0, 'atto_orderedlist', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1022, 0, 'atto_orderedlist', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1023, 0, 'atto_rtl', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1024, 0, 'atto_rtl', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1025, 0, 'atto_rtl', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1026, 0, 'atto_strike', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1027, 0, 'atto_strike', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1028, 0, 'atto_strike', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1029, 0, 'atto_subscript', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1030, 0, 'atto_subscript', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1031, 0, 'atto_subscript', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1032, 0, 'atto_superscript', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1033, 0, 'atto_superscript', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1034, 0, 'atto_superscript', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1035, 0, 'atto_table', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1036, 0, 'atto_table', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1037, 0, 'atto_table', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1038, 0, 'atto_title', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1039, 0, 'atto_title', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1040, 0, 'atto_title', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047432),
(1041, 0, 'atto_underline', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047432),
(1042, 0, 'atto_underline', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047432),
(1043, 0, 'atto_underline', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047433),
(1044, 0, 'atto_undo', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047433),
(1045, 0, 'atto_undo', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047433),
(1046, 0, 'atto_undo', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047433),
(1047, 0, 'atto_unorderedlist', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047433),
(1048, 0, 'atto_unorderedlist', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047433),
(1049, 0, 'atto_unorderedlist', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047433),
(1050, 0, 'tinymce_ctrlhelp', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047433),
(1051, 0, 'tinymce_ctrlhelp', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047433),
(1052, 0, 'tinymce_ctrlhelp', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047433),
(1053, 0, 'tinymce_managefiles', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047433),
(1054, 0, 'tinymce_managefiles', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047433),
(1055, 0, 'tinymce_managefiles', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047434),
(1056, 0, 'tinymce_moodleemoticon', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047434),
(1057, 0, 'tinymce_moodleemoticon', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047434),
(1058, 0, 'tinymce_moodleemoticon', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047434),
(1059, 0, 'tinymce_moodleimage', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047434),
(1060, 0, 'tinymce_moodleimage', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047434),
(1061, 0, 'tinymce_moodleimage', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047434),
(1062, 0, 'tinymce_moodlemedia', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047434),
(1063, 0, 'tinymce_moodlemedia', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047434),
(1064, 0, 'tinymce_moodlemedia', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047434),
(1065, 0, 'tinymce_moodlenolink', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047434),
(1066, 0, 'tinymce_moodlenolink', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047434),
(1067, 0, 'tinymce_moodlenolink', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047435),
(1068, 0, 'tinymce_pdw', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047435),
(1069, 0, 'tinymce_pdw', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047435),
(1070, 0, 'tinymce_pdw', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047435),
(1071, 0, 'tinymce_spellchecker', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047435),
(1072, 0, 'tinymce_spellchecker', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047435),
(1073, 0, 'tinymce_spellchecker', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047436),
(1074, 0, 'tinymce_wrap', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047436),
(1075, 0, 'tinymce_wrap', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047436),
(1076, 0, 'tinymce_wrap', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047436),
(1077, 0, 'logstore_database', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047436),
(1078, 0, 'logstore_database', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047436),
(1079, 0, 'logstore_database', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047436),
(1080, 0, 'logstore_legacy', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047436),
(1081, 0, 'logstore_legacy', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047436),
(1082, 0, 'logstore_legacy', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047437),
(1083, 0, 'logstore_standard', NULL, '2015111600', 'Starting plugin installation', NULL, '', 0, 1458047437),
(1084, 0, 'logstore_standard', '2015111600', '2015111600', 'Upgrade savepoint reached', NULL, '', 0, 1458047437),
(1085, 0, 'logstore_standard', '2015111600', '2015111600', 'Plugin installed', NULL, '', 0, 1458047437),
(1086, 2, 'core', '2015111603', '2015111603', 'Exception: plugin_defective_exception', 'Plugin "block_kaplan_plugin" is defective or outdated, can not continue, sorry.', '* line 831 of /lib/upgradelib.php: plugin_defective_exception thrown\n* line 429 of /lib/upgradelib.php: call to upgrade_plugins_blocks()\n* line 1647 of /lib/upgradelib.php: call to upgrade_plugins()\n* line 677 of /admin/index.php: call to upgrade_noncore()\n', 2, 1458059183),
(1087, 2, 'core', '2015111603', '2015111603', 'Exception: plugin_defective_exception', 'Plugin "block_kaplan_plugin" is defective or outdated, can not continue, sorry.', '* line 831 of /lib/upgradelib.php: plugin_defective_exception thrown\n* line 429 of /lib/upgradelib.php: call to upgrade_plugins_blocks()\n* line 1647 of /lib/upgradelib.php: call to upgrade_plugins()\n* line 677 of /admin/index.php: call to upgrade_noncore()\n', 2, 1458059485),
(1088, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458059781),
(1089, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458059781),
(1090, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458059781),
(1091, 2, 'core', '2015111603', '2015111603', 'Exception: plugin_misplaced_exception', 'Plugin "block_kaplan_plugin" is installed in incorrect location "$CFG-&gt;dirroot/local/kaplan_plugin", expected location is "$CFG-&gt;dirroot/blocks/kaplan_plugin"', '* line 463 of /lib/upgradelib.php: plugin_misplaced_exception thrown\n* line 1647 of /lib/upgradelib.php: call to upgrade_plugins()\n* line 677 of /admin/index.php: call to upgrade_noncore()\n', 2, 1458064161),
(1092, 2, 'core', '2015111603', '2015111603', 'Exception: plugin_misplaced_exception', 'Plugin "block_kaplan_plugin" is installed in incorrect location "$CFG-&gt;dirroot/local/kaplan_plugin", expected location is "$CFG-&gt;dirroot/blocks/kaplan_plugin"', '* line 463 of /lib/upgradelib.php: plugin_misplaced_exception thrown\n* line 1647 of /lib/upgradelib.php: call to upgrade_plugins()\n* line 677 of /admin/index.php: call to upgrade_noncore()\n', 2, 1458064173),
(1093, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458064884),
(1094, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458064884),
(1095, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458064884),
(1096, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458065130),
(1097, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458065130),
(1098, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458065130),
(1099, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458067126),
(1100, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458067126),
(1101, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458067127),
(1102, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458068001),
(1103, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458068001),
(1104, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458068002),
(1105, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458068398),
(1106, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458068398),
(1107, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458068398),
(1108, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458094257),
(1109, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458094257),
(1110, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458094257),
(1111, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458094917),
(1112, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458094917),
(1113, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458094917),
(1114, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458096256),
(1115, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458096256),
(1116, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458096256),
(1117, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458102511),
(1118, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458102511),
(1119, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458102511),
(1120, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458104273),
(1121, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458104273),
(1122, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458104273),
(1123, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458104542),
(1124, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458104542),
(1125, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458104542),
(1126, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458115228),
(1127, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458115228),
(1128, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458115228),
(1129, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458122545),
(1130, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458122545),
(1131, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458122545),
(1132, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458126227),
(1133, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458126227),
(1134, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458126227),
(1135, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458126357),
(1136, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458126357),
(1137, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458126358),
(1138, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458132973),
(1139, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458132974),
(1140, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458132974),
(1141, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458133310),
(1142, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458133310),
(1143, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458133310),
(1144, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458133559),
(1145, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458133559),
(1146, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458133559),
(1147, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458133830),
(1148, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458133830),
(1149, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458133830),
(1150, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458135457),
(1151, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458135457),
(1152, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458135457),
(1153, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458135703),
(1154, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458135704),
(1155, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458135704),
(1156, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458136096),
(1157, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458136096),
(1158, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458136096),
(1159, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458136411),
(1160, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458136411),
(1161, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458136411),
(1162, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458136944),
(1163, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458136944),
(1164, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458136944),
(1165, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458137212),
(1166, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458137212),
(1167, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458137212),
(1168, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458137733),
(1169, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458137733),
(1170, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458137733),
(1171, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458141121),
(1172, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458141121),
(1173, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458141122),
(1174, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458142037),
(1175, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458142037),
(1176, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458142038),
(1177, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458142200),
(1178, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458142200),
(1179, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458142200),
(1180, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458142480),
(1181, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458142480),
(1182, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458142480),
(1183, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458142870),
(1184, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458142870),
(1185, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458142870),
(1186, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458143018),
(1187, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458143018),
(1188, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458143018),
(1189, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458143809),
(1190, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458143809),
(1191, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458143810),
(1192, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458144598),
(1193, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458144598),
(1194, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458144599),
(1195, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458144810),
(1196, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458144810),
(1197, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458144810),
(1198, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458145019),
(1199, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458145019),
(1200, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458145019),
(1201, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458145503),
(1202, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458145503),
(1203, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458145503),
(1204, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458145898),
(1205, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458145898),
(1206, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458145898),
(1207, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458146242),
(1208, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458146242),
(1209, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458146242),
(1210, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458146627),
(1211, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458146627),
(1212, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458146627),
(1213, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458146748),
(1214, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458146748),
(1215, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458146748),
(1216, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458147104),
(1217, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458147104),
(1218, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458147104),
(1219, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458147335),
(1220, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458147335),
(1221, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458147336),
(1222, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458147527),
(1223, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458147527),
(1224, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458147527),
(1225, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458147667),
(1226, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458147667),
(1227, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458147668),
(1228, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458147752),
(1229, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458147752),
(1230, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458147753),
(1231, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458147922),
(1232, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458147922),
(1233, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458147922),
(1234, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458148489),
(1235, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458148490),
(1236, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458148490),
(1237, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458148750),
(1238, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458148750),
(1239, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458148750),
(1240, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458149124),
(1241, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458149124),
(1242, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458149124),
(1243, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458149458),
(1244, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458149458),
(1245, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458149458),
(1246, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458150011),
(1247, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458150011),
(1248, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458150011),
(1249, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458150198),
(1250, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458150198),
(1251, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458150198),
(1252, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458150450),
(1253, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458150450),
(1254, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458150450),
(1255, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458150708),
(1256, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458150708),
(1257, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458150708),
(1258, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458151408),
(1259, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458151408),
(1260, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458151408),
(1261, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458151793),
(1262, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458151793),
(1263, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458151793),
(1264, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458186757),
(1265, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458186757),
(1266, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458186758),
(1267, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458187241),
(1268, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458187241),
(1269, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458187242),
(1270, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458187613),
(1271, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458187613),
(1272, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458187613),
(1273, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458187775),
(1274, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458187775),
(1275, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458187775),
(1276, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458188272),
(1277, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458188272),
(1278, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458188272),
(1279, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458188627),
(1280, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458188627),
(1281, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458188627),
(1282, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458189129),
(1283, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458189129),
(1284, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458189129),
(1285, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458189959),
(1286, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458189959),
(1287, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458189959),
(1288, 0, 'block_kaplan_plugin', NULL, '2016031500', 'Starting plugin installation', NULL, '', 2, 1458190252),
(1289, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Upgrade savepoint reached', NULL, '', 2, 1458190252),
(1290, 0, 'block_kaplan_plugin', '2016031500', '2016031500', 'Plugin installed', NULL, '', 2, 1458190252);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_url`
--

CREATE TABLE IF NOT EXISTS `mdl_url` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `parameters` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one url resource';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user`
--

CREATE TABLE IF NOT EXISTS `mdl_user` (
  `id` bigint(10) NOT NULL,
  `auth` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `yahoo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aim` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msn` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone1` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `institution` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `department` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `calendartype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'gregorian',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastnamephonetic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstnamephonetic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternatename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='One record for each person';

--
-- Dumping data for table `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `calendartype`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`, `lastnamephonetic`, `firstnamephonetic`, `middlename`, `alternatename`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', '$2y$10$h1Boi9K1wMhgPTBqRpSDVe5uIhN0xKISkFiAbsSYjg7TCsIZseoHa', '', 'Guest user', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 'This user is a special user that allows read-only access to some courses.', 1, 1, 0, 2, 1, 0, 0, 1458047378, 0, NULL, NULL, NULL, NULL, NULL),
(2, 'manual', 1, 0, 0, 0, 1, 'admin', '$2y$10$zLuBUQxjdBtL5weQ9dLEIeRYhMqo9qXCcC7oyj6.xdf3nKVGYsT9.', '', 'Admin', 'User', 'admin@moodle.com', 0, '', '', '', '', '', '', '', '', '', '', 'Bangalore', 'IN', 'en', 'gregorian', '', '99', 1458048023, 1458190657, 1458132766, 1458186689, '127.0.0.1', '', 0, '', '', 1, 1, 0, 1, 1, 0, 0, 1458048083, 0, NULL, '', '', '', ''),
(3, 'manual', 1, 0, 0, 0, 1, 'seadon', '$2y$10$WQMQAztZ3.hYH.dxJT8BbuwBuXd3.etg9pRPAnGIk2IDHbfKapK0O', '', 'Seadon', 'Pinto', 'seadonfrank@moodle.com', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 1458151840, 1458190731, 1458186482, 1458190731, '127.0.0.1', '', 0, '', '', 1, 1, 0, 2, 1, 0, 1458138667, 1458138667, 0, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_devices`
--

CREATE TABLE IF NOT EXISTS `mdl_user_devices` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `appid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `model` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `platform` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pushid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores user''s mobile devices information in order';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users participating in courses (aka enrolled users) - everyb';

--
-- Dumping data for table `mdl_user_enrolments`
--

INSERT INTO `mdl_user_enrolments` (`id`, `status`, `enrolid`, `userid`, `timestart`, `timeend`, `modifierid`, `timecreated`, `timemodified`) VALUES
(1, 0, 1, 2, 1458114199, 0, 2, 1458114202, 1458114202),
(2, 0, 1, 3, 1458138699, 0, 2, 1458138725, 1458138725),
(3, 0, 4, 2, 1458139099, 0, 2, 1458139190, 1458139190);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_category`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable fields categories';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_data`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Data for the customisable user fields';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_field`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
  `id` bigint(10) NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shortname',
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext COLLATE utf8_unicode_ci,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable user profile fields';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_lastaccess`
--

CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To keep track of course page access times, used in online pa';

--
-- Dumping data for table `mdl_user_lastaccess`
--

INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
(1, 2, 2, 1458153491),
(2, 2, 3, 1458153491),
(3, 3, 2, 1458153700);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_password_history`
--

CREATE TABLE IF NOT EXISTS `mdl_user_password_history` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A rotating log of hashes of previously used passwords for ea';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_password_resets`
--

CREATE TABLE IF NOT EXISTS `mdl_user_password_resets` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timerequested` bigint(10) NOT NULL,
  `timererequested` bigint(10) NOT NULL DEFAULT '0',
  `token` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table tracking password reset confirmation tokens';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_preferences`
--

CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(1333) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Allows modules to store arbitrary user preferences';

--
-- Dumping data for table `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(1, 2, 'auth_manual_passwordupdatetime', '1458048083'),
(2, 2, 'email_bounce_count', '1'),
(3, 2, 'email_send_count', '1'),
(4, 2, 'login_failed_count_since_success', '1'),
(5, 2, 'filepicker_recentrepository', '4'),
(6, 2, 'filepicker_recentlicense', 'allrightsreserved'),
(7, 3, 'auth_forcepasswordchange', '0'),
(8, 3, 'email_bounce_count', '1'),
(9, 3, 'email_send_count', '1'),
(10, 3, 'docked_block_instance_5', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_private_key`
--

CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
  `id` bigint(10) NOT NULL,
  `script` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='access keys used in cookieless scripts - rss, etc.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Wiki',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores Wiki activity configuration';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_links`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
  `id` bigint(10) NOT NULL,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Page wiki links';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Manages page locks';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `cachedcontent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_subwikis`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores subwiki instances';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_synonyms`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pagesynonym'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages synonyms';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_versions`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki page history';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext COLLATE utf8_unicode_ci,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext COLLATE utf8_unicode_ci,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `evaluation` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext COLLATE utf8_unicode_ci,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about the module instances and ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resultlog` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the allocation settings for the scheduled allocator';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Settings for the grading evaluation subplugin Comparison wit';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_accumulative`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Accumulative gradin';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Comments strategy f';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Number of errors gr';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This maps the number of errors to a percentual grade for sub';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Rubric grading stra';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'list'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Configuration table for the Rubric grading strategy';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The definition of rubric rating scales';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_aggregations`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Aggregated grades for assessment are stored here. The aggreg';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext COLLATE utf8_unicode_ci,
  `feedbackreviewerformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the made assessment and automatically calculated ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext COLLATE utf8_unicode_ci,
  `teachercomment` longtext COLLATE utf8_unicode_ci,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_assessments table to be dropped later in Moo';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_comments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_comments table to be dropped later in Moodle';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_elements_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_elements table to be dropped later in Moodle';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext COLLATE utf8_unicode_ci,
  `peercommentformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='How the reviewers filled-up the grading forms, given grades ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop table to be dropped later in Moodle 2.x';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_stockcomments table to be dropped later in M';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the submission and the aggregation of the grade f';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_submissions table to be dropped later in Moo';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mdl_assign`
--
ALTER TABLE `mdl_assign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assi_cou_ix` (`course`),
  ADD KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`);

--
-- Indexes for table `mdl_assignfeedback_comments`
--
ALTER TABLE `mdl_assignfeedback_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assicomm_ass_ix` (`assignment`),
  ADD KEY `mdl_assicomm_gra_ix` (`grade`);

--
-- Indexes for table `mdl_assignfeedback_editpdf_annot`
--
ALTER TABLE `mdl_assignfeedback_editpdf_annot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  ADD KEY `mdl_assieditanno_gra_ix` (`gradeid`);

--
-- Indexes for table `mdl_assignfeedback_editpdf_cmnt`
--
ALTER TABLE `mdl_assignfeedback_editpdf_cmnt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  ADD KEY `mdl_assieditcmnt_gra_ix` (`gradeid`);

--
-- Indexes for table `mdl_assignfeedback_editpdf_quick`
--
ALTER TABLE `mdl_assignfeedback_editpdf_quick`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assieditquic_use_ix` (`userid`);

--
-- Indexes for table `mdl_assignfeedback_file`
--
ALTER TABLE `mdl_assignfeedback_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assifile_ass2_ix` (`assignment`),
  ADD KEY `mdl_assifile_gra_ix` (`grade`);

--
-- Indexes for table `mdl_assignment`
--
ALTER TABLE `mdl_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assi_cou2_ix` (`course`);

--
-- Indexes for table `mdl_assignment_submissions`
--
ALTER TABLE `mdl_assignment_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assisubm_use2_ix` (`userid`),
  ADD KEY `mdl_assisubm_mai_ix` (`mailed`),
  ADD KEY `mdl_assisubm_tim_ix` (`timemarked`),
  ADD KEY `mdl_assisubm_ass2_ix` (`assignment`);

--
-- Indexes for table `mdl_assignment_upgrade`
--
ALTER TABLE `mdl_assignment_upgrade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assiupgr_old_ix` (`oldcmid`),
  ADD KEY `mdl_assiupgr_old2_ix` (`oldinstance`);

--
-- Indexes for table `mdl_assignsubmission_file`
--
ALTER TABLE `mdl_assignsubmission_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assifile_ass_ix` (`assignment`),
  ADD KEY `mdl_assifile_sub_ix` (`submission`);

--
-- Indexes for table `mdl_assignsubmission_onlinetext`
--
ALTER TABLE `mdl_assignsubmission_onlinetext`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assionli_ass_ix` (`assignment`),
  ADD KEY `mdl_assionli_sub_ix` (`submission`);

--
-- Indexes for table `mdl_assign_grades`
--
ALTER TABLE `mdl_assign_grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  ADD KEY `mdl_assigrad_use_ix` (`userid`),
  ADD KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  ADD KEY `mdl_assigrad_ass_ix` (`assignment`);

--
-- Indexes for table `mdl_assign_plugin_config`
--
ALTER TABLE `mdl_assign_plugin_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  ADD KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  ADD KEY `mdl_assiplugconf_nam_ix` (`name`),
  ADD KEY `mdl_assiplugconf_ass_ix` (`assignment`);

--
-- Indexes for table `mdl_assign_submission`
--
ALTER TABLE `mdl_assign_submission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  ADD KEY `mdl_assisubm_use_ix` (`userid`),
  ADD KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  ADD KEY `mdl_assisubm_assusegrolat_ix` (`assignment`,`userid`,`groupid`,`latest`),
  ADD KEY `mdl_assisubm_ass_ix` (`assignment`);

--
-- Indexes for table `mdl_assign_user_flags`
--
ALTER TABLE `mdl_assign_user_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  ADD KEY `mdl_assiuserflag_use_ix` (`userid`),
  ADD KEY `mdl_assiuserflag_ass_ix` (`assignment`);

--
-- Indexes for table `mdl_assign_user_mapping`
--
ALTER TABLE `mdl_assign_user_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  ADD KEY `mdl_assiusermapp_use_ix` (`userid`);

--
-- Indexes for table `mdl_backup_controllers`
--
ALTER TABLE `mdl_backup_controllers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  ADD KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  ADD KEY `mdl_backcont_use_ix` (`userid`);

--
-- Indexes for table `mdl_backup_courses`
--
ALTER TABLE `mdl_backup_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`);

--
-- Indexes for table `mdl_backup_logs`
--
ALTER TABLE `mdl_backup_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  ADD KEY `mdl_backlogs_bac_ix` (`backupid`);

--
-- Indexes for table `mdl_badge`
--
ALTER TABLE `mdl_badge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badg_typ_ix` (`type`),
  ADD KEY `mdl_badg_cou_ix` (`courseid`),
  ADD KEY `mdl_badg_use_ix` (`usermodified`),
  ADD KEY `mdl_badg_use2_ix` (`usercreated`);

--
-- Indexes for table `mdl_badge_backpack`
--
ALTER TABLE `mdl_badge_backpack`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgback_use_ix` (`userid`);

--
-- Indexes for table `mdl_badge_criteria`
--
ALTER TABLE `mdl_badge_criteria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  ADD KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  ADD KEY `mdl_badgcrit_bad_ix` (`badgeid`);

--
-- Indexes for table `mdl_badge_criteria_met`
--
ALTER TABLE `mdl_badge_criteria_met`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgcritmet_cri_ix` (`critid`),
  ADD KEY `mdl_badgcritmet_use_ix` (`userid`),
  ADD KEY `mdl_badgcritmet_iss_ix` (`issuedid`);

--
-- Indexes for table `mdl_badge_criteria_param`
--
ALTER TABLE `mdl_badge_criteria_param`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgcritpara_cri_ix` (`critid`);

--
-- Indexes for table `mdl_badge_external`
--
ALTER TABLE `mdl_badge_external`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgexte_bac_ix` (`backpackid`);

--
-- Indexes for table `mdl_badge_issued`
--
ALTER TABLE `mdl_badge_issued`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  ADD KEY `mdl_badgissu_bad_ix` (`badgeid`),
  ADD KEY `mdl_badgissu_use_ix` (`userid`);

--
-- Indexes for table `mdl_badge_manual_award`
--
ALTER TABLE `mdl_badge_manual_award`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  ADD KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  ADD KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  ADD KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`);

--
-- Indexes for table `mdl_block`
--
ALTER TABLE `mdl_block`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_bloc_nam_uix` (`name`);

--
-- Indexes for table `mdl_block_community`
--
ALTER TABLE `mdl_block_community`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_block_instances`
--
ALTER TABLE `mdl_block_instances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  ADD KEY `mdl_blocinst_par_ix` (`parentcontextid`);

--
-- Indexes for table `mdl_block_positions`
--
ALTER TABLE `mdl_block_positions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  ADD KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  ADD KEY `mdl_blocposi_con_ix` (`contextid`);

--
-- Indexes for table `mdl_block_recent_activity`
--
ALTER TABLE `mdl_block_recent_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_blocreceacti_coutim_ix` (`courseid`,`timecreated`);

--
-- Indexes for table `mdl_block_rss_client`
--
ALTER TABLE `mdl_block_rss_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_blog_association`
--
ALTER TABLE `mdl_blog_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_blogasso_con_ix` (`contextid`),
  ADD KEY `mdl_blogasso_blo_ix` (`blogid`);

--
-- Indexes for table `mdl_blog_external`
--
ALTER TABLE `mdl_blog_external`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_blogexte_use_ix` (`userid`);

--
-- Indexes for table `mdl_book`
--
ALTER TABLE `mdl_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_book_chapters`
--
ALTER TABLE `mdl_book_chapters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_cache_filters`
--
ALTER TABLE `mdl_cache_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`);

--
-- Indexes for table `mdl_cache_flags`
--
ALTER TABLE `mdl_cache_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_cachflag_fla_ix` (`flagtype`),
  ADD KEY `mdl_cachflag_nam_ix` (`name`);

--
-- Indexes for table `mdl_capabilities`
--
ALTER TABLE `mdl_capabilities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_capa_nam_uix` (`name`);

--
-- Indexes for table `mdl_chat`
--
ALTER TABLE `mdl_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_chat_cou_ix` (`course`);

--
-- Indexes for table `mdl_chat_messages`
--
ALTER TABLE `mdl_chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_chatmess_use_ix` (`userid`),
  ADD KEY `mdl_chatmess_gro_ix` (`groupid`),
  ADD KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  ADD KEY `mdl_chatmess_cha_ix` (`chatid`);

--
-- Indexes for table `mdl_chat_messages_current`
--
ALTER TABLE `mdl_chat_messages_current`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_chatmesscurr_use_ix` (`userid`),
  ADD KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  ADD KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  ADD KEY `mdl_chatmesscurr_cha_ix` (`chatid`);

--
-- Indexes for table `mdl_chat_users`
--
ALTER TABLE `mdl_chat_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_chatuser_use_ix` (`userid`),
  ADD KEY `mdl_chatuser_las_ix` (`lastping`),
  ADD KEY `mdl_chatuser_gro_ix` (`groupid`),
  ADD KEY `mdl_chatuser_cha_ix` (`chatid`);

--
-- Indexes for table `mdl_choice`
--
ALTER TABLE `mdl_choice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_choi_cou_ix` (`course`);

--
-- Indexes for table `mdl_choice_answers`
--
ALTER TABLE `mdl_choice_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_choiansw_use_ix` (`userid`),
  ADD KEY `mdl_choiansw_cho_ix` (`choiceid`),
  ADD KEY `mdl_choiansw_opt_ix` (`optionid`);

--
-- Indexes for table `mdl_choice_options`
--
ALTER TABLE `mdl_choice_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_choiopti_cho_ix` (`choiceid`);

--
-- Indexes for table `mdl_cohort`
--
ALTER TABLE `mdl_cohort`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_coho_con_ix` (`contextid`);

--
-- Indexes for table `mdl_cohort_members`
--
ALTER TABLE `mdl_cohort_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  ADD KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  ADD KEY `mdl_cohomemb_use_ix` (`userid`);

--
-- Indexes for table `mdl_comments`
--
ALTER TABLE `mdl_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_config`
--
ALTER TABLE `mdl_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_conf_nam_uix` (`name`);

--
-- Indexes for table `mdl_config_log`
--
ALTER TABLE `mdl_config_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_conflog_tim_ix` (`timemodified`),
  ADD KEY `mdl_conflog_use_ix` (`userid`);

--
-- Indexes for table `mdl_config_plugins`
--
ALTER TABLE `mdl_config_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`);

--
-- Indexes for table `mdl_context`
--
ALTER TABLE `mdl_context`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  ADD KEY `mdl_cont_ins_ix` (`instanceid`),
  ADD KEY `mdl_cont_pat_ix` (`path`);

--
-- Indexes for table `mdl_context_temp`
--
ALTER TABLE `mdl_context_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_course`
--
ALTER TABLE `mdl_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_cour_cat_ix` (`category`),
  ADD KEY `mdl_cour_idn_ix` (`idnumber`),
  ADD KEY `mdl_cour_sho_ix` (`shortname`),
  ADD KEY `mdl_cour_sor_ix` (`sortorder`);

--
-- Indexes for table `mdl_course_categories`
--
ALTER TABLE `mdl_course_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courcate_par_ix` (`parent`);

--
-- Indexes for table `mdl_course_completions`
--
ALTER TABLE `mdl_course_completions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  ADD KEY `mdl_courcomp_use_ix` (`userid`),
  ADD KEY `mdl_courcomp_cou_ix` (`course`),
  ADD KEY `mdl_courcomp_tim_ix` (`timecompleted`);

--
-- Indexes for table `mdl_course_completion_aggr_methd`
--
ALTER TABLE `mdl_course_completion_aggr_methd`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  ADD KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  ADD KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`);

--
-- Indexes for table `mdl_course_completion_criteria`
--
ALTER TABLE `mdl_course_completion_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courcompcrit_cou_ix` (`course`);

--
-- Indexes for table `mdl_course_completion_crit_compl`
--
ALTER TABLE `mdl_course_completion_crit_compl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  ADD KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  ADD KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  ADD KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  ADD KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`);

--
-- Indexes for table `mdl_course_format_options`
--
ALTER TABLE `mdl_course_format_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  ADD KEY `mdl_courformopti_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_course_modules`
--
ALTER TABLE `mdl_course_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courmodu_vis_ix` (`visible`),
  ADD KEY `mdl_courmodu_cou_ix` (`course`),
  ADD KEY `mdl_courmodu_mod_ix` (`module`),
  ADD KEY `mdl_courmodu_ins_ix` (`instance`),
  ADD KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  ADD KEY `mdl_courmodu_gro_ix` (`groupingid`);

--
-- Indexes for table `mdl_course_modules_completion`
--
ALTER TABLE `mdl_course_modules_completion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  ADD KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`);

--
-- Indexes for table `mdl_course_published`
--
ALTER TABLE `mdl_course_published`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_course_request`
--
ALTER TABLE `mdl_course_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courrequ_sho_ix` (`shortname`);

--
-- Indexes for table `mdl_course_sections`
--
ALTER TABLE `mdl_course_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`);

--
-- Indexes for table `mdl_data`
--
ALTER TABLE `mdl_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_data_cou_ix` (`course`);

--
-- Indexes for table `mdl_data_content`
--
ALTER TABLE `mdl_data_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_datacont_rec_ix` (`recordid`),
  ADD KEY `mdl_datacont_fie_ix` (`fieldid`);

--
-- Indexes for table `mdl_data_fields`
--
ALTER TABLE `mdl_data_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  ADD KEY `mdl_datafiel_dat_ix` (`dataid`);

--
-- Indexes for table `mdl_data_records`
--
ALTER TABLE `mdl_data_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_datareco_dat_ix` (`dataid`);

--
-- Indexes for table `mdl_editor_atto_autosave`
--
ALTER TABLE `mdl_editor_atto_autosave`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_editattoauto_eleconuse_uix` (`elementid`,`contextid`,`userid`,`pagehash`);

--
-- Indexes for table `mdl_enrol`
--
ALTER TABLE `mdl_enrol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_enro_enr_ix` (`enrol`),
  ADD KEY `mdl_enro_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_enrol_flatfile`
--
ALTER TABLE `mdl_enrol_flatfile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_enroflat_cou_ix` (`courseid`),
  ADD KEY `mdl_enroflat_use_ix` (`userid`),
  ADD KEY `mdl_enroflat_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_enrol_paypal`
--
ALTER TABLE `mdl_enrol_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_event`
--
ALTER TABLE `mdl_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_even_cou_ix` (`courseid`),
  ADD KEY `mdl_even_use_ix` (`userid`),
  ADD KEY `mdl_even_tim_ix` (`timestart`),
  ADD KEY `mdl_even_tim2_ix` (`timeduration`),
  ADD KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`);

--
-- Indexes for table `mdl_events_handlers`
--
ALTER TABLE `mdl_events_handlers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`);

--
-- Indexes for table `mdl_events_queue`
--
ALTER TABLE `mdl_events_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_evenqueu_use_ix` (`userid`);

--
-- Indexes for table `mdl_events_queue_handlers`
--
ALTER TABLE `mdl_events_queue_handlers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  ADD KEY `mdl_evenqueuhand_han_ix` (`handlerid`);

--
-- Indexes for table `mdl_event_subscriptions`
--
ALTER TABLE `mdl_event_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_external_functions`
--
ALTER TABLE `mdl_external_functions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_extefunc_nam_uix` (`name`);

--
-- Indexes for table `mdl_external_services`
--
ALTER TABLE `mdl_external_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_exteserv_nam_uix` (`name`);

--
-- Indexes for table `mdl_external_services_functions`
--
ALTER TABLE `mdl_external_services_functions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`);

--
-- Indexes for table `mdl_external_services_users`
--
ALTER TABLE `mdl_external_services_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  ADD KEY `mdl_exteservuser_use_ix` (`userid`);

--
-- Indexes for table `mdl_external_tokens`
--
ALTER TABLE `mdl_external_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_extetoke_use_ix` (`userid`),
  ADD KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  ADD KEY `mdl_extetoke_con_ix` (`contextid`),
  ADD KEY `mdl_extetoke_cre_ix` (`creatorid`);

--
-- Indexes for table `mdl_feedback`
--
ALTER TABLE `mdl_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feed_cou_ix` (`course`);

--
-- Indexes for table `mdl_feedback_completed`
--
ALTER TABLE `mdl_feedback_completed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedcomp_use_ix` (`userid`),
  ADD KEY `mdl_feedcomp_fee_ix` (`feedback`);

--
-- Indexes for table `mdl_feedback_completedtmp`
--
ALTER TABLE `mdl_feedback_completedtmp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedcomp_use2_ix` (`userid`),
  ADD KEY `mdl_feedcomp_fee2_ix` (`feedback`);

--
-- Indexes for table `mdl_feedback_item`
--
ALTER TABLE `mdl_feedback_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feeditem_fee_ix` (`feedback`),
  ADD KEY `mdl_feeditem_tem_ix` (`template`);

--
-- Indexes for table `mdl_feedback_sitecourse_map`
--
ALTER TABLE `mdl_feedback_sitecourse_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  ADD KEY `mdl_feedsitemap_fee_ix` (`feedbackid`);

--
-- Indexes for table `mdl_feedback_template`
--
ALTER TABLE `mdl_feedback_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedtemp_cou_ix` (`course`);

--
-- Indexes for table `mdl_feedback_tracking`
--
ALTER TABLE `mdl_feedback_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedtrac_use_ix` (`userid`),
  ADD KEY `mdl_feedtrac_fee_ix` (`feedback`),
  ADD KEY `mdl_feedtrac_com_ix` (`completed`);

--
-- Indexes for table `mdl_feedback_value`
--
ALTER TABLE `mdl_feedback_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedvalu_cou_ix` (`course_id`),
  ADD KEY `mdl_feedvalu_ite_ix` (`item`);

--
-- Indexes for table `mdl_feedback_valuetmp`
--
ALTER TABLE `mdl_feedback_valuetmp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  ADD KEY `mdl_feedvalu_ite2_ix` (`item`);

--
-- Indexes for table `mdl_files`
--
ALTER TABLE `mdl_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  ADD KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  ADD KEY `mdl_file_con_ix` (`contenthash`),
  ADD KEY `mdl_file_con2_ix` (`contextid`),
  ADD KEY `mdl_file_use_ix` (`userid`),
  ADD KEY `mdl_file_ref_ix` (`referencefileid`);

--
-- Indexes for table `mdl_files_reference`
--
ALTER TABLE `mdl_files_reference`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_filerefe_refrep_uix` (`referencehash`,`repositoryid`),
  ADD KEY `mdl_filerefe_rep_ix` (`repositoryid`);

--
-- Indexes for table `mdl_filter_active`
--
ALTER TABLE `mdl_filter_active`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  ADD KEY `mdl_filtacti_con_ix` (`contextid`);

--
-- Indexes for table `mdl_filter_config`
--
ALTER TABLE `mdl_filter_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  ADD KEY `mdl_filtconf_con_ix` (`contextid`);

--
-- Indexes for table `mdl_folder`
--
ALTER TABLE `mdl_folder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_fold_cou_ix` (`course`);

--
-- Indexes for table `mdl_forum`
--
ALTER TABLE `mdl_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_foru_cou_ix` (`course`);

--
-- Indexes for table `mdl_forum_digests`
--
ALTER TABLE `mdl_forum_digests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  ADD KEY `mdl_forudige_use_ix` (`userid`),
  ADD KEY `mdl_forudige_for_ix` (`forum`);

--
-- Indexes for table `mdl_forum_discussions`
--
ALTER TABLE `mdl_forum_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_forudisc_use_ix` (`userid`),
  ADD KEY `mdl_forudisc_cou_ix` (`course`),
  ADD KEY `mdl_forudisc_for_ix` (`forum`);

--
-- Indexes for table `mdl_forum_discussion_subs`
--
ALTER TABLE `mdl_forum_discussion_subs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_forudiscsubs_usedis_uix` (`userid`,`discussion`),
  ADD KEY `mdl_forudiscsubs_for_ix` (`forum`),
  ADD KEY `mdl_forudiscsubs_use_ix` (`userid`),
  ADD KEY `mdl_forudiscsubs_dis_ix` (`discussion`);

--
-- Indexes for table `mdl_forum_posts`
--
ALTER TABLE `mdl_forum_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_forupost_use_ix` (`userid`),
  ADD KEY `mdl_forupost_cre_ix` (`created`),
  ADD KEY `mdl_forupost_mai_ix` (`mailed`),
  ADD KEY `mdl_forupost_dis_ix` (`discussion`),
  ADD KEY `mdl_forupost_par_ix` (`parent`);

--
-- Indexes for table `mdl_forum_queue`
--
ALTER TABLE `mdl_forum_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_foruqueu_use_ix` (`userid`),
  ADD KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  ADD KEY `mdl_foruqueu_pos_ix` (`postid`);

--
-- Indexes for table `mdl_forum_read`
--
ALTER TABLE `mdl_forum_read`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  ADD KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  ADD KEY `mdl_foruread_posuse_ix` (`postid`,`userid`);

--
-- Indexes for table `mdl_forum_subscriptions`
--
ALTER TABLE `mdl_forum_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_forusubs_use_ix` (`userid`),
  ADD KEY `mdl_forusubs_for_ix` (`forum`);

--
-- Indexes for table `mdl_forum_track_prefs`
--
ALTER TABLE `mdl_forum_track_prefs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`);

--
-- Indexes for table `mdl_glossary`
--
ALTER TABLE `mdl_glossary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_glos_cou_ix` (`course`);

--
-- Indexes for table `mdl_glossary_alias`
--
ALTER TABLE `mdl_glossary_alias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_glosalia_ent_ix` (`entryid`);

--
-- Indexes for table `mdl_glossary_categories`
--
ALTER TABLE `mdl_glossary_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gloscate_glo_ix` (`glossaryid`);

--
-- Indexes for table `mdl_glossary_entries`
--
ALTER TABLE `mdl_glossary_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_glosentr_use_ix` (`userid`),
  ADD KEY `mdl_glosentr_con_ix` (`concept`),
  ADD KEY `mdl_glosentr_glo_ix` (`glossaryid`);

--
-- Indexes for table `mdl_glossary_entries_categories`
--
ALTER TABLE `mdl_glossary_entries_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  ADD KEY `mdl_glosentrcate_ent_ix` (`entryid`);

--
-- Indexes for table `mdl_glossary_formats`
--
ALTER TABLE `mdl_glossary_formats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_grade_categories`
--
ALTER TABLE `mdl_grade_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradcate_cou_ix` (`courseid`),
  ADD KEY `mdl_gradcate_par_ix` (`parent`);

--
-- Indexes for table `mdl_grade_categories_history`
--
ALTER TABLE `mdl_grade_categories_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradcatehist_act_ix` (`action`),
  ADD KEY `mdl_gradcatehist_old_ix` (`oldid`),
  ADD KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  ADD KEY `mdl_gradcatehist_par_ix` (`parent`),
  ADD KEY `mdl_gradcatehist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_grade_grades`
--
ALTER TABLE `mdl_grade_grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  ADD KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  ADD KEY `mdl_gradgrad_ite_ix` (`itemid`),
  ADD KEY `mdl_gradgrad_use_ix` (`userid`),
  ADD KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  ADD KEY `mdl_gradgrad_use2_ix` (`usermodified`);

--
-- Indexes for table `mdl_grade_grades_history`
--
ALTER TABLE `mdl_grade_grades_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradgradhist_act_ix` (`action`),
  ADD KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  ADD KEY `mdl_gradgradhist_old_ix` (`oldid`),
  ADD KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  ADD KEY `mdl_gradgradhist_use_ix` (`userid`),
  ADD KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  ADD KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  ADD KEY `mdl_gradgradhist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_grade_import_newitem`
--
ALTER TABLE `mdl_grade_import_newitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradimponewi_imp_ix` (`importer`);

--
-- Indexes for table `mdl_grade_import_values`
--
ALTER TABLE `mdl_grade_import_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  ADD KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  ADD KEY `mdl_gradimpovalu_imp_ix` (`importer`);

--
-- Indexes for table `mdl_grade_items`
--
ALTER TABLE `mdl_grade_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  ADD KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  ADD KEY `mdl_graditem_gra_ix` (`gradetype`),
  ADD KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  ADD KEY `mdl_graditem_cou_ix` (`courseid`),
  ADD KEY `mdl_graditem_cat_ix` (`categoryid`),
  ADD KEY `mdl_graditem_sca_ix` (`scaleid`),
  ADD KEY `mdl_graditem_out_ix` (`outcomeid`);

--
-- Indexes for table `mdl_grade_items_history`
--
ALTER TABLE `mdl_grade_items_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_graditemhist_act_ix` (`action`),
  ADD KEY `mdl_graditemhist_old_ix` (`oldid`),
  ADD KEY `mdl_graditemhist_cou_ix` (`courseid`),
  ADD KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  ADD KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  ADD KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  ADD KEY `mdl_graditemhist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_grade_letters`
--
ALTER TABLE `mdl_grade_letters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`);

--
-- Indexes for table `mdl_grade_outcomes`
--
ALTER TABLE `mdl_grade_outcomes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  ADD KEY `mdl_gradoutc_cou_ix` (`courseid`),
  ADD KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  ADD KEY `mdl_gradoutc_use_ix` (`usermodified`);

--
-- Indexes for table `mdl_grade_outcomes_courses`
--
ALTER TABLE `mdl_grade_outcomes_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  ADD KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  ADD KEY `mdl_gradoutccour_out_ix` (`outcomeid`);

--
-- Indexes for table `mdl_grade_outcomes_history`
--
ALTER TABLE `mdl_grade_outcomes_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradoutchist_act_ix` (`action`),
  ADD KEY `mdl_gradoutchist_old_ix` (`oldid`),
  ADD KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  ADD KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  ADD KEY `mdl_gradoutchist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_grade_settings`
--
ALTER TABLE `mdl_grade_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  ADD KEY `mdl_gradsett_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_gradingform_guide_comments`
--
ALTER TABLE `mdl_gradingform_guide_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradguidcomm_def_ix` (`definitionid`);

--
-- Indexes for table `mdl_gradingform_guide_criteria`
--
ALTER TABLE `mdl_gradingform_guide_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradguidcrit_def_ix` (`definitionid`);

--
-- Indexes for table `mdl_gradingform_guide_fillings`
--
ALTER TABLE `mdl_gradingform_guide_fillings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  ADD KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  ADD KEY `mdl_gradguidfill_cri_ix` (`criterionid`);

--
-- Indexes for table `mdl_gradingform_rubric_criteria`
--
ALTER TABLE `mdl_gradingform_rubric_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradrubrcrit_def_ix` (`definitionid`);

--
-- Indexes for table `mdl_gradingform_rubric_fillings`
--
ALTER TABLE `mdl_gradingform_rubric_fillings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  ADD KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  ADD KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  ADD KEY `mdl_gradrubrfill_cri_ix` (`criterionid`);

--
-- Indexes for table `mdl_gradingform_rubric_levels`
--
ALTER TABLE `mdl_gradingform_rubric_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradrubrleve_cri_ix` (`criterionid`);

--
-- Indexes for table `mdl_grading_areas`
--
ALTER TABLE `mdl_grading_areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  ADD KEY `mdl_gradarea_con_ix` (`contextid`);

--
-- Indexes for table `mdl_grading_definitions`
--
ALTER TABLE `mdl_grading_definitions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  ADD KEY `mdl_graddefi_are_ix` (`areaid`),
  ADD KEY `mdl_graddefi_use_ix` (`usermodified`),
  ADD KEY `mdl_graddefi_use2_ix` (`usercreated`);

--
-- Indexes for table `mdl_grading_instances`
--
ALTER TABLE `mdl_grading_instances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradinst_def_ix` (`definitionid`),
  ADD KEY `mdl_gradinst_rat_ix` (`raterid`);

--
-- Indexes for table `mdl_groupings`
--
ALTER TABLE `mdl_groupings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_grou_idn2_ix` (`idnumber`),
  ADD KEY `mdl_grou_cou2_ix` (`courseid`);

--
-- Indexes for table `mdl_groupings_groups`
--
ALTER TABLE `mdl_groupings_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_grougrou_gro_ix` (`groupingid`),
  ADD KEY `mdl_grougrou_gro2_ix` (`groupid`);

--
-- Indexes for table `mdl_groups`
--
ALTER TABLE `mdl_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_grou_idn_ix` (`idnumber`),
  ADD KEY `mdl_grou_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_groups_members`
--
ALTER TABLE `mdl_groups_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_groumemb_gro_ix` (`groupid`),
  ADD KEY `mdl_groumemb_use_ix` (`userid`);

--
-- Indexes for table `mdl_imscp`
--
ALTER TABLE `mdl_imscp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_imsc_cou_ix` (`course`);

--
-- Indexes for table `mdl_label`
--
ALTER TABLE `mdl_label`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_labe_cou_ix` (`course`);

--
-- Indexes for table `mdl_lesson`
--
ALTER TABLE `mdl_lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_less_cou_ix` (`course`);

--
-- Indexes for table `mdl_lesson_answers`
--
ALTER TABLE `mdl_lesson_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessansw_les_ix` (`lessonid`),
  ADD KEY `mdl_lessansw_pag_ix` (`pageid`);

--
-- Indexes for table `mdl_lesson_attempts`
--
ALTER TABLE `mdl_lesson_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessatte_use_ix` (`userid`),
  ADD KEY `mdl_lessatte_les_ix` (`lessonid`),
  ADD KEY `mdl_lessatte_pag_ix` (`pageid`),
  ADD KEY `mdl_lessatte_ans_ix` (`answerid`);

--
-- Indexes for table `mdl_lesson_branch`
--
ALTER TABLE `mdl_lesson_branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessbran_use_ix` (`userid`),
  ADD KEY `mdl_lessbran_les_ix` (`lessonid`),
  ADD KEY `mdl_lessbran_pag_ix` (`pageid`);

--
-- Indexes for table `mdl_lesson_grades`
--
ALTER TABLE `mdl_lesson_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessgrad_use_ix` (`userid`),
  ADD KEY `mdl_lessgrad_les_ix` (`lessonid`);

--
-- Indexes for table `mdl_lesson_overrides`
--
ALTER TABLE `mdl_lesson_overrides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessover_les_ix` (`lessonid`),
  ADD KEY `mdl_lessover_gro_ix` (`groupid`),
  ADD KEY `mdl_lessover_use_ix` (`userid`);

--
-- Indexes for table `mdl_lesson_pages`
--
ALTER TABLE `mdl_lesson_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lesspage_les_ix` (`lessonid`);

--
-- Indexes for table `mdl_lesson_timer`
--
ALTER TABLE `mdl_lesson_timer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lesstime_use_ix` (`userid`),
  ADD KEY `mdl_lesstime_les_ix` (`lessonid`);

--
-- Indexes for table `mdl_license`
--
ALTER TABLE `mdl_license`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_lock_db`
--
ALTER TABLE `mdl_lock_db`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_lockdb_res_uix` (`resourcekey`),
  ADD KEY `mdl_lockdb_exp_ix` (`expires`),
  ADD KEY `mdl_lockdb_own_ix` (`owner`);

--
-- Indexes for table `mdl_log`
--
ALTER TABLE `mdl_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  ADD KEY `mdl_log_tim_ix` (`time`),
  ADD KEY `mdl_log_act_ix` (`action`),
  ADD KEY `mdl_log_usecou_ix` (`userid`,`course`),
  ADD KEY `mdl_log_cmi_ix` (`cmid`);

--
-- Indexes for table `mdl_logstore_standard_log`
--
ALTER TABLE `mdl_logstore_standard_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_logsstanlog_tim_ix` (`timecreated`),
  ADD KEY `mdl_logsstanlog_couanotim_ix` (`courseid`,`anonymous`,`timecreated`),
  ADD KEY `mdl_logsstanlog_useconconcr_ix` (`userid`,`contextlevel`,`contextinstanceid`,`crud`,`edulevel`,`timecreated`);

--
-- Indexes for table `mdl_log_display`
--
ALTER TABLE `mdl_log_display`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`);

--
-- Indexes for table `mdl_log_queries`
--
ALTER TABLE `mdl_log_queries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_lti`
--
ALTER TABLE `mdl_lti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lti_cou_ix` (`course`);

--
-- Indexes for table `mdl_lti_submission`
--
ALTER TABLE `mdl_lti_submission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_ltisubm_lti_ix` (`ltiid`);

--
-- Indexes for table `mdl_lti_tool_proxies`
--
ALTER TABLE `mdl_lti_tool_proxies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_ltitoolprox_gui_uix` (`guid`);

--
-- Indexes for table `mdl_lti_tool_settings`
--
ALTER TABLE `mdl_lti_tool_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_ltitoolsett_too_ix` (`toolproxyid`),
  ADD KEY `mdl_ltitoolsett_cou_ix` (`course`),
  ADD KEY `mdl_ltitoolsett_cou2_ix` (`coursemoduleid`);

--
-- Indexes for table `mdl_lti_types`
--
ALTER TABLE `mdl_lti_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_ltitype_cou_ix` (`course`),
  ADD KEY `mdl_ltitype_too_ix` (`tooldomain`);

--
-- Indexes for table `mdl_lti_types_config`
--
ALTER TABLE `mdl_lti_types_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_ltitypeconf_typ_ix` (`typeid`);

--
-- Indexes for table `mdl_message`
--
ALTER TABLE `mdl_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mess_use_ix` (`useridto`),
  ADD KEY `mdl_mess_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`);

--
-- Indexes for table `mdl_messageinbound_datakeys`
--
ALTER TABLE `mdl_messageinbound_datakeys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_messdata_handat_uix` (`handler`,`datavalue`),
  ADD KEY `mdl_messdata_han_ix` (`handler`);

--
-- Indexes for table `mdl_messageinbound_handlers`
--
ALTER TABLE `mdl_messageinbound_handlers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_messhand_cla_uix` (`classname`);

--
-- Indexes for table `mdl_messageinbound_messagelist`
--
ALTER TABLE `mdl_messageinbound_messagelist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_messmess_use_ix` (`userid`);

--
-- Indexes for table `mdl_message_airnotifier_devices`
--
ALTER TABLE `mdl_message_airnotifier_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_messairndevi_use_uix` (`userdeviceid`);

--
-- Indexes for table `mdl_message_contacts`
--
ALTER TABLE `mdl_message_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`);

--
-- Indexes for table `mdl_message_processors`
--
ALTER TABLE `mdl_message_processors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_message_providers`
--
ALTER TABLE `mdl_message_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`);

--
-- Indexes for table `mdl_message_read`
--
ALTER TABLE `mdl_message_read`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_messread_use_ix` (`useridto`),
  ADD KEY `mdl_messread_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`),
  ADD KEY `mdl_messread_nottim_ix` (`notification`,`timeread`);

--
-- Indexes for table `mdl_message_working`
--
ALTER TABLE `mdl_message_working`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_messwork_unr_ix` (`unreadmessageid`);

--
-- Indexes for table `mdl_mnetservice_enrol_courses`
--
ALTER TABLE `mdl_mnetservice_enrol_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`);

--
-- Indexes for table `mdl_mnetservice_enrol_enrolments`
--
ALTER TABLE `mdl_mnetservice_enrol_enrolments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnetenroenro_use_ix` (`userid`),
  ADD KEY `mdl_mnetenroenro_hos_ix` (`hostid`);

--
-- Indexes for table `mdl_mnet_application`
--
ALTER TABLE `mdl_mnet_application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_mnet_host`
--
ALTER TABLE `mdl_mnet_host`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnethost_app_ix` (`applicationid`);

--
-- Indexes for table `mdl_mnet_host2service`
--
ALTER TABLE `mdl_mnet_host2service`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`);

--
-- Indexes for table `mdl_mnet_log`
--
ALTER TABLE `mdl_mnet_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`);

--
-- Indexes for table `mdl_mnet_remote_rpc`
--
ALTER TABLE `mdl_mnet_remote_rpc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_mnet_remote_service2rpc`
--
ALTER TABLE `mdl_mnet_remote_service2rpc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`);

--
-- Indexes for table `mdl_mnet_rpc`
--
ALTER TABLE `mdl_mnet_rpc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`);

--
-- Indexes for table `mdl_mnet_service`
--
ALTER TABLE `mdl_mnet_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_mnet_service2rpc`
--
ALTER TABLE `mdl_mnet_service2rpc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`);

--
-- Indexes for table `mdl_mnet_session`
--
ALTER TABLE `mdl_mnet_session`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`);

--
-- Indexes for table `mdl_mnet_sso_access_control`
--
ALTER TABLE `mdl_mnet_sso_access_control`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`);

--
-- Indexes for table `mdl_modules`
--
ALTER TABLE `mdl_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_modu_nam_ix` (`name`);

--
-- Indexes for table `mdl_my_pages`
--
ALTER TABLE `mdl_my_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mypage_usepri_ix` (`userid`,`private`);

--
-- Indexes for table `mdl_page`
--
ALTER TABLE `mdl_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_page_cou_ix` (`course`);

--
-- Indexes for table `mdl_portfolio_instance`
--
ALTER TABLE `mdl_portfolio_instance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_portfolio_instance_config`
--
ALTER TABLE `mdl_portfolio_instance_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portinstconf_nam_ix` (`name`),
  ADD KEY `mdl_portinstconf_ins_ix` (`instance`);

--
-- Indexes for table `mdl_portfolio_instance_user`
--
ALTER TABLE `mdl_portfolio_instance_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portinstuser_ins_ix` (`instance`),
  ADD KEY `mdl_portinstuser_use_ix` (`userid`);

--
-- Indexes for table `mdl_portfolio_log`
--
ALTER TABLE `mdl_portfolio_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portlog_use_ix` (`userid`),
  ADD KEY `mdl_portlog_por_ix` (`portfolio`);

--
-- Indexes for table `mdl_portfolio_mahara_queue`
--
ALTER TABLE `mdl_portfolio_mahara_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portmahaqueu_tok_ix` (`token`),
  ADD KEY `mdl_portmahaqueu_tra_ix` (`transferid`);

--
-- Indexes for table `mdl_portfolio_tempdata`
--
ALTER TABLE `mdl_portfolio_tempdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_porttemp_use_ix` (`userid`),
  ADD KEY `mdl_porttemp_ins_ix` (`instance`);

--
-- Indexes for table `mdl_post`
--
ALTER TABLE `mdl_post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  ADD KEY `mdl_post_las_ix` (`lastmodified`),
  ADD KEY `mdl_post_mod_ix` (`module`),
  ADD KEY `mdl_post_sub_ix` (`subject`),
  ADD KEY `mdl_post_use_ix` (`usermodified`);

--
-- Indexes for table `mdl_profiling`
--
ALTER TABLE `mdl_profiling`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  ADD KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  ADD KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`);

--
-- Indexes for table `mdl_qtype_ddimageortext`
--
ALTER TABLE `mdl_qtype_ddimageortext`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddim_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddimageortext_drags`
--
ALTER TABLE `mdl_qtype_ddimageortext_drags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddimdrag_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddimageortext_drops`
--
ALTER TABLE `mdl_qtype_ddimageortext_drops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddimdrop_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddmarker`
--
ALTER TABLE `mdl_qtype_ddmarker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddma_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddmarker_drags`
--
ALTER TABLE `mdl_qtype_ddmarker_drags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddmadrag_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddmarker_drops`
--
ALTER TABLE `mdl_qtype_ddmarker_drops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddmadrop_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_essay_options`
--
ALTER TABLE `mdl_qtype_essay_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_match_options`
--
ALTER TABLE `mdl_qtype_match_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_match_subquestions`
--
ALTER TABLE `mdl_qtype_match_subquestions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypmatcsubq_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_multichoice_options`
--
ALTER TABLE `mdl_qtype_multichoice_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_randomsamatch_options`
--
ALTER TABLE `mdl_qtype_randomsamatch_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_shortanswer_options`
--
ALTER TABLE `mdl_qtype_shortanswer_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_question`
--
ALTER TABLE `mdl_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_ques_qty_ix` (`qtype`),
  ADD KEY `mdl_ques_cat_ix` (`category`),
  ADD KEY `mdl_ques_par_ix` (`parent`),
  ADD KEY `mdl_ques_cre_ix` (`createdby`),
  ADD KEY `mdl_ques_mod_ix` (`modifiedby`);

--
-- Indexes for table `mdl_question_answers`
--
ALTER TABLE `mdl_question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesansw_que_ix` (`question`);

--
-- Indexes for table `mdl_question_attempts`
--
ALTER TABLE `mdl_question_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  ADD KEY `mdl_quesatte_beh_ix` (`behaviour`),
  ADD KEY `mdl_quesatte_que_ix` (`questionid`),
  ADD KEY `mdl_quesatte_que2_ix` (`questionusageid`);

--
-- Indexes for table `mdl_question_attempt_steps`
--
ALTER TABLE `mdl_question_attempt_steps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  ADD KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  ADD KEY `mdl_quesattestep_use_ix` (`userid`);

--
-- Indexes for table `mdl_question_attempt_step_data`
--
ALTER TABLE `mdl_question_attempt_step_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  ADD KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`);

--
-- Indexes for table `mdl_question_calculated`
--
ALTER TABLE `mdl_question_calculated`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quescalc_ans_ix` (`answer`),
  ADD KEY `mdl_quescalc_que_ix` (`question`);

--
-- Indexes for table `mdl_question_calculated_options`
--
ALTER TABLE `mdl_question_calculated_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quescalcopti_que_ix` (`question`);

--
-- Indexes for table `mdl_question_categories`
--
ALTER TABLE `mdl_question_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quescate_con_ix` (`contextid`),
  ADD KEY `mdl_quescate_par_ix` (`parent`);

--
-- Indexes for table `mdl_question_datasets`
--
ALTER TABLE `mdl_question_datasets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  ADD KEY `mdl_quesdata_que_ix` (`question`),
  ADD KEY `mdl_quesdata_dat_ix` (`datasetdefinition`);

--
-- Indexes for table `mdl_question_dataset_definitions`
--
ALTER TABLE `mdl_question_dataset_definitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesdatadefi_cat_ix` (`category`);

--
-- Indexes for table `mdl_question_dataset_items`
--
ALTER TABLE `mdl_question_dataset_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesdataitem_def_ix` (`definition`);

--
-- Indexes for table `mdl_question_ddwtos`
--
ALTER TABLE `mdl_question_ddwtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesddwt_que_ix` (`questionid`);

--
-- Indexes for table `mdl_question_gapselect`
--
ALTER TABLE `mdl_question_gapselect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesgaps_que_ix` (`questionid`);

--
-- Indexes for table `mdl_question_hints`
--
ALTER TABLE `mdl_question_hints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_queshint_que_ix` (`questionid`);

--
-- Indexes for table `mdl_question_multianswer`
--
ALTER TABLE `mdl_question_multianswer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesmult_que_ix` (`question`);

--
-- Indexes for table `mdl_question_numerical`
--
ALTER TABLE `mdl_question_numerical`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesnume_ans_ix` (`answer`),
  ADD KEY `mdl_quesnume_que_ix` (`question`);

--
-- Indexes for table `mdl_question_numerical_options`
--
ALTER TABLE `mdl_question_numerical_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesnumeopti_que_ix` (`question`);

--
-- Indexes for table `mdl_question_numerical_units`
--
ALTER TABLE `mdl_question_numerical_units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  ADD KEY `mdl_quesnumeunit_que_ix` (`question`);

--
-- Indexes for table `mdl_question_response_analysis`
--
ALTER TABLE `mdl_question_response_analysis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_question_response_count`
--
ALTER TABLE `mdl_question_response_count`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesrespcoun_ana_ix` (`analysisid`);

--
-- Indexes for table `mdl_question_statistics`
--
ALTER TABLE `mdl_question_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_question_truefalse`
--
ALTER TABLE `mdl_question_truefalse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_questrue_que_ix` (`question`);

--
-- Indexes for table `mdl_question_usages`
--
ALTER TABLE `mdl_question_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesusag_con_ix` (`contextid`);

--
-- Indexes for table `mdl_quiz`
--
ALTER TABLE `mdl_quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quiz_cou_ix` (`course`);

--
-- Indexes for table `mdl_quiz_attempts`
--
ALTER TABLE `mdl_quiz_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  ADD UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  ADD KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  ADD KEY `mdl_quizatte_qui_ix` (`quiz`),
  ADD KEY `mdl_quizatte_use_ix` (`userid`);

--
-- Indexes for table `mdl_quiz_feedback`
--
ALTER TABLE `mdl_quiz_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quizfeed_qui_ix` (`quizid`);

--
-- Indexes for table `mdl_quiz_grades`
--
ALTER TABLE `mdl_quiz_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quizgrad_use_ix` (`userid`),
  ADD KEY `mdl_quizgrad_qui_ix` (`quiz`);

--
-- Indexes for table `mdl_quiz_overrides`
--
ALTER TABLE `mdl_quiz_overrides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quizover_qui_ix` (`quiz`),
  ADD KEY `mdl_quizover_gro_ix` (`groupid`),
  ADD KEY `mdl_quizover_use_ix` (`userid`);

--
-- Indexes for table `mdl_quiz_overview_regrades`
--
ALTER TABLE `mdl_quiz_overview_regrades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_quiz_reports`
--
ALTER TABLE `mdl_quiz_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`);

--
-- Indexes for table `mdl_quiz_sections`
--
ALTER TABLE `mdl_quiz_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quizsect_quifir_uix` (`quizid`,`firstslot`),
  ADD KEY `mdl_quizsect_qui_ix` (`quizid`);

--
-- Indexes for table `mdl_quiz_slots`
--
ALTER TABLE `mdl_quiz_slots`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quizslot_quislo_uix` (`quizid`,`slot`),
  ADD KEY `mdl_quizslot_qui_ix` (`quizid`),
  ADD KEY `mdl_quizslot_que_ix` (`questionid`);

--
-- Indexes for table `mdl_quiz_statistics`
--
ALTER TABLE `mdl_quiz_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_rating`
--
ALTER TABLE `mdl_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  ADD KEY `mdl_rati_con_ix` (`contextid`),
  ADD KEY `mdl_rati_use_ix` (`userid`);

--
-- Indexes for table `mdl_registration_hubs`
--
ALTER TABLE `mdl_registration_hubs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_repository`
--
ALTER TABLE `mdl_repository`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_repository_instances`
--
ALTER TABLE `mdl_repository_instances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_repository_instance_config`
--
ALTER TABLE `mdl_repository_instance_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_resource`
--
ALTER TABLE `mdl_resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_reso_cou_ix` (`course`);

--
-- Indexes for table `mdl_resource_old`
--
ALTER TABLE `mdl_resource_old`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  ADD KEY `mdl_resoold_cmi_ix` (`cmid`);

--
-- Indexes for table `mdl_role`
--
ALTER TABLE `mdl_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  ADD UNIQUE KEY `mdl_role_sho_uix` (`shortname`);

--
-- Indexes for table `mdl_role_allow_assign`
--
ALTER TABLE `mdl_role_allow_assign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  ADD KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  ADD KEY `mdl_rolealloassi_all_ix` (`allowassign`);

--
-- Indexes for table `mdl_role_allow_override`
--
ALTER TABLE `mdl_role_allow_override`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  ADD KEY `mdl_rolealloover_rol_ix` (`roleid`),
  ADD KEY `mdl_rolealloover_all_ix` (`allowoverride`);

--
-- Indexes for table `mdl_role_allow_switch`
--
ALTER TABLE `mdl_role_allow_switch`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  ADD KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  ADD KEY `mdl_rolealloswit_all_ix` (`allowswitch`);

--
-- Indexes for table `mdl_role_assignments`
--
ALTER TABLE `mdl_role_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_roleassi_sor_ix` (`sortorder`),
  ADD KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  ADD KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  ADD KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  ADD KEY `mdl_roleassi_rol_ix` (`roleid`),
  ADD KEY `mdl_roleassi_con_ix` (`contextid`),
  ADD KEY `mdl_roleassi_use_ix` (`userid`);

--
-- Indexes for table `mdl_role_capabilities`
--
ALTER TABLE `mdl_role_capabilities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  ADD KEY `mdl_rolecapa_rol_ix` (`roleid`),
  ADD KEY `mdl_rolecapa_con_ix` (`contextid`),
  ADD KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  ADD KEY `mdl_rolecapa_cap_ix` (`capability`);

--
-- Indexes for table `mdl_role_context_levels`
--
ALTER TABLE `mdl_role_context_levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  ADD KEY `mdl_rolecontleve_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_role_names`
--
ALTER TABLE `mdl_role_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  ADD KEY `mdl_rolename_rol_ix` (`roleid`),
  ADD KEY `mdl_rolename_con_ix` (`contextid`);

--
-- Indexes for table `mdl_role_sortorder`
--
ALTER TABLE `mdl_role_sortorder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  ADD KEY `mdl_rolesort_use_ix` (`userid`),
  ADD KEY `mdl_rolesort_rol_ix` (`roleid`),
  ADD KEY `mdl_rolesort_con_ix` (`contextid`);

--
-- Indexes for table `mdl_scale`
--
ALTER TABLE `mdl_scale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scal_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_scale_history`
--
ALTER TABLE `mdl_scale_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scalhist_act_ix` (`action`),
  ADD KEY `mdl_scalhist_old_ix` (`oldid`),
  ADD KEY `mdl_scalhist_cou_ix` (`courseid`),
  ADD KEY `mdl_scalhist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_scorm`
--
ALTER TABLE `mdl_scorm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scor_cou_ix` (`course`);

--
-- Indexes for table `mdl_scorm_aicc_session`
--
ALTER TABLE `mdl_scorm_aicc_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  ADD KEY `mdl_scoraiccsess_use_ix` (`userid`);

--
-- Indexes for table `mdl_scorm_scoes`
--
ALTER TABLE `mdl_scorm_scoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scorscoe_sco_ix` (`scorm`);

--
-- Indexes for table `mdl_scorm_scoes_data`
--
ALTER TABLE `mdl_scorm_scoes_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scorscoedata_sco_ix` (`scoid`);

--
-- Indexes for table `mdl_scorm_scoes_track`
--
ALTER TABLE `mdl_scorm_scoes_track`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  ADD KEY `mdl_scorscoetrac_use_ix` (`userid`),
  ADD KEY `mdl_scorscoetrac_ele_ix` (`element`),
  ADD KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  ADD KEY `mdl_scorscoetrac_sco2_ix` (`scoid`);

--
-- Indexes for table `mdl_scorm_seq_mapinfo`
--
ALTER TABLE `mdl_scorm_seq_mapinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  ADD KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  ADD KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`);

--
-- Indexes for table `mdl_scorm_seq_objective`
--
ALTER TABLE `mdl_scorm_seq_objective`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  ADD KEY `mdl_scorseqobje_sco_ix` (`scoid`);

--
-- Indexes for table `mdl_scorm_seq_rolluprule`
--
ALTER TABLE `mdl_scorm_seq_rolluprule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  ADD KEY `mdl_scorseqroll_sco_ix` (`scoid`);

--
-- Indexes for table `mdl_scorm_seq_rolluprulecond`
--
ALTER TABLE `mdl_scorm_seq_rolluprulecond`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  ADD KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  ADD KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`);

--
-- Indexes for table `mdl_scorm_seq_rulecond`
--
ALTER TABLE `mdl_scorm_seq_rulecond`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  ADD KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  ADD KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`);

--
-- Indexes for table `mdl_scorm_seq_ruleconds`
--
ALTER TABLE `mdl_scorm_seq_ruleconds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  ADD KEY `mdl_scorseqrule_sco_ix` (`scoid`);

--
-- Indexes for table `mdl_sessions`
--
ALTER TABLE `mdl_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  ADD KEY `mdl_sess_sta_ix` (`state`),
  ADD KEY `mdl_sess_tim_ix` (`timecreated`),
  ADD KEY `mdl_sess_tim2_ix` (`timemodified`),
  ADD KEY `mdl_sess_use_ix` (`userid`);

--
-- Indexes for table `mdl_stats_daily`
--
ALTER TABLE `mdl_stats_daily`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statdail_cou_ix` (`courseid`),
  ADD KEY `mdl_statdail_tim_ix` (`timeend`),
  ADD KEY `mdl_statdail_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_stats_monthly`
--
ALTER TABLE `mdl_stats_monthly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statmont_cou_ix` (`courseid`),
  ADD KEY `mdl_statmont_tim_ix` (`timeend`),
  ADD KEY `mdl_statmont_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_stats_user_daily`
--
ALTER TABLE `mdl_stats_user_daily`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statuserdail_cou_ix` (`courseid`),
  ADD KEY `mdl_statuserdail_use_ix` (`userid`),
  ADD KEY `mdl_statuserdail_rol_ix` (`roleid`),
  ADD KEY `mdl_statuserdail_tim_ix` (`timeend`);

--
-- Indexes for table `mdl_stats_user_monthly`
--
ALTER TABLE `mdl_stats_user_monthly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statusermont_cou_ix` (`courseid`),
  ADD KEY `mdl_statusermont_use_ix` (`userid`),
  ADD KEY `mdl_statusermont_rol_ix` (`roleid`),
  ADD KEY `mdl_statusermont_tim_ix` (`timeend`);

--
-- Indexes for table `mdl_stats_user_weekly`
--
ALTER TABLE `mdl_stats_user_weekly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statuserweek_cou_ix` (`courseid`),
  ADD KEY `mdl_statuserweek_use_ix` (`userid`),
  ADD KEY `mdl_statuserweek_rol_ix` (`roleid`),
  ADD KEY `mdl_statuserweek_tim_ix` (`timeend`);

--
-- Indexes for table `mdl_stats_weekly`
--
ALTER TABLE `mdl_stats_weekly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statweek_cou_ix` (`courseid`),
  ADD KEY `mdl_statweek_tim_ix` (`timeend`),
  ADD KEY `mdl_statweek_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_survey`
--
ALTER TABLE `mdl_survey`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_surv_cou_ix` (`course`);

--
-- Indexes for table `mdl_survey_analysis`
--
ALTER TABLE `mdl_survey_analysis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_survanal_use_ix` (`userid`),
  ADD KEY `mdl_survanal_sur_ix` (`survey`);

--
-- Indexes for table `mdl_survey_answers`
--
ALTER TABLE `mdl_survey_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_survansw_use_ix` (`userid`),
  ADD KEY `mdl_survansw_sur_ix` (`survey`),
  ADD KEY `mdl_survansw_que_ix` (`question`);

--
-- Indexes for table `mdl_survey_questions`
--
ALTER TABLE `mdl_survey_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_tag`
--
ALTER TABLE `mdl_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  ADD KEY `mdl_tag_use_ix` (`userid`);

--
-- Indexes for table `mdl_tag_correlation`
--
ALTER TABLE `mdl_tag_correlation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_tagcorr_tag_ix` (`tagid`);

--
-- Indexes for table `mdl_tag_instance`
--
ALTER TABLE `mdl_tag_instance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  ADD KEY `mdl_taginst_tag_ix` (`tagid`),
  ADD KEY `mdl_taginst_con_ix` (`contextid`);

--
-- Indexes for table `mdl_task_adhoc`
--
ALTER TABLE `mdl_task_adhoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_taskadho_nex_ix` (`nextruntime`);

--
-- Indexes for table `mdl_task_scheduled`
--
ALTER TABLE `mdl_task_scheduled`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_tasksche_cla_uix` (`classname`);

--
-- Indexes for table `mdl_tool_customlang`
--
ALTER TABLE `mdl_tool_customlang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  ADD KEY `mdl_toolcust_com_ix` (`componentid`);

--
-- Indexes for table `mdl_tool_customlang_components`
--
ALTER TABLE `mdl_tool_customlang_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_tool_monitor_events`
--
ALTER TABLE `mdl_tool_monitor_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_tool_monitor_history`
--
ALTER TABLE `mdl_tool_monitor_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_toolmonihist_sidusetim_uix` (`sid`,`userid`,`timesent`),
  ADD KEY `mdl_toolmonihist_sid_ix` (`sid`);

--
-- Indexes for table `mdl_tool_monitor_rules`
--
ALTER TABLE `mdl_tool_monitor_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolmonirule_couuse_ix` (`courseid`,`userid`),
  ADD KEY `mdl_toolmonirule_eve_ix` (`eventname`);

--
-- Indexes for table `mdl_tool_monitor_subscriptions`
--
ALTER TABLE `mdl_tool_monitor_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolmonisubs_couuse_ix` (`courseid`,`userid`),
  ADD KEY `mdl_toolmonisubs_rul_ix` (`ruleid`);

--
-- Indexes for table `mdl_upgrade_log`
--
ALTER TABLE `mdl_upgrade_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  ADD KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  ADD KEY `mdl_upgrlog_use_ix` (`userid`);

--
-- Indexes for table `mdl_url`
--
ALTER TABLE `mdl_url`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_url_cou_ix` (`course`);

--
-- Indexes for table `mdl_user`
--
ALTER TABLE `mdl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  ADD KEY `mdl_user_del_ix` (`deleted`),
  ADD KEY `mdl_user_con_ix` (`confirmed`),
  ADD KEY `mdl_user_fir_ix` (`firstname`),
  ADD KEY `mdl_user_las_ix` (`lastname`),
  ADD KEY `mdl_user_cit_ix` (`city`),
  ADD KEY `mdl_user_cou_ix` (`country`),
  ADD KEY `mdl_user_las2_ix` (`lastaccess`),
  ADD KEY `mdl_user_ema_ix` (`email`),
  ADD KEY `mdl_user_aut_ix` (`auth`),
  ADD KEY `mdl_user_idn_ix` (`idnumber`),
  ADD KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  ADD KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  ADD KEY `mdl_user_mid_ix` (`middlename`),
  ADD KEY `mdl_user_alt_ix` (`alternatename`);

--
-- Indexes for table `mdl_user_devices`
--
ALTER TABLE `mdl_user_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  ADD KEY `mdl_userdevi_uuiuse_ix` (`uuid`,`userid`),
  ADD KEY `mdl_userdevi_use_ix` (`userid`);

--
-- Indexes for table `mdl_user_enrolments`
--
ALTER TABLE `mdl_user_enrolments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  ADD KEY `mdl_userenro_enr_ix` (`enrolid`),
  ADD KEY `mdl_userenro_use_ix` (`userid`),
  ADD KEY `mdl_userenro_mod_ix` (`modifierid`);

--
-- Indexes for table `mdl_user_info_category`
--
ALTER TABLE `mdl_user_info_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_user_info_data`
--
ALTER TABLE `mdl_user_info_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userinfodata_usefie_uix` (`userid`,`fieldid`);

--
-- Indexes for table `mdl_user_info_field`
--
ALTER TABLE `mdl_user_info_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_user_lastaccess`
--
ALTER TABLE `mdl_user_lastaccess`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  ADD KEY `mdl_userlast_use_ix` (`userid`),
  ADD KEY `mdl_userlast_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_user_password_history`
--
ALTER TABLE `mdl_user_password_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_userpasshist_use_ix` (`userid`);

--
-- Indexes for table `mdl_user_password_resets`
--
ALTER TABLE `mdl_user_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_userpassrese_use_ix` (`userid`);

--
-- Indexes for table `mdl_user_preferences`
--
ALTER TABLE `mdl_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`);

--
-- Indexes for table `mdl_user_private_key`
--
ALTER TABLE `mdl_user_private_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  ADD KEY `mdl_userprivkey_use_ix` (`userid`);

--
-- Indexes for table `mdl_wiki`
--
ALTER TABLE `mdl_wiki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_wiki_cou_ix` (`course`);

--
-- Indexes for table `mdl_wiki_links`
--
ALTER TABLE `mdl_wiki_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_wikilink_fro_ix` (`frompageid`),
  ADD KEY `mdl_wikilink_sub_ix` (`subwikiid`);

--
-- Indexes for table `mdl_wiki_locks`
--
ALTER TABLE `mdl_wiki_locks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_wiki_pages`
--
ALTER TABLE `mdl_wiki_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  ADD KEY `mdl_wikipage_sub_ix` (`subwikiid`);

--
-- Indexes for table `mdl_wiki_subwikis`
--
ALTER TABLE `mdl_wiki_subwikis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  ADD KEY `mdl_wikisubw_wik_ix` (`wikiid`);

--
-- Indexes for table `mdl_wiki_synonyms`
--
ALTER TABLE `mdl_wiki_synonyms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`);

--
-- Indexes for table `mdl_wiki_versions`
--
ALTER TABLE `mdl_wiki_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_wikivers_pag_ix` (`pageid`);

--
-- Indexes for table `mdl_workshop`
--
ALTER TABLE `mdl_workshop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_work_cou_ix` (`course`);

--
-- Indexes for table `mdl_workshopallocation_scheduled`
--
ALTER TABLE `mdl_workshopallocation_scheduled`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`);

--
-- Indexes for table `mdl_workshopeval_best_settings`
--
ALTER TABLE `mdl_workshopeval_best_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_accumulative`
--
ALTER TABLE `mdl_workshopform_accumulative`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workaccu_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_comments`
--
ALTER TABLE `mdl_workshopform_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workcomm_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_numerrors`
--
ALTER TABLE `mdl_workshopform_numerrors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_worknume_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_numerrors_map`
--
ALTER TABLE `mdl_workshopform_numerrors_map`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  ADD KEY `mdl_worknumemap_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_rubric`
--
ALTER TABLE `mdl_workshopform_rubric`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workrubr_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_rubric_config`
--
ALTER TABLE `mdl_workshopform_rubric_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_rubric_levels`
--
ALTER TABLE `mdl_workshopform_rubric_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workrubrleve_dim_ix` (`dimensionid`);

--
-- Indexes for table `mdl_workshop_aggregations`
--
ALTER TABLE `mdl_workshop_aggregations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  ADD KEY `mdl_workaggr_wor_ix` (`workshopid`),
  ADD KEY `mdl_workaggr_use_ix` (`userid`);

--
-- Indexes for table `mdl_workshop_assessments`
--
ALTER TABLE `mdl_workshop_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workasse_sub_ix` (`submissionid`),
  ADD KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  ADD KEY `mdl_workasse_rev_ix` (`reviewerid`);

--
-- Indexes for table `mdl_workshop_assessments_old`
--
ALTER TABLE `mdl_workshop_assessments_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workasseold_use_ix` (`userid`),
  ADD KEY `mdl_workasseold_mai_ix` (`mailed`),
  ADD KEY `mdl_workasseold_wor_ix` (`workshopid`),
  ADD KEY `mdl_workasseold_sub_ix` (`submissionid`);

--
-- Indexes for table `mdl_workshop_comments_old`
--
ALTER TABLE `mdl_workshop_comments_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workcommold_use_ix` (`userid`),
  ADD KEY `mdl_workcommold_mai_ix` (`mailed`),
  ADD KEY `mdl_workcommold_wor_ix` (`workshopid`),
  ADD KEY `mdl_workcommold_ass_ix` (`assessmentid`);

--
-- Indexes for table `mdl_workshop_elements_old`
--
ALTER TABLE `mdl_workshop_elements_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workelemold_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshop_grades`
--
ALTER TABLE `mdl_workshop_grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  ADD KEY `mdl_workgrad_ass_ix` (`assessmentid`);

--
-- Indexes for table `mdl_workshop_grades_old`
--
ALTER TABLE `mdl_workshop_grades_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workgradold_wor_ix` (`workshopid`),
  ADD KEY `mdl_workgradold_ass_ix` (`assessmentid`);

--
-- Indexes for table `mdl_workshop_old`
--
ALTER TABLE `mdl_workshop_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workold_cou_ix` (`course`);

--
-- Indexes for table `mdl_workshop_rubrics_old`
--
ALTER TABLE `mdl_workshop_rubrics_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workrubrold_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshop_stockcomments_old`
--
ALTER TABLE `mdl_workshop_stockcomments_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workstocold_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshop_submissions`
--
ALTER TABLE `mdl_workshop_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_worksubm_wor_ix` (`workshopid`),
  ADD KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  ADD KEY `mdl_worksubm_aut_ix` (`authorid`);

--
-- Indexes for table `mdl_workshop_submissions_old`
--
ALTER TABLE `mdl_workshop_submissions_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_worksubmold_use_ix` (`userid`),
  ADD KEY `mdl_worksubmold_mai_ix` (`mailed`),
  ADD KEY `mdl_worksubmold_wor_ix` (`workshopid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mdl_assign`
--
ALTER TABLE `mdl_assign`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_comments`
--
ALTER TABLE `mdl_assignfeedback_comments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_editpdf_annot`
--
ALTER TABLE `mdl_assignfeedback_editpdf_annot`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_editpdf_cmnt`
--
ALTER TABLE `mdl_assignfeedback_editpdf_cmnt`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_editpdf_quick`
--
ALTER TABLE `mdl_assignfeedback_editpdf_quick`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_file`
--
ALTER TABLE `mdl_assignfeedback_file`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignment`
--
ALTER TABLE `mdl_assignment`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignment_submissions`
--
ALTER TABLE `mdl_assignment_submissions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignment_upgrade`
--
ALTER TABLE `mdl_assignment_upgrade`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignsubmission_file`
--
ALTER TABLE `mdl_assignsubmission_file`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignsubmission_onlinetext`
--
ALTER TABLE `mdl_assignsubmission_onlinetext`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_grades`
--
ALTER TABLE `mdl_assign_grades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_plugin_config`
--
ALTER TABLE `mdl_assign_plugin_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_submission`
--
ALTER TABLE `mdl_assign_submission`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_user_flags`
--
ALTER TABLE `mdl_assign_user_flags`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_user_mapping`
--
ALTER TABLE `mdl_assign_user_mapping`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_backup_controllers`
--
ALTER TABLE `mdl_backup_controllers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_backup_courses`
--
ALTER TABLE `mdl_backup_courses`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_backup_logs`
--
ALTER TABLE `mdl_backup_logs`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge`
--
ALTER TABLE `mdl_badge`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_backpack`
--
ALTER TABLE `mdl_badge_backpack`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_criteria`
--
ALTER TABLE `mdl_badge_criteria`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_criteria_met`
--
ALTER TABLE `mdl_badge_criteria_met`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_criteria_param`
--
ALTER TABLE `mdl_badge_criteria_param`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_external`
--
ALTER TABLE `mdl_badge_external`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_issued`
--
ALTER TABLE `mdl_badge_issued`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_manual_award`
--
ALTER TABLE `mdl_badge_manual_award`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block`
--
ALTER TABLE `mdl_block`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `mdl_block_community`
--
ALTER TABLE `mdl_block_community`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block_instances`
--
ALTER TABLE `mdl_block_instances`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `mdl_block_positions`
--
ALTER TABLE `mdl_block_positions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_block_recent_activity`
--
ALTER TABLE `mdl_block_recent_activity`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block_rss_client`
--
ALTER TABLE `mdl_block_rss_client`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_blog_association`
--
ALTER TABLE `mdl_blog_association`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_blog_external`
--
ALTER TABLE `mdl_blog_external`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_book`
--
ALTER TABLE `mdl_book`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_book_chapters`
--
ALTER TABLE `mdl_book_chapters`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_cache_filters`
--
ALTER TABLE `mdl_cache_filters`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_cache_flags`
--
ALTER TABLE `mdl_cache_flags`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `mdl_capabilities`
--
ALTER TABLE `mdl_capabilities`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=663;
--
-- AUTO_INCREMENT for table `mdl_chat`
--
ALTER TABLE `mdl_chat`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_chat_messages`
--
ALTER TABLE `mdl_chat_messages`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_chat_messages_current`
--
ALTER TABLE `mdl_chat_messages_current`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_chat_users`
--
ALTER TABLE `mdl_chat_users`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_choice`
--
ALTER TABLE `mdl_choice`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_choice_answers`
--
ALTER TABLE `mdl_choice_answers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_choice_options`
--
ALTER TABLE `mdl_choice_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_cohort`
--
ALTER TABLE `mdl_cohort`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_cohort_members`
--
ALTER TABLE `mdl_cohort_members`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_comments`
--
ALTER TABLE `mdl_comments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_config`
--
ALTER TABLE `mdl_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=540;
--
-- AUTO_INCREMENT for table `mdl_config_log`
--
ALTER TABLE `mdl_config_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=930;
--
-- AUTO_INCREMENT for table `mdl_config_plugins`
--
ALTER TABLE `mdl_config_plugins`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1218;
--
-- AUTO_INCREMENT for table `mdl_context`
--
ALTER TABLE `mdl_context`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `mdl_course`
--
ALTER TABLE `mdl_course`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_course_categories`
--
ALTER TABLE `mdl_course_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_course_completions`
--
ALTER TABLE `mdl_course_completions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_completion_aggr_methd`
--
ALTER TABLE `mdl_course_completion_aggr_methd`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_completion_criteria`
--
ALTER TABLE `mdl_course_completion_criteria`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_completion_crit_compl`
--
ALTER TABLE `mdl_course_completion_crit_compl`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_format_options`
--
ALTER TABLE `mdl_course_format_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mdl_course_modules`
--
ALTER TABLE `mdl_course_modules`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_course_modules_completion`
--
ALTER TABLE `mdl_course_modules_completion`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_published`
--
ALTER TABLE `mdl_course_published`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_request`
--
ALTER TABLE `mdl_course_request`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_sections`
--
ALTER TABLE `mdl_course_sections`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `mdl_data`
--
ALTER TABLE `mdl_data`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_data_content`
--
ALTER TABLE `mdl_data_content`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_data_fields`
--
ALTER TABLE `mdl_data_fields`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_data_records`
--
ALTER TABLE `mdl_data_records`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_editor_atto_autosave`
--
ALTER TABLE `mdl_editor_atto_autosave`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `mdl_enrol`
--
ALTER TABLE `mdl_enrol`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `mdl_enrol_flatfile`
--
ALTER TABLE `mdl_enrol_flatfile`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_paypal`
--
ALTER TABLE `mdl_enrol_paypal`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_event`
--
ALTER TABLE `mdl_event`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_events_handlers`
--
ALTER TABLE `mdl_events_handlers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_events_queue`
--
ALTER TABLE `mdl_events_queue`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_events_queue_handlers`
--
ALTER TABLE `mdl_events_queue_handlers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_event_subscriptions`
--
ALTER TABLE `mdl_event_subscriptions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_external_functions`
--
ALTER TABLE `mdl_external_functions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=313;
--
-- AUTO_INCREMENT for table `mdl_external_services`
--
ALTER TABLE `mdl_external_services`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `mdl_external_services_functions`
--
ALTER TABLE `mdl_external_services_functions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT for table `mdl_external_services_users`
--
ALTER TABLE `mdl_external_services_users`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_external_tokens`
--
ALTER TABLE `mdl_external_tokens`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `mdl_feedback`
--
ALTER TABLE `mdl_feedback`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_completed`
--
ALTER TABLE `mdl_feedback_completed`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_completedtmp`
--
ALTER TABLE `mdl_feedback_completedtmp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_item`
--
ALTER TABLE `mdl_feedback_item`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_sitecourse_map`
--
ALTER TABLE `mdl_feedback_sitecourse_map`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_template`
--
ALTER TABLE `mdl_feedback_template`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_tracking`
--
ALTER TABLE `mdl_feedback_tracking`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_value`
--
ALTER TABLE `mdl_feedback_value`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_valuetmp`
--
ALTER TABLE `mdl_feedback_valuetmp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_files`
--
ALTER TABLE `mdl_files`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `mdl_files_reference`
--
ALTER TABLE `mdl_files_reference`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_filter_active`
--
ALTER TABLE `mdl_filter_active`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_filter_config`
--
ALTER TABLE `mdl_filter_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_folder`
--
ALTER TABLE `mdl_folder`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum`
--
ALTER TABLE `mdl_forum`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_forum_digests`
--
ALTER TABLE `mdl_forum_digests`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_discussions`
--
ALTER TABLE `mdl_forum_discussions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_discussion_subs`
--
ALTER TABLE `mdl_forum_discussion_subs`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_posts`
--
ALTER TABLE `mdl_forum_posts`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_queue`
--
ALTER TABLE `mdl_forum_queue`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_read`
--
ALTER TABLE `mdl_forum_read`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_subscriptions`
--
ALTER TABLE `mdl_forum_subscriptions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_track_prefs`
--
ALTER TABLE `mdl_forum_track_prefs`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary`
--
ALTER TABLE `mdl_glossary`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_alias`
--
ALTER TABLE `mdl_glossary_alias`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_categories`
--
ALTER TABLE `mdl_glossary_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_entries`
--
ALTER TABLE `mdl_glossary_entries`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_entries_categories`
--
ALTER TABLE `mdl_glossary_entries_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_formats`
--
ALTER TABLE `mdl_glossary_formats`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mdl_grade_categories`
--
ALTER TABLE `mdl_grade_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_categories_history`
--
ALTER TABLE `mdl_grade_categories_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_grades`
--
ALTER TABLE `mdl_grade_grades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_grades_history`
--
ALTER TABLE `mdl_grade_grades_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_import_newitem`
--
ALTER TABLE `mdl_grade_import_newitem`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_import_values`
--
ALTER TABLE `mdl_grade_import_values`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_items`
--
ALTER TABLE `mdl_grade_items`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_items_history`
--
ALTER TABLE `mdl_grade_items_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_letters`
--
ALTER TABLE `mdl_grade_letters`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_outcomes`
--
ALTER TABLE `mdl_grade_outcomes`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_outcomes_courses`
--
ALTER TABLE `mdl_grade_outcomes_courses`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_outcomes_history`
--
ALTER TABLE `mdl_grade_outcomes_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_settings`
--
ALTER TABLE `mdl_grade_settings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_guide_comments`
--
ALTER TABLE `mdl_gradingform_guide_comments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_guide_criteria`
--
ALTER TABLE `mdl_gradingform_guide_criteria`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_guide_fillings`
--
ALTER TABLE `mdl_gradingform_guide_fillings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_rubric_criteria`
--
ALTER TABLE `mdl_gradingform_rubric_criteria`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_rubric_fillings`
--
ALTER TABLE `mdl_gradingform_rubric_fillings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_rubric_levels`
--
ALTER TABLE `mdl_gradingform_rubric_levels`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grading_areas`
--
ALTER TABLE `mdl_grading_areas`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grading_definitions`
--
ALTER TABLE `mdl_grading_definitions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grading_instances`
--
ALTER TABLE `mdl_grading_instances`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_groupings`
--
ALTER TABLE `mdl_groupings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_groupings_groups`
--
ALTER TABLE `mdl_groupings_groups`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_groups`
--
ALTER TABLE `mdl_groups`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_groups_members`
--
ALTER TABLE `mdl_groups_members`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_imscp`
--
ALTER TABLE `mdl_imscp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_label`
--
ALTER TABLE `mdl_label`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson`
--
ALTER TABLE `mdl_lesson`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_answers`
--
ALTER TABLE `mdl_lesson_answers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_attempts`
--
ALTER TABLE `mdl_lesson_attempts`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_branch`
--
ALTER TABLE `mdl_lesson_branch`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_grades`
--
ALTER TABLE `mdl_lesson_grades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_overrides`
--
ALTER TABLE `mdl_lesson_overrides`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_pages`
--
ALTER TABLE `mdl_lesson_pages`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_timer`
--
ALTER TABLE `mdl_lesson_timer`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_license`
--
ALTER TABLE `mdl_license`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `mdl_lock_db`
--
ALTER TABLE `mdl_lock_db`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_log`
--
ALTER TABLE `mdl_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_logstore_standard_log`
--
ALTER TABLE `mdl_logstore_standard_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=591;
--
-- AUTO_INCREMENT for table `mdl_log_display`
--
ALTER TABLE `mdl_log_display`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=188;
--
-- AUTO_INCREMENT for table `mdl_log_queries`
--
ALTER TABLE `mdl_log_queries`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti`
--
ALTER TABLE `mdl_lti`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti_submission`
--
ALTER TABLE `mdl_lti_submission`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti_tool_proxies`
--
ALTER TABLE `mdl_lti_tool_proxies`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti_tool_settings`
--
ALTER TABLE `mdl_lti_tool_settings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti_types`
--
ALTER TABLE `mdl_lti_types`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti_types_config`
--
ALTER TABLE `mdl_lti_types_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message`
--
ALTER TABLE `mdl_message`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_messageinbound_datakeys`
--
ALTER TABLE `mdl_messageinbound_datakeys`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_messageinbound_handlers`
--
ALTER TABLE `mdl_messageinbound_handlers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_messageinbound_messagelist`
--
ALTER TABLE `mdl_messageinbound_messagelist`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message_airnotifier_devices`
--
ALTER TABLE `mdl_message_airnotifier_devices`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message_contacts`
--
ALTER TABLE `mdl_message_contacts`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message_processors`
--
ALTER TABLE `mdl_message_processors`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mdl_message_providers`
--
ALTER TABLE `mdl_message_providers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `mdl_message_read`
--
ALTER TABLE `mdl_message_read`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message_working`
--
ALTER TABLE `mdl_message_working`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnetservice_enrol_courses`
--
ALTER TABLE `mdl_mnetservice_enrol_courses`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnetservice_enrol_enrolments`
--
ALTER TABLE `mdl_mnetservice_enrol_enrolments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnet_application`
--
ALTER TABLE `mdl_mnet_application`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_mnet_host`
--
ALTER TABLE `mdl_mnet_host`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_mnet_host2service`
--
ALTER TABLE `mdl_mnet_host2service`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnet_log`
--
ALTER TABLE `mdl_mnet_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnet_remote_rpc`
--
ALTER TABLE `mdl_mnet_remote_rpc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `mdl_mnet_remote_service2rpc`
--
ALTER TABLE `mdl_mnet_remote_service2rpc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `mdl_mnet_rpc`
--
ALTER TABLE `mdl_mnet_rpc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `mdl_mnet_service`
--
ALTER TABLE `mdl_mnet_service`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mdl_mnet_service2rpc`
--
ALTER TABLE `mdl_mnet_service2rpc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `mdl_mnet_session`
--
ALTER TABLE `mdl_mnet_session`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnet_sso_access_control`
--
ALTER TABLE `mdl_mnet_sso_access_control`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_modules`
--
ALTER TABLE `mdl_modules`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `mdl_my_pages`
--
ALTER TABLE `mdl_my_pages`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mdl_page`
--
ALTER TABLE `mdl_page`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_instance`
--
ALTER TABLE `mdl_portfolio_instance`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_instance_config`
--
ALTER TABLE `mdl_portfolio_instance_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_instance_user`
--
ALTER TABLE `mdl_portfolio_instance_user`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_log`
--
ALTER TABLE `mdl_portfolio_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_mahara_queue`
--
ALTER TABLE `mdl_portfolio_mahara_queue`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_tempdata`
--
ALTER TABLE `mdl_portfolio_tempdata`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_post`
--
ALTER TABLE `mdl_post`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_profiling`
--
ALTER TABLE `mdl_profiling`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_ddimageortext`
--
ALTER TABLE `mdl_qtype_ddimageortext`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_ddimageortext_drags`
--
ALTER TABLE `mdl_qtype_ddimageortext_drags`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_ddimageortext_drops`
--
ALTER TABLE `mdl_qtype_ddimageortext_drops`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_ddmarker`
--
ALTER TABLE `mdl_qtype_ddmarker`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_ddmarker_drags`
--
ALTER TABLE `mdl_qtype_ddmarker_drags`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_ddmarker_drops`
--
ALTER TABLE `mdl_qtype_ddmarker_drops`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_essay_options`
--
ALTER TABLE `mdl_qtype_essay_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_match_options`
--
ALTER TABLE `mdl_qtype_match_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_match_subquestions`
--
ALTER TABLE `mdl_qtype_match_subquestions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_multichoice_options`
--
ALTER TABLE `mdl_qtype_multichoice_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_randomsamatch_options`
--
ALTER TABLE `mdl_qtype_randomsamatch_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_shortanswer_options`
--
ALTER TABLE `mdl_qtype_shortanswer_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question`
--
ALTER TABLE `mdl_question`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_answers`
--
ALTER TABLE `mdl_question_answers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_attempts`
--
ALTER TABLE `mdl_question_attempts`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_attempt_steps`
--
ALTER TABLE `mdl_question_attempt_steps`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_attempt_step_data`
--
ALTER TABLE `mdl_question_attempt_step_data`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_calculated`
--
ALTER TABLE `mdl_question_calculated`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_calculated_options`
--
ALTER TABLE `mdl_question_calculated_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_categories`
--
ALTER TABLE `mdl_question_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_datasets`
--
ALTER TABLE `mdl_question_datasets`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_dataset_definitions`
--
ALTER TABLE `mdl_question_dataset_definitions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_dataset_items`
--
ALTER TABLE `mdl_question_dataset_items`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_ddwtos`
--
ALTER TABLE `mdl_question_ddwtos`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_gapselect`
--
ALTER TABLE `mdl_question_gapselect`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_hints`
--
ALTER TABLE `mdl_question_hints`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_multianswer`
--
ALTER TABLE `mdl_question_multianswer`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_numerical`
--
ALTER TABLE `mdl_question_numerical`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_numerical_options`
--
ALTER TABLE `mdl_question_numerical_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_numerical_units`
--
ALTER TABLE `mdl_question_numerical_units`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_response_analysis`
--
ALTER TABLE `mdl_question_response_analysis`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_response_count`
--
ALTER TABLE `mdl_question_response_count`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_statistics`
--
ALTER TABLE `mdl_question_statistics`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_truefalse`
--
ALTER TABLE `mdl_question_truefalse`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_usages`
--
ALTER TABLE `mdl_question_usages`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_quiz`
--
ALTER TABLE `mdl_quiz`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_quiz_attempts`
--
ALTER TABLE `mdl_quiz_attempts`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_quiz_feedback`
--
ALTER TABLE `mdl_quiz_feedback`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_quiz_grades`
--
ALTER TABLE `mdl_quiz_grades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_quiz_overrides`
--
ALTER TABLE `mdl_quiz_overrides`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_quiz_overview_regrades`
--
ALTER TABLE `mdl_quiz_overview_regrades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_quiz_reports`
--
ALTER TABLE `mdl_quiz_reports`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mdl_quiz_sections`
--
ALTER TABLE `mdl_quiz_sections`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_quiz_slots`
--
ALTER TABLE `mdl_quiz_slots`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_quiz_statistics`
--
ALTER TABLE `mdl_quiz_statistics`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_rating`
--
ALTER TABLE `mdl_rating`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_registration_hubs`
--
ALTER TABLE `mdl_registration_hubs`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_repository`
--
ALTER TABLE `mdl_repository`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mdl_repository_instances`
--
ALTER TABLE `mdl_repository_instances`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mdl_repository_instance_config`
--
ALTER TABLE `mdl_repository_instance_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_resource`
--
ALTER TABLE `mdl_resource`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_resource_old`
--
ALTER TABLE `mdl_resource_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_role`
--
ALTER TABLE `mdl_role`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `mdl_role_allow_assign`
--
ALTER TABLE `mdl_role_allow_assign`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mdl_role_allow_override`
--
ALTER TABLE `mdl_role_allow_override`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `mdl_role_allow_switch`
--
ALTER TABLE `mdl_role_allow_switch`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `mdl_role_assignments`
--
ALTER TABLE `mdl_role_assignments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_role_capabilities`
--
ALTER TABLE `mdl_role_capabilities`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1370;
--
-- AUTO_INCREMENT for table `mdl_role_context_levels`
--
ALTER TABLE `mdl_role_context_levels`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `mdl_role_names`
--
ALTER TABLE `mdl_role_names`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_role_sortorder`
--
ALTER TABLE `mdl_role_sortorder`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scale`
--
ALTER TABLE `mdl_scale`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scale_history`
--
ALTER TABLE `mdl_scale_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm`
--
ALTER TABLE `mdl_scorm`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_aicc_session`
--
ALTER TABLE `mdl_scorm_aicc_session`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_scoes`
--
ALTER TABLE `mdl_scorm_scoes`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_scoes_data`
--
ALTER TABLE `mdl_scorm_scoes_data`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_scoes_track`
--
ALTER TABLE `mdl_scorm_scoes_track`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_seq_mapinfo`
--
ALTER TABLE `mdl_scorm_seq_mapinfo`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_seq_objective`
--
ALTER TABLE `mdl_scorm_seq_objective`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_seq_rolluprule`
--
ALTER TABLE `mdl_scorm_seq_rolluprule`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_seq_rolluprulecond`
--
ALTER TABLE `mdl_scorm_seq_rolluprulecond`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_seq_rulecond`
--
ALTER TABLE `mdl_scorm_seq_rulecond`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_seq_ruleconds`
--
ALTER TABLE `mdl_scorm_seq_ruleconds`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_sessions`
--
ALTER TABLE `mdl_sessions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `mdl_stats_daily`
--
ALTER TABLE `mdl_stats_daily`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_stats_monthly`
--
ALTER TABLE `mdl_stats_monthly`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_stats_user_daily`
--
ALTER TABLE `mdl_stats_user_daily`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_stats_user_monthly`
--
ALTER TABLE `mdl_stats_user_monthly`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_stats_user_weekly`
--
ALTER TABLE `mdl_stats_user_weekly`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_stats_weekly`
--
ALTER TABLE `mdl_stats_weekly`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_survey`
--
ALTER TABLE `mdl_survey`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mdl_survey_analysis`
--
ALTER TABLE `mdl_survey_analysis`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_survey_answers`
--
ALTER TABLE `mdl_survey_answers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_survey_questions`
--
ALTER TABLE `mdl_survey_questions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `mdl_tag`
--
ALTER TABLE `mdl_tag`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_tag_correlation`
--
ALTER TABLE `mdl_tag_correlation`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_tag_instance`
--
ALTER TABLE `mdl_tag_instance`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_task_adhoc`
--
ALTER TABLE `mdl_task_adhoc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_task_scheduled`
--
ALTER TABLE `mdl_task_scheduled`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `mdl_tool_customlang`
--
ALTER TABLE `mdl_tool_customlang`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_tool_customlang_components`
--
ALTER TABLE `mdl_tool_customlang_components`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_tool_monitor_events`
--
ALTER TABLE `mdl_tool_monitor_events`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_tool_monitor_history`
--
ALTER TABLE `mdl_tool_monitor_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_tool_monitor_rules`
--
ALTER TABLE `mdl_tool_monitor_rules`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_tool_monitor_subscriptions`
--
ALTER TABLE `mdl_tool_monitor_subscriptions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_upgrade_log`
--
ALTER TABLE `mdl_upgrade_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1291;
--
-- AUTO_INCREMENT for table `mdl_url`
--
ALTER TABLE `mdl_url`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_user`
--
ALTER TABLE `mdl_user`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_user_devices`
--
ALTER TABLE `mdl_user_devices`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_user_enrolments`
--
ALTER TABLE `mdl_user_enrolments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_user_info_category`
--
ALTER TABLE `mdl_user_info_category`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_user_info_data`
--
ALTER TABLE `mdl_user_info_data`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_user_info_field`
--
ALTER TABLE `mdl_user_info_field`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_user_lastaccess`
--
ALTER TABLE `mdl_user_lastaccess`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_user_password_history`
--
ALTER TABLE `mdl_user_password_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_user_password_resets`
--
ALTER TABLE `mdl_user_password_resets`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_user_preferences`
--
ALTER TABLE `mdl_user_preferences`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `mdl_user_private_key`
--
ALTER TABLE `mdl_user_private_key`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki`
--
ALTER TABLE `mdl_wiki`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki_links`
--
ALTER TABLE `mdl_wiki_links`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki_locks`
--
ALTER TABLE `mdl_wiki_locks`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki_pages`
--
ALTER TABLE `mdl_wiki_pages`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki_subwikis`
--
ALTER TABLE `mdl_wiki_subwikis`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki_synonyms`
--
ALTER TABLE `mdl_wiki_synonyms`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki_versions`
--
ALTER TABLE `mdl_wiki_versions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop`
--
ALTER TABLE `mdl_workshop`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopallocation_scheduled`
--
ALTER TABLE `mdl_workshopallocation_scheduled`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopeval_best_settings`
--
ALTER TABLE `mdl_workshopeval_best_settings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_accumulative`
--
ALTER TABLE `mdl_workshopform_accumulative`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_comments`
--
ALTER TABLE `mdl_workshopform_comments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_numerrors`
--
ALTER TABLE `mdl_workshopform_numerrors`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_numerrors_map`
--
ALTER TABLE `mdl_workshopform_numerrors_map`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_rubric`
--
ALTER TABLE `mdl_workshopform_rubric`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_rubric_config`
--
ALTER TABLE `mdl_workshopform_rubric_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_rubric_levels`
--
ALTER TABLE `mdl_workshopform_rubric_levels`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_aggregations`
--
ALTER TABLE `mdl_workshop_aggregations`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_assessments`
--
ALTER TABLE `mdl_workshop_assessments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_assessments_old`
--
ALTER TABLE `mdl_workshop_assessments_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_comments_old`
--
ALTER TABLE `mdl_workshop_comments_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_elements_old`
--
ALTER TABLE `mdl_workshop_elements_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_grades`
--
ALTER TABLE `mdl_workshop_grades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_grades_old`
--
ALTER TABLE `mdl_workshop_grades_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_old`
--
ALTER TABLE `mdl_workshop_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_rubrics_old`
--
ALTER TABLE `mdl_workshop_rubrics_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_stockcomments_old`
--
ALTER TABLE `mdl_workshop_stockcomments_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_submissions`
--
ALTER TABLE `mdl_workshop_submissions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_submissions_old`
--
ALTER TABLE `mdl_workshop_submissions_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
