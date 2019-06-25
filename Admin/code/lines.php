<?php 
if(isset($_GET['suspend']) and $_SESSION['MM_UserGroup'] !='Demo')
{
  $insertSQL = "UPDATE `lines` set expires = ".date('YmdHis')." where id =".intval($_GET['suspend']);
					    $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
						
			
$smarty->assign('updated2',true);	
;	
}

if(isset($_POST['update']) and $_SESSION['MM_UserGroup'] !='Demo')
{
  $insertSQL = "UPDATE `lines` set sub_plan = ".$_POST['lines']." where id =".intval($_POST['update']);
					    $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
						
			
$smarty->assign('updated3',true);	
;	
}

if(isset($_GET['delete']) and $_SESSION['MM_UserGroup'] !='Demo')
{
  $insertSQL = "delete from `lines`  where id =".intval($_GET['delete']);
					    $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
						
			
$smarty->assign('deleted2',true);			
}
if(isset($_POST['length']) and isset($_POST['type']) and isset($_POST['id']) and $_SESSION['MM_UserGroup'] !='Demo')
{
$expires = date('YmdHis', strtotime('+ '.$_POST['length'].' '.$_POST['type']));
$insertSQL = sprintf("UPDATE `lines` set expires ='%s' Where id=%s",$expires,$_POST['id']);  

mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
}
 $query_users_db = "SELECT * FROM `lines`";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
if($totalRows_users_db > 0)
{
$i = 0;

do {
$users_db3[$i]['mac'] = $row_users_db['mac'];
$users_db3[$i]['sub_plan'] = $row_users_db['sub_plan'];
$users_db3[$i]['name'] = $row_users_db['name'];
$users_db3[$i]['id'] = $row_users_db['id'];
$users_db3[$i]['last_viewed'] = $row_users_db['last_viewed'];
$users_db3[$i]['display'] = $row_users_db['display'];
$users_db3[$i]['user'] = $row_users_db['user'];
if($row_users_db['expires'] <= date('YmdHis')){
$users_db3[$i]['expires'] = 'Expired';
}
else
{
$users_db3[$i]['expires'] = dateDiff($row_users_db['expires'],date('YmdHis'));
}
$users_db3[$i]['pass'] = $row_users_db['pass'];
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('lines',$users_db3);

 $query_users_db = "SELECT * FROM iptv ORDER BY name ASC";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);

$i = 0;
do {
$lines[$i]['name'] = $row_users_db['name'];
$lines[$i]['id'] = $row_users_db['id'];
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('lines2',$lines);

$int1 = 1;
do{
$time[$int1] = $int1;
$int1 ++;
} while($int1 < 101);



$smarty->assign('time',$time);}
 ?>