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
header('Location:login.php?accesscheck='.urlencode('basket.html'));
exit;
}$get_query = new setup;
$db1 = new db;
$db1->connect();
$login = new auth;
$template = $get_query->SetTheme();
$smarty= new smarty();
$content['basket']= $db1->db_query("SELECT * FROM basket WHERE ip=".$db1->GetSQLValueString($_SERVER['REMOTE_ADDR'], "text")." and paid = 'false' ORDER BY id Desc",array (
    "name",'price','image','id'
),1000000,0);
$smarty->assign('basket',$content['basket']);
$smarty->assign('logo',logo);
$smarty->assign('slogan','slogan');
if(isset($_GET['delete']) and isset($_GET['id']))
{
$insertSQL = sprintf("Delete from basket where email=%s and ip=%s and id=%s ",
                       $db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text"),
                       $db1->GetSQLValueString($_SERVER['REMOTE_ADDR'], "text"),
                       $db1->GetSQLValueString($_GET['id'], "int"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('deleted',true);
}
$content['pword']= $db1->db_query("SELECT pword, uname FROM users_db WHERE email=".$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text")."",array (
   'pword','uname'
),1000000,0);

//get user info

$insertSQL = sprintf("UPDATE basket set uname =%s,hash=%s,email=%s,pass=%s,mac=%s where ip=%s",
                       $db1->GetSQLValueString(@$content['pword'][0]['uname'], "text"),
                       $db1->GetSQLValueString(md5($_SERVER['REMOTE_ADDR'].date('Dmis')), "text"),
                       $db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text"),
                       $db1->GetSQLValueString(@$content['pword'][0]['pword'] ,"text"),
                       $db1->GetSQLValueString('none' ,"text"),
                       $db1->GetSQLValueString($_SERVER['REMOTE_ADDR'], "text"));

  
  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
if(isset($_POST['mac'])){
$insertSQL = sprintf("UPDATE basket set mac=%s where ip=%s",
                       $db1->GetSQLValueString($_POST['mac'] ,"text"),
                       $db1->GetSQLValueString($_SERVER['REMOTE_ADDR'], "text"));

  
  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));}
$content['basket']= $db1->db_query("SELECT * FROM basket WHERE email=".$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text")." and paid = 'false' ORDER BY id Desc",array (
    "name",'price','image','id'
),1000000,0);
$price = 0.0;
if($content['basket'][0]['is_empty'] == 'false'){foreach($content['basket'] as $items)
{
$price += $items['price'];
}
}
$content['ads']['side_bar']= $db1->db_query("SELECT * FROM ads WHERE position='sidebar' ORDER BY id Desc",array (
    'code'
),1000000,0);



$content['ads']['top']= $db1->db_query("SELECT * FROM ads WHERE position='top' ORDER BY id Desc",array (
    'code'
),1000000,0);


$content['categories']= $db1->db_query("SELECT * FROM categories ORDER BY name ASC",array (
    'url'
),1000000,0);
//end account
$content['categories']= $db1->db_query("SELECT * FROM categories ORDER BY name ASC",array (
    "name",'url'
),1000000,0);
include('page-titles.php');

$smarty->assign('page_title',$title['basket']);
if(isset($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]))
{

$smarty->assign('group',$_SESSION['MM_UserGroup']);
$smarty->assign('user',$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]);
}
$smarty->assign('ads',$content['ads']);
$smarty->assign('totalprice',$price);
$smarty->assign('curency',curency);
$smarty->assign('categories',$content['categories']);
$smarty->assign('basket',$content['basket']);
$smarty->template_dir = 'themes/'.$template;
$smarty->assign('theme_dir',$template);
$smarty->assign('site_root',site_root);
$smarty->assign('sandbox',sandbox);

$smarty->assign('paypal_email',paypal_email);
$smarty->assign('moneycode',moneycode);
$smarty->compile_dir = 'tmp';
$smarty->display('basket.tpl'); ?>