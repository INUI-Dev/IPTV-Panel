<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
// Author : Paul Moore
// Project : in2music.co Video CMS
date_default_timezone_set('Europe/London');



//include some important Files...
require_once('../config/config.php');
include('../functions/db.php');

$db1 = new db;
$db1->connect();
require_once('../libs/Smarty.class.php');
require_once('functions/admin.php');
restrict();


@$content['mac'] = $db1->db_query("SELECT * FROM `video_series_files`",array (
    "url"
),500,0);
print_r($content['mac']);
?>