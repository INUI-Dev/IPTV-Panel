<?php
$content['user'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "uname",'credits'
),1,0);


$smarty->assign('uname',$content['user'][0]['uname']);
$smarty->assign('total_credits',$content['user'][0]['credits']);


$content['stats'] = db_query("SELECT * FROM `lines` WHERE seller='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."' order BY id DESC",array (
    "name",'fname','image','series','id'
),1,0);
$smarty->assign('stats',$content['stats']);
$content['statistic'] = db_query("SELECT * FROM `stats` WHERE user='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."' order BY id DESC",array (
    "lines",'views','remaining'
),1,0);
$smarty->assign('statistic',$content['statistic']);

$content['vod'] = db_query("SELECT * FROM `videos` order BY name ASC",array (
    "name",'fname','image','series','id','views'
),1,0);
$smarty->assign('vod',$content['vod']);

$content['live'] = db_query("SELECT * FROM `live` order BY name ASC",array (
    "name",'fname','image','series','id','views'
),1,0);
$smarty->assign('live',$content['live']);

$content['users_db'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "name",'uname','credits','purchased'
),1,0);
$smarty->assign('users_db',$content['users_db']);

$content['credits'] = db_query("SELECT * FROM `credits` order by price asc",array (
    "price",'cur_code','cur_sign','id'
),1,0);
$smarty->assign('credits',$content['credits']);

?>
