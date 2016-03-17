<?php
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Kaplan Plugin block
 *
 * @package   block_kaplan_plugin
 */

$functions = array(
    'block_kaplan_plugin_get_users_custom' => array(
        'classname'   => 'block_kaplan_plugin_external',
        'methodname'  => 'get_users_custom',
        'classpath'   => 'blocks/kaplan_plugin/externallib.php',
        'description' => 'Custom Function to get users details',
        'type'        => 'read',
        'ajax'        => true
    ),
    'block_kaplan_plugin_get_courses_custom' => array(
        'classname'   => 'block_kaplan_plugin_external',
        'methodname'  => 'get_courses_custom',
        'classpath'   => 'blocks/kaplan_plugin/externallib.php',
        'description' => 'Custom Function to get courses details',
        'type'        => 'read',
        'ajax'        => true
    )
);

$services = array(
    'Custom Users and Courses Functions' => array(
        'functions' => array ('block_kaplan_plugin_get_users_custom', 'block_kaplan_plugin_get_courses_custom'),
        'restrictedusers' => 0,
        'enabled'=>1,
        'shortname'=>'get_users_courses_custom'
    )
);