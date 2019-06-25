<?php 

if(isset($_GET['delete']) and  $_SESSION['MM_UserGroup'] != 'Demo')
{
  
  $insertSQL = sprintf("DELETE FROM categories WHERE id=%s",
                         $db1->GetSQLValueString($_GET['id'], "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('deleted',true);
}if(isset($_POST['add']) and  $_SESSION['MM_UserGroup'] != 'Demo')
{
  
  $insertSQL = sprintf("INSERT INTO categories (name,url) VALUES(%s,%s)",
                       $db1->GetSQLValueString($_POST['name'], "text"),
                       $db1->GetSQLValueString($_POST['url'], "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('added',true);
}

if(isset($_POST['prod_id']) and  $_SESSION['MM_UserGroup'] != 'Demo')
{
$insertSQL = sprintf("UPDATE categories set name=%s,url=%s WHERE id=%s",
                       $db1->GetSQLValueString($_POST['name'], "text"),
                       $db1->GetSQLValueString($_POST['url'], "text"),
					   $db1->GetSQLValueString($_POST['prod_id'], "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
  $insertSQL = sprintf("UPDATE files set category=%s WHERE category =%s",
                       $db1->GetSQLValueString($_POST['name'], "text"),
                       $db1->GetSQLValueString($_POST['orig'], "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('updated',true);
}
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM categories order by id desc";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$i = 0;
do {
$users_db2[$i]['name'] = $row_users_db['name'];
$users_db2[$i]['url'] = $row_users_db['url'];
$users_db2[$i]['id'] = $row_users_db['id'];
;
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('cates',$users_db2);
mysqli_free_result($users_db);

if(isset($_GET['id']))
{
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM categories WHERE id=".intval($_GET['id']);
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$i = 0;
if($totalRows_users_db > 0){
$smarty->assign('edit',true);
do {
$users_db2[$i]['name'] = $row_users_db['name'];
$users_db2[$i]['url'] = $row_users_db['url'];
$users_db2[$i]['id'] = $row_users_db['id'];
;
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));
$smarty->assign('cate',$users_db2);
}
else
{

}
mysqli_free_result($users_db);
}
?>