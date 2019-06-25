<?php

$content['user'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "uname",'credits'
),1,0);


$smarty->assign('uname',$content['user'][0]['uname']);
$smarty->assign('total_credits',$content['user'][0]['credits']);

$content['user'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "uname",'credits'
),1,0);


$smarty->assign('uname',$content['user'][0]['uname']);
$smarty->assign('total_credits',$content['user'][0]['credits']);
$content['user'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "uname",'stream'
),1,0);

$smarty->assign('uname',$content['user'][0]['uname']);

$content['stream'] = db_query("SELECT * FROM `iptv` WHERE m3u_name='".$content['user'][0]['stream']."'",array (
    'id'
),1,0);
$content['stats'] = db_query("SELECT * FROM `limit` WHERE seller='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."' order BY id DESC",array (
    "name",'fname','image','series','id'
),1,0);
$smarty->assign('stats',$content['stats']);
$content['statistic'] = db_query("SELECT * FROM `stats` WHERE user='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."' order BY id DESC",array (
    "limit",'views','remaining'
),1,0);
$smarty->assign('statistic',$content['statistic']);

$content['vod'] = db_query("SELECT * FROM `streams` WHERE type='vod' and m3u=".intval($content['stream'][0]['id'])."",array (
    "name",'fname','image','series','id','views'
),20,0);

$smarty->assign('vod',$content['vod']);
$content['live'] = db_query("SELECT * FROM `streams` WHERE type='live' and m3u=".intval($content['stream'][0]['id'])."",array (
    "name",'fname','image','series','id','views'
),20,0);
$smarty->assign('live',$content['live']);
$smarty->assign('live',$content['live']);

$content['users_db'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    'uname','credits','purchased'
),1,0);
$smarty->assign('users_db',$content['users_db']);

$content['credits'] = db_query("SELECT * FROM `credits` order by price asc",array (
    "price",'cur_code','cur_sign','id'
),1,0);
$smarty->assign('credits',$content['credits']);
if(isset($_GET['delete']))
{

$insertSQL = sprintf("DELETE FROM `limit` Where id=".intval($_GET['id'])." and seller='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'");  

mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

$smarty->assign('deleted',true);
}
 $query_users_db = "SELECT * FROM `limit` where seller='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
if($totalRows_users_db > 0)
{
$i = 0;

do {
$users_db3[$i]['name'] = $row_users_db['name'];
$users_db3[$i]['id'] = $row_users_db['id'];
$users_db3[$i]['last_viewed'] = $row_users_db['last_viewed'];
$users_db3[$i]['user'] = $row_users_db['user'];
$users_db3[$i]['display'] = $row_users_db['display'];
$users_db3[$i]['pass'] = $row_users_db['pass'];
if($row_users_db['expires'] < date('YmdHis')){
$users_db3[$i]['expires'] = 'Expired';
}
else
{
$users_db3[$i]['expires'] = dateDiff($row_users_db['expires'],date('YmdHis'));
}
$users_db3[$i]['pass'] = $row_users_db['pass'];
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('limit',$users_db3);
}

?>
