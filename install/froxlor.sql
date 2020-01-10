DROP TABLE IF EXISTS `ftp_groups`;
CREATE TABLE `ftp_groups` (
  `id` int(20) NOT NULL auto_increment,
  `groupname` varchar(60) NOT NULL default '',
  `gid` int(5) NOT NULL default '0',
  `members` longtext NOT NULL,
  `customerid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `groupname` (`groupname`),
  KEY `customerid` (`customerid`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `ftp_users`;
CREATE TABLE `ftp_users` (
  `id` int(20) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL default '',
  `uid` int(5) NOT NULL default '0',
  `gid` int(5) NOT NULL default '0',
  `password` varchar(128) NOT NULL default '',
  `homedir` varchar(255) NOT NULL default '',
  `shell` varchar(255) NOT NULL default '/bin/false',
  `login_enabled` enum('N','Y') NOT NULL default 'N',
  `login_count` int(15) NOT NULL default '0',
  `last_login` datetime default NULL,
  `up_count` int(15) NOT NULL default '0',
  `up_bytes` bigint(30) NOT NULL default '0',
  `down_count` int(15) NOT NULL default '0',
  `down_bytes` bigint(30) NOT NULL default '0',
  `customerid` int(11) NOT NULL default '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `customerid` (`customerid`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `mail_users`;
CREATE TABLE `mail_users` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) NOT NULL default '',
  `username` varchar(255) NOT NULL default '',
  `password` varchar(128) NOT NULL default '',
  `password_enc` varchar(128) NOT NULL default '',
  `uid` int(11) NOT NULL default '0',
  `gid` int(11) NOT NULL default '0',
  `homedir` varchar(255) NOT NULL default '',
  `maildir` varchar(255) NOT NULL default '',
  `postfix` enum('Y','N') NOT NULL default 'Y',
  `domainid` int(11) NOT NULL default '0',
  `customerid` int(11) NOT NULL default '0',
  `quota` bigint(13) NOT NULL default '0',
  `pop3` tinyint(1) NOT NULL default '1',
  `imap` tinyint(1) NOT NULL default '1',
  `mboxsize` bigint(30) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `mail_virtual`;
CREATE TABLE `mail_virtual` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) NOT NULL default '',
  `email_full` varchar(255) NOT NULL default '',
  `destination` text,
  `domainid` int(11) NOT NULL default '0',
  `customerid` int(11) NOT NULL default '0',
  `popaccountid` int(11) NOT NULL default '0',
  `iscatchall` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;


DROP TABLE IF EXISTS `panel_activation`;
CREATE TABLE `panel_activation` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `userid` int(11) unsigned NOT NULL default '0',
  `admin` tinyint(1) unsigned NOT NULL default '0',
  `creation` int(11) unsigned NOT NULL default '0',
  `activationcode` varchar(50) default NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  CHARSET=utf8 COLLATE=utf8_general_ci;


DROP TABLE IF EXISTS `panel_admins`;
CREATE TABLE `panel_admins` (
  `adminid` int(11) unsigned NOT NULL auto_increment,
  `loginname` varchar(50) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `def_language` varchar(100) NOT NULL default '',
  `ip` varchar(500) NOT NULL default '-1',
  `customers` int(15) NOT NULL default '0',
  `customers_used` int(15) NOT NULL default '0',
  `customers_see_all` tinyint(1) NOT NULL default '0',
  `domains` int(15) NOT NULL default '0',
  `domains_used` int(15) NOT NULL default '0',
  `domains_see_all` tinyint(1) NOT NULL default '0',
  `caneditphpsettings` tinyint(1) NOT NULL default '0',
  `change_serversettings` tinyint(1) NOT NULL default '0',
  `diskspace` int(15) NOT NULL default '0',
  `diskspace_used` int(15) NOT NULL default '0',
  `mysqls` int(15) NOT NULL default '0',
  `mysqls_used` int(15) NOT NULL default '0',
  `emails` int(15) NOT NULL default '0',
  `emails_used` int(15) NOT NULL default '0',
  `email_accounts` int(15) NOT NULL default '0',
  `email_accounts_used` int(15) NOT NULL default '0',
  `email_forwarders` int(15) NOT NULL default '0',
  `email_forwarders_used` int(15) NOT NULL default '0',
  `email_quota` bigint(13) NOT NULL default '0',
  `email_quota_used` bigint(13) NOT NULL default '0',
  `ftps` int(15) NOT NULL default '0',
  `ftps_used` int(15) NOT NULL default '0',
  `subdomains` int(15) NOT NULL default '0',
  `subdomains_used` int(15) NOT NULL default '0',
  `traffic` bigint(30) NOT NULL default '0',
  `traffic_used` bigint(30) NOT NULL default '0',
  `deactivated` tinyint(1) NOT NULL default '0',
  `lastlogin_succ` int(11) unsigned NOT NULL default '0',
  `lastlogin_fail` int(11) unsigned NOT NULL default '0',
  `loginfail_count` int(11) unsigned NOT NULL default '0',
  `reportsent` tinyint(4) unsigned NOT NULL default '0',
  `theme` varchar(50) NOT NULL default 'Sparkle',
  `custom_notes` text,
  `custom_notes_show` tinyint(1) NOT NULL default '0',
  `type_2fa` tinyint(1) NOT NULL default '0',
  `data_2fa` varchar(25) NOT NULL default '',
  `api_allowed` tinyint(1) NOT NULL default '1',
   PRIMARY KEY  (`adminid`),
   UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `panel_customers`;
CREATE TABLE `panel_customers` (
  `customerid` int(11) unsigned NOT NULL auto_increment,
  `loginname` varchar(50) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `adminid` int(11) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `firstname` varchar(255) NOT NULL default '',
  `gender` int(1) NOT NULL DEFAULT '0',
  `company` varchar(255) NOT NULL default '',
  `street` varchar(255) NOT NULL default '',
  `zipcode` varchar(25) NOT NULL default '',
  `city` varchar(255) NOT NULL default '',
  `phone` varchar(50) NOT NULL default '',
  `fax` varchar(50) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `customernumber` varchar(255) NOT NULL default '',
  `def_language` varchar(100) NOT NULL default '',
  `diskspace` bigint(30) NOT NULL default '0',
  `diskspace_used` bigint(30) NOT NULL default '0',
  `mysqls` int(15) NOT NULL default '0',
  `mysqls_used` int(15) NOT NULL default '0',
  `emails` int(15) NOT NULL default '0',
  `emails_used` int(15) NOT NULL default '0',
  `email_accounts` int(15) NOT NULL default '0',
  `email_accounts_used` int(15) NOT NULL default '0',
  `email_forwarders` int(15) NOT NULL default '0',
  `email_forwarders_used` int(15) NOT NULL default '0',
  `email_quota` bigint(13) NOT NULL default '0',
  `email_quota_used` bigint(13) NOT NULL default '0',
  `ftps` int(15) NOT NULL default '0',
  `ftps_used` int(15) NOT NULL default '0',
  `subdomains` int(15) NOT NULL default '0',
  `subdomains_used` int(15) NOT NULL default '0',
  `traffic` bigint(30) NOT NULL default '0',
  `traffic_used` bigint(30) NOT NULL default '0',
  `documentroot` varchar(255) NOT NULL default '',
  `standardsubdomain` int(11) NOT NULL default '0',
  `guid` int(5) NOT NULL default '0',
  `ftp_lastaccountnumber` int(11) NOT NULL default '0',
  `mysql_lastaccountnumber` int(11) NOT NULL default '0',
  `deactivated` tinyint(1) NOT NULL default '0',
  `phpenabled` tinyint(1) NOT NULL default '1',
  `lastlogin_succ` int(11) unsigned NOT NULL default '0',
  `lastlogin_fail` int(11) unsigned NOT NULL default '0',
  `loginfail_count` int(11) unsigned NOT NULL default '0',
  `reportsent` tinyint(4) unsigned NOT NULL default '0',
  `pop3` tinyint(1) NOT NULL default '1',
  `imap` tinyint(1) NOT NULL default '1',
  `perlenabled` tinyint(1) NOT NULL default '0',
  `dnsenabled` tinyint(1) NOT NULL default '0',
  `theme` varchar(50) NOT NULL default 'Sparkle',
  `custom_notes` text,
  `custom_notes_show` tinyint(1) NOT NULL default '0',
  `lepublickey` mediumtext default NULL,
  `leprivatekey` mediumtext default NULL,
  `leregistered` tinyint(1) NOT NULL default '0',
  `allowed_phpconfigs` varchar(500) NOT NULL default '',
  `type_2fa` tinyint(1) NOT NULL default '0',
  `data_2fa` varchar(25) NOT NULL default '',
  `api_allowed` tinyint(1) NOT NULL default '1',
  `logviewenabled` tinyint(1) NOT NULL default '0',
   PRIMARY KEY  (`customerid`),
   UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `panel_databases`;
CREATE TABLE `panel_databases` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `customerid` int(11) NOT NULL default '0',
  `databasename` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `dbserver` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `customerid` (`customerid`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `panel_domains`;
CREATE TABLE `panel_domains` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `domain` varchar(255) NOT NULL default '',
  `adminid` int(11) unsigned NOT NULL default '0',
  `customerid` int(11) unsigned NOT NULL default '0',
  `aliasdomain` int(11) unsigned NULL,
  `documentroot` varchar(255) NOT NULL default '',
  `isbinddomain` tinyint(1) NOT NULL default '0',
  `isemaildomain` tinyint(1) NOT NULL default '0',
  `email_only` tinyint(1) NOT NULL default '0',
  `iswildcarddomain` tinyint(1) NOT NULL default '1',
  `subcanemaildomain` tinyint(1) NOT NULL default '0',
  `caneditdomain` tinyint(1) NOT NULL default '1',
  `zonefile` varchar(255) NOT NULL default '',
  `dkim` tinyint(1) NOT NULL default '0',
  `dkim_id` int(11) unsigned NOT NULL default '0',
  `dkim_privkey` text,
  `dkim_pubkey` text,
  `wwwserveralias` tinyint(1) NOT NULL default '1',
  `parentdomainid` int(11) NOT NULL default '0',
  `phpenabled` tinyint(1) NOT NULL default '0',
  `openbasedir` tinyint(1) NOT NULL default '0',
  `openbasedir_path` tinyint(1) NOT NULL default '0',
  `speciallogfile` tinyint(1) NOT NULL default '0',
  `ssl_redirect` tinyint(4) NOT NULL default '0',
  `specialsettings` text,
  `ssl_specialsettings` text,
  `include_specialsettings` tinyint(1) NOT NULL default '0',
  `deactivated` tinyint(1) NOT NULL default '0',
  `bindserial` varchar(10) NOT NULL default '2000010100',
  `add_date` int( 11 ) NOT NULL default '0',
  `registration_date` date DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `phpsettingid` INT( 11 ) UNSIGNED NOT NULL DEFAULT '1',
  `mod_fcgid_starter` int(4) default '-1',
  `mod_fcgid_maxrequests` int(4) default '-1',
  `ismainbutsubto` int(11) unsigned NOT NULL default '0',
  `letsencrypt` tinyint(1) NOT NULL default '0',
  `hsts` varchar(10) NOT NULL default '0',
  `hsts_sub` tinyint(1) NOT NULL default '0',
  `hsts_preload` tinyint(1) NOT NULL default '0',
  `ocsp_stapling` tinyint(1) DEFAULT '0',
  `http2` tinyint(1) DEFAULT '0',
  `notryfiles` tinyint(1) DEFAULT '0',
  `writeaccesslog` tinyint(1) DEFAULT '1',
  `writeerrorlog` tinyint(1) DEFAULT '1',
  `override_tls` tinyint(1) DEFAULT '0',
  `ssl_protocols` text,
  `ssl_cipher_list` text,
  `tlsv13_cipher_list` text,
  `ssl_enabled` tinyint(1) DEFAULT '1',
  `ssl_honorcipherorder` tinyint(1) DEFAULT '0',
  `ssl_sessiontickets` tinyint(1) DEFAULT '1',
  PRIMARY KEY  (`id`),
  KEY `customerid` (`customerid`),
  KEY `parentdomain` (`parentdomainid`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `panel_ipsandports`;
CREATE TABLE `panel_ipsandports` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `ip` varchar(39) NOT NULL default '',
  `port` int(5) NOT NULL default '80',
  `listen_statement` tinyint(1) NOT NULL default '0',
  `namevirtualhost_statement` tinyint(1) NOT NULL default '0',
  `vhostcontainer` tinyint(1) NOT NULL default '0',
  `vhostcontainer_servername_statement` tinyint(1) NOT NULL default '0',
  `specialsettings` text,
  `ssl` tinyint(4) NOT NULL default '0',
  `ssl_cert_file` varchar(255) NOT NULL default '',
  `ssl_key_file` varchar(255) NOT NULL default '',
  `ssl_ca_file` varchar(255) NOT NULL default '',
  `default_vhostconf_domain` text,
  `ssl_cert_chainfile` varchar(255) NOT NULL default '',
  `docroot` varchar(255) NOT NULL default '',
  `ssl_specialsettings` text,
  `include_specialsettings` tinyint(1) NOT NULL default '0',
  `ssl_default_vhostconf_domain` text,
  `include_default_vhostconf_domain` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `ip_port` (`ip`,`port`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `panel_htaccess`;
CREATE TABLE `panel_htaccess` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `customerid` int(11) unsigned NOT NULL default '0',
  `path` varchar(255) NOT NULL default '',
  `options_indexes` tinyint(1) NOT NULL default '0',
  `error404path` varchar(255) NOT NULL default '',
  `error403path` varchar(255) NOT NULL default '',
  `error500path` varchar(255) NOT NULL default '',
  `error401path` varchar(255) NOT NULL default '',
  `options_cgi` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `panel_htpasswds`;
CREATE TABLE `panel_htpasswds` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `customerid` int(11) unsigned NOT NULL default '0',
  `path` varchar(255) NOT NULL default '',
  `username` varchar(255) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `authname` varchar(255) NOT NULL default 'Restricted Area',
  PRIMARY KEY  (`id`),
  KEY `customerid` (`customerid`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `panel_sessions`;
CREATE TABLE `panel_sessions` (
  `hash` varchar(32) NOT NULL default '',
  `userid` int(11) unsigned NOT NULL default '0',
  `ipaddress` varchar(255) NOT NULL default '',
  `useragent` varchar(255) NOT NULL default '',
  `lastactivity` int(11) unsigned NOT NULL default '0',
  `lastpaging` varchar(255) NOT NULL default '',
  `formtoken` char(32) NOT NULL default '',
  `language` varchar(64) NOT NULL default '',
  `adminsession` tinyint(1) unsigned NOT NULL default '0',
  `theme` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`hash`),
  KEY `userid` (`userid`)
) ENGINE=HEAP;



DROP TABLE IF EXISTS `panel_settings`;
CREATE TABLE `panel_settings` (
  `settingid` int(11) unsigned NOT NULL auto_increment,
  `settinggroup` varchar(255) NOT NULL default '',
  `varname` varchar(255) NOT NULL default '',
  `value` text NOT NULL,
  PRIMARY KEY  (`settingid`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `panel_settings` (`settinggroup`, `varname`, `value`) VALUES
	('catchall', 'catchall_enabled', '1'),
	('session', 'allow_multiple_login', '0'),
	('session', 'sessiontimeout', '600'),
	('customer', 'accountprefix', 'web'),
	('customer', 'ftpprefix', 'ftp'),
	('customer', 'mysqlprefix', 'sql'),
	('customer', 'ftpatdomain', '0'),
	('customer', 'show_news_feed', '0'),
	('customer', 'news_feed_url', ''),
	('logger', 'enabled', '1'),
	('logger', 'log_cron', '0'),
	('logger', 'logfile', ''),
	('logger', 'logtypes', 'syslog,mysql'),
	('logger', 'severity', '1'),
	('dkim', 'use_dkim', '0'),
	('dkim', 'dkim_prefix', '/etc/postfix/dkim/'),
	('dkim', 'dkim_domains', 'domains'),
	('dkim', 'dkim_dkimkeys', 'dkim-keys.conf'),
	('dkim', 'dkimrestart_command', '/etc/init.d/dkim-filter restart'),
	('admin', 'show_news_feed', '0'),
	('admin', 'show_version_login', '0'),
	('admin', 'show_version_footer', '0'),
	('caa', 'caa_entry', ''),
	('spf', 'use_spf', '0'),
	('spf', 'spf_entry', '"v=spf1 a mx -all"'),
	('dkim', 'dkim_algorithm', 'all'),
	('dkim', 'dkim_keylength', '1024'),
	('dkim', 'dkim_servicetype', '0'),
	('dkim', 'dkim_notes', ''),
	('defaultwebsrverrhandler', 'enabled', '0'),
	('defaultwebsrverrhandler', 'err401', ''),
	('defaultwebsrverrhandler', 'err403', ''),
	('defaultwebsrverrhandler', 'err404', ''),
	('defaultwebsrverrhandler', 'err500', ''),
	('customredirect', 'enabled', '1'),
	('customredirect', 'default', '1'),
	('perl', 'suexecworkaround', '0'),
	('perl', 'suexecpath', '/var/www/cgi-bin/'),
	('login', 'domain_login', '0'),
	('login', 'maxloginattempts', '3'),
	('login', 'deactivatetime', '900'),
	('phpfpm', 'enabled', '0'),
	('phpfpm', 'tmpdir', '/var/customers/tmp/'),
	('phpfpm', 'peardir', '/usr/share/php/:/usr/share/php5/'),
	('phpfpm', 'envpath', '/usr/local/bin:/usr/bin:/bin'),
	('phpfpm', 'enabled_ownvhost', '0'),
	('phpfpm', 'vhost_httpuser', 'froxlorlocal'),
	('phpfpm', 'vhost_httpgroup', 'froxlorlocal'),
	('phpfpm', 'aliasconfigdir', '/var/www/php-fpm/'),
	('phpfpm', 'defaultini', '1'),
	('phpfpm', 'vhost_defaultini', '2'),
	('phpfpm', 'fastcgi_ipcdir', '/var/lib/apache2/fastcgi/'),
	('phpfpm', 'use_mod_proxy', '1'),
	('phpfpm', 'ini_flags', 'asp_tags
display_errors
display_startup_errors
html_errors
log_errors
magic_quotes_gpc
magic_quotes_runtime
magic_quotes_sybase
mail.add_x_header
session.cookie_secure
session.use_cookies
short_open_tag
track_errors
xmlrpc_errors
suhosin.simulation
suhosin.session.encrypt
suhosin.session.cryptua
suhosin.session.cryptdocroot
suhosin.cookie.encrypt
suhosin.cookie.cryptua
suhosin.cookie.cryptdocroot
suhosin.executor.disable_eval
mbstring.func_overload'),
	('phpfpm', 'ini_values', 'auto_append_file
auto_prepend_file
date.timezone
default_charset
error_reporting
include_path
log_errors_max_len
mail.log
max_execution_time
session.cookie_domain
session.cookie_lifetime
session.cookie_path
session.name
session.serialize_handler
upload_max_filesize
xmlrpc_error_number
session.auto_start
always_populate_raw_post_data
suhosin.session.cryptkey
suhosin.session.cryptraddr
suhosin.session.checkraddr
suhosin.cookie.cryptkey
suhosin.cookie.plainlist
suhosin.cookie.cryptraddr
suhosin.cookie.checkraddr
suhosin.executor.func.blacklist
suhosin.executor.eval.whitelist'),
	('phpfpm', 'ini_admin_flags', 'allow_call_time_pass_reference
allow_url_fopen
allow_url_include
auto_detect_line_endings
cgi.fix_pathinfo
cgi.force_redirect
enable_dl
expose_php
file_uploads
ignore_repeated_errors
ignore_repeated_source
log_errors
register_argc_argv
report_memleaks
opcache.enable
opcache.consistency_checks
opcache.dups_fix
opcache.load_comments
opcache.revalidate_path
opcache.save_comments
opcache.use_cwd
opcache.validate_timestamps
opcache.fast_shutdown'),
	('phpfpm', 'ini_admin_values', 'cgi.redirect_status_env
date.timezone
disable_classes
disable_functions
error_log
gpc_order
max_input_time
max_input_vars
memory_limit
open_basedir
output_buffering
post_max_size
precision
sendmail_path
session.gc_divisor
session.gc_probability
variables_order
opcache.log_verbosity_level
opcache.restrict_api
opcache.revalidate_freq
opcache.max_accelerated_files
opcache.memory_consumption
opcache.interned_strings_buffer'),
	('nginx', 'fastcgiparams', '/etc/nginx/fastcgi_params'),
	('system', 'lastaccountnumber', '0'),
	('system', 'lastguid', '9999'),
	('system', 'documentroot_prefix', '/var/customers/webs/'),
	('system', 'logfiles_directory', '/var/customers/logs/'),
	('system', 'ipaddress', 'SERVERIP'),
	('system', 'apachereload_command', '/etc/init.d/apache2 reload'),
	('system', 'last_traffic_run', '000000'),
	('system', 'vmail_uid', '2000'),
	('system', 'vmail_gid', '2000'),
	('system', 'vmail_homedir', '/var/customers/mail/'),
	('system', 'vmail_maildirname', 'Maildir'),
	('system', 'bind_enable', '1'),
	('system', 'bindconf_directory', '/etc/bind/'),
	('system', 'bindreload_command', '/etc/init.d/bind9 reload'),
	('system', 'hostname', 'SERVERNAME'),
	('system', 'mysql_access_host', 'localhost'),
	('system', 'lastcronrun', ''),
	('system', 'defaultip', '1'),
	('system', 'defaultsslip', ''),
	('system', 'phpappendopenbasedir', '/tmp/'),
	('system', 'deactivateddocroot', ''),
	('system', 'mailpwcleartext', '0'),
	('system', 'last_tasks_run', '000000'),
	('system', 'nameservers', ''),
	('system', 'mxservers', ''),
	('system', 'mod_fcgid', '0'),
	('system', 'apacheconf_vhost', '/etc/apache2/sites-enabled/'),
	('system', 'apacheconf_diroptions', '/etc/apache2/sites-enabled/'),
	('system', 'apacheconf_htpasswddir', '/etc/apache2/htpasswd/'),
	('system', 'webalizer_quiet', '2'),
	('system', 'last_archive_run', '000000'),
	('system', 'mod_fcgid_configdir', '/var/www/php-fcgi-scripts'),
	('system', 'mod_fcgid_tmpdir', '/var/customers/tmp'),
	('system', 'ssl_cert_file', '/etc/apache2/apache2.pem'),
	('system', 'use_ssl', '0'),
	('system', 'default_vhostconf', ''),
	('system', 'mail_quota_enabled', '0'),
	('system', 'mail_quota', '100'),
	('system', 'webalizer_enabled', '1'),
	('system', 'awstats_enabled', '0'),
	('system', 'httpuser', 'www-data'),
	('system', 'httpgroup', 'www-data'),
	('system', 'webserver', 'apache2'),
	('system', 'mod_fcgid_wrapper', '1'),
	('system', 'mod_fcgid_starter', '0'),
	('system', 'mod_fcgid_peardir', '/usr/share/php/:/usr/share/php5/'),
	('system', 'index_file_extension', 'html'),
	('system', 'mod_fcgid_maxrequests', '250'),
	('system', 'ssl_key_file','/etc/apache2/apache2.key'),
	('system', 'ssl_ca_file', ''),
	('system', 'debug_cron', '0'),
	('system', 'store_index_file_subs', '1'),
	('system', 'stdsubdomain', ''),
	('system', 'awstats_path', '/usr/bin/'),
	('system', 'awstats_conf', '/etc/awstats/'),
	('system', 'awstats_logformat', '1'),
	('system', 'defaultttl', '604800'),
	('system', 'mod_fcgid_defaultini', '1'),
	('system', 'ftpserver', 'proftpd'),
	('system', 'dns_createmailentry', '0'),
	('system', 'dns_createcaaentry', '1'),
	('system', 'froxlordirectlyviahostname', '0'),
	('system', 'report_enable', '1'),
	('system', 'report_webmax', '90'),
	('system', 'report_trafficmax', '90'),
	('system', 'validate_domain', '1'),
	('system', 'diskquota_enabled', '0'),
	('system', 'diskquota_repquota_path', '/usr/sbin/repquota'),
	('system', 'diskquota_quotatool_path', '/usr/bin/quotatool'),
	('system', 'diskquota_customer_partition', '/dev/root'),
	('system', 'mod_fcgid_idle_timeout', '30'),
	('system', 'perl_path', '/usr/bin/perl'),
	('system', 'mod_fcgid_ownvhost', '0'),
	('system', 'mod_fcgid_httpuser', 'froxlorlocal'),
	('system', 'mod_fcgid_httpgroup', 'froxlorlocal'),
	('system', 'awstats_awstatspath', '/usr/bin/'),
	('system', 'mod_fcgid_defaultini_ownvhost', '2'),
	('system', 'awstats_icons', '/usr/share/awstats/icon/'),
	('system', 'ssl_cert_chainfile', ''),
	('system', 'ssl_cipher_list', 'ECDH+AESGCM:ECDH+AES256:!aNULL:!MD5:!DSS:!DH:!AES128'),
	('system', 'nginx_php_backend', '127.0.0.1:8888'),
	('system', 'http2_support', '0'),
	('system', 'perl_server', 'unix:/var/run/nginx/cgiwrap-dispatch.sock'),
	('system', 'phpreload_command', ''),
	('system', 'apache24', '1'),
	('system', 'apache24_ocsp_cache_path', 'shmcb:/var/run/apache2/ocsp-stapling.cache(131072)'),
	('system', 'documentroot_use_default_value', '0'),
	('system', 'passwordcryptfunc', '3'),
	('system', 'axfrservers', ''),
	('system', 'customer_ssl_path', '/etc/ssl/froxlor-custom/'),
	('system', 'allow_error_report_admin', '1'),
	('system', 'allow_error_report_customer', '0'),
	('system', 'mdalog', '/var/log/mail.log'),
	('system', 'mtalog', '/var/log/mail.log'),
	('system', 'mdaserver', 'dovecot'),
	('system', 'mtaserver', 'postfix'),
	('system', 'mailtraffic_enabled', '1'),
	('system', 'cronconfig', '/etc/cron.d/froxlor'),
	('system', 'crondreload', '/etc/init.d/cron reload'),
	('system', 'croncmdline', '/usr/bin/nice -n 5 /usr/bin/php -q'),
	('system', 'cron_allowautoupdate', '0'),
	('system', 'dns_createhostnameentry', '0'),
	('system', 'send_cron_errors', '0'),
	('system', 'apacheitksupport', '0'),
	('system', 'leprivatekey', 'unset'),
	('system', 'lepublickey', 'unset'),
	('system', 'letsencryptca', 'production'),
	('system', 'letsencryptcountrycode', 'DE'),
	('system', 'letsencryptstate', 'Hessen'),
	('system', 'letsencryptchallengepath', '/var/www/froxlor'),
	('system', 'letsencryptkeysize', '4096'),
	('system', 'letsencryptreuseold', 0),
	('system', 'leenabled', '0'),
	('system', 'leapiversion', '2'),
	('system', 'backupenabled', '0'),
	('system', 'dnsenabled', '0'),
	('system', 'dns_server', 'Bind'),
	('system', 'apacheglobaldiropt', ''),
	('system', 'allow_customer_shell', '0'),
	('system', 'available_shells', ''),
	('system', 'le_froxlor_enabled', '0'),
	('system', 'le_froxlor_redirect', '0'),
	('system', 'letsencryptacmeconf', '/etc/apache2/conf-enabled/acme.conf'),
	('system', 'mail_use_smtp', '0'),
	('system', 'mail_smtp_host', 'localhost'),
	('system', 'mail_smtp_port', '25'),
	('system', 'mail_smtp_usetls', '1'),
	('system', 'mail_smtp_auth', '1'),
	('system', 'mail_smtp_user', ''),
	('system', 'mail_smtp_passwd', ''),
	('system', 'hsts_maxage', '0'),
	('system', 'hsts_incsub', '0'),
	('system', 'hsts_preload', '0'),
	('system', 'leregistered', '0'),
	('system', 'leaccount', ''),
	('system', 'nssextrausers', '0'),
	('system', 'disable_le_selfcheck', '0'),
	('system', 'ssl_protocols', 'TLSv1,TLSv1.2'),
	('system', 'tlsv13_cipher_list', ''),
	('system', 'honorcipherorder', '0'),
	('system', 'sessiontickets', '1'),
	('system', 'sessionticketsenabled', '1'),
	('system', 'logfiles_format', ''),
	('system', 'logfiles_type', '1'),
	('system', 'logfiles_piped', '0'),
	('system', 'logfiles_script', ''),
	('system', 'dhparams_file', ''),
	('system', 'errorlog_level', 'warn'),
	('system', 'leecc', '0'),
	('system', 'froxloraliases', ''),
	('system', 'apply_specialsettings_default', '1'),
	('system', 'apply_phpconfigs_default', '1'),
	('api', 'enabled', '0'),
	('2fa', 'enabled', '1'),
	('panel', 'decimal_places', '4'),
	('panel', 'adminmail', 'admin@SERVERNAME'),
	('panel', 'phpmyadmin_url', ''),
	('panel', 'webmail_url', ''),
	('panel', 'webftp_url', ''),
	('panel', 'standardlanguage', 'English'),
	('panel', 'pathedit', 'Manual'),
	('panel', 'paging', '20'),
	('panel', 'natsorting', '1'),
	('panel', 'sendalternativemail', '0'),
	('panel', 'no_robots', '1'),
	('panel', 'allow_domain_change_admin', '0'),
	('panel', 'allow_domain_change_customer', '0'),
	('panel', 'frontend', 'froxlor'),
	('panel', 'default_theme', 'Sparkle'),
	('panel', 'password_min_length', '0'),
	('panel', 'adminmail_defname', 'Froxlor Administrator'),
	('panel', 'adminmail_return', ''),
	('panel', 'unix_names', '1'),
	('panel', 'allow_preset', '1'),
	('panel', 'allow_preset_admin', '0'),
	('panel', 'password_regex', ''),
	('panel', 'phpconfigs_hidestdsubdomain', '0'),
	('panel', 'allow_theme_change_admin', '1'),
	('panel', 'allow_theme_change_customer', '1'),
	('panel', 'password_alpha_lower', '1'),
	('panel', 'password_alpha_upper', '1'),
	('panel', 'password_numeric', '0'),
	('panel', 'password_special_char_required', '0'),
	('panel', 'password_special_char', '!?<>§$%+#=@'),
	('panel', 'customer_hide_options', ''),
	('panel', 'is_configured', '0'),
	('panel', 'version', '0.10.12'),
	('panel', 'db_version', '201912313');


DROP TABLE IF EXISTS `panel_tasks`;
CREATE TABLE `panel_tasks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `type` int(11) NOT NULL default '0',
  `data` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `panel_tasks` (`type`) VALUES ('99');


DROP TABLE IF EXISTS `panel_templates`;
CREATE TABLE `panel_templates` (
  `id` int(11) NOT NULL auto_increment,
  `adminid` int(11) NOT NULL default '0',
  `language` varchar(255) NOT NULL default '',
  `templategroup` varchar(255) NOT NULL default '',
  `varname` varchar(255) NOT NULL default '',
  `value` longtext NOT NULL,
  PRIMARY KEY  (id),
  KEY adminid (adminid)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `panel_traffic`;
CREATE TABLE `panel_traffic` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `customerid` int(11) unsigned NOT NULL default '0',
  `year` int(4) unsigned zerofill NOT NULL default '0000',
  `month` int(2) unsigned zerofill NOT NULL default '00',
  `day` int(2) unsigned zerofill NOT NULL default '00',
  `stamp` int(11) unsigned NOT NULL default '0',
  `http` bigint(30) unsigned NOT NULL default '0',
  `ftp_up` bigint(30) unsigned NOT NULL default '0',
  `ftp_down` bigint(30) unsigned NOT NULL default '0',
  `mail` bigint(30) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `customerid` (`customerid`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `panel_traffic_admins`;
CREATE TABLE `panel_traffic_admins` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `adminid` int(11) unsigned NOT NULL default '0',
  `year` int(4) unsigned zerofill NOT NULL default '0000',
  `month` int(2) unsigned zerofill NOT NULL default '00',
  `day` int(2) unsigned zerofill NOT NULL default '00',
  `stamp` int(11) unsigned NOT NULL default '0',
  `http` bigint(30) unsigned NOT NULL default '0',
  `ftp_up` bigint(30) unsigned NOT NULL default '0',
  `ftp_down` bigint(30) unsigned NOT NULL default '0',
  `mail` bigint(30) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `adminid` (`adminid`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `panel_diskspace`;
CREATE TABLE `panel_diskspace` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `customerid` int(11) unsigned NOT NULL default '0',
  `year` int(4) unsigned zerofill NOT NULL default '0000',
  `month` int(2) unsigned zerofill NOT NULL default '00',
  `day` int(2) unsigned zerofill NOT NULL default '00',
  `stamp` int(11) unsigned NOT NULL default '0',
  `webspace` bigint(30) unsigned NOT NULL default '0',
  `mail` bigint(30) unsigned NOT NULL default '0',
  `mysql` bigint(30) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `customerid` (`customerid`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `panel_diskspace_admins`;
CREATE TABLE `panel_diskspace_admins` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `adminid` int(11) unsigned NOT NULL default '0',
  `year` int(4) unsigned zerofill NOT NULL default '0000',
  `month` int(2) unsigned zerofill NOT NULL default '00',
  `day` int(2) unsigned zerofill NOT NULL default '00',
  `stamp` int(11) unsigned NOT NULL default '0',
  `webspace` bigint(30) unsigned NOT NULL default '0',
  `mail` bigint(30) unsigned NOT NULL default '0',
  `mysql` bigint(30) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `adminid` (`adminid`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `panel_languages`;
CREATE TABLE `panel_languages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(30) NOT NULL DEFAULT '',
  `iso` char(3) NOT NULL DEFAULT 'foo',
  `file` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO `panel_languages` (`id`, `language`, `iso`, `file`) VALUES
    (1, 'Deutsch', 'de', 'lng/german.lng.php'),
    (2, 'English', 'en', 'lng/english.lng.php'),
    (3, 'Fran&ccedil;ais', 'fr', 'lng/french.lng.php'),
    (4, 'Portugu&ecirc;s', 'pt', 'lng/portugues.lng.php'),
    (5, 'Italiano', 'it', 'lng/italian.lng.php'),
    (6, 'Nederlands', 'nl', 'lng/dutch.lng.php'),
    (7, 'Svenska', 'sv', 'lng/swedish.lng.php');


DROP TABLE IF EXISTS `panel_syslog`;
CREATE TABLE IF NOT EXISTS `panel_syslog` (
  `logid` bigint(20) NOT NULL auto_increment,
  `action` int(5) NOT NULL default '10',
  `type` int(5) NOT NULL default '0',
  `date` int(15) NOT NULL,
  `user` varchar(50) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY  (`logid`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `panel_fpmdaemons`;
CREATE TABLE `panel_fpmdaemons` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `description` varchar(50) NOT NULL,
  `reload_cmd` varchar(255) NOT NULL,
  `config_dir` varchar(255) NOT NULL,
  `pm` varchar(15) NOT NULL DEFAULT 'static',
  `max_children` int(4) NOT NULL DEFAULT '1',
  `start_servers` int(4) NOT NULL DEFAULT '20',
  `min_spare_servers` int(4) NOT NULL DEFAULT '5',
  `max_spare_servers` int(4) NOT NULL DEFAULT '35',
  `max_requests` int(4) NOT NULL DEFAULT '0',
  `idle_timeout` int(4) NOT NULL DEFAULT '30',
  `limit_extensions` varchar(255) NOT NULL default '.php',
  `custom_config` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `reload` (`reload_cmd`),
  UNIQUE KEY `config` (`config_dir`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO `panel_fpmdaemons` (`id`, `description`, `reload_cmd`, `config_dir`) VALUES
(1, 'System default', 'service php7.0-fpm restart', '/etc/php/7.0/fpm/pool.d/');



DROP TABLE IF EXISTS `panel_phpconfigs`;
CREATE TABLE `panel_phpconfigs` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `description` varchar(50) NOT NULL,
  `binary` varchar(255) NOT NULL,
  `file_extensions` varchar(255) NOT NULL,
  `mod_fcgid_starter` int(4) NOT NULL DEFAULT '-1',
  `mod_fcgid_maxrequests` int(4) NOT NULL DEFAULT '-1',
  `mod_fcgid_umask` varchar(15) NOT NULL DEFAULT '022',
  `fpm_slowlog` tinyint(1) NOT NULL default '0',
  `fpm_reqterm` varchar(15) NOT NULL default '60s',
  `fpm_reqslow` varchar(15) NOT NULL default '5s',
  `phpsettings` text NOT NULL,
  `fpmsettingid` int(11) NOT NULL DEFAULT '1',
  `pass_authorizationheader` tinyint(1) NOT NULL default '0',
  `override_fpmconfig` tinyint(1) NOT NULL DEFAULT '0',
  `pm` varchar(15) NOT NULL DEFAULT 'static',
  `max_children` int(4) NOT NULL DEFAULT '1',
  `start_servers` int(4) NOT NULL DEFAULT '20',
  `min_spare_servers` int(4) NOT NULL DEFAULT '5',
  `max_spare_servers` int(4) NOT NULL DEFAULT '35',
  `max_requests` int(4) NOT NULL DEFAULT '0',
  `idle_timeout` int(4) NOT NULL DEFAULT '30',
  `limit_extensions` varchar(255) NOT NULL default '.php',
  PRIMARY KEY  (`id`),
  KEY `fpmsettingid` (`fpmsettingid`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO `panel_phpconfigs` (`id`, `description`, `binary`, `file_extensions`, `mod_fcgid_starter`, `mod_fcgid_maxrequests`, `phpsettings`) VALUES
(1, 'Default Config', '/usr/bin/php-cgi', 'php', '-1', '-1', 'allow_call_time_pass_reference = Off\r\nallow_url_fopen = Off\r\nasp_tags = Off\r\ndisable_classes =\r\ndisable_functions = curl_exec,curl_multi_exec,exec,parse_ini_file,passthru,popen,proc_close,proc_get_status,proc_nice,proc_open,proc_terminate,shell_exec,show_source,system\r\ndisplay_errors = Off\r\ndisplay_startup_errors = Off\r\nenable_dl = Off\r\nerror_reporting = E_ALL & ~E_NOTICE\r\nexpose_php = Off\r\nfile_uploads = On\r\ncgi.force_redirect = 1\r\ngpc_order = "GPC"\r\nhtml_errors = Off\r\nignore_repeated_errors = Off\r\nignore_repeated_source = Off\r\ninclude_path = ".:{PEAR_DIR}"\r\nlog_errors = On\r\nlog_errors_max_len = 1024\r\nmagic_quotes_gpc = Off\r\nmagic_quotes_runtime = Off\r\nmagic_quotes_sybase = Off\r\nmax_execution_time = 30\r\nmax_input_time = 60\r\nmemory_limit = 128M\r\n{OPEN_BASEDIR_C}open_basedir = "{OPEN_BASEDIR}"\r\noutput_buffering = 4096\r\npost_max_size = 16M\r\nprecision = 14\r\nregister_argc_argv = Off\r\nregister_globals = Off\r\nreport_memleaks = On\r\nsendmail_path = "/usr/sbin/sendmail -t -i -f {CUSTOMER_EMAIL}"\r\nsession.auto_start = 0\r\nsession.bug_compat_42 = 0\r\nsession.bug_compat_warn = 1\r\nsession.cache_expire = 180\r\nsession.cache_limiter = nocache\r\nsession.cookie_domain =\r\nsession.cookie_lifetime = 0\r\nsession.cookie_path = /\r\nsession.entropy_file = /dev/urandom\r\nsession.entropy_length = 16\r\nsession.gc_divisor = 1000\r\nsession.gc_maxlifetime = 1440\r\nsession.gc_probability = 1\r\nsession.name = PHPSESSID\r\nsession.referer_check =\r\nsession.save_handler = files\r\nsession.save_path = "{TMP_DIR}"\r\nsession.serialize_handler = php\r\nsession.use_cookies = 1\r\nsession.use_trans_sid = 0\r\nshort_open_tag = On\r\nsuhosin.mail.protect = 1\r\nsuhosin.simulation = Off\r\ntrack_errors = Off\r\nupload_max_filesize = 32M\r\nupload_tmp_dir = "{TMP_DIR}"\r\nvariables_order = "GPCS"\r\n;mail.add_x_header = On\r\n;mail.log = "/var/log/phpmail.log"\r\nopcache.restrict_api = "{DOCUMENT_ROOT}"\r\n'),
(2, 'Froxlor Vhost Config', '/usr/bin/php-cgi', 'php', '-1', '-1', 'allow_call_time_pass_reference = Off\r\nallow_url_fopen = On\r\nasp_tags = Off\r\ndisable_classes =\r\ndisable_functions = curl_multi_exec,parse_ini_file,passthru,popen,proc_close,proc_get_status,proc_nice,proc_open,proc_terminate,shell_exec,show_source,system\r\ndisplay_errors = Off\r\ndisplay_startup_errors = Off\r\nenable_dl = Off\r\nerror_reporting = E_ALL & ~E_NOTICE\r\nexpose_php = Off\r\nfile_uploads = On\r\ncgi.force_redirect = 1\r\ngpc_order = "GPC"\r\nhtml_errors = Off\r\nignore_repeated_errors = Off\r\nignore_repeated_source = Off\r\ninclude_path = ".:{PEAR_DIR}"\r\nlog_errors = On\r\nlog_errors_max_len = 1024\r\nmagic_quotes_gpc = Off\r\nmagic_quotes_runtime = Off\r\nmagic_quotes_sybase = Off\r\nmax_execution_time = 60\r\nmax_input_time = 60\r\nmemory_limit = 128M\r\noutput_buffering = 4096\r\npost_max_size = 16M\r\nprecision = 14\r\nregister_argc_argv = Off\r\nregister_globals = Off\r\nreport_memleaks = On\r\nsendmail_path = "/usr/sbin/sendmail -t -i -f {CUSTOMER_EMAIL}"\r\nsession.auto_start = 0\r\nsession.bug_compat_42 = 0\r\nsession.bug_compat_warn = 1\r\nsession.cache_expire = 180\r\nsession.cache_limiter = nocache\r\nsession.cookie_domain =\r\nsession.cookie_lifetime = 0\r\nsession.cookie_path = /\r\nsession.entropy_file = /dev/urandom\r\nsession.entropy_length = 16\r\nsession.gc_divisor = 1000\r\nsession.gc_maxlifetime = 1440\r\nsession.gc_probability = 1\r\nsession.name = PHPSESSID\r\nsession.referer_check =\r\nsession.save_handler = files\r\nsession.save_path = "{TMP_DIR}"\r\nsession.serialize_handler = php\r\nsession.use_cookies = 1\r\nsession.use_trans_sid = 0\r\nshort_open_tag = On\r\nsuhosin.mail.protect = 1\r\nsuhosin.simulation = Off\r\ntrack_errors = Off\r\nupload_max_filesize = 32M\r\nupload_tmp_dir = "{TMP_DIR}"\r\nvariables_order = "GPCS"\r\n;mail.add_x_header = On\r\n;mail.log = "/var/log/phpmail.log"\r\nopcache.restrict_api = ""\r\n');


DROP TABLE IF EXISTS `cronjobs_run`;
CREATE TABLE IF NOT EXISTS `cronjobs_run` (
  `id` bigint(20) NOT NULL auto_increment,
  `module` varchar(250) NOT NULL,
  `cronfile` varchar(250) NOT NULL,
  `cronclass` varchar(500) NOT NULL,
  `lastrun` int(15) NOT NULL DEFAULT '0',
  `interval` varchar(100) NOT NULL DEFAULT '5 MINUTE',
  `isactive` tinyint(1) DEFAULT '1',
  `desc_lng_key` varchar(100) NOT NULL DEFAULT 'cron_unknown_desc',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO `cronjobs_run` (`id`, `module`, `cronfile`, `cronclass`, `interval`, `isactive`, `desc_lng_key`) VALUES
	(1, 'froxlor/core', 'tasks', '\\Froxlor\\Cron\\System\\TasksCron', '5 MINUTE', '1', 'cron_tasks'),
	(2, 'froxlor/core', 'traffic', '\\Froxlor\\Cron\\Traffic\\TrafficCron', '1 DAY', '1', 'cron_traffic'),
	(3, 'froxlor/reports', 'usage_report', '\\Froxlor\\Cron\\Traffic\\ReportsCron', '1 DAY', '1', 'cron_usage_report'),
	(4, 'froxlor/core', 'mailboxsize', '\\Froxlor\\Cron\\System\\MailboxsizeCron', '6 HOUR', '1', 'cron_mailboxsize'),
	(5, 'froxlor/letsencrypt', 'letsencrypt', '\\Froxlor\\Cron\\Http\\LetsEncrypt\\AcmeSh', '5 MINUTE', '0', 'cron_letsencrypt'),
	(6, 'froxlor/backup', 'backup', '\\Froxlor\\Cron\\System\\BackupCron', '1 DAY', '1', 'cron_backup');



DROP TABLE IF EXISTS `ftp_quotalimits`;
CREATE TABLE IF NOT EXISTS `ftp_quotalimits` (
  `name` varchar(30) default NULL,
  `quota_type` enum('user','group','class','all') NOT NULL default 'user',
  `per_session` enum('false','true') NOT NULL default 'false',
  `limit_type` enum('soft','hard') NOT NULL default 'hard',
  `bytes_in_avail` float NOT NULL,
  `bytes_out_avail` float NOT NULL,
  `bytes_xfer_avail` float NOT NULL,
  `files_in_avail` int(10) unsigned NOT NULL,
  `files_out_avail` int(10) unsigned NOT NULL,
  `files_xfer_avail` int(10) unsigned NOT NULL
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO `ftp_quotalimits` (`name`, `quota_type`, `per_session`, `limit_type`, `bytes_in_avail`, `bytes_out_avail`, `bytes_xfer_avail`, `files_in_avail`, `files_out_avail`, `files_xfer_avail`) VALUES 
	('froxlor', 'user', 'false', 'hard', 0, 0, 0, 0, 0, 0);



DROP TABLE IF EXISTS `ftp_quotatallies`;
CREATE TABLE IF NOT EXISTS `ftp_quotatallies` (
  `name` varchar(30) NOT NULL,
  `quota_type` enum('user','group','class','all') NOT NULL,
  `bytes_in_used` float NOT NULL,
  `bytes_out_used` float NOT NULL,
  `bytes_xfer_used` float NOT NULL,
  `files_in_used` int(10) unsigned NOT NULL,
  `files_out_used` int(10) unsigned NOT NULL,
  `files_xfer_used` int(10) unsigned NOT NULL
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



DROP TABLE IF EXISTS `redirect_codes`;
CREATE TABLE IF NOT EXISTS `redirect_codes` (
  `id` int(5) NOT NULL auto_increment,
  `code` varchar(3) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO `redirect_codes` (`id`, `code`, `desc`, `enabled`) VALUES
	(1, '---', 'rc_default', 1),
	(2, '301', 'rc_movedperm', 1),
	(3, '302', 'rc_found', 1),
	(4, '303', 'rc_seeother', 1),
	(5, '307', 'rc_tempred', 1);



DROP TABLE IF EXISTS `domain_redirect_codes`;
CREATE TABLE IF NOT EXISTS `domain_redirect_codes` (
  `rid` int(5) NOT NULL,
  `did` int(11) unsigned NOT NULL,
  UNIQUE KEY `rc` (`rid`, `did`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;


DROP TABLE IF EXISTS `domain_ssl_settings`;
CREATE TABLE IF NOT EXISTS `domain_ssl_settings` (
  `id` int(5) NOT NULL auto_increment,
  `domainid` int(11) NOT NULL,
  `ssl_cert_file` mediumtext,
  `ssl_key_file` mediumtext,
  `ssl_ca_file` mediumtext,
  `ssl_cert_chainfile` mediumtext,
  `ssl_csr_file` mediumtext,
  `ssl_fullchain_file` mediumtext,
  `expirationdate` datetime DEFAULT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;


DROP TABLE IF EXISTS `panel_domaintoip`;
CREATE TABLE IF NOT EXISTS `panel_domaintoip` (
  `id_domain` int(11) unsigned NOT NULL,
  `id_ipandports` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_domain`,`id_ipandports`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;


DROP TABLE IF EXISTS `domain_dns_entries`;
CREATE TABLE `domain_dns_entries` (
  `id` int(20) NOT NULL auto_increment,
  `domain_id` int(15) NOT NULL,
  `record` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'A',
  `content` text NOT NULL,
  `ttl` int(11) NOT NULL DEFAULT '18000',
  `prio` int(11) DEFAULT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;


DROP TABLE IF EXISTS `panel_plans`;
CREATE TABLE `panel_plans` (
  `id` int(11) NOT NULL auto_increment,
  `adminid` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `value` longtext NOT NULL,
  `ts` int(15) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY adminid (adminid)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;


DROP TABLE IF EXISTS `api_keys`;
CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL auto_increment,
  `adminid` int(11) NOT NULL default '0',
  `customerid` int(11) NOT NULL default '0',
  `apikey` varchar(500) NOT NULL default '',
  `secret` varchar(500) NOT NULL default '',
  `allowed_from` text NOT NULL,
  `valid_until` int(15) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY adminid (adminid),
  KEY customerid (customerid)
) ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;

