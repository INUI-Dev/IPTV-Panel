<?php 

mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM mesages order by id desc";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$i = 0;
do {
$users_db2[$i]['name'] = $row_users_db['name'];
$users_db2[$i]['message'] = $row_users_db['message'];
$users_db2[$i]['from_email'] = $row_users_db['from_email'];
$users_db2[$i]['subject'] = $row_users_db['subject'];
$users_db2[$i]['status'] = $row_users_db['status'];
$users_db2[$i]['id'] = $row_users_db['id'];
;
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('messages',$users_db2);
mysqli_free_result($users_db);

if(isset($_GET['id']))
{
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM mesages WHERE id=".intval($_GET['id']);
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$i = 0;
if($totalRows_users_db > 0){
$smarty->assign('edit',true);
do {
$users_db2[$i]['name'] = $row_users_db['name'];
$users_db2[$i]['from_email'] = $row_users_db['from_email'];
$users_db2[$i]['subject'] = $row_users_db['subject'];
$users_db2[$i]['status'] = $row_users_db['status'];
$users_db2[$i]['id'] = $row_users_db['id'];
;
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));
$smarty->assign('mesage',$users_db2);
}
else
{

}
mysqli_free_result($users_db);
}
?>