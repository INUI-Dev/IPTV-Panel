<?php
$content['user'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "uname",'credits'
),1,0);


$smarty->assign('uname',$content['user'][0]['uname']);
$smarty->assign('total_credits',$content['user'][0]['credits']);


$content['user'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "uname",'credits'
),1,0);


$smarty->assign('uname',$content['user'][0]['uname']);
$smarty->assign('total_credits',$content['user'][0]['credits']);
$content['user'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "uname",'stream'
),346,0);

$smarty->assign('uname',$content['user'][0]['uname']);

$content['stream'] = db_query("SELECT * FROM `iptv` WHERE id='".htmlspecialchars($_POST['plan'])."'",array (
    'id','name','m3u_name'
),1,0);
$content['iptv'] = db_query("SELECT * FROM `iptv`",array (
    "credits",'stream','id','name'
),300,0);

$smarty->assign('iptv',$content['iptv']);
$content['stats'] = db_query("SELECT * FROM `lines` WHERE seller='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."' order BY id DESC",array (
    "name",'id'
),1,0);
$smarty->assign('stats',$content['stats']);
$content['statistic'] = db_query("SELECT * FROM `stats` WHERE user='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."' order BY id DESC",array (
    "lines",'views','remaining'
),1,0);
$smarty->assign('statistic',$content['statistic']);

$content['vod'] = db_query("SELECT * FROM `streams` WHERE type='vod' and m3u=".intval($content['stream'][0]['id'])."",array (
    "name",'id','views'
),20,0);

$smarty->assign('vod',$content['vod']);
$content['live'] = db_query("SELECT * FROM `streams` WHERE type='live' and m3u=".intval($content['stream'][0]['id'])."",array (
    "name",'fname','image','series','id','views'
),20,0);
$smarty->assign('live',$content['live']);
$smarty->assign('live',$content['live']);
if(isset($_POST['uname']) and isset($_POST['pass']) and isset($_POST['email'])){

$content['user'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "credits",'stream'
),1000000,0);
$content['line'] = db_query("SELECT * FROM `user_lines` WHERE id='".intval($_POST['lines'])."'",array (
    "name",'cost','id','length','type'
),1000000,0);
if($content['user'][0]['credits'] >= $content['line'][0]['cost'])
{


$expires = date('YmdHis', strtotime('+ '.$content['line'][0]['length'].' '.$content['line'][0]['type']));


$content['users_db1'] = db_query("SELECT * FROM `lines` WHERE user=".GetSQLValueString($_POST['uname'], "text",$GLOBALS['__Connect'])."",array (
    "name",'cost','id','length','type'
),1,0);
if($content['users_db1'][0]['is_empty'] == 'true'){ 
if($_POST['mac'] != 'jhgjhgjhgjhg'){
						
						$file = file_get_contents(ministra.'/createuser.php?login='.$_POST['uname'].'&loginpass='.$_POST['pass'].'&mac='.$_POST['mac'].'&user='.ministra_user.'&pass='.ministra_pass.'&tariff='.default_tariff);
}
else{
	$file = 'added';
}
						
$insertSQL = sprintf("INSERT INTO `lines` (mac,name, user, active, sub_plan,pass,expires,display,seller) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)",
  
   GetSQLValueString($_POST['mac'], "text",$GLOBALS['__Connect']),
   GetSQLValueString($content['line'][0]['name'], "text",$GLOBALS['__Connect']),
				      GetSQLValueString($_POST['uname'], "text",$GLOBALS['__Connect']),
  GetSQLValueString('true', "text",$GLOBALS['__Connect']),

                       GetSQLValueString($content['stream'][0]['id'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['pass'], "text",$GLOBALS['__Connect']),
                       GetSQLValueString($expires, "text",$GLOBALS['__Connect']),
                       GetSQLValueString($content['stream'][0]['m3u_name'], "text",$GLOBALS['__Connect']),
                       GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text",$GLOBALS['__Connect'])					   );
					    $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
					
$smarty->assign('display',$content['stream'][0]['m3u_name']);	
						
						
						
						$insertSQL = sprintf("INSERT INTO subscriptions(name,prod_id,user,url,type,display,expires,uname) VALUES(%s,%s,%s,%s,'file',%s,%s,%s)",
                       GetSQLValueString($_POST['lines'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($content['line'][0]['id'], "text",$GLOBALS['__Connect']),
                       GetSQLValueString($_POST['uname'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($content['user'][0]['stream'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($content['stream'][0]['name'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($expires , "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['uname'], "text",$GLOBALS['__Connect']));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
  
  
  $insertSQL = sprintf("update users_db set credits=credits-%s where uname=%s",
					   GetSQLValueString($content['line'][0]['cost'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text",$GLOBALS['__Connect']));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

$smarty->assign('added',true);
define('added',true);
						}

else
{

$smarty->assign('taken1',true);
}

}
else{

$smarty->assign('credits',false);
}
}
$content['lines'] = db_query("SELECT * FROM `user_lines` order BY cost ASC",array (
    "name",'cost','id'
),1000000,0);
$smarty->assign('lines',$content['lines']);

$content['credit'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "credits",'stream'
),1,0);
if(defined('added'))
{
$smarty->assign('total_credits',$content['credit'][0]['credits']);
}
$smarty->assign('credit',$content['credit']);
?>