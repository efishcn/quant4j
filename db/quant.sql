/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : quant

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2019-07-13 00:51:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'api的名称',
  `user_id` int(11) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT '0' COMMENT '0未删除 1删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6688522 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for balance
-- ----------------------------
DROP TABLE IF EXISTS `balance`;
CREATE TABLE `balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT '' COMMENT '账户类型',
  `currency` varchar(255) DEFAULT NULL COMMENT '币种',
  `trade_balance` varchar(255) DEFAULT NULL COMMENT '余额',
  `frozen_balance` varchar(255) DEFAULT NULL COMMENT 'trade: 交易余额，frozen: 冻结余额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1556 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `robot_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` bigint(11) unsigned NOT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `robot_id` int(11) DEFAULT NULL,
  `account_id` bigint(11) unsigned DEFAULT NULL,
  `amount` decimal(20,10) DEFAULT NULL,
  `price` decimal(20,10) DEFAULT NULL,
  `order_state` varchar(255) DEFAULT NULL,
  `order_type` varchar(255) DEFAULT NULL,
  `create_time` bigint(11) DEFAULT NULL,
  `finished_time` bigint(11) DEFAULT NULL,
  `field_fees` decimal(20,10) DEFAULT NULL,
  `field_amount` decimal(20,10) DEFAULT NULL,
  `field_cash_amount` decimal(20,10) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_profit
-- ----------------------------
DROP TABLE IF EXISTS `order_profit`;
CREATE TABLE `order_profit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `robot_id` int(11) DEFAULT NULL,
  `sell_order_id` bigint(20) DEFAULT NULL,
  `buy_order_id` bigint(20) DEFAULT NULL,
  `buy_price` decimal(20,10) DEFAULT NULL,
  `sell_price` decimal(20,10) DEFAULT NULL,
  `buy_cash_amount` decimal(20,10) DEFAULT NULL,
  `sell_cash_amount` decimal(20,10) DEFAULT NULL,
  `buy_amount` decimal(20,10) DEFAULT NULL,
  `sell_amount` decimal(20,10) DEFAULT NULL,
  `is_profit` tinyint(4) DEFAULT NULL,
  `diff` decimal(10,10) DEFAULT NULL,
  `divide` decimal(10,10) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for robot
-- ----------------------------
DROP TABLE IF EXISTS `robot`;
CREATE TABLE `robot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `robot_name` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `strategy_id` int(11) DEFAULT NULL,
  `client_address` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '0未删除 1已经删除',
  `is_run` tinyint(1) DEFAULT '0' COMMENT '0未启动 1已经启动',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for strategy
-- ----------------------------
DROP TABLE IF EXISTS `strategy`;
CREATE TABLE `strategy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `strategy_name` varchar(255) DEFAULT NULL,
  `strategy_type` int(11) DEFAULT '0',
  `buy_amount` decimal(20,8) DEFAULT NULL,
  `buy_quota_price` decimal(20,8) DEFAULT NULL COMMENT '市价买入交易额',
  `sell_amount` decimal(20,8) DEFAULT NULL,
  `buy_price` decimal(20,8) DEFAULT NULL,
  `sell_price` decimal(20,8) DEFAULT NULL,
  `is_all_buy` tinyint(1) DEFAULT '0' COMMENT '0 不是全部购买',
  `is_all_sell` tinyint(1) DEFAULT '0' COMMENT '0不是全部卖出',
  `is_limit_price` tinyint(1) DEFAULT '1' COMMENT '是否限价交易',
  `sell_all_weights` int(11) DEFAULT NULL,
  `buy_all_weights` int(11) DEFAULT NULL,
  `profit` int(11) DEFAULT NULL COMMENT '亏损次数',
  `sleep` double(11,4) DEFAULT NULL,
  `setting1` mediumtext,
  `setting2` varchar(255) DEFAULT NULL,
  `setting3` varchar(255) DEFAULT NULL,
  `setting4` varchar(255) DEFAULT NULL,
  `setting5` mediumtext,
  `setting6` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for symbol
-- ----------------------------
DROP TABLE IF EXISTS `symbol`;
CREATE TABLE `symbol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_currency` varchar(255) DEFAULT NULL,
  `quote_currency` varchar(255) DEFAULT NULL,
  `price_precision` int(2) DEFAULT NULL,
  `amount_precision` int(2) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=476 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `enable_mail` int(2) DEFAULT '0' COMMENT '是否开启邮件0不开 1开启',
  `send_mail` varchar(255) DEFAULT NULL COMMENT '接受邮件',
  `roles` varchar(255) DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
