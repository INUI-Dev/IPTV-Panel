<?php

$content['user'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "uname",'credits'
),1,0);


$smarty->assign('uname',$content['user'][0]['uname']);
$smarty->assign('total_credits',$content['user'][0]['credits']);
$content['user'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "uname",'stream'
),1,0);

$smarty->assign('uname',$content['user'][0]['uname']);

$content['stream'] = db_query("SELECT * FROM `iptv`",array (
    'id'
),1,0);
$content['stats'] = db_query("SELECT * FROM `lines` WHERE seller='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."' order BY id DESC",array (
    "name",'id'
),1,0);
$smarty->assign('stats',$content['stats']);
$content['statistic'] = db_query("SELECT * FROM `stats` WHERE user='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."' order BY id DESC",array (
    "lines",'views','remaining'
),1,0);
$smarty->assign('statistic',$content['statistic']);

$content['vod'] = db_query("SELECT * FROM `streams` WHERE type='vod'",array (
    "name",'id','views'
),20,0);

$smarty->assign('vod',$content['vod']);
$content['live'] = db_query("SELECT * FROM `streams` WHERE type='live'",array (
    "name",'image','series','id','views'
),20,0);
$smarty->assign('live',$content['live']);

?>
