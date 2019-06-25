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



if(!isset($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]))
{
if(isset($_GET['uname']))
{
header('Location:login.php?accesscheck='.urlencode('account.php?uname='.$_GET['uname']));
exit();
} else { header('Location:login.php?accesscheck='.urlencode('account.php'));

}
}$get_query = new setup;
$db1 = new db;
$db1->connect();
$db1->user__online();
$login = new auth;
$template = $get_query->SetTheme();
$cleared = false;
if(isset($_GET['clear_list']))
{


$insertSQL = sprintf("delete from user_streams where user = %s",
                       $db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)].'', "text"));
  
$result =   mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
$cleared = true;
}
//get user info
@$content['user'] = $db1->db_query("SELECT * FROM users_db _db where email=".$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text")."",array (
    "uname",'email','pword'
),1,0);

// end user info
//account purchases
if(isset($_POST['pass']) and isset($_POST['confirm']))
{
$content['usr'] = $db1->db_query("SELECT * FROM users_db _db where email=".$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text")." and pword=".$db1->GetSQLValueString($_POST['pass'], "text"),array (
    "uname",'email','pword'
),1,0);
if($content['usr'][0]['is_empty'] == 'true' or $content['usr'][0]['uname'] == 'test')
{
$pwordset = 'notfound';
}
else
{
$insertSQL = sprintf("UPDATE users_db _db set pword=%s where email=%s and pword=%s",
                       $db1->GetSQLValueString($_POST['confirm'].'', "text"),
                       $db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text"),
                       $db1->GetSQLValueString($_POST['pass'], "text"));

  

  
$result =   mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
$pwordset = 'true';
}

}
else{
$pwordset = 'false';
}
$content['ads']['side_bar']= $db1->db_query("SELECT * FROM ads WHERE position='sidebar' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);

$content['ads']['top']= $db1->db_query("SELECT * FROM ads WHERE position='top' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);


$content['categories']= $db1->db_query("SELECT * FROM categories ORDER BY name ASC",array (
    "name",'url'
),1000000,0);
@$content['orders']= $db1->db_query("SELECT * FROM subscriptions WHERE user= '".$content['user'][0]['uname']."' ORDER BY name ASC",array (
    "name",'url','image','url','id','user','display'
),1000000,0);


//end account
$smarty= new smarty();
$content['basket']= $db1->db_query("SELECT * FROM basket WHERE ip=".$db1->GetSQLValueString($_SERVER['REMOTE_ADDR'], "text")." and paid = 'false' ORDER BY id Desc",array (
    "name",'price','image','id'
),1000000,0);
$smarty->assign('basket',$content['basket']);
$smarty->assign('logo',logo);
$smarty->assign('slogan',slogan);
if(isset($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]))
{

$smarty->assign('group',$_SESSION['MM_UserGroup']);
$smarty->assign('user',$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]);
}
$content['categories']= $db1->db_query("SELECT * FROM categories ORDER BY name ASC",array (
    "name",'url'
),1000000,0);
include('page-titles.php');

$smarty->assign('page_title',$title['account']);
$smarty->assign('curency',curency);
$smarty->assign('uname1',$content['user'][0]['uname']);
$smarty->assign('pword1',$content['user'][0]['pword']);

$smarty->assign('pwordset',$pwordset);
$smarty->assign('cleared',$cleared);
$smarty->assign('user',$content['user']);
$smarty->assign('orders',$content['orders']);
$smarty->assign('categories',$content['categories']);
$smarty->assign('ads',$content['ads']);
$smarty->template_dir = 'themes/'.$template;
$smarty->assign('theme_dir',$template);
$smarty->assign('site_root',site_root);
$smarty->compile_dir = 'tmp';
$smarty->display('account.tpl'); ?>