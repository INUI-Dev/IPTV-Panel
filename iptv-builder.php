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

$get_query = new setup;
$db1 = new db;
$db1->connect();
$db1->user__online();
$login = new auth;
$template = $get_query->SetTheme();
function checkEmail($email) {
   $find1 = strpos($email, '@');
   $find2 = strpos($email, '.');
   return ($find1 !== false && $find2 !== false && $find2 > $find1 ? true : false);
}
if(!isset($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]))
{
if(isset($_GET['uname']) or !checkEmail($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]))
{
header('Location:login.php?accesscheck='.urlencode('iptv-builder.php?uname='.$_GET['uname']));
exit();
} else { header('Location:login.php?accesscheck='.urlencode('account.php'));

}
}
if(!checkEmail($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]))
{
header('Location:login.php?accesscheck='.urlencode('iptv-builder.php?uname='.$_GET['uname']));
exit();
}
//get user info
@$content['user'] = $db1->db_query("SELECT * FROM users_db where email=".$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text")."",array (
    "uname",'email'
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

if(isset($_GET['psearch'])) { 
if(isset($_GET['type']) && $_GET['type'] == 'live'){
$content['iptv']= $db1->db_query("SELECT * FROM live WHERE `name` LIKE ".$db1->GetSQLValueString('%'.$_GET['psearch'].'%', "text")." ORDER BY id DESC",array (
    "name",'id','image'
),20,0,true);

}
else{
$content['iptv']= $db1->db_query("SELECT * FROM videos WHERE `name` LIKE ".$db1->GetSQLValueString('%'.$_GET['psearch'].'%', "text")." ORDER BY id DESC",array (
    "name",'id','image'
),20,0,true);
}
}

else
{

if(isset($_GET['type']) && $_GET['type'] == 'live'){

$content['iptv']= $db1->db_query("SELECT * FROM live ORDER BY id DESC",array (
    "name",'id','image'
),20,0,true);
}
else{
$content['iptv']= $db1->db_query("SELECT * FROM videos ORDER BY id DESC",array (
    "name",'id','image'
),20,0,true);
}
}
$int1 = 0;
if($content['iptv'][0]['is_empty'] == 'false')
{
foreach($content['iptv'] as $item){

$content['videos']= $db1->db_query("SELECT * FROM user_streams where item_id=".$item['id'].' and user ='."'".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "name"
),1,0);
if($content['videos'][0]['is_empty'] == 'false')
{
$content['iptv'][$int1]['used'] = true;

}
$content['iptv'][$int1]['name'] = $item['name'];

$content['iptv'][$int1]['image'] = $item['image'];
$content['iptv'][$int1]['id'] = $item['id'];
$content['iptv'][$int1]['name'] = $item['name'];


$int1++;
}
include('page-titles.php');
}
$i = 0;
do { 
$pages_num[$i]['num'] = $i;
$i++;
} while($i <= $content['iptv'][0]['total_pages']);

$smarty->assign('pages_num',$pages_num);
$smarty->assign('page_number',$content['iptv'][0]['page_num']);
$smarty->assign('total_pages',$content['iptv'][0]['total_pages']);
$smarty->assign('total_rows',$content['iptv'][0]['total_rows']);
$smarty->assign('page_title',$title['account']);
$smarty->assign('curency',curency);

$smarty->assign('iptv',$content['iptv']);
$smarty->assign('user',$content['user']);
$smarty->assign('orders',$content['orders']);
$smarty->assign('categories',$content['categories']);
$smarty->assign('ads',$content['ads']);
$smarty->template_dir = 'themes/'.$template;
$smarty->assign('theme_dir',$template);
$smarty->assign('site_root',site_root);
$smarty->compile_dir = 'tmp';
$smarty->display('builder.tpl'); ?>