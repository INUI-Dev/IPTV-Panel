<?php

if(isset($_POST['name'])){

  $fname = md5(date("Hisms")).'.jpg';
      $fname2 = md5(date("Hisms")).'.'.$_FILES['image']['name'];
	  $newname2 = $_SERVER['DOCUMENT_ROOT'].site_root.'/prod/'.$fname2;
        move_uploaded_file($_FILES['image']['tmp_name'],$newname2);
  
 $insertSQL = sprintf("INSERT INTO files (category,display,discount, name, image, fname,price,`description`,subscriptions,line,length,type,prod_type) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,'credit')",
	GetSQLValueString($_POST['category'], "text",$GLOBALS['__Connect']),
	GetSQLValueString(cleanstring($_POST['name']).'-'.md5($_POST['name']).'.html', "text",$GLOBALS['__Connect']),
	GetSQLValueString($_POST['discount'], "text",$GLOBALS['__Connect']),
	GetSQLValueString($_POST['name'], "text",$GLOBALS['__Connect']),
	GetSQLValueString($fname2, "text",$GLOBALS['__Connect']),
	GetSQLValueString($_POST['lines'], "text",$GLOBALS['__Connect']),
	GetSQLValueString($_POST['price'], "text",$GLOBALS['__Connect']),
	GetSQLValueString($_POST['desc'], "text",$GLOBALS['__Connect']),
	GetSQLValueString($_POST['sub'], "text",$GLOBALS['__Connect']),
	GetSQLValueString($_POST['lines'], "text",$GLOBALS['__Connect']),
	GetSQLValueString($_POST['length'], "text",$GLOBALS['__Connect']),
	GetSQLValueString('none', "text",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('added',true);
  }

mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM categories order by name asc";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$i = 0;
do {
$users_db2[$i]['name'] = $row_users_db['name'];
$users_db2[$i]['url'] = $row_users_db['url'];
$users_db2[$i]['products'] = $row_users_db['products'];
;
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('categories',$users_db2);




mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_lines = "SELECT * FROM iptv order by name asc";
$lines = mysqli_query($GLOBALS['__Connect'],$query_lines) or die(mysqli_error($GLOBALS['__Connect']));
$row_lines = mysqli_fetch_assoc($lines);
$totalRows_lines = mysqli_num_rows($lines);
$i = 0;
do {
$lines2[$i]['name'] = $row_lines['name'];
$lines2[$i]['sub'] = $row_lines['sub'];
$lines2[$i]['id'] = $row_lines['id'];
$lines2[$i]['display'] = $row_lines['m3u_name'];
;
$i ++;
} while ($row_lines = mysqli_fetch_assoc($lines));
$smarty->assign('lines',$lines2);
$i=1;

do {
$list[$i]['list'] = $i;


$i ++;
} while ($i <= 100);
$smarty->assign('list',$list);
?>