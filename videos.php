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
include('functions/loginaction.php');$get_query = new setup;
$db1 = new db;
$db1->connect();
$db1->user__online();
$login = new auth;
$template = $get_query->SetTheme();
$login = new auth;
if(isset($_POST['uname']) && is_array($_POST['uname']) or isset($_POST['pword']) && is_array($_POST['pword']))
{
}else {
$content['loginaction'] = $login->loginaction();
}
//get user info
@$content['user'] = $db1->db_query("SELECT * FROM users_db where email=".$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text")."",array (
    "uname"
),1,0);
// end user info
//account purchases
$content['ads']['side']= $db1->db_query("SELECT * FROM ads WHERE position='side' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);



$content['ads']['top']= $db1->db_query("SELECT * FROM ads WHERE position='top' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);


$content['categories']= $db1->db_query("SELECT * FROM categories ORDER BY name ASC",array (
    "name",'url'
),1000000,0);
//end account


//end account
$smarty= new smarty();
$content['basket']= $db1->db_query("SELECT * FROM basket WHERE ip=".$db1->GetSQLValueString($_SERVER['REMOTE_ADDR'], "text")." and paid = 'false' ORDER BY id Desc",array (
    "name",'price','image','id'
),1000000,0);


$content['videos']= $db1->db_query("SELECT * FROM videos ORDER BY id Desc",array (
    'name','image','id','views'
),1000000,0);
$smarty->assign('basket',$content['basket']);
$smarty->assign('logo',logo);
include('page-titles.php');

$smarty->assign('page_title',$title['videos']);
$smarty->assign('slogan',slogan);$smarty->template_dir = 'themes/'.$template;
$smarty->assign('theme_dir',$template);
$smarty->assign('ads',$content['ads']);
$smarty->assign('videos',$content['videos']);
$smarty->assign('categories',$content['categories']);
$smarty->assign('site_root',site_root);
$smarty->compile_dir = 'tmp';
$smarty->display('videos.tpl'); ?>

