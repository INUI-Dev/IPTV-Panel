<?php 
if(isset($_POST['name']))
{
$insertSQL = sprintf("INSERT INTO videos(name,fname,image,visible,display,series,`desc`,`type`) VALUES(%s,%s,%s,%s,%s,%s,%s,'vod')",
  
				     
					   GetSQLValueString($_POST['name'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['url'].' ', "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['image'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString('true', "text",$GLOBALS['__Connect']),
					   GetSQLValueString(cleanstring($_POST['name']), "text",$GLOBALS['__Connect']),
                       GetSQLValueString($_POST['cate'].' ', "text",$GLOBALS['__Connect']),
                       GetSQLValueString($_POST['desc'].' ', "text",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('added',true);
}
$content['cate'] = db_query("SELECT * FROM vid_cate ORDER BY name ASC",array (
    "name",'id'
),30000,0);

$smarty->assign('date',date('Y-m-d H:i:s'));

$smarty->assign('category',$content['cate']); ?>