<?php //Main Functions For Front-end
date_default_timezone_set('Europe/London');
function get_theme($portfolio , $database_portfolio)
{

if (isset($_GET['pageNum'])) {
  $pageNum = $_GET['pageNum'];
}

mysqli_select_db($portfolio, $database_portfolio);
$query_linkiptv = "SELECT directory from themes where active ='true'";
$linkiptv = mysqli_query( $portfolio, $query_linkiptv) or die(mysqli_error($portfolio));
$row_linkiptv = mysqli_fetch_assoc($linkiptv);


  $totalRows_linkiptv = mysqli_num_rows($linkiptv);



$i = 0;
if($totalRows_linkiptv == 0)
{
	return 'default';
}
else
{
return $row_linkiptv['directory'];
	

		}

mysqli_free_result($linkiptv);
}

function get_current_pl($portfolio , $database_portfolio,$query,$limit,$page = 0)
{

$max_db = $limit;
$pageNum = $page;
if (isset($_GET['pageNum'])) {
  $pageNum = $_GET['pageNum'];
}
$startRow = $pageNum * $max_db;

mysqli_select_db($portfolio, $database_portfolio);
$query_linkiptv = $query;
$query_limit_linkiptv = sprintf("%s LIMIT %d, %d", $query_linkiptv, $startRow, $max_db);
$linkiptv = mysqli_query( $portfolio, $query_limit_linkiptv) or die(mysqli_error($portfolio));
$row_linkiptv = mysqli_fetch_assoc($linkiptv);

if (isset($_GET['totalRows_linkiptv'])) {
  $totalRows_linkiptv = $_GET['totalRows_linkiptv'];
} else {
  $all_linkiptv = mysqli_query($portfolio,$query_linkiptv);
  $totalRows_linkiptv = mysqli_num_rows($all_linkiptv);
}
$totalPages_linkiptv = ceil($totalRows_linkiptv/$max_db)-1;



$i = 0;
if($totalRows_linkiptv == 0)
{
	$list['is_empty']  = 'true';
}
else
{

	$list['is_empty']  = 'false';

		}
		return $list;

mysqli_free_result($linkiptv);
}


function get_ads($portfolio , $database_portfolio,$query,$limit,$page = 0)
{


mysqli_select_db($portfolio, $database_portfolio);
$query_linkiptv = $query;
$linkiptv = mysqli_query( $portfolio, $query_linkiptv) or die(mysqli_error($portfolio));
$row_linkiptv = mysqli_fetch_assoc($linkiptv);

  $totalRows_linkiptv = mysqli_num_rows($linkiptv);


$i = 0;
if($totalRows_linkiptv == 0)
{
	$list['empty']  = true;
}
else
{

	$list['empty']  = false;

	$list['is_empty']  = 'false';
	$list['html']  = $row_linkiptv['html'];
	

		}
		return $list;

mysqli_free_result($linkiptv);
}

function get_plist($portfolio , $database_portfolio,$query)
{

$query_linkiptv = $query;
$linkiptv = mysqli_query( $portfolio, $query_linkiptv) or die(mysqli_error($portfolio));
$row_linkiptv = mysqli_fetch_assoc($linkiptv);

if (isset($_GET['totalRows_linkiptv'])) {
  $totalRows_linkiptv = $_GET['totalRows_linkiptv'];
} else {
  $all_linkiptv = mysqli_query($portfolio,$query_linkiptv);
  $totalRows_linkiptv = mysqli_num_rows($all_linkiptv);
}



$i = 0;
if($totalRows_linkiptv == 0)
{
	$list['is_empty']  = 'true';
}
else
{
$i = 0;
do { 
	$list[$i]['is_empty'] = 'false';
	$list[$i]['rows'] = $totalRows_linkiptv;
	$list[$i]['name'] = $row_linkiptv['title'];
	$list[$i]['fname'] = $row_linkiptv['fname'];
	$list[$i]['duration'] = $row_linkiptv['duration'];
	$list[$i]['image'] = $row_linkiptv['image'];
	$list[$i]['type'] = $row_linkiptv['type'];
	$i ++;
} 
		while ($row_linkiptv = mysqli_fetch_assoc($linkiptv));
		}
		return $list;

mysqli_free_result($linkiptv);
}


