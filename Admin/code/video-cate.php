<?php
$smarty->assign('role',$_SESSION['MM_UserGroup']);
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
if(isset($_GET['add']) and isset($_POST['name']) and $_SESSION['MM_UserGroup'] != 'Demo'){
$insertSQL = sprintf("INSERT INTO vid_cate (name) VALUES(%s)",
                       GetSQLValueString($_POST['name'], "text",$GLOBALS['__Connect']));    
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  $smarty->assign('added','true');
}
if(isset($_GET['id']))
{
$id4 = $_GET['id'];
}
else
{
$id4 = 'dfgdfgfgdfg';
}
 $query_categories = sprintf("SELECT * FROM vid_cate WHERE id=%s",GetSQLValueString($id4,'text',$GLOBALS['__Connect']));
$categories = mysqli_query($GLOBALS['__Connect'],$query_categories) or die(mysqli_error($GLOBALS['__Connect']));
$row_categories = mysqli_fetch_assoc($categories);
$totalRows_categories = mysqli_num_rows($categories);
$i = 0;
if($totalRows_categories == 0)
{
$smarty->assign('cate_empty','true');
}
else
{
if(isset($_GET['delete']) and !isset($_POST['name']) and $_SESSION['MM_UserGroup'] != 'Demo')
{
$insertSQL = sprintf("DELETE FROM vid_cate WHERE id=%s",
                       GetSQLValueString($_GET['id'], "int",$GLOBALS['__Connect']));    
mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
$smarty->assign('deleted',true);
}
if(isset($_POST['name']) and $_SESSION['MM_UserGroup'] != 'Demo')
{
$insertSQL = sprintf("UPDATE videos SET series=%s WHERE series=%s",
                       GetSQLValueString($_POST['name'], "text",$GLOBALS['__Connect']),
                       GetSQLValueString($row_categories['id'], "text",$GLOBALS['__Connect']));    
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
$insertSQL = sprintf("UPDATE vid_cate SET name=%s WHERE id=%s",
                       GetSQLValueString($_POST['name'], "text",$GLOBALS['__Connect']),
                       GetSQLValueString($row_categories['id'], "text",$GLOBALS['__Connect']));    
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));	
  
$smarty->assign('set1',true);
}
$smarty->assign('cate_empty','false');

$smarty->assign('cate_id',$row_categories['name']);

}
mysqli_free_result($categories);



mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_categories = "SELECT * FROM vid_cate ORDER BY id ASC";
$categories = mysqli_query($GLOBALS['__Connect'],$query_categories) or die(mysqli_error($GLOBALS['__Connect']));
$row_categories = mysqli_fetch_assoc($categories);
$totalRows_categories = mysqli_num_rows($categories);
$i = 0;
do {
$category[$i]['name'] = $row_categories['name'];
$category[$i]['id'] = $row_categories['id'];
$i ++;
} while ($row_categories = mysqli_fetch_assoc($categories));
if(isset($_GET['add']))
{
$smarty->assign('add',true);
}
else
{
$smarty->assign('add',false);
}
	
$smarty->assign('cate',$category);
mysqli_free_result($categories); ?>