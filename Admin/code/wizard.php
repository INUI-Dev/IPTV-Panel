<?php 

if(isset($_GET['action']) && $_GET['action'] == 'add_streams' and isset($_POST['plname'])){
if($_SESSION['MM_UserGroup'] != 'Demo')
{
$fname = str_replace('+','-',$_POST['plname']);
$fname = str_replace(' ','-',$fname);
$insertSQL = sprintf("INSERT Into iptv (name,m3u_name,sub,active,code,smart_code,location,webtv,`limit`,limit_to) VALUES(%s,%s,%s,'true',' ',' ',' ',' ',%s,%s)",
					   GetSQLValueString($_POST['plname'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString(str_replace(' ','-',$fname).'.m3u', "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['free'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['device'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['limit'], "text",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

$smarty->assign('added',true);
}}
if(isset($_GET['action']) && $_GET['action'] == 'addstream' and isset($_POST['type']) && $_POST['type'] == 'live')
{
	 $query_m3u = "SELECT * FROM m3u_names ORDER BY id ASC";
$m3u = mysqli_query($GLOBALS['__Connect'],$query_m3u) or die(mysqli_error($GLOBALS['__Connect']));
$row_m3u = mysqli_fetch_assoc($m3u);
$totalRows_m3u = mysqli_num_rows($m3u);
$i = 0;
do {
$tv1[$i]['id'] = $row_m3u['id'];
$tv1[$i]['name'] = $row_m3u['name'];

$i ++;
} while ($row_m3u = mysqli_fetch_assoc($m3u));


$smarty->assign('m3u_names',$tv1);

$smarty->assign('role',$_SESSION['MM_UserGroup']); if(isset($_POST['plname'])){
$insertSQL = sprintf("INSERT Into iptv (name,m3u_name,sub) VALUES(%s,%s,%s)",
					   GetSQLValueString($_POST['plname'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString(str_replace(' ','-',$_POST['plname']).'.m3u', "text",$GLOBALS['__Connect']),
					   GetSQLValueString('all', "text",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

$smarty->assign('added',true);
}
function clean($string) {
   $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

   return preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
}
if(isset($_POST['create']) or isset($_POST['update']))
{
$list2 = '#EXTM3U
';
$list6 = '#EXTM3U
';
if(isset($_GET['psearch'])){
$query_linkiptv = 'SELECT * FROM live  WHERE m3u_name LIKE '.GetSQLValueString('%'.$_GET['psearch'].'%', "text",$GLOBALS['__Connect']).' ORDER BY id  DESC';
}
else{
$query_linkiptv = "SELECT * FROM live ORDER BY name ASC";
}
$linkiptv = mysqli_query($GLOBALS['__Connect'],$query_linkiptv) or die(mysqli_error($GLOBALS['__Connect']));
$row_linkiptv = mysqli_fetch_assoc($linkiptv);
$totalRows_linkiptv = mysqli_num_rows($linkiptv);

$i = 0;

$query_iptv9 = "SELECT * FROM iptv WHERE id='".intval($_POST['iptvlist'])."' ORDER BY name ASC";

$iptv9 = mysqli_query($GLOBALS['__Connect'],$query_iptv9) or die(mysqli_error($GLOBALS['__Connect']));
$row_iptv9 = mysqli_fetch_assoc($iptv9);
$totalRows_iptv9 = mysqli_num_rows($iptv9);
$list2 = $row_iptv9['code'];
if((isset($_POST['add']) && $_POST['add'] == 'create')){


$insertSQL = sprintf("DELETE  From streams WHERE m3u=%s and `type`='live'",
  
				     
					   GetSQLValueString($_POST['iptvlist'], "int",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
}
do {
$url = $row_linkiptv['id'];
if (isset($_POST['add'.$row_linkiptv['id']]) or !isset($_GET['psearch']))
{
$epg1 = explode(':',$row_linkiptv['name']);

if(count($epg1) > 0){
$eg = strtolower(str_replace('hd','',str_replace('sd','',$epg1[1]))).'';
$eg = ucwords(str_replace('hd','',str_replace('sd','',$eg))).' '.$_POST['epg'];

}
else
{
$eg = str_replace('Hd ','',ucwords(strtolower(str_replace('hd ','',$row_linkiptv['name'])))).' '.$_POST['epg'];

}
$list5 = '#EXTINF:-1 tvg-id="'.$row_linkiptv['epg'].'" tvg-name="'.trim(preg_replace('/\s*\([^)]*\)/', '',str_replace(' | SD','',str_replace(' | HD','',str_replace(',','',$row_linkiptv['name']))))).'" tvg-logo="'.$row_linkiptv['image'].'" group-title="Live-Tv: '.$row_linkiptv['series'].'", '.str_replace(',','',trim(preg_replace('/\s*\([^)]*\)/', '',str_replace(' | SD','',str_replace(' | HD','',str_replace(',','',$row_linkiptv['name'])))))).'
'.'http://'.$_SERVER['HTTP_HOST'].site_root.'/stream-live.php/video.m3u8?url='.$row_linkiptv['id'].'-user'.'
';



if((isset($_POST['add']) && $_POST['add'] == 'create' or  $_POST['add'] == 'add')){



$insertSQL = sprintf("insert into streams (name,item_id,code,views,m3u,type,`limit`) VALUES(%s,%s,%s,%s,%s,'live',%s)",
  
				     
					   GetSQLValueString(str_replace(',','',$row_linkiptv['name']), "text",$GLOBALS['__Connect']),
					   GetSQLValueString($row_linkiptv['id'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($list5, "text",$GLOBALS['__Connect']),
					   GetSQLValueString(0, "int",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['iptvlist'], "int",$GLOBALS['__Connect']),
					   GetSQLValueString($row_iptv9['limit'], "text",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

}
}$i ++;
} while ($row_linkiptv = mysqli_fetch_assoc($linkiptv));


$smarty->assign('added',true);

$smarty->assign('updated',true);
}
  $query_iptv = "SELECT * FROM iptv ORDER BY id desc";
$iptv = mysqli_query($GLOBALS['__Connect'],$query_iptv) or die(mysqli_error($GLOBALS['__Connect']));
$row_iptv = mysqli_fetch_assoc($iptv);
$totalRows_iptv = mysqli_num_rows($iptv);
$i = 0;
do {
$tv[$i]['id'] = $row_iptv['id'];
$tv[$i]['name'] = $row_iptv['name'];

$i ++;
} while ($row_iptv = mysqli_fetch_assoc($iptv));

$smarty->assign('iptv',$tv);
mysqli_free_result($iptv);
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
if(isset($_GET['delete'])){

$insertSQL = sprintf("UPDATE live set iptv='false' WHERE id=%s",
  
				     
					   GetSQLValueString($_GET['delete'], "int",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('deleted',true);

}
$smarty->assign('role',$_SESSION['MM_UserGroup']);
  $query_categories = "SELECT * FROM categories ORDER BY id ASC";
$categories = mysqli_query($GLOBALS['__Connect'],$query_categories) or die(mysqli_error($GLOBALS['__Connect']));
$row_categories = mysqli_fetch_assoc($categories);
$totalRows_categories = mysqli_num_rows($categories);
$i = 0;
do {
$category[$i]['id'] = $row_categories['id'];
$i ++;
} while ($row_categories = mysqli_fetch_assoc($categories));
mysqli_free_result($categories);
$smarty->assign('category',$category);

$max_db = 300;



$pageNum = 0;

if (isset($_GET['pageNum'])) {
  $pageNum = $_GET['pageNum'];
}
if(isset($_POST['page']) && $_POST['page'] == 'next')
{
$smarty->assign('next',true);
$pageNum ++;
}
$startRow = $pageNum * $max_db;

if(!isset($_GET['psearch'])){
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
$query_dbList = 'SELECT * FROM live ORDER BY id  DESC';
$query_limit_dbList = sprintf("%s LIMIT %d, %d", $query_dbList, $startRow, $max_db);
$dbList = mysqli_query( $GLOBALS['__Connect'], $query_limit_dbList) or die(mysqli_error($GLOBALS['__Connect']));
$row_dbList = mysqli_fetch_assoc($dbList);
}
else{
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
$query_dbList = 'SELECT * FROM live  WHERE m3u_name LIKE '. GetSQLValueString('%'.$_GET['psearch'].'%', "text",$GLOBALS['__Connect']).' ORDER BY id  DESC';
$query_limit_dbList = sprintf("%s LIMIT %d, %d", $query_dbList, $startRow, $max_db);
$dbList = mysqli_query( $GLOBALS['__Connect'], $query_limit_dbList) or die(mysqli_error($GLOBALS['__Connect']));
$row_dbList = mysqli_fetch_assoc($dbList);
;

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
					

	$list[$i]['name'] = $row_dbList['name'];
	$list[$i]['fname'] = $row_dbList['fname'];
	$list[$i]['views'] = $row_dbList['views'];
	$list[$i]['image'] = $row_dbList['image'];
	$list[$i]['views'] = $row_dbList['views'];
	$list[$i]['id'] = $row_dbList['id'];
	$list[$i]['series'] = $row_dbList['series'];
	
	$list[0]['total_rows'] = $totalRows_dbList;
		
			$i++;
			}
		while ($row_dbList = mysqli_fetch_assoc($dbList));
		}
		$i = 0;
do { 
$pages_num[$i]['num'] = $i;

$i++;
} while($i <= $totalPages_dbList);

$smarty->assign('totalPages_dbList',$totalPages_dbList);
$smarty->assign('pages_num',$pages_num);
$smarty->assign('page_number',$pageNum);
$smarty->assign('total_pages',$totalPages_dbList);
$smarty->assign('total_rows',$totalRows_dbList);
$smarty->assign('videos',$list);
$smarty->assign('pageNum',$pageNum);

mysqli_free_result($dbList);
	
}

$i = 1;
do { 
$count[$i]['num'] = $i;

$i++;
} while($i <= 100);
$smarty->assign('count',$count);
?>