function current_video($portfolio , $database_portfolio,$query,$limit,$page = 0)
{

$max_db = $limit;
$pageNum = $page;
if (isset($_GET['pageNum'])) {
  $pageNum = $_GET['pageNum'];
}
$startRow = $pageNum * $max_db;

mysqli_select_db($portfolio, $database_portfolio);
$query_linkiptv = $query;
$query_limit_linkiptv = sprintf("%s LIMIT %d, %d", $query_linkiptv, $startRow, $max_db);
$linkiptv = mysqli_query( $portfolio, $query_limit_linkiptv) or die(mysqli_error($portfolio));
$row_linkiptv = mysqli_fetch_assoc($dbList);

if (isset($_GET['totalRows_dbList'])) {
  $totalRows_dbList = $_GET['totalRows_dbList'];
} else {
  $all_dbList = mysqli_query($portfolio,$query_dbList);
  $totalRows_dbList = mysqli_num_rows($all_dbList);
}
$totalPages_dbList = ceil($totalRows_dbList/$max_db)-1;



$i = 0;
if($totalRows_dbList == 0)
{
	$list['is_empty']  = 'true';
}
else
{

	$list['is_empty']  = 'false';
	$list['total_rows']  = $totalRows_dbList;
	$list['total_pages']  = $totalPages_dbList;
	$list['page_num']  = $pageNum;
	
	$list['id'] = $row_dbList['id'];
$list['likes'] = $row_dbList['likes'];
						
if(txt_length < strlen($row_dbList['name']))
{
$nname = substr($row_dbList['name'],0,txt_length).'...';
}
else
{
$nname = $row_dbList['name'];
}
	$list['shortname'] = $nname;
	$list['name'] = $row_dbList['name'];
	$list['series'] = $row_dbList['series'];
	$list['fname'] = $row_dbList['fname'];
	$list['likes'] = $row_dbList['likes'];
	$list['views'] = $row_dbList['views'];
	$list['duration'] = $row_dbList['length'];
	$list['image'] = $row_dbList['image'];
	$list['length'] = $row_dbList['length'];
	$list['type'] = $row_dbList['type'];
	$list['views'] = $row_dbList['views'];
	$list['desc'] = str_replace("\n",'<br />',$row_dbList['desc']);
	
	if(rewrite_module == 'true')
	{
	$list['url'] = site_root.'/watch/'.$row_dbList['id'].'/'.cleanstring($row_dbList['name']).'.html';
	}
	else
	{
	$list['url'] = site_root.'/watch.php?id='.$row_dbList['id'];
	}
	if(isset($_GET['id']))
	{
			
			$insertSQL = sprintf("UPDATE videos SET views=views+1 WHERE id=%s",
                       GetSQLValueString($_GET['id'], "int",$portfolio));
					  
  

  
  mysqli_query($portfolio,$insertSQL) or die(mysqli_error($portfolio)); }


		}
		
		return $list;

mysqli_free_result($dbList);
}
function db_query($portfolio , $database_portfolio,$query,$limit,$page = 0)
{

$max_db = $limit;
$pageNum = $page;
if (isset($_GET['pageNum'])) {
  $pageNum = $_GET['pageNum'];
}
$startRow = $pageNum * $max_db;

mysqli_select_db($portfolio, $database_portfolio);
$query_dbList = $query;
$query_limit_dbList = sprintf("%s LIMIT %d, %d", $query_dbList, $startRow, $max_db);
$dbList = mysqli_query( $portfolio, $query_limit_dbList) or die(mysqli_error($portfolio));
$row_dbList = mysqli_fetch_assoc($dbList);

if (isset($_GET['totalRows_dbList'])) {
  $totalRows_dbList = $_GET['totalRows_dbList'];
} else {
  $all_dbList = mysqli_query($portfolio,$query_dbList);
  $totalRows_dbList = mysqli_num_rows($all_dbList);
}
$totalPages_dbList = ceil($totalRows_dbList/$max_db)-1;



$i = 0;
if($totalRows_dbList == 0)
{
	$list[0]['is_empty']  = 'true';
	
	$list[$i]['total_rows']  = 0;
	$list[$i]['total_pages']  = 0;
	$list[$i]['page_num']  = 0;
}
else
{

	
	
do
	{
	$list[$i]['is_empty']  = 'false';
	$list[$i]['total_rows']  = $totalRows_dbList;
	$list[$i]['total_pages']  = $totalPages_dbList;
	$list[$i]['page_num']  = $pageNum;
	$list[$i]['id'] = $row_dbList['id'];
$list[$i]['likes'] = $row_dbList['likes'];
						
if(txt_length < strlen($row_dbList['name']))
{
$nname = substr($row_dbList['name'],0,txt_length).'...';
}
else
{
$nname = $row_dbList['name'];
}
	$list[$i]['shortname'] = $nname;
	$list[$i]['name'] = $row_dbList['name'];
	$list[$i]['fname'] = $row_dbList['fname'];
	$list[$i]['views'] = $row_dbList['views'];
	if($row_dbList['type'] == 'yt' or $row_dbList['type'] == 'dm')
	{
	$list[$i]['image'] = $row_dbList['image'];
	}
	else
	{
	$list[$i]['image'] = 'vidimgs/'.$row_dbList['image'];
	}
	$list[$i]['length'] = $row_dbList['length'];
	$list[$i]['type'] = $row_dbList['type'];
	$list[$i]['featured'] = $row_dbList['featured'];
	$list[$i]['views'] = $row_dbList['views'];
	if(rewrite_module == 'true')
	{
	$list[$i]['url'] = site_root.'/watch/'.$row_dbList['id'].'/'.cleanstring($row_dbList['name']).'.html';
	}
	else
	{
	$list[$i]['url'] = site_root.'/watch.php?id='.$row_dbList['id'];
	}
			
			$i++;
			}
		while ($row_dbList = mysqli_fetch_assoc($dbList));
		}
		return $list;

mysqli_free_result($dbList);
}

