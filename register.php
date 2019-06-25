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
include "phpqrcode/qrlib.php"; $get_query = new setup;
$db1 = new db;
$db1->connect();
$db1->user__online();
$template = $get_query->SetTheme();

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

$smarty= new smarty();
$content['basket']= $db1->db_query("SELECT * FROM basket WHERE ip=".$db1->GetSQLValueString($_SERVER['REMOTE_ADDR'], "text")." and paid = 'false' ORDER BY id Desc",array (
    "name",'price','image','id'
),1000000,0);
$smarty->assign('basket',$content['basket']);
if(isset($_POST['uname']))
{
@$content['username']= $db1->db_query("SELECT * FROM users_db WHERE uname =".$db1->GetSQLValueString($_POST['uname'], "text")."",array (
   
),1,0);
@$content['email']= $db1->db_query("SELECT * FROM users_db WHERE email =".$db1->GetSQLValueString($_POST['email'], "text")."",array (
    
),1,0);

if($content['username'][0]['is_empty'] == 'true' and $content['email'][0]['is_empty'] == 'true')
{
if(filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
$insertSQL = sprintf("INSERT INTO users_db (uname,pword,active,role,email,signup_date) VALUES(%s,%s,%s,%s,%s,%s)",
	$db1->GetSQLValueString(htmlspecialchars($_POST['uname']), "text"),
	$db1->GetSQLValueString($_POST['pword'], "text"),
	$db1->GetSQLValueString('true', "text"),
	$db1->GetSQLValueString('User', "text"),
	$db1->GetSQLValueString($_POST['email'], "text"),
	$db1->GetSQLValueString(date('Y-m-d H:i:s'), "text"));

  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
 
$smarty->assign('user_added',true);


}
else
{

$smarty->assign('email_valid',false);
}
}
else{
if($content['username'][0]['is_empty'] != 'true')
{
$smarty->assign('uname_taken',true);
}
if($content['email'][0]['is_empty'] != 'true')
{
$smarty->assign('email_taken',true);
}
}
}

$content['categories']= $db1->db_query("SELECT * FROM categories ORDER BY name ASC",array (
    "name",'url'
),1000000,0);
//end account


//end account
$smarty->assign('logo',logo);
include('page-titles.php');

$smarty->assign('page_title',$title['register']);
$smarty->assign('slogan',slogan);$smarty->template_dir = 'themes/'.$template;
$smarty->assign('theme_dir',$template);
$smarty->assign('ads',$content['ads']);
$smarty->assign('categories',$content['categories']);
$smarty->assign('curency',curency);
$smarty->assign('site_root',site_root);
$smarty->compile_dir = 'tmp';
$smarty->display('register.tpl'); ?>
