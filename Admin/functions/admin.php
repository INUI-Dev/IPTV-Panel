<?php
function get_contents($url)
{
$ch = curl_init();
curl_setopt ($ch, CURLOPT_URL, $url);
curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, 5);
curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
$contents = curl_exec($ch);
if (curl_errno($ch)) {
  echo curl_error($ch);
  echo "\n<br />";
  $contents = '';
} else {
  curl_close($ch);
}

if (!is_string($contents) || !strlen($contents)) {
echo "Failed to get contents.";
$contents = '';
}
	return $contents;
}

function check_yt($url)
{
	
    
    
	parse_str( parse_url($url, PHP_URL_QUERY ), $vars );
 
    
    $id=$vars['v'];
    $dt=get_contents("https://www.youtube.com/get_video_info?video_id=$id&el=embedded&ps=default&eurl=&gl=US&hl=en");
    //var_dump(explode("&",$dt));
    if (strpos($dt, 'status=fail') !== false) {
		echo "https://www.youtube.com/get_video_info?video_id=$id&el=embedded&ps=default&eurl=&gl=US&hl=en
		";
		        return false;
		exit;
    }
	else
	{
		return true;
	}
}
function update_m3u($string,$image = 'noimg.jpg'){
preg_match_all('/(?P<tag>#EXTINF:0)|(?:(?P<prop_key>[-a-z]+)=\"(?P<prop_val>[^"]+)")|(?<something>,[^\r\n]+)|(?<url>http[^\s]+)/', $string, $match );

$count = count( $match[0] );
$index = -1;

for( $i =0; $i < $count; $i++ ){
    $item = $match[0][$i];

    if( !empty($match['tag'][$i])){
        //is a tag increment the result index
        ++$index;
    }elseif( !empty($match['prop_key'][$i])){
        //is a prop - split item
        $result[$index][$match['prop_key'][$i]] = $match['prop_val'][$i];
    }elseif( !empty($match['something'][$i])){
        //is a prop - split itemquer
        $result[$index]['something'] = $item;
    }elseif( !empty($match['url'][$i])){
        $result[$index]['url'] = $item ;
    }
}

$int1 = 0;
$counter['added'] = 0;
$counter['updated'] = 0;
foreach($result as $items)
{
if(isset($items['url'])){
if(!!isset($items['tvg-name']) or $items['tvg-name'] == '')
 {
 $tvg = str_replace(',','',$items['something']);
 }
		else{
		$tvg = $items['tvg-name'];
		}	

$query_title = sprintf("SELECT * FROM live WHERE name = %s",GetSQLValueString(str_replace(',','',$items['something']),'text',$GLOBALS['__Connect']));
$title = mysqli_query( $GLOBALS['__Connect'], $query_title) or die(mysqli_error($GLOBALS['__Connect']));
$row_title = mysqli_fetch_assoc($title);

$tota_rows_title = mysqli_num_rows($title);

if($tota_rows_title == 0){
$insertSQL = sprintf("INSERT INTO live(name,fname,image,visible,display,price,series,m3u_name,`desc`,views,`tvg_name`,added, likes) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,' ',0,%s,' ',0)",
  
 		   GetSQLValueString(str_replace(',','',$items['something']), "text",$GLOBALS['__Connect']),
					   GetSQLValueString($items['url'].' ', "text",$GLOBALS['__Connect']),
					   GetSQLValueString($image, "text",$GLOBALS['__Connect']),
					   GetSQLValueString('true', "text",$GLOBALS['__Connect']),
					   GetSQLValueString(cleanstring($items['something']).' ', "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['free'], "text",$GLOBALS['__Connect']),
                       GetSQLValueString($items['group-title'].' ', "text",$GLOBALS['__Connect']),
                       GetSQLValueString($_POST['date'].' ', "text",$GLOBALS['__Connect']),
                       GetSQLValueString($tvg.' ', "text",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  $counter['added']++;
}
else{
if($row_title['fname'] <> $items['url'].' ')
{ 
$counter['updated'] ++;
$insertSQL = sprintf("UPDATE live SET fname=%s WHERE name=%s",
  
					   GetSQLValueString($items['url'].' ', "text",$GLOBALS['__Connect']),
					   GetSQLValueString(str_replace(',','',$items['something']), "text",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
  
  $code1 = str_replace($row_title['fname'],$items['url'].' ');
  
  $insertSQL = sprintf("UPDATE streams SET code =%s WHERE item_id=%s and `type` = 'live'",
  
					   GetSQLValueString($code1.' ', "text",$GLOBALS['__Connect']),
					   GetSQLValueString($row_title['id'], "text",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  $int1++;
  
  $int1++;
  
  
 }else{
 
 }
}
}}

return $counter;

}



function db_query($query,$data,$max_db = 100,$startRow = 0,$enable = false,$pre = false)
{
if(defined('DBTYPE') && DBTYPE == 'mysql'){

$query_dbList = $query;
$query_limit_dbList = sprintf("%s LIMIT %d, %d", $query_dbList, $startRow, $max_db);
$dbList = mysql_query($query_limit_dbList) or die(mysql_error());
$row_dbList = mysql_fetch_assoc($dbList);
$i2 = 0;

do { for ($i = 0; $i < count($data); ++$i) {
        $list[$i2][$data[$i]] = $row_dbList[$data[$i]];
  } $i2++; } while ($row_dbList = mysql_fetch_assoc($dbList));

return $list;
}
else
{
if($enable)
{$pageNum = 0;
if (isset($_GET['pageNum'])) {
  if($pre){
		
  $pageNum = $_GET['pageNum'] - 1;
	}
	else{
  $pageNum = $_GET['pageNum'];
	}
}
$startRow = $pageNum * $max_db;
$list[0]['page_num'] = $pageNum;
}

$query_dbList = $query;
$query_limit_dbList = sprintf("%s LIMIT %d, %d", $query_dbList, $startRow, $max_db);
$dbList = mysqli_query($GLOBALS['__Connect'], $query_limit_dbList) or die(mysqli_error($GLOBALS['__Connect']));
$row_dbList = mysqli_fetch_assoc($dbList);
if (isset($_GET['totalRows_dbList'])) {
  $totalRows_dbList = $_GET['totalRows_dbList'];
} else {
  $all_dbList = mysqli_query($GLOBALS['__Connect'],$query_dbList);
  $totalRows_dbList = mysqli_num_rows($all_dbList);
}
$totalPages_dbList = ceil($totalRows_dbList/$max_db)-1;
if($totalRows_dbList == 0){
$list[0]['is_empty'] = 'true';
$list[0]['total_rows'] = 0;
$list[0]['total_pages'] = 0;
}
else
{
$list[0]['is_empty'] = 'false';
$list[0]['total_rows'] = $totalRows_dbList;
$list[0]['total_pages'] = $totalPages_dbList;


$i2 = 0;
do { 
if($row_dbList['name'] <> ''){ 
$list[$i2]['clean'] = cleanstring($row_dbList['name']);


}
for ($i = 0; $i < count($data); ++$i) {

        $list[$i2][$data[$i]] = $row_dbList[$data[$i]];
  } $i2++; } while ($row_dbList = mysqli_fetch_assoc($dbList));
  }
mysqli_free_result($dbList);
return $list;
}


}
function dateDiff($time1, $time2, $precision = 6) {
    // If not numeric then convert texts to unix timestamps
    if (!is_int($time1)) {
      $time1 = strtotime($time1);
    }
    if (!is_int($time2)) {
      $time2 = strtotime($time2);
    }
 
    // If time1 is bigger than time2
    // Then swap time1 and time2
    if ($time1 > $time2) {
      $ttime = $time1;
      $time1 = $time2;
      $time2 = $ttime;
    }
 
    // Set up intervals and diffs arrays
    $intervals = array('year','month','day','hour','minute','second');
    $diffs = array();
 
    // Loop thru all intervals
    foreach ($intervals as $interval) {
      // Set default diff to 0
      $diffs[$interval] = 0;
      // Create temp time from time1 and interval
      $ttime = strtotime("+1 " . $interval, $time1);
      // Loop until temp time is smaller than time2
      while ($time2 >= $ttime) {
	$time1 = $ttime;
	$diffs[$interval]++;
	// Create new temp time from time1 and interval
	$ttime = strtotime("+1 " . $interval, $time1);
      }
    }
 
    $count = 0;
    $times = array();
    // Loop thru all diffs
    foreach ($diffs as $interval => $value) {
      // Break if we have needed precission
      if ($count >= $precision) {
	break;
      }
      // Add value and interval 
      // if value is bigger than 0
      if ($value > 0) {
	// Add s if value is not 1
	if ($value != 1) {
	  $interval .= "s";
	}
	// Add value and interval to times array
	$times[] = $value . " " . $interval;
	$count++;
      }
    }
 
    // Return string with times
    return implode(", ", $times);
  }

function set_m3u_demand($string){
preg_match_all('/(?P<tag>#EXTINF:0)|(?:(?P<prop_key>[-a-z]+)=\"(?P<prop_val>[^"]+)")|(?<something>,[^\r\n]+)|(?<url>http[^\s]+)/', $string, $match );

$count = count( $match[0] );

$index = -1;

for( $i =0; $i < $count; $i++ ){
    $item = $match[0][$i];

    if( !empty($match['tag'][$i])){
        //is a tag increment the result index
        ++$index;
    }elseif( !empty($match['prop_key'][$i])){
        //is a prop - split item
        $result[$index][$match['prop_key'][$i]] = $match['prop_val'][$i];
    }elseif( !empty($match['something'][$i])){
        //is a prop - split item
        $result[$index]['something'] = $item;
    }elseif( !empty($match['url'][$i])){
        $result[$index]['url'] = $item ;
    }
}
 $insertSQL = sprintf("INSERT INTO `videos` (`id`, `fname`, `name`, `display`, `desc`, `views`, `series`, `image`, `dislike`, `length`, `type`, `visible`, `pass`, `featured`, `login`, `likes`, `added`, `liked_by`, `sub`, `iptv`) VALUES (NULL, 'jhgjhgjhg', 'jhgjhgjhg', 'jhgjhg', 'jhgjh', '0', 'gjhg', 'jjhgjhg', '0', 'jhgjhgjhg', 'jhgjhgjhg', 'true', 'none', 'false', 'false', '0', '0', 'none', 'false', 'true');");
  
 $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));;

 $content['streams'] = db_query("SELECT * FROM `videos` order by id desc ",array ('id'),100000,0);
 $intid = $content['streams'][0]['id'] + 1;
$added1 = 0;
foreach($result as $items)
{
if(isset($items['url'])){

$query_title = sprintf("SELECT * FROM vid_cate WHERE name=%s",GetSQLValueString($items['group-title'],'text',$GLOBALS['__Connect']));
$title = mysqli_query( $GLOBALS['__Connect'], $query_title) or die(mysqli_error($GLOBALS['__Connect']));
$row_title = mysqli_fetch_assoc($title);

$tota_rows_title = mysqli_num_rows($title);

if($tota_rows_title == 0){
if(isset($items['group-title']) && $items['group-title'] != '')
{
 $insertSQL = sprintf("INSERT INTO vid_cate (name) VALUES (%s)",
	
	GetSQLValueString($items['group-title'], "text",$GLOBALS['__Connect']));

  
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

}}

$fname = explode('.',$items['url']);
 if(1 ==1){
 if($fname[count($fname) - 1] == 'mp4'){
 $vvisible = 'true';
 }
 else
 {
  $vvisible = 'true';
 }
 
 }
 else{
  $vvisible = 'true';
  }
  
 mysqli_free_result($title);
 $query_title = sprintf("SELECT * FROM videos WHERE fname=%s",GetSQLValueString($items['url'],'text',$GLOBALS['__Connect']));
$title = mysqli_query( $GLOBALS['__Connect'], $query_title) or die(mysqli_error($GLOBALS['__Connect']));
$row_title = mysqli_fetch_assoc($title);

$tota_rows_title = mysqli_num_rows($title);
if($tota_rows_title == 0)
{
   $insertSQL = sprintf("INSERT INTO videos (added,login,featured,pass,visible, fname, name, `desc`, series, image, length, type,sub) VALUES (%s,%s,%s, %s, %s, %s, %s, %s, %s,%s,%s,%s,%s)",
	
	GetSQLValueString(date('Y-m-d H:i'), "text",$GLOBALS['__Connect']),
	GetSQLValueString('false', "text",$GLOBALS['__Connect']),
    GetSQLValueString('false', "text",$GLOBALS['__Connect']),
	GetSQLValueString(' ', "text",$GLOBALS['__Connect']),
	GetSQLValueString($vvisible, "text",$GLOBALS['__Connect']),
                       GetSQLValueString($items['url'], "text",$GLOBALS['__Connect']),
                       GetSQLValueString(str_replace(',','',$items['something']), "text",$GLOBALS['__Connect']),
                       GetSQLValueString(str_replace(',','',$items['something']), "text",$GLOBALS['__Connect']),
                       GetSQLValueString($items['group-title'].' ', "text",$GLOBALS['__Connect']),
                       GetSQLValueString($items['tvg-logo'].' ', "text",$GLOBALS['__Connect']),
                       GetSQLValueString(' ', "text",$GLOBALS['__Connect']),
                       GetSQLValueString("ondemand", "text",$GLOBALS['__Connect']),
                       GetSQLValueString($_POST['sub'], "text",$GLOBALS['__Connect']));

  
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
  
  
  
  
  $list5 = '#EXTINF:-1  tvg-logo="'.$items['tvg-logo'].'" tvg-name="'.str_replace(',','',$items['something']).'" group-title="VOD: '.$items['group-title'].'", '.str_replace(',','',$items['something']).'
'.str_replace('feature%3Dyoutube_gdata_player','','http://'.$_SERVER['HTTP_HOST'].site_root.'/stream.php/Video.mp4?url='.$intid).'&ministra
';

$insertSQL = sprintf("insert into ministra_streams (name,item_id,code,views,m3u) VALUES(%s,%s,%s,%s,0)",
  
				     
					   GetSQLValueString(str_replace(',','',$items['something']), "text",$GLOBALS['__Connect']),
					   GetSQLValueString($intid, "text",$GLOBALS['__Connect']),
					   GetSQLValueString($list5, "text",$GLOBALS['__Connect']),
					   GetSQLValueString(0, "int",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

$insertSQL = sprintf("delete from ministra_streams where name =''");
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

$added1++;
 $intid++;
} }
}

  $insertSQL = sprintf("Delete FROM `videos` where name='jhgjhgjhg'");
  
 $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
 return $added1;
 }
function set_m3u($string,$image = 'noimg.jpg'){
preg_match_all('/(?P<tag>#EXTINF:0)|(?:(?P<prop_key>[-a-z]+)=\"(?P<prop_val>[^"]+)")|(?<something>,[^\r\n]+)|(?<url>http[^\s]+)/', $string, $match );

$count = count( $match[0] );
$index = -1;

for( $i =0; $i < $count; $i++ ){
    $item = $match[0][$i];

    if( !empty($match['tag'][$i])){
        //is a tag increment the result index
        ++$index;
    }elseif( !empty($match['prop_key'][$i])){
        //is a prop - split item
        $result[$index][$match['prop_key'][$i]] = $match['prop_val'][$i];
    }elseif( !empty($match['something'][$i])){
        //is a prop - split item
        $result[$index]['something'] = $item;
    }elseif( !empty($match['url'][$i])){
        $result[$index]['url'] = $item ;
    }
}

$int1 = 0;
$insertSQL = sprintf("INSERT INTO `live` (name,fname,image,visible,display,price,series,m3u_name,`desc`,views,`tvg_name`,added, likes) VALUES('jhgjhgjhg','RGERGERGE','WEFWEFWE','WEFWEFWE','SFSDSDF','SEFSDFSDF','FSADFSDFSDF','SDFSDWEWFE','GFGF',1,'WEFWEFWEF','SEFSEDFSDF',1)");
  
 $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));;

 $content['streams'] = db_query("SELECT * FROM `live` order by id desc ",array ('id'),100000,0);
 $intid = $content['streams'][0]['id'] + 1;

foreach($result as $items)
{
if(isset($items['url'])){
if(!isset($items['tvg-name']) or isset($items['tvg-name']) && $items['tvg-name'] == '')
 {
 $tvg = str_replace(',','',$items['something']);
 }
		else{
		$tvg = $items['tvg-name'];
		}	

$insertSQL = sprintf("INSERT INTO live(name,fname,image,visible,display,price,series,m3u_name,`desc`,views,`tvg_name`,added, likes) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,' ',0,%s,' ',0)",
  
 		   GetSQLValueString(str_replace(',','',$items['something']), "text",$GLOBALS['__Connect']),
					   GetSQLValueString($items['url'].' ', "text",$GLOBALS['__Connect']),
					   GetSQLValueString($image, "text",$GLOBALS['__Connect']),
					   GetSQLValueString('true', "text",$GLOBALS['__Connect']),
					   GetSQLValueString(cleanstring($items['something']).' ', "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['free'], "text",$GLOBALS['__Connect']),
                       GetSQLValueString(@$items['group-title'].' ', "text",$GLOBALS['__Connect']),
                       GetSQLValueString($_POST['date'].' ', "text",$GLOBALS['__Connect']),
                       GetSQLValueString($tvg.' ', "text",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
   $list5 = '#EXTINF:-1  tvg-logo="'.$items['tvg-logo'].'" tvg-name="'.str_replace(',','',$items['something']).'" group-title="Live: '.$items['group-title'].'", '.str_replace(',','',$items['something']).'
'.str_replace('feature%3Dyoutube_gdata_player','','http://'.$_SERVER['HTTP_HOST'].site_root.'/stream-live.php/Video.m3u8?url='.$intid).'&ministra
';

$insertSQL = sprintf("insert into ministra_streams (name,item_id,code,views,m3u,`type`) VALUES(%s,%s,%s,%s,0,'live')",
  
				     
					   GetSQLValueString(str_replace(',','',$items['something']), "text",$GLOBALS['__Connect']),
					   GetSQLValueString($intid, "text",$GLOBALS['__Connect']),
					   GetSQLValueString($list5, "text",$GLOBALS['__Connect']),
					   GetSQLValueString(0, "int",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

$insertSQL = sprintf("delete from ministra_streams where name =''");
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
$intid++;
  $int1++;
 
}
}
 $insertSQL = sprintf("INSERT INTO m3u_names (name,items) VALUES(%s,%s)",
  
				     
					   GetSQLValueString($_POST['date'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($int1, "text",$GLOBALS['__Connect']));
  $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));


}

function cleanstring($string) {
   $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

   $string =  preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
  return preg_replace('/-+/', '-', $string);
}
function listFolderFiles($dir){
    $ffs = scandir($dir);

    unset($ffs[array_search('.', $ffs, true)]);
    unset($ffs[array_search('..', $ffs, true)]);

    // prevent empty ordered elements
    if (count($ffs) < 1)
        return;

    echo '<ol>';
    foreach($ffs as $ff){
        echo '<li>'.$ff;
        if(is_dir($dir.'/'.$ff)) listFolderFiles($dir.'/'.$ff);
        echo '</li>';
    }
    echo '</ol>';
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
if($row_user['active'] == 'true' or $row_user['role']  == 'Admin' or $row_user['active'] == 'true' or $row_user['role']  == 'Demo') {
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

function GetSQLValueString($theValue = '', $theType,$portfolio) 
{

  $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;

  $theValue = function_exists("mysqli_real_escape_string") ? mysqli_real_escape_string($portfolio,$theValue) : $theValue;

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
if (!isset($_SESSION)) {

  session_start();

}
function restrict()
{

$MM_authorizedusers_db = "Admin,Demo";

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



$MM_restrictGoTo = "login.php?pname=login";

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
?>