function db_music($portfolio , $database_portfolio,$query,$limit,$pages=true,$page = 0)
{

$max_db = $limit;
$pageNum = $page;
if (isset($_GET['pageNum'])) {
  $pageNum = $_GET['pageNum'];
}
if($pages)
{

$startRow = $pageNum * $max_db;
}
else
{
$startRow = 0;
}

mysqli_select_db($portfolio, $database_portfolio);
$query_dbList = $query;
$query_limit_dbList = sprintf("%s LIMIT %d, %d", $query_dbList, $startRow, $max_db);
$dbList = mysqli_query( $portfolio, $query_limit_dbList) or die(mysqli_error($portfolio));
$row_dbList = mysqli_fetch_assoc($dbList);

if (isset($_GET['totalRows_dbList'])) {
  $totalRows_dbList = $_GET['totalRows_dbList'];
} else {
  $all_dbList = mysqli_query($portfolio,$query_dbList);
  $totalRows_dbList = mysqli_num_rows($all_dbList);
}
$totalPages_dbList = ceil($totalRows_dbList/$max_db)-1;



$i = 0;
if($totalRows_dbList == 0)
{
	$list[0]['is_empty']  = 'true';
	
	$list[$i]['total_rows']  = 0;
	$list[$i]['total_pages']  = 0;
	$list[$i]['page_num']  = 0;
}
else
{

	
	
do
	{
	$list[$i]['is_empty']  = 'false';
	$list[$i]['total_rows']  = $totalRows_dbList;
	$list[$i]['total_pages']  = $totalPages_dbList;
	$list[$i]['page_num']  = $pageNum;
	$list[$i]['name'] = $row_dbList['name'];
	$list[$i]['artist'] = $row_dbList['artist'];
	$list[$i]['id'] = $row_dbList['id'];
	$list[$i]['album'] = $row_dbList['album'];
	$list[$i]['fname'] = site_root.'/ipod_downloads/'.$row_dbList['fname'];
	$list[$i]['url'] = site_root.'/audio/'.$row_dbList['id'].'/'.cleanstring($row_dbList['artist'].' '.$row_dbList['name']).'.html';
	$list[$i]['image'] = site_root.'/vidimgs/'.$row_dbList['image'];
	
			
			$i++;
			}
		while ($row_dbList = mysqli_fetch_assoc($dbList));
		}
		return $list;

mysqli_free_result($dbList);
}



