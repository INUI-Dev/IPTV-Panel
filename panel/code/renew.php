<?php


$content['user'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    "uname",'credits'
),1,0);
@$content['line'] = db_query("SELECT * FROM `user_lines`",array (
    "name",'cost','id','length','type'
),1000000,0);

$smarty->assign('lines',@$content['line']);
if($content['user'][0]['credits'] >= @$content['line'][0]['cost'] and isset($_POST['lines']))
{


$content['line2'] = db_query("SELECT * FROM `lines` where id=".intval($_GET['id']) ,array (
    'user'
),1000000,0);

@$content['deduct'] = db_query("SELECT * FROM `user_lines` where id=".intval($_POST['lines'])."",array (
    "name",'cost','id','length','type'
),1000000,0);
$expires = date('YmdHis', strtotime('+ '.$content['deduct'][0]['length'].' '.$content['deduct'][0]['type']));


$insertSQL = sprintf("UPDATE `lines` set expires=%s where id=%s and user=%s",
  
                       GetSQLValueString($expires, "text",$GLOBALS['__Connect']),
                       GetSQLValueString($_GET['id'], "int",$GLOBALS['__Connect']),
                       GetSQLValueString($content['line2'][0]['user'], "text",$GLOBALS['__Connect']));
					    $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
					
					
					$insertSQL = sprintf("UPDATE subscriptions SET expires=%s where prod_id=%s and uname=%s",
                     
                       GetSQLValueString($expires, "text",$GLOBALS['__Connect']),
                       GetSQLValueString($_GET['id'], "int",$GLOBALS['__Connect']),
                       GetSQLValueString($content['line2'][0]['user'], "text",$GLOBALS['__Connect']));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

  
  	
  $insertSQL = sprintf("update users_db set credits=credits-%s where uname=%s",
					   GetSQLValueString($content['line'][0]['cost'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($content['user'][0]['uname'], "text",$GLOBALS['__Connect']));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));


$smarty->assign('added',true);

}


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
$content['stats'] = db_query("SELECT * FROM `lines` WHERE seller='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."' order BY id DESC",array (
    "name",'id'
),1,0);
$smarty->assign('stats',$content['stats']);
$content['statistic'] = db_query("SELECT * FROM `stats` WHERE user='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."' order BY id DESC",array (
    "lines",'views','remaining'
),1,0);
$smarty->assign('statistic',$content['statistic']);

$content['vod'] = db_query("SELECT * FROM `streams` WHERE type='vod' and m3u=".intval($content['stream'][0]['id'])."",array (
    "name",'id','views'
),20,0);

$smarty->assign('vod',$content['vod']);
$content['live'] = db_query("SELECT * FROM `streams` WHERE type='live' and m3u=".intval($content['stream'][0]['id'])."",array (
    "name",'id','views'
),20,0);
$smarty->assign('live',$content['live']);
$smarty->assign('live',$content['live']);

$content['users_db'] = db_query("SELECT * FROM `users_db` WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'",array (
    'uname','credits','purchased'
),1,0);
$smarty->assign('users_db',$content['users_db']);


@$smarty->assign('credits',$content['credits']);

 $query_users_db = "SELECT * FROM `lines` where seller='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."' and id=".intval($_GET['id'])."";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$content['lines'] = db_query("SELECT * FROM `user_lines` order BY cost ASC",array (
    "name",'cost','id'
),1000000,0);
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

$smarty->assign('line',$users_db3);
}

?>