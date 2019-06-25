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


$content['files'] = $db1->db_query("SELECT * FROM files WHERE category= ".$db1->GetSQLValueString($_GET['id'], "text")." ORDER BY id Desc",array (
    "name",'description','image','price','id','discount','display','category'
),20,0,true);

$content['cate'] = $db1->db_query("SELECT * FROM categories WHERE url= ".$db1->GetSQLValueString($_GET['id'], "text")." ORDER BY id Desc",array (
    "name"
),1,0);

$content['ads']['side_bar']= $db1->db_query("SELECT * FROM ads WHERE position='sidebar' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);

$content['ads']['side']= $db1->db_query("SELECT * FROM ads WHERE position='side' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);

$content['ads']['top']= $db1->db_query("SELECT * FROM ads WHERE position='top' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);


$content['categories']= $db1->db_query("SELECT * FROM categories ORDER BY name ASC",array (
    "name",'url'
),1000000,0);
$template = $get_query->SetTheme();
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

include('page-titles.php');

$i = 0;
do { 
$pages_num[$i]['num'] = $i;
$i++;
} while($i <= $content['files'][0]['total_pages']);
$smarty->assign('pages_num',$pages_num);
$smarty->assign('page_number',$content['files'][0]['page_num']);
$smarty->assign('total_pages',$content['files'][0]['total_pages']);
$smarty->assign('total_rows',$content['files'][0]['total_rows']);
@$smarty->assign('page_title',sprintf($title['categories'],$content['cate'][0]['name']));
$smarty->assign('curency',curency);
$smarty->template_dir = 'themes/'.$template;
$smarty->assign('theme_dir',$template);
$smarty->assign('site_root',site_root);
$smarty->assign('percentage','');
$smarty->assign('ads',$content['ads']);
$smarty->assign('files',$content['files']);
$smarty->assign('categories',$content['categories']);
$smarty->assign('cate',$content['cate']);
$smarty->compile_dir = 'tmp';
$smarty->display('categories.tpl'); ?>