function db_current_music($portfolio , $database_portfolio,$query,$limit,$page = 0)
{

$max_db = $limit;
$pageNum = $page;
if (isset($_GET['pageNum'])) {
  $pageNum = $_GET['pageNum'];
}
$startRow = $pageNum * $max_db;

mysqli_select_db($portfolio, $database_portfolio);
$query_dbList = $query;
$query_limit_dbList = sprintf("%s LIMIT %d, %d", $query_dbList, $startRow, $max_db);
$dbList = mysqli_query( $portfolio, $query_limit_dbList) or die(mysqli_error($portfolio));
$row_dbList = mysqli_fetch_assoc($dbList);

if (isset($_GET['totalRows_dbList'])) {
  $totalRows_dbList = $_GET['totalRows_dbList'];
} else {
  $all_dbList = mysqli_query($portfolio,$query_dbList);
  $totalRows_dbList = mysqli_num_rows($all_dbList);
}
$totalPages_dbList = ceil($totalRows_dbList/$max_db)-1;



$i = 0;
if($totalRows_dbList == 0)
{
	$list['is_empty']  = 'true';
	
	$list['total_rows']  = 0;
	$list['total_pages']  = 0;
	$list['page_num']  = 0;
}
else
{

	
	
	$list['is_empty']  = 'false';
	$list['total_rows']  = $totalRows_dbList;
	$list['total_pages']  = $totalPages_dbList;
	$list['page_num']  = $pageNum;
	$list['name'] = $row_dbList['name'];
	$list['artist'] = $row_dbList['artist'];
	$list['price'] = $row_dbList['price'];
	$list['id'] = $row_dbList['id'];
	$list['url'] = site_root.'/audio/'.$row_dbList['id'].'/'.cleanstring($row_dbList['artist'].' '.$row_dbList['name']).'.html';
	$list['download'] = site_root.'/download/'.$row_dbList['zip'];
	$list['image'] = site_root.'/vidimgs/'.$row_dbList['image'];
	
			
		}
		return $list;

mysqli_free_result($dbList);
}
function categories($portfolio , $database_portfolio,$query)
{


mysqli_select_db($portfolio, $database_portfolio);
$dbList = mysqli_query( $portfolio, $query) or die(mysqli_error($portfolio));
$row_dbList = mysqli_fetch_assoc($dbList);

  $totalRows_dbList = mysqli_num_rows($dbList);
$i = 0;
if($totalRows_dbList == 0)
{
	$list[0]['is_empty']  = 'true';
}
else
{

	$list[0]['is_empty']  = 'false';
	$list[0]['total_rows']  = $totalRows_dbList;

	
do
	{
	
	$list[$i]['id'] = $row_dbList['id'];

		
			$i++;
			}
		while ($row_dbList = mysqli_fetch_assoc($dbList));
		}
		return $list;

mysqli_free_result($dbList);
}

function genres($portfolio , $database_portfolio,$query)
{


mysqli_select_db($portfolio, $database_portfolio);
$dbList = mysqli_query( $portfolio, $query) or die(mysqli_error($portfolio));
$row_dbList = mysqli_fetch_assoc($dbList);

  $totalRows_dbList = mysqli_num_rows($dbList);
$i = 0;
if($totalRows_dbList == 0)
{
	$list[0]['is_empty']  = 'true';
}
else
{

	$list[0]['is_empty']  = 'false';
	$list[0]['total_rows']  = $totalRows_dbList;

	
do
	{
	
	$list[$i]['id'] = $row_dbList['id'];
	$list[$i]['name'] = $row_dbList['name'];

		
			$i++;
			}
		while ($row_dbList = mysqli_fetch_assoc($dbList));
		}
		return $list;

mysqli_free_result($dbList);
}
function cleanstring($string) {
   $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

   $string =  preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
  return preg_replace('/-+/', '-', $string);
}

