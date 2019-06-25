<?php
if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType) 
{
  $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  $theValue = function_exists("mysqli_real_escape_string") ? mysqli_real_escape_string($GLOBALS['__Connect'],$theValue) : mysqli_escape_string($theValue);

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? "'" . doubleval($theValue) . "'" : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}
}

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require_once('../config/config.php');
include('../functions/db.php');

$db1 = new db;
$db1->connect();
 if (!isset($_SESSION)) {
  session_start();
}
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
if(isset($_SESSION['MM_UserGroup']) && $_SESSION['MM_UserGroup'] != "Admin") { ?>Not authorized.<?php } else {
if((!empty($_FILES["uploaded_file"])) && ($_FILES['uploaded_file']['error'] == 0)) {

  //Check if the file is JPEG image and it's size is less than 350Kb
  $filename = basename($_FILES['uploaded_file']['name']);
  $ext = strtolower(substr($filename, strrpos($filename, '.') + 1));
  
  if (($ext == "mp4")) {
  
    //Determine the path to which we want to save this file
      $fname = md5(date("Hisms")).'.'.$ext;
	  $newname = $_SERVER['DOCUMENT_ROOT'].site_root.'/ipod_downloads/'.$fname;
      $fname2 = md5(date("Hisms")).'.'.$_FILES['image']['name'];
	  $newname2 = $_SERVER['DOCUMENT_ROOT'].site_root.'/vidimgs/'.$fname2;
      //Check if the file with the same name is already exists on the server
      if (!file_exists($newname)) {
        //Attempt to move the uploaded file to it's new place
		$str = str_replace($_SERVER['DOCUMENT_ROOT'].site_root,"",$newname);
		$str = str_replace("/uploads/","",$str);
        if ((1==1)) {
        move_uploaded_file($_FILES['uploaded_file']['tmp_name'],$newname);
        move_uploaded_file($_FILES['image']['tmp_name'],$newname2);    
			
		if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "form1")) {
		
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
  $insertSQL = sprintf("INSERT INTO videos (added,login,featured,pass,visible, fname, name, `desc`, series, image, length, type,sub) VALUES (%s,%s,%s, %s, %s, %s, %s, %s, %s,%s,%s,%s,%s)",
	GetSQLValueString(date('Y-m-d H:i'), "text"),
	GetSQLValueString($_POST['login'], "text"),
    GetSQLValueString($_POST['featured'], "text"),
	GetSQLValueString($_POST['pass'], "text"),
	GetSQLValueString($_POST['hidden'], "text"),
                       GetSQLValueString($fname, "text"),
                       GetSQLValueString($_POST['name'], "text"),
                       GetSQLValueString($_POST['desc'], "text"),
                       GetSQLValueString($_POST['cata'], "text"),
                       GetSQLValueString($fname2, "text"),
                       GetSQLValueString($_POST['length'], "text"),
                       GetSQLValueString("flash", "text"),
                       GetSQLValueString($_POST['sub'], "text"));

  
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  echo 'File added';
}


    
        } else {
           define("msg","Error: A problem occurred during file upload!");
        }
      } else {
         define("msg","Error: File ".$_FILES["uploaded_file"]["name"]." already exists");
      }
  } else {
  if($_FILES["uploaded_file"]["size"] > 58720256) {
 define("msg","Error: Videos must be less than 7mb");
  }
  else
  {
    echo "Error: Invalid Video type";
  }}
} else {
define("msg","");
define('done','done');
define('numeric','');
} }
?><style type="text/css">
.upload
{
font-weight:bold;
color:#FFFFFF;
background-color:#009900;
border:1px #000000 dashed;
padding:25px;
}

</style><div class="upload">