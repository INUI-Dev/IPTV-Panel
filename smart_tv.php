<?php

// Author : Paul Moore
// Project : In2streams.co Video CMS
include('config/config.php');
if(defined('disable') && disable){
include('noservice.html');
exit;

}
include('functions/db.php');
include('functions/settings.php');

$get_query = new setup;
$db1 = new db;
$db1->connect();
if(isset($_GET['list']))
{

$content['list'] =  $db1->db_query("SELECT * FROM iptv where m3u_name=".$db1->GetSQLValueString($_GET['list'], "text"),array (
    "smart_code",'sub'),100,0);
	if($content['list'][0]['is_empty'] == 'false')
	{
	$content['user'] = $db1->db_query("SELECT * FROM `lines` where user=".$db1->GetSQLValueString($_GET['user'], "text")." and pass=".$db1->GetSQLValueString($_GET['pass'], "text").' And display = '.$db1->GetSQLValueString($_GET['list'],'text'),array ('expires'),100,0);
	
	if(@$content['user'][0]['expires'] >= date('YmdHis')) {$expired= false;  }  else { $expired = true;  } 
if(!$expired or $content['list'][0]['sub'] == 'all'){
header("Content-Type: audio/mpegurl;");
	if(isset($_GET['m3u'])) {  echo @str_replace('.ts','.m3u8',str_replace('-user',$_GET['user'],$content['list'][0]['code'])); } else {
	
	if(isset($_GET['user']) and isset($_GET['pass'])){
	
	 echo @str_replace('-user','&user='.$_GET['user'].'&pass='.$_GET['pass'],$content['list'][0]['code']);
	 }
	 else{
	 echo $content['list'][0]['smart_code'];
	 }
	}
	
	}
	else { ?>No acrtive subscription<?php } 
	}
	else{ ?>File not found<?php }

}else{ ?>File not found<?php }

 ?>