function page_title($portfolio , $database_portfolio,$id,$variable,$text = '')
{
$maxRows_title = 10;
$pageNum_view_title = 0;
if (isset($_GET['pageNum_view_title'])) {
  $pageNum_view_title = $_GET['pageNum_view_title'];
}
$startRow_title = $pageNum_view_title * $maxRows_title;

mysqli_select_db($portfolio, $database_portfolio);
$query_title = sprintf("SELECT * FROM page_title WHERE page_id=%s",GetSQLValueString($id,'text',$portfolio));
$title = mysqli_query( $portfolio, $query_title) or die(mysqli_error($portfolio));
$row_title = mysqli_fetch_assoc($title);

  $totalRows_title = mysqli_num_rows($title);

if($totalRows_title > 0)
{
	$list['is_empty'] =  'false';
	
if($variable == '' and $text == '')
{

$title = sprintf($row_title['text'],
          'In2streams.co');
	$list['title'] =  $title;
}
else
{
if($text == '')
{

	$list['desc'] =  sprintf($row_title['metadesc'],$_GET[$variable],'In2streams.co');
	$list['key'] =  sprintf($row_title['metakey'],$_GET[$variable],'In2streams.co');
$title = sprintf($row_title['text'],
          $_GET[$variable],'In2streams.co');
	$list['title'] =  $title;
}
else
{
$title = sprintf($row_title['text'],
          $text,'In2streams.co');
	$list['title'] =  $title;
	
	$list['desc'] =  sprintf($row_title['metadesc'],$text,'In2streams.co');
	$list['key'] =  sprintf($row_title['metakey'],$text,'In2streams.co');
	}
}	
}
else
{
	$list['is_empty'] =  'true';
	
}


			
		
		return $list;


}
function GetSQLValueString($theValue = '', $theType,$portfolio) 
{

  $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;

  if(is_string($theValue)) { $theValue = function_exists("mysqli_real_escape_string") ? mysqli_real_escape_string($portfolio,$theValue) : $theValue;}

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
function is_ios()
{
if (strlen(strstr($_SERVER['HTTP_USER_AGENT'], "iPad") )>0 or strlen(strstr(strtolower($_SERVER['HTTP_USER_AGENT']), "playstation"))>0 or strlen(strstr($_SERVER['HTTP_USER_AGENT'], "iPhone")) or strlen(strstr($_SERVER['HTTP_USER_AGENT'], "iPod")) or strlen(strstr($_SERVER['HTTP_USER_AGENT'], "Android")) or strlen(strstr(strtolower($_SERVER['HTTP_USER_AGENT']), "xbox") )>0  or strlen(strstr(strtolower($_SERVER['HTTP_USER_AGENT']), "tv") )>0) {

if(!defined('isios')) { define("isios","true"); } 

}
else
{
if(!defined('isios')) { define("isios","false"); } 
}
}
function set_comment($portfolio , $database_portfolio)
{
if(isset($_POST['name']) and isset($_POST['comment']))
{
$insertSQL = sprintf("INSERT INTO comments (coment,pageid,item_id,image,name) VALUES ( %s, %s, %s,%s,%s)",
                       GetSQLValueString($_POST['comment'], "text",$portfolio),
                       GetSQLValueString('watch.php', "text",$portfolio),
                       GetSQLValueString($_GET['id'], "text",$portfolio),
                       GetSQLValueString($_POST['thumb'], "text",$portfolio),
                       GetSQLValueString($_POST['name'], "text",$portfolio));

  

  
  mysqli_query($portfolio,$insertSQL) or die(mysqli_error($portfolio));

}
}

function set_like($portfolio , $database_portfolio)
{
if(isset($_GET['id']))
{
mysqli_select_db($portfolio, $database_portfolio);
$query_title = sprintf("SELECT * FROM videos WHERE `liked_by` LIKE %s AND id=%s",GetSQLValueString("%".$_SERVER['REMOTE_ADDR']."%",'text',$portfolio),GetSQLValueString($_GET['id'],'int',$portfolio));
$title = mysqli_query( $portfolio, $query_title) or die(mysqli_error($portfolio));
$row_title = mysqli_fetch_assoc($title);

  $totalRows_title = mysqli_num_rows($title);
if($totalRows_title == 0)
{
$insertSQL = sprintf("UPDATE videos SET likes=likes+1 WHERE id=%s",
                       GetSQLValueString($_GET['id'], "int",$portfolio));

  

  
  mysqli_query($portfolio,$insertSQL) or die(mysqli_error($portfolio));
  mysqli_free_result($title);
  
$query_title = sprintf("SELECT * FROM videos WHERE id=%s",GetSQLValueString($_GET['id'],'int',$portfolio));
$title = mysqli_query( $portfolio, $query_title) or die(mysqli_error($portfolio));
$row_title = mysqli_fetch_assoc($title);

  $totalRows_title = mysqli_num_rows($title);

$insertSQL = sprintf("UPDATE videos SET liked_by=%s WHERE id=%s",
                       GetSQLValueString($row_title['liked_by'].' '.$_SERVER['REMOTE_ADDR'], "text",$portfolio),
					   GetSQLValueString($_GET['id'], "int",$portfolio));


  mysqli_free_result($title);
  mysqli_query($portfolio,$insertSQL) or die(mysqli_error($portfolio));


echo '[{
    "success": "true",
    "error": "None"
}]';
}
else
{
echo '{
    "success": "false",
    "error": "None"
}';

}
}
}
function get_user_info($portfolio , $database_portfolio)
{


mysqli_select_db($portfolio, $database_portfolio);
$query_dbList = "SELECT * FROM users_db WHERE uname='".$_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]."'";
$dbList = mysqli_query( $portfolio, $query_dbList) or die(mysqli_error($portfolio));
$row_dbList = mysqli_fetch_assoc($dbList);


  $totalRows_dbList = mysqli_num_rows($dbList);



