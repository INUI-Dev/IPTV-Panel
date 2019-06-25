<?php

// Author : Paul Moore
// Project : In2streams.co Video CMS
include('../config/config.php');

include('../functions/db.php');
include('../functions/settings.php');

$get_query = new setup;
$db1 = new db;
$db1->connect();
$content['user'] = $db1->db_query("SELECT * FROM `users` where role='Admin' and  `uname`='".htmlspecialchars($_GET['user'])."'",array ('pword'),100000,0);


if($_GET['pass'] != $content['user'][0]['pword'])
{
	echo ' incorrect user or password';
	exit;
}
if(isset($_GET['line']) and isset($_GET['type']) && $_GET['type'] == 'live')
	{
		$content['streams'] = $db1->db_query("SELECT * FROM `ministra_streams` where type='live'",array ('code'),100000,0);
	
	}
	elseif(isset($_GET['type']) && $_GET['type'] == 'vod')
	{
		$content['streams'] = $db1->db_query("SELECT * FROM `ministra_streams` where type='vod'",array ('code'),100000,0);
	}

if($content['streams'][0]['is_empty']  != 'true')
{
header("Content-Type: audio/mpegurl;");
	echo '#EXTM3U
	';
	$int1 = 0;
foreach ($content['streams'] as $items){
	
	echo str_replace('-user','&ministra',str_replace('-1','0',$items['code']));

}
}

 ?>