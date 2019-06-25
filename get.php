<?php

// Author : Paul Moore
// Project : In2streams.co Video CMS
include('config/config.php');

include('functions/db.php');
include('functions/settings.php');

$get_query = new setup;
$db1 = new db;
$db1->connect();
if(1==1)
{
$content['username'] = $db1->db_query("SELECT * FROM `lines` where user=".$db1->GetSQLValueString($_GET['username'], "text")." and pass=".$db1->GetSQLValueString($_GET['password'], "text"),array ('expires','display'),100,0);

$content['list'] =  $db1->db_query("SELECT * FROM iptv where m3u_name=".$db1->GetSQLValueString($content['username'][0]['display'], "text"),array (
    "code",'sub','code','id'),100,0);
	if($content['list'][0]['is_empty'] == 'false')
	{
	$content['username'] = $db1->db_query("SELECT * FROM `lines` where user=".$db1->GetSQLValueString($_GET['username'], "text")." and pass=".$db1->GetSQLValueString($_GET['password'], "text").' And display = '.$db1->GetSQLValueString($content['username'][0]['display'],'text'),array ('expires'),100,0);
	
	
	$content['streams'] = $db1->db_query("SELECT * FROM `streams` where m3u=".$db1->GetSQLValueString($content['list'][0]['id'], "text"),array ('code'),100000,0);
	if(@$content['username'][0]['expires'] >= date('YmdHis')) {$expired= false;  }  else { $expired = true;  } 
if(!$expired or $content['list'][0]['sub'] == 'all'){
header("Content-Type: audio/mpegurl;");
	if(isset($_GET['m3u'])) {  echo @str_replace('.ts','.m3u8',str_replace('-username','&line='.$_GET['list'].$_GET['username'],$content['list'][0]['code'])); } else {
	
	if(isset($_GET['username']) and isset($_GET['password'])){
	
	if(strpos($_SERVER['HTTP_username_AGENT'], "Win") !== FALSE)
$os = "Windows";
elseif(strpos($_SERVER['HTTP_username_AGENT'], "Mac") !== FALSE)
$os = "Mac";
	if(1==2){ echo @str_replace('-username','&username='.'&line='.$_GET['list'].$_GET['username'].'&password='.$_GET['password'],$content['list'][0]['code']);
}else{

foreach($content['streams'] as $items){
echo @str_replace('-username','&line='.$_GET['list'].'&username='.$_GET['username'].'&password='.$_GET['password'],$items['code']);

}
}
	 }
	 else{
	 
	 foreach ($content['streams'] as $items){

	 echo @str_replace('-username','&line='.$_GET['list'].'&username=all&password=all',$items['code']);
}
	 }
	}
	
	}
	else { ?>No acrtive subscription<?php } 
	}
	else{ ?>File not found<?php }

}else{ ?>File not found<?php }

 ?>