$i = 0;
if($totalRows_dbList == 0)
{
	$list['is_empty']  = 'true';
	
	$list['image'] = 'noimg.jpg';
	
	$list['role'] = 'NONE';
	$list['uname'] = 'NONE';
}
else
{

	$list['is_empty']  = 'false';
	
	$list['image'] = $row_dbList['image'];
	
	$list['role'] = $row_dbList['role'];
	$list['uname'] = $row_dbList['uname'];
		}
		return $list;

mysqli_free_result($dbList);
}
function get_comments($portfolio , $database_portfolio,$query)
{


mysqli_select_db($portfolio, $database_portfolio);
$query_dbList = $query;
$dbList = mysqli_query( $portfolio, $query_dbList) or die(mysqli_error($portfolio));
$row_dbList = mysqli_fetch_assoc($dbList);


  $totalRows_dbList = mysqli_num_rows($dbList);



$i = 0;
if($totalRows_dbList == 0)
{
	$list[0]['is_empty']  = 'true';
	
	$list[$i]['total_rows']  = 0;
}
else
{
$i=0;
do { 

	$list[0]['is_empty']  = 'false';
	$list[$i]['total_rows']  = $totalRows_dbList;
	
	$list[$i]['id'] = $row_dbList['id'];
	$list[$i]['coment'] = $row_dbList['coment'];
	$list[$i]['pageid'] = $row_dbList['pageid'];
	$list[$i]['image'] = $row_dbList['image'];
	$list[$i]['name'] = $row_dbList['name'];
	$i ++;
}
		while ($row_dbList = mysqli_fetch_assoc($dbList));	
		}
		
		return $list;

mysqli_free_result($dbList);
}
function login_action($portfolio , $database_portfolio)
{

// *** Validate request to login to this site.
if (!isset($_SESSION)) {
  session_start();
}

mysqli_select_db($portfolio, $database_portfolio);
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
  
  	
  $LoginRS__query=sprintf("SELECT uname, pword, role FROM users_db WHERE uname=%s AND pword=%s",
  GetSQLValueString($loginUsername, "text",$portfolio), GetSQLValueString($password, "text",$portfolio)); 
   
  $LoginRS = mysqli_query($portfolio,$LoginRS__query) or die(mysqli_error($portfolio));
  $loginFoundUser = mysqli_num_rows($LoginRS);
  if ($loginFoundUser) {
    function mysqli_result($res, $row, $field=0) { 
    $res->data_seek($row); 
    $datarow = $res->fetch_array(); 
    return $datarow[$field]; 
} 
    $loginStrGroup  = mysqli_result($LoginRS,0,'role');
    mysqli_select_db($portfolio, $database_portfolio);
$query_user = sprintf("SELECT * FROM users_db WHERE uname=%s", GetSQLValueString($_POST['uname'], "text",$portfolio));
$user = mysqli_query( $portfolio, $query_user) or die(mysqli_error($portfolio));
$row_user = mysqli_fetch_assoc($user);
$tota_rows_user = mysqli_num_rows($user);
if($row_user['active'] == 'true' or $row_user['role']  == 'Admin') {
    //declare two session variables and assign them

    $_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)] = $loginUsername;
	$_SESSION['thumb'] = $row_user['image'];
	
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
      $MM_redirectLoginSuccess = site_root.'/';	
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
function add_playlist($portfolio , $database_portfolio)
{
if(isset($_GET['id']))
{
$contentv = current_video($portfolio , $database_portfolio,
"SELECT * FROM videos
 WHERE id=".GetSQLValueString($_GET['id'],'int',$portfolio)
,video_items_limit);
$insertSQL = sprintf("INSERT INTO playlist (title,fname,type,uname,image,video_id,duration) VALUES ( %s, %s, %s,%s,%s,%s,%s)",
                       GetSQLValueString($contentv['name'], "text",$portfolio),
                       GetSQLValueString($contentv['fname'], "text",$portfolio),
                       GetSQLValueString($contentv['type'], "text",$portfolio),
                       GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text",$portfolio),
                       GetSQLValueString($contentv['image'], "text",$portfolio),
                       GetSQLValueString($contentv['id'], "text",$portfolio),
                       GetSQLValueString($contentv['duration'], "text",$portfolio));

  

  
  mysqli_query($portfolio,$insertSQL) or die(mysqli_error($portfolio));

}
}
function restrict()
{
$MM_authorizedusers_db = "Admin,Demo,User";

$MM_donotCheckaccess = "false";



// *** Restrict Access To Page: Grant or deny access to this page

function isAuthorized($strusers_db, $strGroups, $UserName, $UserGroup) { 

  // For security, start by assuming the visitor is NOT authorized. 

  $isValid = False; 



  // When a visitor has logged into this site, the Session variable MM_Username set equal to their username. 

  // Therefore, we know that a user is NOT logged in if that Session variable is blank. 

  if (!empty($UserName)) { 

    // Besides being logged in, you may restrict access to only certain users_db based on an ID established when they login. 

    // Parse the strings into arrays. 

    $arrusers_db = Explode(",", $strusers_db); 

    $arrGroups = Explode(",", $strGroups); 

    if (in_array($UserName, $arrusers_db)) { 

      $isValid = true; 

    } 

    // Or, you may restrict access to only certain users_db based on their username. 

    if (in_array($UserGroup, $arrGroups)) { 

      $isValid = true; 

    } 

    if (($strusers_db == "") && false) { 

      $isValid = true; 

    } 

  } 

  return $isValid; 

}



$MM_restrictGoTo = "login.php";

if (!((isset($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)])) && (isAuthorized("",$MM_authorizedusers_db, $_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], $_SESSION['MM_UserGroup'])))) {   

  $MM_qsChar = "?";

  $MM_referrer = $_SERVER['REQUEST_URI'];

  if (strpos($MM_restrictGoTo, "?")) $MM_qsChar = "&";

  if (isset($QUERY_STRING) && strlen($QUERY_STRING) > 0) 

  $MM_referrer .= "?" . $QUERY_STRING;

  $MM_restrictGoTo = $MM_restrictGoTo. $MM_qsChar . "accesscheck=" . urlencode($MM_referrer);

  header("Location: ". $MM_restrictGoTo); 

  exit;

 }

}
function log_out()
{
 //to fully log out a visitor we need to clear the session varialbles
  $_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)] = NULL;
  $_SESSION['MM_UserGroup'] = NULL;
  $_SESSION['PrevUrl'] = NULL;
  unset($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]);
  unset($_SESSION['MM_UserGroup']);
  unset($_SESSION['PrevUrl']);
  session_unset();
    $_SESSION['FBID'] = NULL;
    $_SESSION['USERNAME'] = NULL;
    $_SESSION['FULLNAME'] = NULL;
    $_SESSION['EMAIL'] =  NULL;
    $_SESSION['LOGOUT'] = NULL;
   
