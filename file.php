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
//get user info
@$content['user'] = $db1->db_query("SELECT * FROM users_db where email=".$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text")."",array (
    "uname"
),1,0);
// end user info
//account purchases


$content['files'] = $db1->db_query("SELECT * FROM files WHERE display=".$db1->GetSQLValueString($_GET['id'], "text")." ORDER BY id Desc",array (
    "name",'description','image','price','id','discount','display','sales','line'
),1000000,0);

$content['review'] = $db1->db_query("SELECT * FROM reviews WHERE links=".$db1->GetSQLValueString($_GET['id'], "text")." ORDER BY id Desc",array (
    'name','rating','links','posted_by','review'
),1000000,0);


@$content['images'] = $db1->db_query("SELECT * FROM product_images WHERE prod_id=".$db1->GetSQLValueString($content['files'][0]['id'], "int")." ORDER BY id Desc",array (
    "name",'fname'
),1000000,0);

$content['related'] = $db1->db_query("SELECT * FROM files WHERE display<>".$db1->GetSQLValueString($_GET['id'], "text")." ORDER BY id Desc",array (
    "name",'description','image','price','id','discount','display'
),9,0);$content['ads']['side_bar']= $db1->db_query("SELECT * FROM ads WHERE position='sidebar' ORDER BY id Desc",array (
    "name",'code'
),2,0);

$content['ads']['top']= $db1->db_query("SELECT * FROM ads WHERE position='top' ORDER BY id Desc",array (
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
if($content['files'][0]['is_empty'] == 'false')
{
$smarty->assign('page_title',sprintf($title['product'],$content['files'][0]['name']));
}
else
{
$smarty->assign('page_title','Product not found');
}
$smarty->assign('images',$content['images']);
$smarty->assign('related',$content['related']);
$smarty->assign('categories',$content['categories']);
$smarty->assign('review',$content['review']);
$smarty->assign('tabs',$content['tabs']);
$smarty->assign('ads',$content['ads']);
$smarty->assign('percentage','');
$smarty->assign('curency',curency);
$smarty->template_dir = 'themes/'.$template;
$smarty->assign('theme_dir',$template);
$smarty->assign('files',$content['files']);
$smarty->assign('site_root',site_root);
$smarty->compile_dir = 'tmp';
$smarty->display('file.tpl'); ?>