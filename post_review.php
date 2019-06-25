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
$content['loginaction'] = $login->loginaction();
//get user info
@$content['user'] = $db1->db_query("SELECT * FROM users_db where email=".$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text")."",array (
    "uname"
),1,0);
// end user info
//account purchases
$content['ads']['side_bar']= $db1->db_query("SELECT * FROM ads WHERE position='sidebar' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);



$content['ads']['top']= $db1->db_query("SELECT * FROM ads WHERE position='top' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);


$content['categories']= $db1->db_query("SELECT * FROM categories ORDER BY name ASC",array (
    "name",'url'
),1000000,0);
//end account
$content['files'] = $db1->db_query("SELECT * FROM files where display=".$db1->GetSQLValueString($_GET['id'], "text")."",array (
    "id",'display'
),1,0);

$smarty= new smarty();
$content['basket']= $db1->db_query("SELECT * FROM basket WHERE ip=".$db1->GetSQLValueString($_SERVER['REMOTE_ADDR'], "text")." and paid = 'false' ORDER BY id Desc",array (
    "name",'price','image','id'
),1000000,0);
$smarty->assign('basket',$content['basket']);
if(isset($_POST['review']) and $content['files'][0]['is_empty'] == 'false')
{
$insertSQL = sprintf("INSERT INTO reviews SET name=%s,rating=%s,review=%s,posted_by=%s,links=%s",
                      $db1->GetSQLValueString(htmlspecialchars($_POST['head']), "text"),
					    $db1->GetSQLValueString(htmlspecialchars($_POST['rating']), "text"),
						 $db1->GetSQLValueString(htmlspecialchars($_POST['review']), "text"),
						 $db1->GetSQLValueString(htmlspecialchars($_POST['user_name']).' ' , "text"),
						 $db1->GetSQLValueString($content['files'][0]['display'], "text"));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

$smarty->assign('posted',true);
}
//end account
$smarty->assign('logo',logo);
$smarty->assign('slogan',slogan);$smarty->template_dir = 'themes/'.$template;
$smarty->assign('theme_dir',$template);
$smarty->assign('ads',$content['ads']);
$smarty->assign('files',$content['files']);
$smarty->assign('categories',$content['categories']);
$smarty->assign('site_root',site_root);
$smarty->compile_dir = 'tmp';
$smarty->display('post_review.tpl'); ?>