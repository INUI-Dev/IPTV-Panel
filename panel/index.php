<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
// Author : Paul Moore
// Project : in2music.co Video CMS
date_default_timezone_set('Europe/London');



//include some important Files...
require_once('../config/config.php');
include('../functions/db.php');

$db1 = new db;
$db1->connect();
require_once('../libs/Smarty.class.php');
require_once('functions/admin.php');
restrict();
$smarty= new smarty();
if(isset($_GET['pname']))
{
$files = $_GET['pname'];
}
else
{
$files='index';
}
$smarty->assign('pname',$files);
$smarty->assign('logo',logo);
$smarty->assign('slogan',slogan);

$smarty->assign('text_top','in2iptv.com');
$smarty->assign('site_root',site_root);
$smarty->assign('curency',curency);

$smarty->assign('user',$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]);
$smarty->assign('role',$_SESSION['MM_UserGroup']);
$smarty->template_dir = 'theme/default/';
$smarty->compile_dir = '../tmp';
include('code/'.$files.'.php');
$smarty->display($files.'.tpl');
?>