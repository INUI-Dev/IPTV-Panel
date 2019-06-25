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
$query_users_db = sprintf("SELECT * FROM basket WHERE paid='false' and ip = %s AND prod_id= %s",$db1->GetSQLValueString($_SERVER['REMOTE_ADDR'],'text'),$db1->GetSQLValueString($_GET['id'],'int'));
$users_db = mysqli_query($GLOBALS['__Connect'] ,$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
if($totalRows_users_db == 0) {
?>
<?php mysqli_select_db( $GLOBALS['__Connect'] , database_portfolio);
$query_users_db = sprintf("SELECT * FROM files WHERE id= %s",$db1->GetSQLValueString($_GET['id'],'int'));
$users_db = mysqli_query($GLOBALS['__Connect'] ,$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db); 
if($totalRows_users_db > 0)
{
if(1 ==1) { 
mysqli_select_db( $GLOBALS['__Connect'] , database_portfolio);
$query_users_db = sprintf("SELECT * FROM files WHERE id= %s",$db1->GetSQLValueString($_GET['id'],'int'));
$users_db = mysqli_query($GLOBALS['__Connect'] ,$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db); 
$insertSQL = sprintf("INSERT INTO basket (ip,name, prod_id, price,uname,token,image,type,length,type2,display,prod_type) VALUES (%s,%s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s)",
                       $db1->GetSQLValueString($_SERVER['REMOTE_ADDR'], "text"),
                       $db1->GetSQLValueString($row_users_db['name'], "text"),
                       $db1->GetSQLValueString($_GET['id'], "int"),
                       $db1->GetSQLValueString($row_users_db['price'], "text"),
                       $db1->GetSQLValueString($_GET['uname'], "text"),
                       $db1->GetSQLValueString($_GET['uname'], "text"),
                       $db1->GetSQLValueString($row_users_db['image'], "text"),
                       $db1->GetSQLValueString('file', "text"),
                       $db1->GetSQLValueString($row_users_db['length'], "text"),
                       $db1->GetSQLValueString($row_users_db['type'].'', "text"),
                       $db1->GetSQLValueString($row_users_db['fname'], "text"),
                       $db1->GetSQLValueString($row_users_db['prod_type'], "text"));

  

  
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