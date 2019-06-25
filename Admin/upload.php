<?php
function cleanstring($string) {
   $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

   $string =  preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
  return preg_replace('/-+/', '-', $string);
}
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

require_once('../config/config.php');
include('../functions/db.php');

$db1 = new db;
$db1->connect();
 if (!isset($_SESSION)) {
  session_start();
}
if(isset($_SESSION['MM_UserGroup']) && $_SESSION['MM_UserGroup'] != "Admin") { ?>Not authorized.<?php } else {

 if((!empty($_FILES["image"])) && ($_FILES['image']['error'] == 0)) {

  
  if ((1==1)) {

    //Determecxine the path to which we want to save this file
      $fname = md5(date("Hisms")).'.';
	  $newname = $_SERVER['DOCUMENT_ROOT'].site_root.'/uploads2017/'.$fname;
      $fname2 = md5(date("Hisms")).'.'.$_FILES['image']['name'];
	  $newname2 = $_SERVER['DOCUMENT_ROOT'].site_root.'/prod/'.$fname2;
      //Check if the file with the same name is already exists on the server
      if (1==1) {
        //Attempt to move the uploaded file to it's new place
		
        if ((1==1)) {
        move_uploaded_file($_FILES['image']['tmp_name'],$newname2);    
			
		if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "form1")) {
		
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
  $insertSQL = sprintf("INSERT INTO files (category,display,discount, name, image, fname,price,`description`,subscriptions,line,length,type) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",
	GetSQLValueString($_POST['category'], "text"),
	GetSQLValueString(cleanstring($_POST['name']).'-'.md5($_POST['name']).'.html', "text"),
	GetSQLValueString($_POST['discount'], "text"),
	GetSQLValueString($_POST['name'], "text"),
	GetSQLValueString($fname2, "text"),
	GetSQLValueString($_POST['lines'], "text"),
	GetSQLValueString($_POST['price'], "text"),
	GetSQLValueString($_POST['desc'], "text"),
	GetSQLValueString($_POST['sub'], "text"),
	GetSQLValueString($_POST['lines'], "text"),
	GetSQLValueString($_POST['length'], "text"),
	GetSQLValueString($_POST['type'], "text"));

  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
 
  
  ?><style type="text/css">
.upload
{
font-weight:bold;
color:#FFFFFF;
background-color:#009900;
border:1px #000000 dashed;
padding:25px;
}.upload a
{
color:#FFFFFF;
}

</style><div class="upload"><?php
  echo 'File added'; ?><?php
}


    
        } else {
           define("msg","Error: A problem occurred during file upload!");
        }
      } else {
         define("msg","Error: File ".$_FILES["file"]["name"]." already exists");
      }
  } else {
  if($_FILES["file"]["size"] > 58720256) {
 define("msg","Error: files must be less than 7mb");
  }
  else
  {
    echo "Error: Invalid file type";
  }}
} else {
define("msg","");
define('done','done');
define('numeric','');
} }
?>