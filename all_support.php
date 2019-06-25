<?php
// Author : Paul Moore
// Project : In2streams.co Video CMS
include('config/config.php');



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

@$content['user'] = $db1->db_query("SELECT * FROM users_db where email=".$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text")."",array (
    "uname"
),1,0);
// end user info
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

$content['support']= $db1->db_query("SELECT * FROM support ORDER BY id Desc",array (
    "name",'content','display','short'
),1000000,0);
$smarty->assign('basket',$content['basket']);
$smarty->assign('curency',curency);
$smarty->assign('logo',logo);
include('page-titles.php');
include('page-titles.php');
if($content['support'][0]['is_empty'] == 'false')
{
$smarty->assign('page_title',$title['support.html']);
}
else
{
$smarty->assign('page_title','Product not found');
}
$smarty->assign('support',$content['support']);
$smarty->assign('slogan',slogan);$smarty->template_dir = 'themes/'.$template;
$smarty->assign('theme_dir',$template);
$smarty->assign('ads',$content['ads']);
$smarty->assign('categories',$content['categories']);
$smarty->assign('site_root',site_root);
$smarty->compile_dir = 'tmp';
$smarty->display('all_support.tpl'); ?>

