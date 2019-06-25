<?php

// Author : Paul Moore
// Project : In2streams.co Video CMS
include('config/config.php');

include('functions/db.php');
include('functions/settings.php');

$get_query = new setup;
$db1 = new db;
$db1->connect();

if(isset($_GET['user']))
{
header("Content-Type: audio/mpegurl");
@$content['users_db'] = $db1->db_query("SELECT * FROM users_db where email=".$db1->GetSQLValueString($_GET['user'], "text").' AND pword='.$db1->GetSQLValueString($_GET['pass'], "text"),array ('code'),100000,0);
if($content['users_db'][0]['is_empty'] == 'false'){
@$content['streams'] = $db1->db_query("SELECT * FROM `user_streams` where user=".$db1->GetSQLValueString($_GET['user'], "text"),array ('code'),100000,0);

foreach($content['streams'] as $items){
echo $items['code'];

}


}

} ?>