<?php

	 if(isset($_POST['insert'])) { $insertSQL = sprintf("INSERT INTO support (name,display,content,code,short) VALUES(%s,%s,%s,%s,%s)",
      GetSQLValueString($_POST['name'], "text",$GLOBALS['__Connect']),
      GetSQLValueString($_POST['url'], "text",$GLOBALS['__Connect']),
      GetSQLValueString($_POST['content'], "text",$GLOBALS['__Connect']),
      GetSQLValueString($_POST['content'], "text",$GLOBALS['__Connect']),
      GetSQLValueString($_POST['short'], "text",$GLOBALS['__Connect']));
					 
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  $smarty->assign('insert','added');
  }	 if(isset($_GET['delete'])) { $insertSQL = sprintf("Delete from support where id=%s",
      GetSQLValueString($_GET['id'], "int",$GLOBALS['__Connect']));
					 
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  $smarty->assign('deleted','true');
  }
  
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM support order by name asc";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$i = 0;
do {
$users_db2[$i]['name'] = $row_users_db['name'];
$users_db2[$i]['code'] = $row_users_db['code'];
$users_db2[$i]['id'] = $row_users_db['id'];
$users_db2[$i]['display'] = $row_users_db['display'];
;
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('support',$users_db2);
mysqli_free_result($users_db);

?>