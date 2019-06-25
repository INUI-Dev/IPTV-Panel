<?php 

if(isset($_POST['limit']) and isset($_POST['id']) and  $_SESSION['MM_UserGroup'] != 'Demo')
{
$insertSQL = sprintf("UPDATE `iptv` SET limit_to = %s where id=%s ",
                       $db1->GetSQLValueString($_POST['limit'], "int"),
					   $db1->GetSQLValueString($_POST['id'], "int"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

}


$content['cate'] = db_query("SELECT * FROM vid_cate ORDER BY name ASC",array (
    "name",'id'
),30,0);$i = 1;
do { 
$count[$i]['num'] = $i;

$i++;
} while($i <= 100);
$smarty->assign('count',$count);
$smarty->assign('role',$_SESSION['MM_UserGroup']); if(isset($_GET['delete'])){
$insertSQL = sprintf("Delete from iptv where id=%s",
					   GetSQLValueString($_GET['delete'], "int",$GLOBALS['__Connect']));


  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
$smarty->assign('deleted',true);
}if(isset($_GET['free'])){
if($_GET['free'] == 'true')
{

					   $paid = 'all';
}
else {
$paid='true';
}
$insertSQL = sprintf("UPDATE iptv set sub=%s where id=%s",
					   GetSQLValueString($paid, "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_GET['id1'], "int",$GLOBALS['__Connect']));


  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
$smarty->assign('updated',true);
}


  $query_iptv = "SELECT * FROM iptv ORDER BY id ASC";
$iptv = mysqli_query($GLOBALS['__Connect'],$query_iptv) or die(mysqli_error($GLOBALS['__Connect']));
$row_iptv = mysqli_fetch_assoc($iptv);
$totalRows_iptv = mysqli_num_rows($iptv);
$i = 0;
do {
$tv[$i]['id'] = $row_iptv['id'];
$tv[$i]['name'] = $row_iptv['name'];
$tv[$i]['m3u_name'] = $row_iptv['m3u_name'];

$tv[$i]['sub'] = $row_iptv['sub'];
$tv[$i]['limit'] = $row_iptv['limit'];
$tv[$i]['limit_to'] = $row_iptv['limit_to'];

$i ++;
} while ($row_iptv = mysqli_fetch_assoc($iptv));

$smarty->assign('iptv',$tv);
mysqli_free_result($iptv);
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);

$smarty->assign('role',$_SESSION['MM_UserGroup']);

$max_db = 5200;
$pageNum = 0;
if (isset($_GET['pageNum'])) {
  $pageNum = $_GET['pageNum'];
}
$startRow = $pageNum * $max_db;

if(!isset($_GET['psearch'])){
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
$query_dbList = 'SELECT * FROM iptv ORDER BY id  DESC';
$query_limit_dbList = sprintf("%s LIMIT %d, %d", $query_dbList, $startRow, $max_db);
$dbList = mysqli_query( $GLOBALS['__Connect'], $query_limit_dbList) or die(mysqli_error($GLOBALS['__Connect']));
$row_dbList = mysqli_fetch_assoc($dbList);
}
else{

mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
$query_dbList = 'SELECT * FROM videos  WHERE iptv = "true"  and name LIKE "%'.$_GET['psearch'].'%" ORDER BY id  DESC';
$query_limit_dbList = sprintf("%s LIMIT %d, %d", $query_dbList, $startRow, $max_db);
$dbList = mysqli_query( $GLOBALS['__Connect'], $query_limit_dbList) or die(mysqli_error($GLOBALS['__Connect']));
$row_dbList = mysqli_fetch_assoc($dbList);


}
if (isset($_GET['totalRows_dbList'])) {
  $totalRows_dbList = $_GET['totalRows_dbList'];
} else {
  $all_dbList = mysqli_query($GLOBALS['__Connect'],$query_dbList);
  $totalRows_dbList = mysqli_num_rows($all_dbList);
}
$totalPages_dbList = ceil($totalRows_dbList/$max_db)-1;



$i = 0;
if($totalRows_dbList == 0)
{
	$list[0]['is_empty']  = 'true';
}
else
{

	
	
do
	{
					
		
			$i++;
			}
		while ($row_dbList = mysqli_fetch_assoc($dbList));
		}
		$i = 0;
do { 
$pages_num[$i]['num'] = $i;

$i++;
} while($i <= $totalPages_dbList);

$smarty->assign('pages_num',$pages_num);
$smarty->assign('page_number',$pageNum);
$smarty->assign('total_pages',$totalPages_dbList);
$smarty->assign('total_rows',$totalRows_dbList);

mysqli_free_result($dbList);

 ?>