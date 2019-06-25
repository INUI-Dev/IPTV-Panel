<?php

if(isset($_GET['id']) and isset($_POST['url']) and $_SESSION['MM_UserGroup'] != 'Demo'){

	  $insertSQL = sprintf("update  live SET name=%s, fname=%s, series=%s WHERE id=%s",
      GetSQLValueString($_POST['name'], "text",$GLOBALS['__Connect']),
      GetSQLValueString($_POST['url'], "text",$GLOBALS['__Connect']),
      GetSQLValueString($_POST['series'], "text",$GLOBALS['__Connect']),
      GetSQLValueString($_GET['id'], "text",$GLOBALS['__Connect']));
					 
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('updated',true);
}if(isset($_GET['delete'])){

	  $insertSQL = sprintf("DELETE FROM live WHERE id=%s",
      GetSQLValueString($_GET['delete'], "int",$GLOBALS['__Connect']));
					 
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  $insertSQL = sprintf("DELETE FROM ministra_streams WHERE item_id=%s",
      GetSQLValueString($_GET['delete'], "int",$GLOBALS['__Connect']));
  
$smarty->assign('deleted',true);
}
if(isset($_GET['delete_all']) and $_SESSION['MM_UserGroup'] != 'Demo'){

	  $insertSQL = sprintf("DELETE FROM live");
					 
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('vod_deleted',true);
}if(isset($_POST['epg']) and $_SESSION['MM_UserGroup'] != 'Demo'){
 $insertSQL = sprintf("update  live SET epg=%s WHERE id=%s",
      GetSQLValueString($_POST['epg'], "text",$GLOBALS['__Connect']),
      GetSQLValueString($_POST['id'], "int",$GLOBALS['__Connect']));
					 
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
}

@$content['vid'] = db_query("SELECT * FROM live WHERE id = ".intval($_GET['id'])." order by id asc",array (
    "name",'fname','image','series','id','series'
),30,0);

$content['cate'] = db_query("SELECT * FROM vid_cate ORDER BY name ASC",array (
    "name",'id'
),30,0);
if(isset($_GET['psearch'])){
$content['user'] = db_query("SELECT * FROM live WHERE name LIKE '%".htmlspecialchars($_GET['psearch'])."%' order by id asc",array (
    "name",'fname','image','series','id','epg'
),30,0,true);
}
else
{
$content['user'] = db_query("SELECT * FROM live order by id DESC ",array (
    "name",'fname','image','series','id','epg'
),30,0,true);
}
$i = 0;
do { 
$pages_num[$i]['num'] = $i;
$i++;
} while($i <= $content['user'][0]['total_pages']);
if($content['user'][0]['is_empty'] == 'true')
{
$isempty = true;
} else {
$isempty = false;
}
$smarty->assign('pages_num',$pages_num);
$smarty->assign('vid',$content['vid']);
$smarty->assign('category',$content['cate']);
$smarty->assign('page_number',$content['user'][0]['page_num']);
$smarty->assign('total_pages',$content['user'][0]['total_pages']);
$smarty->assign('total_rows',$content['user'][0]['total_rows']);
@$smarty->assign('videos',$content['user']);


 ?>
