<?php
include('config/config.php');
if(defined('disable') && disable){
include('noservice.html');
exit;

}
include('functions/db.php');
include('functions/settings.php');
require_once('libs/Smarty.class.php');
   $get_query = new setup;
$db1 = new db;
$db1->connect();
mysqli_select_db( $GLOBALS['__Connect'] , database_portfolio);
$query_users_db = sprintf("SELECT * FROM user_streams WHERE user=%s and item_id = %s",$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)],'text'),$db1->GetSQLValueString($_GET['id'],'int'));
$users_db = mysqli_query($GLOBALS['__Connect'] ,$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
if($totalRows_users_db > 0) {
?>
<?php
if(0 == 0)
{
if(1 ==1) { 
mysqli_select_db( $GLOBALS['__Connect'] , database_portfolio);
$query_users_db = sprintf("SELECT * FROM videos WHERE id= %s",$db1->GetSQLValueString($_GET['id'],'int'));
$users_db = mysqli_query($GLOBALS['__Connect'] ,$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
 
 
 
$insertSQL = sprintf("DELETE FROM user_streams WHERE user = %s and item_id = %s",
                       
                       $db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text"),
					   $db1->GetSQLValueString($_GET['id'], "int"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
?>{
  "added": "true",
  "status": "success"
}
<?php } else { ?>{
  "added": "false",
  "status": "This service is not a direct service. Please contact support"
}<?php } } else
{ ?>{
  "added": "false",
  "status": "product not found"
}<?php
}
} else { ?>{
  "added": "false",
  "status": "Already in basket"
}<?php } ?>