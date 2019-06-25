<?php
if(isset($_POST['length']) and isset($_POST['type']) and isset($_POST['id']))
{
$expires = date('YmdHis', strtotime('+ '.$_POST['length'].' '.$_POST['type']));
$insertSQL = sprintf("UPDATE `lines` set expires ='%s' Where id=%s",$expires,$_POST['id']);  

mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
}
if(isset($_GET['deleteall'])) {
$insertSQL = sprintf("DELETE FROM user_online");  
mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
$insertSQL = sprintf("DELETE FROM refer");  
mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
$insertSQL = sprintf("DELETE FROM browsers");  
mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
$insertSQL = sprintf("DELETE FROM country");  
mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
$insertSQL = sprintf("UPDATE settings set value='0'");  
mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

}
 $query_users_db = "SELECT id FROM files ";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$i = 0;


$smarty->assign('files_',$totalRows_users_db);
$users_db2 = '';

mysqli_free_result($users_db); 
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);

 




$users_db2 = array();



 $query_users_db = "SELECT * FROM users_db ORDER BY uname DESC";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$i = 0;
if($totalRows_users_db > 0){
do {
	
$users_db2[0]['totalRows_users_db'] = $totalRows_users_db;
$users_db2[$i]['uname'] = $row_users_db['uname'];
$users_db2[$i]['email'] = $row_users_db['email'];
$users_db2[$i]['role'] = $row_users_db['role'];
$users_db2[$i]['active'] = $row_users_db['active'];
$users_db2[$i]['signup_date'] = $row_users_db['signup_date'];
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

}
$smarty->assign('users_db',$users_db2);



$users_db2 = '';

$users_db2 = array();
mysqli_free_result($users_db); 

mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM country ORDER BY name ASC";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);

$i = 0;
do {
$country1[$i]['name'] = $row_users_db['name'];
$country1[$i]['city'] = $row_users_db['city'];
$country1[$i]['count'] = $row_users_db['count'];
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

 
$smarty->assign('country2',$country1);
$users_db2 = '';

mysqli_free_result($users_db);

$users_db2 = '';

mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM browsers ORDER BY os ASC";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$users_db2 = array();
$i = 0;
if($totalRows_users_db == 0){

$users_db2[$i]['is_empty'] = 'true';
}
else{

$users_db2[$i]['is_empty'] = 'false';
}
do {
$users_db2[$i]['os'] = $row_users_db['os'];
$users_db2[$i]['browser2'] = $row_users_db['browser'];
$users_db2[$i]['count'] = $row_users_db['count'];
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));




$smarty->assign('brow',$users_db2);
$users_db2 = '';

mysqli_free_result($users_db); 

 $query_users_db = "SELECT * FROM `lines`";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
if(1== 1)
{
$i = 0;
if($totalRows_users_db == 0)
{

$users_db3[$i]['is_empty'] = 'true';
}
else
{
$users_db3[$i]['is_empty'] = 'false';
}
do {
$users_db3[$i]['name'] = $row_users_db['name'];
$users_db3[$i]['id'] = $row_users_db['id'];
$users_db3[$i]['last_viewed'] = $row_users_db['last_viewed'];
$users_db3[$i]['user'] = $row_users_db['user'];
if($row_users_db['expires'] < date('YmdHis')){
$users_db3[$i]['expires'] = 'Expired';
}
else
{
$users_db3[$i]['expires'] = dateDiff($row_users_db['expires'],date('YmdHis'));
}
$users_db3[$i]['pass'] = $row_users_db['pass'];
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('lines',$users_db3);

$int1 = 1;
do{
$time[$int1] = $int1;
$int1 ++;
} while($int1 < 101);


$smarty->assign('time',$time);}
$content['user'] = db_query("SELECT * FROM live order BY id DESC",array (
    "name",'fname','image','series','id','views'
),10,0);
$smarty->assign('videos',$content['user']);
$content['vod'] = db_query("SELECT * FROM videos order BY id DESC",array (
    "name",'fname','image','series','id','views'
),10,0);
$smarty->assign('vod',$content['vod']);
?>