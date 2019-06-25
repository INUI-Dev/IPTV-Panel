<?php

if(isset($_GET['id']) and isset($_POST['url'])){

	  $insertSQL = sprintf("update  streams SET name=%s, code=%s WHERE id=%s",
      GetSQLValueString($_POST['name'], "text",$GLOBALS['__Connect']),
      GetSQLValueString($_POST['url'], "text",$GLOBALS['__Connect']),
      GetSQLValueString($_GET['id'], "text",$GLOBALS['__Connect']));
					 
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('updated',true);
}if(isset($_GET['delete'])){

	  $insertSQL = sprintf("DELETE FROM streams WHERE id=%s",
      GetSQLValueString($_GET['delete'], "int",$GLOBALS['__Connect']));
					 
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('deleted',true);
}


@$content['vid'] = db_query("SELECT * FROM streams WHERE id = ".intval($_GET['id'])." order by id asc",array (
    "name",'code'
),30,0);

$content['cate'] = db_query("SELECT * FROM vid_cate ORDER BY name ASC",array (
    "name",'id'
),30,0);
if(isset($_GET['psearch'])){
$content['user'] = db_query("SELECT * FROM streams WHERE name LIKE '%".htmlspecialchars($_GET['psearch'])."%' order by id asc",array (
    "name",'fname','image','series','id'
),30,0);
}
else
{
$content['user'] = db_query("SELECT * FROM streams order by id DESC ",array (
    "name",'fname','image','series','id'
),30,0);
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
