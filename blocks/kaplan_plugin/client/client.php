<?php

/**
 * Kaplan Plugin block
 *
 * @package   block_kaplan_plugin
 */

$token = 'f9a0febc6002fed26a356315f701de14';
$domainname = 'http://localhost/moodle';
$serverurl = $domainname . '/webservice/xmlrpc/server.php'. '?wstoken=' . $token;
require_once('./curl.php');
$curl = new curl;
header('Content-Type: text/plain');

$functionname = 'block_kaplan_plugin_get_users_custom';
$post = xmlrpc_encode_request($functionname,array());
$resp1 = xmlrpc_decode($curl->post($serverurl, $post));

$functionname = 'block_kaplan_plugin_get_courses_custom';
$post = xmlrpc_encode_request($functionname, array());
$resp2 = xmlrpc_decode($curl->post($serverurl, $post));

print_r(json_encode(array('get_users_custom'=>$resp1,'get_courses_custom'=>$resp2)));
