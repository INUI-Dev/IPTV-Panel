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
if(isset($_SESSION['MM_UserGroup']) && $_SESSION['MM_UserGroup'] != "Admin") { ?>Not authorized.<?php } else {
if((!empty($_FILES["uploaded_file"])) && ($_FILES['uploaded_file']['error'] == 0)) {

  //Check if the file is JPEG image and it's size is less than 350Kb
  $filename = basename($_FILES['uploaded_file']['name']);
  $ext = strtolower(substr($filename, strrpos($filename, '.') + 1));
  
  if (($ext == "zip")) {
    //Determine the path to which we want to save this file
      $fname = @md5(date("Hisms")).'.'.$ext;
	  $newname = $_SERVER['DOCUMENT_ROOT'].site_root.'/ipod_downloads/'.$fname;
      $fname2 = @md5(date("Hisms")).'.'.$_FILES['image']['name'];
	  $newname2 = $_SERVER['DOCUMENT_ROOT'].site_root.'/vidimgs/'.$fname2;
	  
        move_uploaded_file($_FILES['image']['tmp_name'],$newname2);    
	  $zip = new ZipArchive;
if ($zip->open($_FILES['uploaded_file']['tmp_name']) === TRUE) {
    $zip->extractTo('tmp/'.md5($_FILES['uploaded_file']['tmp_name']));
    $zip->close();
    echo 'ok';
	require_once('../getid3/getid3.php');

// Initialize getID3 engine
$getID3 = new getID3;

$DirectoryToScan = 'tmp/'.md5($_FILES['uploaded_file']['tmp_name']); // change to whatever directory you want to scan
$dir = opendir($DirectoryToScan);
if($_POST['artistnew'] <> 'none')
  {
  $artist = $_POST['artistnew'];
  }else
  {
  $artist = $_POST['artist'];
  }
while (($file = readdir($dir)) !== false) {
	$FullFileName = realpath($DirectoryToScan.'/'.$file);
	if ((substr($file, 0, 1) != '.') && is_file($FullFileName)) {
	
		$ThisFileInfo = $getID3->analyze($FullFileName);

		getid3_lib::CopyTagsToComments($ThisFileInfo);

		// output desired information in whatever format you want
		
	 move_uploaded_file($_FILES['uploaded_file']['tmp_name'],'../ipod_downloads/'.$fname.'.zip');
rename($FullFileName,'../ipod_downloads/'.md5($FullFileName).'.mp3');
		 $insertSQL = sprintf("INSERT INTO music (name,artist,album,fname,preview,image,visible,genre,sub) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)",
	GetSQLValueString(htmlentities(!empty($ThisFileInfo['comments_html']['title'])  ? implode('<br>', $ThisFileInfo['comments_html']['title'])          : chr(160)), "text"),
	GetSQLValueString($artist, "text"),
    GetSQLValueString($_POST['name'], "text"),
	GetSQLValueString(md5($FullFileName).'.mp3', "text"),
	GetSQLValueString(md5($FullFileName).'.mp3', "text"),
                       GetSQLValueString($fname2, "text"),
                       GetSQLValueString($_POST['hidden'], "text"),
                       GetSQLValueString($_POST['cata'], "text"),
                       GetSQLValueString($_POST['sub'], "text"));

  
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
  
   
	}
}$insertSQL = sprintf("INSERT INTO albums (zip,name,artist,image,genre,sub) VALUES (%s,%s,%s,%s,%s,%s)",
	GetSQLValueString($fname.'.zip', "text"),
	GetSQLValueString($_POST['name'], "text"),
		GetSQLValueString($artist, "text"),
                       GetSQLValueString($fname2, "text"),
                       GetSQLValueString($_POST['cata'], "text"),
                       GetSQLValueString($_POST['sub'], "text"));

  
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
	
} else {
    echo 'failed';
}
      //Check if the file with the same name is already exists on the server
      
  } else {
  if($_FILES["uploaded_file"]["size"] > 58720256) {
 define("msg","Error: Videos must be less than 7mb");
  }
  else
  {
    echo "Error: Invalid Video type";
  }}
} else {
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
