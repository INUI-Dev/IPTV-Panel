<?php 

if(isset($_GET['delete_device']) and  $_SESSION['MM_UserGroup'] != 'Demo')
{
if(isset($_GET['delete_device'])){
$insertSQL = sprintf("DELETE FROM `limit` WHERE id=%s",
                       $db1->GetSQLValueString($_GET['delete_device'], "int"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

}

}if(isset($_POST['uname']) and isset($_POST['email']) and  $_SESSION['MM_UserGroup'] != 'Demo')
{


if($_POST['pass'] == 'none')
{
$insertSQL = sprintf("UPDATE users_db set email=%s,active=%s,credits=%s WHERE uname=%s",
                       $db1->GetSQLValueString($_POST['email'], "text"),
                       $db1->GetSQLValueString($_POST['active'], "text"),
                       $db1->GetSQLValueString($_POST['credits'], "text"),
					   $db1->GetSQLValueString($_POST['uname'], "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  

$smarty->assign('set',true);
  }
  else
  {
  if($_POST['pass'] == $_POST['confirm']){ 
  $insertSQL = sprintf("UPDATE users_db set email=%s,active=%s,pword=%s, credits=%s WHERE uname=%s",
                       $db1->GetSQLValueString($_POST['email'], "text"),
                       $db1->GetSQLValueString($_POST['active'], "text"),
					   $db1->GetSQLValueString($_POST['pass'], "text"),
                       $db1->GetSQLValueString($_POST['credits'], "text"),
					   $db1->GetSQLValueString($_POST['uname'], "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

$smarty->assign('set',true);
  }
  else{
  

$smarty->assign('notmatch',true);
  }
  
  }
 
}


mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM users_db where uname = ".$db1->GetSQLValueString($_GET['id'],'text');
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$i = 0;
do {
$users_db2[$i]['uname'] = $row_users_db['uname'];

$users_db2[$i]['credits'] = $row_users_db['credits'];
$users_db2[$i]['email'] = $row_users_db['email'];
$users_db2[$i]['role'] = $row_users_db['role'];
$users_db2[$i]['active'] = $row_users_db['active'];
$users_db2[$i]['credits'] = $row_users_db['credits'];
$users_db2[$i]['signup_date'] = $row_users_db['signup_date'];
;
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('users_db',$users_db2);
 $query_users_db = "SELECT * FROM `lines` where user=".$db1->GetSQLValueString($_GET['id'],'text',$GLOBALS['__Connect'])."";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
if($totalRows_users_db > 0)
{
$i = 0;

do {
$users_db3[$i]['sub_plan'] = $row_users_db['sub_plan'];
$users_db3[$i]['name'] = $row_users_db['name'];
$users_db3[$i]['id'] = $row_users_db['id'];
$users_db3[$i]['last_viewed'] = $row_users_db['last_viewed'];
$users_db3[$i]['display'] = $row_users_db['display'];
$users_db3[$i]['user'] = $row_users_db['user'];
$users_db3[$i]['credits'] = $row_users_db['credits'];
$query_check = "SELECT * FROM `limit` where user = ".$db1->GetSQLValueString($_GET['id'],'text',$GLOBALS['__Connect'])." and m3u_id=".$row_users_db['id'];
$check = mysqli_query($GLOBALS['__Connect'],$query_check) or die(mysqli_error($GLOBALS['__Connect']));
$row_check = mysqli_fetch_assoc($check);

$totalRows_check = mysqli_num_rows($check);
if($totalRows_check > 0)
{
 $users_db3[$i]['limit_empty'] == 'false';
do {

$users_db3[$i]['limit_user_agent'] = $row_check['user_agent'];

$users_db3[$i]['limit_id'] = $row_check['id'];

} while ($row_check = mysqli_fetch_assoc($check));
}
else{ $users_db3[$i]['limit_empty'] == 'true';
}
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
}
@$smarty->assign('lines',$users_db3);
?>