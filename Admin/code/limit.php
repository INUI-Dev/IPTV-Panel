<?php
if(isset($_GET['delete_device']) and  $_SESSION['MM_UserGroup'] != 'Demo')
{
if(isset($_GET['delete_device'])){
$insertSQL = sprintf("DELETE FROM `limit` WHERE id=%s",
                       $db1->GetSQLValueString($_GET['delete_device'], "int"));
					   

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

}
}

$query_users_db = "SELECT * FROM `limit`";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
if($totalRows_users_db > 0)
{

$users_db3[0]['is_empty'] = 'false';
$i = 0;

do {
$users_db3[$i]['name'] = $row_users_db['name'];
$users_db3[$i]['user_agent'] = $row_users_db['user_agent'];
$users_db3[$i]['device'] = $row_users_db['device'];
$users_db3[$i]['m3u'] = $row_users_db['m3u'];
$users_db3[$i]['id'] = $row_users_db['id'];
$users_db3[$i]['m3u_id'] = $row_users_db['m3u_id'];
$users_db3[$i]['user'] = $row_users_db['user'];
$users_db3[$i]['city'] = $row_users_db['city'];
$users_db3[$i]['country'] = $row_users_db['country'];
$users_db3[$i]['agent'] = $row_users_db['agent'];

$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));
 }
 else{
 
$users_db3[0]['is_empty'] = 'true';}
$smarty->assign('limit',$users_db3);
 ?>