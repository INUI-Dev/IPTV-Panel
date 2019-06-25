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
require_once('libs/Smarty.class.php');
include "phpqrcode/qrlib.php"; 
include('functions/loginaction.php');

$logoutAction = site_root."/";
if ((isset($_SERVER['QUERY_STRING'])) && ($_SERVER['QUERY_STRING'] != "")){
  $logoutAction .="&". htmlentities($_SERVER['QUERY_STRING']);
}
if ((isset($_GET['doLogout'])) &&($_GET['doLogout']=="true")){
  //to fully log out a visitor we need to clear the session varialbles
  $_SESSION['MM_Username'] = NULL;
  $_SESSION['MM_UserGroup'] = NULL;
  $_SESSION['PrevUrl'] = NULL;
  unset($_SESSION['MM_Username']);
  unset($_SESSION['MM_UserGroup']);
  unset($_SESSION['PrevUrl']);
  session_unset();
    $_SESSION['FBID'] = NULL;
    $_SESSION['USERNAME'] = NULL;
    $_SESSION['FULLNAME'] = NULL;
    $_SESSION['EMAIL'] =  NULL;
    $_SESSION['LOGOUT'] = NULL;
   
header("Location: ".site_root."/");
exit;}
	
$get_query = new setup;
$db1 = new db;
$db1->connect();
$login = new auth;
$template = $get_query->SetTheme();
$db1->user__online();	

@$content['mac'] = $db1->db_query("SELECT * FROM `lines` where expires < '".date('YmdHis')."' and mac !='Not Set'",array (
    "mac"
),1,0);
if($content['mac'][0]['is_empty'] == 'false')
{
	$file = file_get_contents(ministra.'/delete.php?mac='.$content['mac'][0]['mac'].'&user='.ministra_user.'&pass='.ministra_pass);
	$insertSQL = sprintf("UPDATE `lines` set mac = 'Not Set' where mac=%s",
  				   $db1->GetSQLValueString($content['mac'][0]['mac'], "text",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
 
}

//get user info
@$content['user'] = $db1->db_query("SELECT * FROM users_db where email=".$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text")."",array (
    "uname"
),1,0);
// end user info
//account purchases


$content['files'] = $db1->db_query("SELECT * FROM files ORDER BY id Desc",array (
    "name",'description','image','price','id','discount','display','sales'
),20,0);


$content['ads']['top']= $db1->db_query("SELECT * FROM ads WHERE position='top' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);

$content['ads']['side']= $db1->db_query("SELECT * FROM ads WHERE position='side' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);


$content['categories']= $db1->db_query("SELECT * FROM categories ORDER BY name ASC",array (
    "name",'url'
),1000000,0);


@$content['tabs']= $db1->db_query("SELECT * FROM tabs WHERE item_id=".intval($content['files'][0]['id'])." ORDER BY id ASC",array (
    "name",'content','id'
),1000000,0);
//end account
$smarty= new smarty();
$smarty->assign('logo',logo);
$smarty->assign('slogan',slogan);
if(isset($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]))
{

$smarty->assign('group',$_SESSION['MM_UserGroup']);
$smarty->assign('user',$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]);
}

$content['basket']= $db1->db_query("SELECT * FROM basket WHERE ip=".$db1->GetSQLValueString($_SERVER['REMOTE_ADDR'], "text")." and paid = 'false' ORDER BY id Desc",array (
    "name",'price','image','id'
),1000000,0);

include('page-titles.php');
 $content['ads']['side_bar']= $db1->db_query("SELECT * FROM ads WHERE position='sidebar' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);

$smarty->assign('page_title',$title['index']);
$smarty->assign('ads',$content['ads']);

$smarty->assign('basket',$content['basket']);
$smarty->assign('categories',$content['categories']);
$smarty->assign('tabs',$content['tabs']);
$smarty->assign('ads',$content['ads']);
$smarty->assign('percentage','');
$smarty->assign('curency',curency);
$smarty->template_dir = 'themes/'.$template;
$smarty->assign('theme_dir',$template);
$smarty->assign('files',$content['files']);
$smarty->assign('site_root',site_root);
$smarty->compile_dir = 'tmp';
$smarty->display('index.tpl'); ?>