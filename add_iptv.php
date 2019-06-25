<?php
include('config/config.php');
if(defined('disable') && disable){
include('noservice.html');
exit;

}
include('functions/db.php');
include('functions/settings.php');
require_once('libs/Smarty.class.php');
   $get_query = new setup;
$db1 = new db;
$db1->connect();
mysqli_select_db( $GLOBALS['__Connect'] , database_portfolio);
$query_users_db = sprintf("SELECT * FROM user_streams WHERE user=%s and item_id = %s",$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)],'text'),$db1->GetSQLValueString($_GET['id'],'int'));
$users_db = mysqli_query($GLOBALS['__Connect'] ,$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
if($totalRows_users_db == 0) {
?>
<?php
if($totalRows_users_db ==0)
{
if(1 ==1) { 
mysqli_select_db( $GLOBALS['__Connect'] , database_portfolio);

if(isset($_GET['type']) && $_GET['type'] == 'live')
{

$query_users_db = sprintf("SELECT * FROM live WHERE id= %s",$db1->GetSQLValueString($_GET['id'],'int'));}
else{

$query_users_db = sprintf("SELECT * FROM videos WHERE id= %s",$db1->GetSQLValueString($_GET['id'],'int'));}
$users_db = mysqli_query($GLOBALS['__Connect'] ,$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
 
 if(isset($_GET['type']) && $_GET['type'] == 'live')
{
 
 @$list5 = '#EXTINF:-1 tvg-id="'.$eg.'" tvg-name="'.trim(preg_replace('/\s*\([^)]*\)/', '',str_replace(' | SD','',str_replace(' | HD','',str_replace(',','',$row_users_db['name']))))).'" tvg-logo="'.$row_users_db['image'].'" group-title="Live-Tv: '.$row_users_db['series'].'", '.str_replace(',','',trim(preg_replace('/\s*\([^)]*\)/', '',str_replace(' | SD','',str_replace(' | HD','',str_replace(',','',$row_users_db['name'])))))).'
'.'http://'.$_SERVER['HTTP_HOST'].site_root.'/stream-live.php/video.m3u8?url='.$row_users_db['id'].'-user'.'
';
}
else{
 @$list5 = '#EXTINF:-1 tvg-id="'.$eg.'" tvg-name="'.trim(preg_replace('/\s*\([^)]*\)/', '',str_replace(' | SD','',str_replace(' | HD','',str_replace(',','',$row_users_db['name']))))).'" tvg-logo="'.$row_users_db['image'].'" group-title="Live-Tv: '.$row_users_db['series'].'", '.str_replace(',','',trim(preg_replace('/\s*\([^)]*\)/', '',str_replace(' | SD','',str_replace(' | HD','',str_replace(',','',$row_users_db['name'])))))).'
'.'http://'.$_SERVER['HTTP_HOST'].site_root.'/stream.php/video.mp4?url='.$row_users_db['id'].'-user'.'
';
}
$insertSQL = sprintf("INSERT INTO user_streams (name, item_id, code,views,m3u,`type`,`limit`,user) VALUES (%s,%s, %s, %s, %s, %s,%s,%s)",
                       $db1->GetSQLValueString($row_users_db['name'], "text"),
                       $db1->GetSQLValueString($row_users_db['id'], "text"),
                       $db1->GetSQLValueString($list5.' ', "text"),
                       $db1->GetSQLValueString(0, "int"),
                       $db1->GetSQLValueString(0, "int"),
                       $db1->GetSQLValueString('video', "text"),
                       $db1->GetSQLValueString('false', "text"),
                       $db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
?>{
  "added": "true",
  "status": "success"
}
<?php } else { ?>{
  "added": "false",
  "status": "This service is not a direct service. Please contact support"
}<?php } } else
{ ?>{
  "added": "false",
  "status": "product not found"
}<?php
}
} else { ?>{
  "added": "false",
  "status": "Already in basket"
}<?php } ?>