header("Location: ".site_root."/");
}







function register($portfolio , $database_portfolio)
{
if(isset($_POST['uname']) and isset($_POST['email']) and isset($_POST['pword']))
{

mysqli_select_db($portfolio, $database_portfolio);
$query_user = sprintf("SELECT uname FROM users_db WHERE uname=%s", GetSQLValueString($_POST['uname'], "text",$portfolio));
$user = mysqli_query( $portfolio, $query_user) or die(mysqli_error($portfolio));
$row_user = mysqli_fetch_assoc($user);
$tota_rows_user = mysqli_num_rows($user);
if($tota_rows_user > 0)
{
$list['user_taken'] = true;
$fail = true;

$list['username'] = htmlspecialchars($_POST['uname']);
$list['email_add'] = htmlspecialchars($_POST['email']);
}
mysqli_free_result($user);
mysqli_select_db($portfolio, $database_portfolio);
$query_user = sprintf("SELECT uname FROM users_db WHERE email=%s", GetSQLValueString($_POST['email'], "text",$portfolio));
$user = mysqli_query( $portfolio, $query_user) or die(mysqli_error($portfolio));
$row_user = mysqli_fetch_assoc($user);
$tota_rows_user = mysqli_num_rows($user);
if($tota_rows_user > 0)
{
$list['email_taken'] = true;
$fail = true;

$list['username'] = htmlspecialchars($_POST['uname']);
$list['email_add'] = htmlspecialchars($_POST['email']);
}
if(!isset($fail))
{
$insertSQL = sprintf("INSERT INTO users_db (uname,pword,email,active,role) VALUES ( %s, %s, %s,%s,'User')",
                       GetSQLValueString($_POST['uname'], "text",$portfolio),
                       GetSQLValueString($_POST['pword'], "text",$portfolio),
                       GetSQLValueString($_POST['email'], "text",$portfolio),
                       GetSQLValueString(active, "text",$portfolio));

  

  
  mysqli_query($portfolio,$insertSQL) or die(mysqli_error($portfolio));
  $mail_to= $_POST['email'];

$mail_from='admin@in2streams.co';

$mail_sub=subj;

$mail_mesg= sprintf(msg,"\n".'Welcome to '.$_SERVER['HTTP_HOST']);
require_once('PHPMailer/class.phpmailer.php');
require_once('PHPMailer/PHPMailerAutoload.php');
//Create a new PHPMailer instance
$mail = new PHPMailer;
//Tell PHPMailer to use SMTP
$mail->isSMTP();
//Enable SMTP debugging
// 0 = off (for production use)
// 1 = client messages
//Ask for HTML-friendly debug output
//Set the hostname of the mail server
$mail->Host = mail_host;
// use
// $mail->Host = gethostbyname('smtp.gmail.com');
// if your network does not support SMTP over IPv6
//Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
$mail->Port = 587;
//Set the encryption system to use - ssl (deprecated) or tls
$mail->SMTPSecure = 'tls';
//Whether to use SMTP authentication
$mail->SMTPAuth = true;
//Username to use for SMTP authentication - use full email address for gmail
$mail->Username = emailsigb;
//Password to use for SMTP authentication
$mail->Password = email_pass;
//Set who the message is to be sent from
$mail->setFrom($mail_from, 'Registration');
//Set an alternative reply-to address
//Set who the message is to be sent to
$mail->addAddress($mail_to, 'NoReply');
//Set the subject line
$mail->Subject = $mail_sub;
//Read an HTML message body from an external file, convert referenced images to embedded,
//convert HTML into a basic plain-text alternative body
$mail->msgHTML($mail_mesg);
//Replace the plain text body with one created manually
//Attach an image file
//send the message, check for errors
if (!$mail->send()) {
    echo "Mailer Error: " . $mail->ErrorInfo;
} else {
  $list['email'] = 'true';
  
}
}
mysqli_free_result($user);
	}
	else
	{ 
	$list = false;
	}
    return $list;
}
function db_album($portfolio , $database_portfolio,$query,$limit,$page = 0)
{

$max_db = $limit;
$pageNum = $page;
if (isset($_GET['pageNum'])) {
  $pageNum = $_GET['pageNum'];
}
$startRow = $pageNum * $max_db;

mysqli_select_db($portfolio, $database_portfolio);
$query_dbList = $query;
$query_limit_dbList = sprintf("%s LIMIT %d, %d", $query_dbList, $startRow, $max_db);
$dbList = mysqli_query( $portfolio, $query_limit_dbList) or die(mysqli_error($portfolio));
$row_dbList = mysqli_fetch_assoc($dbList);

if (isset($_GET['totalRows_dbList'])) {
  $totalRows_dbList = $_GET['totalRows_dbList'];
} else {
  $all_dbList = mysqli_query($portfolio,$query_dbList);
  $totalRows_dbList = mysqli_num_rows($all_dbList);
}
$totalPages_dbList = ceil($totalRows_dbList/$max_db)-1;



$i = 0;
if($totalRows_dbList == 0)
{
	$list[0]['is_empty']  = 'true';
	
	$list[$i]['total_rows']  = 0;
	$list[$i]['total_pages']  = 0;
	$list[$i]['page_num']  = 0;
}
else
{

	
	
do
	{
	$list[$i]['is_empty']  = 'false';
	$list[$i]['total_rows']  = $totalRows_dbList;
	$list[$i]['total_pages']  = $totalPages_dbList;
	$list[$i]['page_num']  = $pageNum;
	$list[$i]['name'] = $row_dbList['name'];
	$list[$i]['artist'] = $row_dbList['artist'];
	$list[$i]['id'] = $row_dbList['id'];
	$list[$i]['items'] = $row_dbList['items'];
	$list[$i]['image'] = $row_dbList['image']
	;$list[$i]['url'] = site_root.'/album/'.$row_dbList['id'].'/'.cleanstring($row_dbList['artist'].' '.$row_dbList['name']).'.html';
	$list[$i]['image'] = site_root.'/vidimgs/'.$row_dbList['image'];
	
			
			$i++;
			}
		while ($row_dbList = mysqli_fetch_assoc($dbList));
		}
		return $list;

mysqli_free_result($dbList);
}
?>