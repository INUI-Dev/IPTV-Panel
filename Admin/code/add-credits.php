<?php 
if(isset($_POST['uname'])) { 
 
$insertSQL = sprintf("UPDATE users_db set credits = %s WHERE uname=%s",
                       
					   $db1->GetSQLValueString($_POST['credits'], "text"),
					   $db1->GetSQLValueString($_POST['uname'], "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  $smarty->assign('updated',true);
}

mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM users_db where role='Admin' or role='Reseller'";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$i = 0;
do {
$users_db2[$i]['uname'] = $row_users_db['uname'];
$users_db2[$i]['credits'] = $row_users_db['credits'];
;
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('users_db',$users_db2);
mysqli_free_result($users_db);


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