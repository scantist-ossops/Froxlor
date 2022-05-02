<?php

/**
 * This file is part of the Froxlor project.
 * Copyright (c) 2010 the Froxlor Team (see authors).
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, you can also view it online at
 * https://files.froxlor.org/misc/COPYING.txt
 *
 * @copyright  the authors
 * @author     Froxlor team <team@froxlor.org>
 * @license    https://files.froxlor.org/misc/COPYING.txt GPLv2
 */

use Froxlor\Froxlor;

return [
	'install' => [
		'title' => 'install',
		'sections' => [
			'step1' => [
				'title' => lng('install.database.title'),
				'fields' => [
					'mysql_host' => [
						'label' => lng('mysql.mysql_server'),
						'type' => 'text',
						'mandatory' => true,
						'value' => old('mysql_host', 'localhost', 'installation')
					],
					'mysql_root_user' => [
						'label' => lng('mysql.privileged_user'),
						'type' => 'text',
						'mandatory' => true,
						'value' => old('mysql_root_user', 'froxroot', 'installation'),
						'next_to' => [
							'mysql_root_pass' => [
								'label' => lng('login.password'),
								'type' => 'password',
								'mandatory' => true,
								'value' => old('mysql_root_pass', null, 'installation'),
							],
						]
					],
					'mysql_unprivileged_user' => [
						'label' => lng('install.database.user'),
						'type' => 'text',
						'mandatory' => true,
						'value' => old('mysql_unprivileged_user', 'froxlor', 'installation'),
						'next_to' => [
							'mysql_unprivileged_pass' => [
								'label' => lng('login.password'),
								'type' => 'password',
								'mandatory' => true,
								'value' => old('mysql_unprivileged_pass', null, 'installation'),
							],
						]
					],
					'mysql_database' => [
						'label' => lng('install.database.dbname'),
						'type' => 'text',
						'mandatory' => true,
						'value' => old('mysql_database', 'froxlor', 'installation'),
					],
					'mysql_force_create' => [
						'label' => lng('install.database.force_create'),
						'type' => 'checkbox',
						'value' => '1',
						'checked' => old('mysql_force_create', '0', 'installation')
					],
				]
			],
			'step2' => [
				'title' => lng('install.admin.title'),
				'fields' => [
					'admin_name' => [
						'label' => lng('customer.name'),
						'type' => 'text',
						'mandatory' => true,
						'value' => old('admin_name', 'Administrator', 'installation'),
					],
					'admin_user' => [
						'label' => lng('login.username'),
						'type' => 'text',
						'mandatory' => true,
						'value' => old('admin_user', 'admin', 'installation'),
					],
					'admin_pass' => [
						'label' => lng('login.password'),
						'type' => 'password',
						'mandatory' => true,
						'value' => old('admin_pass', null, 'installation'),
					],
					'admin_email' => [
						'label' => lng('customer.email'),
						'type' => 'text',
						'mandatory' => true,
						'value' => old('admin_email', null, 'installation'),
					],
				]
			],
			'step3' => [
				'title' => lng('install.system.title'),
				'fields' => [
					'distribution' => [
						'label' => lng('admin.configfiles.distribution'),
						'type' => 'select',
						'mandatory' => true,
						'select_var' => $this->supportedOS,
					],
					'serverip' => [
						'label' => lng('serversettings.ipaddress.title'),
						'type' => 'text',
						'mandatory' => true,
						'value' => old('serverip', null, 'installation'),
					],
					'servername' => [
						'label' => lng('install.system.servername'),
						'type' => 'text',
						'mandatory' => true,
						'value' => old('servername', null, 'installation'),
					],
					'use_ssl' => [
						'label' => lng('serversettings.ssl.use_ssl.title'),
						'type' => 'checkbox',
						'value' => '1',
						'checked' => old('use_ssl', '1', 'installation'),
					],
					'webserver' => [
						'label' => lng('admin.webserver'),
						'type' => 'select',
						'mandatory' => true,
						'select_var' => ['apache24' => 'Apache 2.4', 'nginx' => 'Nginx', 'lighttpd' => 'LigHTTPd'],
						'value' => old('webserver', 'apache24', 'installation'),
					],
					'webserver_backend' => [
						'label' => lng('install.system.phpbackend'),
						'type' => 'select',
						'mandatory' => true,
						'select_var' => $this->webserverBackend,
					],
					'httpuser' => [
						'label' => lng('admin.webserver_user'),
						'type' => 'text',
						'mandatory' => true,
						'value' => old('httpuser', 'www-data', 'installation'),
					],
					'httpgroup' => [
						'label' => lng('admin.webserver_group'),
						'type' => 'text',
						'mandatory' => true,
						'value' => old('httpgroup', 'www-data', 'installation'),
					],
					'activate_newsfeed' => [
						'label' => lng('install.system.activate_newsfeed'),
						'type' => 'checkbox',
						'value' => '1',
						'checked' => false
					],
				]
			],
			'step4' => [
				'title' => lng('install.system.title'),
				'fields' => [
					'system' => [
						'label' => lng('install.install.runcmd'),
						'type' => 'textarea',
						'value' => Froxlor::getInstallDir().'bin/froxlor-cli froxlor:config-services -a [JSON PARAMETER] --yes-to-all',
						'readonly' => true,
						'rows' => 1
					],
				]
			]
		]
	]
];
