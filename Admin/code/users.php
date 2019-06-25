<?php
if(isset($_GET['delete']) and  $_SESSION['MM_UserGroup'] != 'Demo'){
$insertSQL = sprintf("Delete from users_db where uname=%s",
					   GetSQLValueString($_GET['delete'], "text",$GLOBALS['__Connect']));


  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
$smarty->assign('deleted',true);
}

mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM users_db ORDER BY uname ASC";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);

$i = 0;
do {
$users_db2[$i]['uname'] = $row_users_db['uname'];
$users_db2[$i]['mac'] = $row_users_db['mac'];
$users_db2[$i]['role'] = $row_users_db['role'];
$users_db2[$i]['active'] = $row_users_db['active'];
$users_db2[$i]['active'] = $row_users_db['active'];
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('users_db',$users_db2);
mysqli_free_result($users_db);
?>