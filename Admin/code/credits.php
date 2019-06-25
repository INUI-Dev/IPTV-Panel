<?php
if(isset($_GET['delete']) and $_SESSION['MM_UserGroup'] != 'Demo'){
$insertSQL = sprintf("Delete from user_lines where id=%s",
					   GetSQLValueString($_GET['id'], "text",$GLOBALS['__Connect']));


  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
$smarty->assign('deleted',true);
}
if(isset($_GET['add']) and isset($_POST['length'])){

$insertSQL = sprintf("INSERT Into user_lines (name,type,length,cost) VALUES(%s,%s,%s,%s)",
					   GetSQLValueString($_POST['name'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['type'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['length'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['cost'], "text",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('added',true);
}
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM user_lines ORDER BY name ASC";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);

$i = 0;
do {
$users_db2[$i]['name'] = $row_users_db['name'];
$users_db2[$i]['cost'] = $row_users_db['cost'];
$users_db2[$i]['length'] = $row_users_db['length'];
$users_db2[$i]['type'] = $row_users_db['type'];
$users_db2[$i]['id'] = $row_users_db['id'];
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('users_db',$users_db2);
mysqli_free_result($users_db);
$int1 = 1;
do{
$time[$int1] = $int1;
$int1 ++;
} while($int1 < 101);


$smarty->assign('time',$time);
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_lines = "SELECT * FROM iptv order by name asc";
$lines = mysqli_query($GLOBALS['__Connect'],$query_lines) or die(mysqli_error($GLOBALS['__Connect']));
$row_lines = mysqli_fetch_assoc($lines);
$totalRows_lines = mysqli_num_rows($lines);
$i = 0;
do {
$lines2[$i]['name'] = $row_lines['name'];
$lines2[$i]['sub'] = $row_lines['sub'];
$lines2[$i]['id'] = $row_lines['id'];
$lines2[$i]['display'] = $row_lines['m3u_name'];
;
$i ++;
} while ($row_lines = mysqli_fetch_assoc($lines));
$smarty->assign('lines',$lines2);
?>