<?php
class auth extends db
{
function loginaction()
{
if (!isset($_SESSION)) {
  session_start();
}

mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
$loginFormAction = $_SERVER['PHP_SELF'];
if (isset($_GET['accesscheck'])) {
  $_SESSION['PrevUrl'] = $_GET['accesscheck'];
  
}

if (isset($_POST['uname'])) {
  $loginUsername=$_POST['uname'];
  $password=$_POST['pword'];
  $MM_fldUserAuthorization = "active";
  $MM_redirectLoginSuccess = "?";
  $MM_redirectLoginFailed = "?";
  $MM_redirecttoReferrer = true;
  
  	
  $LoginRS__query=sprintf("SELECT uname, pword, role FROM users_db WHERE email=%s AND pword=%s",
  db::GetSQLValueString($loginUsername, "text"), db::GetSQLValueString($password, "text")); 
   
  $LoginRS = mysqli_query($GLOBALS['__Connect'],$LoginRS__query) or die(mysqli_error($GLOBALS['__Connect']));
  $loginFoundUser = mysqli_num_rows($LoginRS);
  if ($loginFoundUser) {
    function mysqli_result($res, $row, $field=0) { 
    $res->data_seek($row); 
    $datarow = $res->fetch_array(); 
    return $datarow[$field]; 
} 
    $loginStrGroup  = mysqli_result($LoginRS,0,'role');
    mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
$query_user = sprintf("SELECT * FROM users_db WHERE email=%s", db::GetSQLValueString($_POST['uname'], "text"));
$user = mysqli_query( $GLOBALS['__Connect'], $query_user) or die(mysqli_error($GLOBALS['__Connect']));
$row_user = mysqli_fetch_assoc($user);
$tota_rows_user = mysqli_num_rows($user);
if($row_user['active'] == 'true' or $row_user['role']  == 'Admin') {
    //declare two session variables and assign them

    $_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)] = $loginUsername;

	
    $_SESSION['MM_UserGroup'] = $loginStrGroup;	  
	if(isset($_GET['accesscheck']))
	{
	$MM_redirectLoginSuccess = $_GET['accesscheck'];
	}
	elseif (isset($_SESSION['PrevUrl']) && true) {
      $MM_redirectLoginSuccess = $_SESSION['PrevUrl'];
	  }
	else
	{ 
      $MM_redirectLoginSuccess = site_root.'/account.html';	
}	
    
    header("Location: " . $MM_redirectLoginSuccess );
  
  }
	else
	{
	return 'notactive'; 
    
	}}
  else {
    $list['failed'] =  "failed";
	$list['username'] = htmlspecialchars($_POST['uname']);

  }  
	
    return $list;
}

}
function register()
{
if(isset($_POST['uname']) and isset($_POST['email']) and isset($_POST['pword']))
{
$content['user'] = db::db_query("SELECT * FROM users_db WHERE email=".db::GetSQLValueString($_POST['email'], "text")." ",array (
    "uname",
),1,0);
if($content['user'][0]['is_empty'] == 'false')
{
return 'email_taken';
}
$content['user'] = db::db_query("SELECT * FROM users_db WHERE uname=".db::GetSQLValueString($_POST['uname'], "text")." ",array (
    "uname",
),1,0);
if($content['user'][0]['is_empty'] == 'false')
{
return 'uname_taken';
}
$insertSQL = sprintf("INSERT INTO users_db (uname,email,pword,active) VALUES ( %s, %s, %s,'true')",
                      db::GetSQLValueString($_POST['uname'], "text"),
                       db::GetSQLValueString($_POST['email'], "text"),
                       db::GetSQLValueString($_POST['pword'], "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  return 'user_added';
}
}
}

?>