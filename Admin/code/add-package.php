<?php 
$content['cate'] = db_query("SELECT * FROM vid_cate ORDER BY name ASC",array (
    "name",'id'
),50000,0);$i = 1;
do { 
$count[$i]['num'] = $i;

$i++;
} while($i <= 100);
$smarty->assign('count',$count);
$smarty->assign('cate',$content['cate']);
$series = @$db1->GetSQLValueString($_GET['series'],'text');
$smarty->assign('role',$_SESSION['MM_UserGroup']); if(isset($_POST['plname'])){
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
}
}
function clean($string) {
   $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

   return preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
}
if(isset($_POST['create']) or isset($_POST['update']))
{

$list6 = '#EXTM3U
';
if(isset($_GET['psearch'])){
$query_linkiptv = 'SELECT * FROM videos  WHERE  series LIKE "%'.$_GET['cate'].'%" and name LIKE "%'.$_GET['psearch'].'%" ORDER BY id  ASC';
}
else{

$query_linkiptv = "SELECT * FROM videos ORDER BY id ASC";
}
$linkiptv = mysqli_query($GLOBALS['__Connect'],$query_linkiptv) or die(mysqli_error($GLOBALS['__Connect']));
$row_linkiptv = mysqli_fetch_assoc($linkiptv);
$totalRows_linkiptv = mysqli_num_rows($linkiptv);

$i = 0;

if((isset($_POST['add']) && $_POST['add'] == 'create') and  $i == 0){


$insertSQL = sprintf("DELETE  From streams WHERE m3u=%s and `type`='vod'",
  
				     
					   GetSQLValueString($_POST['iptvlist'], "int",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
}

do {
$url = $row_linkiptv['id'];
if(1 ==1){
$length = explode(':',$row_linkiptv['length']);
if(isset($length[1]) && $length[1] == ''){
$setl = $length[0].':00';
}
else{
$setl = @$length[0].':'.@$length[1];
}


$list5 = '#EXTINF:-1  tvg-logo="'.$row_linkiptv['image'].'" tvg-name="'.clean($row_linkiptv['name']).'" group-title="VOD: '.$row_linkiptv['series'].'", '.str_replace(',','',$row_linkiptv['name']).'
'.str_replace('feature%3Dyoutube_gdata_player','','http://'.$_SERVER['HTTP_HOST'].site_root.'/stream.php/Video.mp4?url='.urlencode($row_linkiptv['id'])).'-user
';

if (isset($_POST['add'.$row_linkiptv['id']]) or !isset($_GET['psearch']))
{

$insertSQL = sprintf("insert into streams (name,item_id,code,views,m3u) VALUES(%s,%s,%s,%s,%s)",
  
				     
					   GetSQLValueString(str_replace(',','',$row_linkiptv['name']), "text",$GLOBALS['__Connect']),
					   GetSQLValueString($row_linkiptv['id'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($list5, "text",$GLOBALS['__Connect']),
					   GetSQLValueString(0, "int",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['iptvlist'], "int",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

}
}
$i ++;
} while ($row_linkiptv = mysqli_fetch_assoc($linkiptv));

$smarty->assign('added',true);

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

$i ++;
} while ($row_iptv = mysqli_fetch_assoc($iptv));

$smarty->assign('iptv',$tv);
mysqli_free_result($iptv);
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
if(isset($_GET['delete'])){

$insertSQL = sprintf("UPDATE videos set iptv='false' WHERE id=%s",
  
				     
					   GetSQLValueString($_GET['delete'], "int",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('deleted',true);

}
$smarty->assign('role',$_SESSION['MM_UserGroup']);
  $query_categories = "SELECT * FROM vid_cate ORDER BY id ASC";
$categories = mysqli_query($GLOBALS['__Connect'],$query_categories) or die(mysqli_error($GLOBALS['__Connect']));
$row_categories = mysqli_fetch_assoc($categories);
$totalRows_categories = mysqli_num_rows($categories);
$i = 0;

do {
$category[$i]['id'] = $row_categories['id'];
$category[$i]['name'] = $row_categories['name'];
$i ++;
} while ($row_categories = mysqli_fetch_assoc($categories));
mysqli_free_result($categories);
$smarty->assign('category',$category);

$max_db = 5200;
$pageNum = 0;
if (isset($_GET['pageNum'])) {
  $pageNum = $_GET['pageNum'];
}
$startRow = $pageNum * $max_db;

if(!isset($_GET['psearch'])){
}
else{

mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
$query_linkiptv = sprintf('SELECT * FROM videos  WHERE series LIKE %s and name LIKE %s ORDER BY id  DESC',GetSQLValueString('%'.$_GET['cate'].'%', "text",$GLOBALS['__Connect']),GetSQLValueString('%'.$_GET['psearch'].'%', "text",$GLOBALS['__Connect']));
$query_limit_linkiptv = sprintf("%s LIMIT %d, %d", $query_linkiptv, $startRow, $max_db);
$linkiptv = mysqli_query( $GLOBALS['__Connect'], $query_limit_linkiptv) or die(mysqli_error($GLOBALS['__Connect']));
$row_linkiptv = mysqli_fetch_assoc($linkiptv);
if (isset($_GET['totalRows_linkiptv'])) {
  $totalRows_linkiptv = $_GET['totalRows_linkiptv'];
} else {
  $all_linkiptv = mysqli_query($GLOBALS['__Connect'],$query_linkiptv);
  $totalRows_linkiptv = mysqli_num_rows($all_linkiptv);
}
$totalPages_linkiptv = ceil($totalRows_linkiptv/$max_db)-1;



}
echo $totalRows_linkiptv;

$i = 0;
if(!isset($totalRows_linkiptv))
{
	$list[0]['is_empty']  = 'true';
}
else
{


	$list[0]['is_empty']  = 'false';	
do
	{
					

	$list[$i]['name'] = $row_linkiptv['name'];
	$list[$i]['fname'] = $row_linkiptv['fname'];
	$list[$i]['views'] = $row_linkiptv['views'];
	$list[$i]['id'] = $row_linkiptv['id'];
	$list[$i]['sub'] = $row_linkiptv['sub'];
	if($row_linkiptv['type'] == 'yt' or $row_linkiptv['type'] == 'dm' or $row_linkiptv['type'] == 'ondemand')
	{
	$list[$i]['image'] = $row_linkiptv['image'];
	}
	else
	{
	$list[$i]['image'] = '../vidimgs/'.$row_linkiptv['image'];
	}
	$i++;
			}
		while ($row_linkiptv = mysqli_fetch_assoc($linkiptv));
		}
		$i = 0;
if(isset($totalRows_linkiptv)){ do { 
$pages_num[$i]['num'] = $i;

$i++;
} while($i <= @$totalPages_linkiptv);

$smarty->assign('page_number',$pageNum);
@$smarty->assign('total_pages',$totalPages_linkiptv);
$smarty->assign('total_rows',$totalRows_linkiptv);
$smarty->assign('videos',$list);
mysqli_free_result($linkiptv);}


 ?>
