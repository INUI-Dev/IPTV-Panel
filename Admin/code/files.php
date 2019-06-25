<?php 
if(isset($_GET['id']) and isset($_GET['deleteimage']) and  $_SESSION['MM_UserGroup'] != 'Demo')
{

	  $insertSQL = sprintf("DELETE FROM  product_images WHERE id=%s and prod_id=%s",
      GetSQLValueString($_GET['deleteid'], "text",$GLOBALS['__Connect']),
      GetSQLValueString($_GET['id'], "text",$GLOBALS['__Connect']));
					 
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('imageadded','added');
}
if((!empty($_FILES["image"])) && ($_FILES['image']['error'] == 0)and  $_SESSION['MM_UserGroup'] != 'Demo') {

      $fname2 = md5(date("Hisms")).'.'.$_FILES['image']['name'];
	  $newname2 = $_SERVER['DOCUMENT_ROOT'].site_root.'/prod/'.$fname2;
	  if(move_uploaded_file($_FILES['image']['tmp_name'],$newname2))
	  {
	  $insertSQL = sprintf("INSERT INTO product_images (fname,prod_id,name) VALUES(%s,%s,'newimaghwe')",
      GetSQLValueString($fname2, "text",$GLOBALS['__Connect']),
      GetSQLValueString($_GET['id'], "text",$GLOBALS['__Connect']));
					 
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('imagedeleted','added');

	  }   
}

if(isset($_POST['add']))
{
$insertSQL = sprintf("INSERT INTO tabs (name,content,item_id) VALUES(%s,%s,%s)",
                       GetSQLValueString($_POST['tabname'], "text",$GLOBALS['__Connect']),
                       GetSQLValueString($_POST['tabdesc'], "text",$GLOBALS['__Connect']),
                       GetSQLValueString($_GET['id'], "int",$GLOBALS['__Connect']));
					 
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$smarty->assign('tab','added');

  }
if(isset($_GET['edit']) and isset($_GET['id'])){

if(isset($_POST['mminsert']))
{
 if((!empty($_FILES["image"])) && ($_FILES['image']['error'] == 0)) {
 
$insertSQL = sprintf("UPDATE files SET discount=%s, name=%s, image=%s,price=%s,`description`=%s,subscriptions=%s, category=%s, type=%s, length=%s WHERE id=".intval($_GET['id'])."",
	 $db1->GetSQLValueString($_POST['discount'], "text"),
	 $db1->GetSQLValueString($_POST['name'], "text"),
	 $db1->GetSQLValueString($fname2, "text"),
	 $db1->GetSQLValueString($_POST['price'], "text"),
	 $db1->GetSQLValueString($_POST['desc'], "text"),
	 $db1->GetSQLValueString($_POST['sub'], "text"),
	 $db1->GetSQLValueString($_POST['category'], "text"),
	 $db1->GetSQLValueString($_POST['type2'], "text"),
	 $db1->GetSQLValueString($_POST['length'], "text"));

  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

$smarty->assign('updated',true);
} else { 
 
$insertSQL = sprintf("UPDATE files SET discount=%s, name=%s,price=%s,`description`=%s,subscriptions=%s, category=%s, type=%s, length=%s WHERE id=".intval($_GET['id'])."",
	 $db1->GetSQLValueString($_POST['discount'], "text"),
	 $db1->GetSQLValueString($_POST['name'], "text"),
	 $db1->GetSQLValueString($_POST['price'], "text"),
	 $db1->GetSQLValueString($_POST['desc'], "text"),
	 $db1->GetSQLValueString($_POST['sub'], "text"),
	 $db1->GetSQLValueString($_POST['category'], "text"),
	 $db1->GetSQLValueString($_POST['type2'], "text"),
	 $db1->GetSQLValueString($_POST['length'], "text"));

  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
 
$smarty->assign('updated',true);
}
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
mysqli_free_result($users_db);
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM product_images WHERE prod_id = ".$db1->GetSQLValueString($_GET['id'], "int")." order by name asc";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
if($totalRows_users_db > 0){
$users_db3[0]['is_empty'] = 'false';
}
else
{
$users_db3[0]['is_empty'] = 'true';
}
$i = 0;
do {
$users_db3[$i]['name'] = $row_users_db['name'];
$users_db3[$i]['fname'] = $row_users_db['fname'];
$users_db3[$i]['prod_id'] = $row_users_db['prod_id'];
$users_db3[$i]['id'] = $row_users_db['id'];
;
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('images3',$users_db3);
mysqli_free_result($users_db);
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM files WHERE id = ".intval($_GET['id'])."";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$i = 0;
do {
$users_db2[$i]['name'] = $row_users_db['name'];
$users_db2[$i]['price'] = $row_users_db['price'];
$users_db2[$i]['discount'] = $row_users_db['discount'];
$users_db2[$i]['description'] = $row_users_db['description'];
$users_db2[$i]['type'] = $row_users_db['type'];
$users_db2[$i]['length'] = $row_users_db['length'];

$users_db2[$i]['image'] = $row_users_db['image'];
$users_db2[$i]['category'] = $row_users_db['category'];
$users_db2[$i]['id'] = $row_users_db['id'];
;
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));
if($totalRows_users_db > 0)
{
$users_db2[0]['is_empty'] = 'false';
}
else{
$users_db2[0]['is_empty'] = 'true';
}
$smarty->assign('edit2',$users_db2);

}
if(isset($_GET['delete']) and isset($_GET['id'])){
$insertSQL = sprintf("DELETE FROM files WHERE id=%s",
					   $db1->GetSQLValueString($_GET['id'], "int"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

$smarty->assign('deleted',true);

}
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM files order by id desc";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$i = 0;
do {
$users_db2[$i]['name'] = $row_users_db['name'];
$users_db2[$i]['price'] = $row_users_db['price'];
$users_db2[$i]['image'] = $row_users_db['image'];
$users_db2[$i]['id'] = $row_users_db['id'];
;
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('files',$users_db2);
mysqli_free_result($users_db);
$i=1;

do {
$list[$i]['list'] = $i;


$i ++;
} while ($i <= 100);
$smarty->assign('list',$list);


?>