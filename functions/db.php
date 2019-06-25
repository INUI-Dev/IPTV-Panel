<?php
class db{
function cleanstring($string) {
   $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

   $string =  preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
  return preg_replace('/-+/', '-', $string);
}

public function connect(){
//Get connection Type
if(defined('DBTYPE') && DBTYPE == 'mysql'){

$GLOBALS['__Connect'] =  mysql_connect(hostname_portfolio, username_portfolio, password_portfolio) or trigger_error(mysql_error(),E_USER_ERROR);

mysql_select_db(database_portfolio, $GLOBALS['__Connect']);
}

else{
$GLOBALS['__Connect'] =  mysqli_connect(hostname_portfolio, username_portfolio, password_portfolio,database_portfolio) or trigger_error(mysqli_error(),E_USER_ERROR);


}
//End Connection type

}
function db_query($query,$data,$max_db = 100,$startRow = 0,$enable = false)
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
  $pageNum = $_GET['pageNum'];
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
$list[$i2]['clean'] = $this->cleanstring($row_dbList['name']);


}
for ($i = 0; $i < count($data); ++$i) {

        $list[$i2][$data[$i]] = $row_dbList[$data[$i]];
  } $i2++; } while ($row_dbList = mysqli_fetch_assoc($dbList));
  }
mysqli_free_result($dbList);
return $list;
}


}
function GetSQLValueString($theValue = '', $theType) 
{

  $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;

  if(is_string($theValue)) { $theValue = function_exists("mysqli_real_escape_string") ? mysqli_real_escape_string($GLOBALS['__Connect'],$theValue) : $theValue;}

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
function page_title($id,$variable,$text = '')
{
if(defined('DBTYPE') && DBTYPE == 'mysql'){

$query_title = sprintf("SELECT * FROM page_title WHERE page_id=%s",$this->GetSQLValueString($id,'text'));
$title = mysql_query($query_title) or die(mysql_error());
$row_title = mysql_fetch_assoc($title);

  $totalRows_title = mysql_num_rows($title);

}
 else
{

$query_title = sprintf("SELECT * FROM page_title WHERE page_id=%s",$this->GetSQLValueString($id,'text'));
$dbList = mysqli_query($GLOBALS['__Connect'], $query_title) or die(mysqli_error($GLOBALS['__Connect']));
$row_title = mysqli_fetch_assoc($dbList);
$totalRows_title = mysqli_num_rows($dbList);
}
if($totalRows_title > 0)
{
	$list['is_empty'] =  'false';
	
if($variable == '' and $text == '')
{

$title = sprintf($row_title['text'],
          'In2streams.co');
	$list['title'] =  $title;
	$list['desc'] =  $row_title['metadesc'];
	$list['key'] =  $row_title['metakey'];
}
else
{
if($text == '')
{

	$list['desc'] =  sprintf($row_title['metadesc'],$_GET[$variable],'In2streams.co');
	$list['key'] =  sprintf($row_title['metakey'],$_GET[$variable],'In2streams.co');
$title = sprintf(substr($row_title['text'],0,50).'...',
          $_GET[$variable],'In2streams.co');
	$list['title'] =  $title;
}
else
{

$title = sprintf($row_title['text'],
          $text,'In2streams.co');
	$list['title'] =  substr($title,0,64);
	
	$list['desc'] =  sprintf($row_title['metadesc'],$text,'In2streams.co');
	$list['key'] =  sprintf($row_title['metakey'],str_replace(' ',', ',$text),'In2streams.co');
	}
}	
}
else
{
	$list['is_empty'] =  'true';
	
}


			
		
		return $list;


}
function user__online()
{
$name = 'none';
$image = 'none';
$vid_id = 0;
mysqli_select_db( $GLOBALS['__Connect'] , database_portfolio);
$query_user_online = sprintf("SELECT * FROM user_online WHERE session1 = %s",$this->GetSQLValueString(session_id(), "text"));
$user_online = mysqli_query($GLOBALS['__Connect'] ,$query_user_online) or die(mysqli_error($GLOBALS['__Connect']));
$row_user_online = mysqli_fetch_assoc($user_online);
$totalRows_user_online = mysqli_num_rows($user_online);

if(isset($_SESSION[md5($_SERVER['HTTP_HOST'].site_root)]))
{
$usr = 'true';
}
else
{
$usr = 'false';
}
if($totalRows_user_online == 0)
{
if(isset($_SERVER['HTTP_REFERER']))
{
$ref = $_SERVER['HTTP_REFERER'];
}
else {
$ref = 'none';
}
if(substr($_SERVER['REQUEST_URI'],strlen($_SERVER['REQUEST_URI']) - 15,15) == 'hotscripts=true')
{
$hot = '- hotscripts ';
}
else
{ 
$hot = '';
}

$str1 = '0';
$insertSQL = sprintf("INSERT INTO user_online (vid_id, isuser, session1,time,title,image,refer,ip,country,town,browser) VALUES (%s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s)",
                       $this->GetSQLValueString('0', "int"),
                       $this->GetSQLValueString($usr, "text"),
                       $this->GetSQLValueString(session_id(), "text"),
                       $this->GetSQLValueString(intval(date('YmdHis')), "int"),
                       $this->GetSQLValueString($name.' ', "text"),
                       $this->GetSQLValueString($image.' ', "text"),
					   $this->GetSQLValueString($hot.' - '.$ref, "text"),
					   $this->GetSQLValueString($_SERVER['REMOTE_ADDR'], "text"),
					   $this->GetSQLValueString(@$str1['name'].' ', "text"),
					   $this->GetSQLValueString(@$str1['city'].' ', "text"),
					   $this->GetSQLValueString($this->showInfo('browser').'<br />'.$this->showInfo('version').'<br />'.$this->showInfo('os'), "text"));

  
$this->set_browser();
  @$this->country($str1);
  $this->refer();

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
 
}
else
{


}
}
function getLocationInfoByIp($ip){

    $client  = @$_SERVER['HTTP_CLIENT_IP'];

    $forward = @$_SERVER['HTTP_X_FORWARDED_FOR'];

    $remote  = @$_SERVER['REMOTE_ADDR'];

    $result  = array('country'=>'', 'city'=>'');

    if(filter_var($client, FILTER_VALIDATE_IP)){

        $ip = $client;

    }elseif(filter_var($forward, FILTER_VALIDATE_IP)){

        $ip = $forward;

    }else{

        $ip = $remote;

    }

    if($ip_data && $ip_data->geoplugin_countryName != null){
$result['country'] = $ip_data->geoplugin_countryCode;

        $result['city'] = $ip_data->geoplugin_city;
        $result['name'] = $ip_data->geoplugin_countryName;


    }

    return $result;

}
    private $agent = "";
    private $info = array();

    function __construct(){
        $this->agent = isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : NULL;
        $this->getBrowser();
        $this->getOS();
    }

    function getBrowser(){
        $browser = array("Navigator"            => "/Navigator(.*)/i",
                         "Firefox"              => "/Firefox(.*)/i",
                         "Internet Explorer"    => "/MSIE(.*)/i",
                         "Google Chrome"        => "/chrome(.*)/i",
                         "MAXTHON"              => "/MAXTHON(.*)/i",
                         "Opera"                => "/Opera(.*)/i",
                         );
        foreach($browser as $key => $value){
            if(preg_match($value, $this->agent)){
                $this->info = array_merge($this->info,array("Browser" => $key));
                $this->info = array_merge($this->info,array(
                  "Version" => $this->getVersion($key, $value, $this->agent)));
                break;
            }else{
                $this->info = array_merge($this->info,array("Browser" => "UnKnown"));
                $this->info = array_merge($this->info,array("Version" => "UnKnown"));
            }
        }
        return $this->info['Browser'];
    }

    function getOS(){
        $OS = array("Windows"   =>   "/Windows/i",
                    "Linux"     =>   "/Linux/i",
                    "Unix"      =>   "/Unix/i",
                    "Mac"       =>   "/Mac/i"
                    );

        foreach($OS as $key => $value){
            if(preg_match($value, $this->agent)){
                $this->info = array_merge($this->info,array("Operating System" => $key));
                break;
            }
        }
        return @$this->info['Operating System'];
    }

    function getVersion($browser, $search, $string){
        $browser = $this->info['Browser'];
        $version = "";
        $browser = strtolower($browser);
        preg_match_all($search,$string,$match);
        switch($browser){
            case "firefox": $version = str_replace("/","",$match[1][0]);
            break;

            case "internet explorer": $version = substr($match[1][0],0,4);
            break;

            case "opera": $version = str_replace("/","",substr($match[1][0],0,5));
            break;

            case "navigator": $version = substr($match[1][0],1,7);
            break;

            case "maxthon": $version = str_replace(")","",$match[1][0]);
            break;

            case "google chrome": $version = substr($match[1][0],1,10);
        }
        return $version;
    }

    function showInfo($switch){
        $switch = strtolower($switch);
       
	   if(isset($this->info['Operating System'])){ switch($switch){
            case "browser": return $this->info['Browser'];
            break;

            case "os": return $this->info['Operating System'];
            break;

            case "version": return $this->info['Version'];
            break;

            case "all" : return array($this->info["Version"], 
              $this->info['Operating System'], $this->info['Browser']);
            break;

            default: return "Unkonw";
            break;

        }}
		else{
		return "Unkonw";
		}
    }

	function set_browser(){
	mysqli_select_db( $GLOBALS['__Connect'] , database_portfolio);
$query_items = sprintf("SELECT * FROM browsers where identify = %s",$this->GetSQLValueString($this->showInfo('browser').$this->showInfo('os'), "text"));
$items = mysqli_query($GLOBALS['__Connect'] ,$query_items) or die(mysqli_error($GLOBALS['__Connect']));
$row_items = mysqli_fetch_assoc($items);
$totalRows_items = mysqli_num_rows($items);
	if($totalRows_items == 0){
	

$insertSQL = sprintf("INSERT INTO browsers (identify,os,browser,count) VALUES (%s,%s,%s,%s)",
                         $this->GetSQLValueString($this->showInfo('browser').$this->showInfo('os'), "text"),
                         $this->GetSQLValueString($this->showInfo('os'), "text"),
                         $this->GetSQLValueString($this->showInfo('browser'), "text"),
                         $this->GetSQLValueString(1, "int"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

	
	
	}
	else{
	

$insertSQL = sprintf("UPDATE browsers SET count = count+1 WHERE identify= %s",
                         $this->GetSQLValueString($this->showInfo('browser').$this->showInfo('os'), "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
	}
	}
	
		
	
	function country($arr){
	mysqli_select_db( $GLOBALS['__Connect'] , database_portfolio);
$query_items = sprintf("SELECT * FROM country where name = %s",$this->GetSQLValueString($arr['name'], "text"));
$items = mysqli_query($GLOBALS['__Connect'] ,$query_items) or die(mysqli_error($GLOBALS['__Connect']));
$row_items = mysqli_fetch_assoc($items);
$totalRows_items = mysqli_num_rows($items);
	if($totalRows_items == 0){
	
	
$insertSQL = sprintf("INSERT INTO country (name,city,count) VALUES (%s,%s,%s)",
                         $this->GetSQLValueString($arr['name'].' ', "text"),
                         $this->GetSQLValueString($arr['city'].' ', "text"),
                         $this->GetSQLValueString(1, "int"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

	
	
	}
	else{

$insertSQL = sprintf("UPDATE country SET count=count+1 WHERE name= %s",
                         $this->GetSQLValueString($arr['name'], "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
	}
	}
	function refer(){
	if(isset($_SERVER['HTTP_REFERER'])){
	$url = $_SERVER['HTTP_REFERER'];
$parse = parse_url($url);
mysqli_select_db( $GLOBALS['__Connect'] , database_portfolio);
$query_items = sprintf("SELECT * FROM refer where referrer = %s",$this->GetSQLValueString($parse['host'], "text"));
$items = mysqli_query($GLOBALS['__Connect'] ,$query_items) or die(mysqli_error($GLOBALS['__Connect']));
$row_items = mysqli_fetch_assoc($items);
$totalRows_items = mysqli_num_rows($items);
	if($totalRows_items == 0 ){
	
	
  if($url <> ''){
$insertSQL = sprintf("INSERT INTO refer (referrer,url,count) VALUES (%s,%s,%s)",
                         $this->GetSQLValueString($parse['host'], "text"),
                         $this->GetSQLValueString($url, "text"),
                         $this->GetSQLValueString(1, "int"));

  

  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
 }
}
	 else{
$insertSQL = sprintf("UPDATE refer set count=count+1 WHERE referrer= %s ",
                         $this->GetSQLValueString($parse['host'], "text"));

  

  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

  }
	
	}
	else{
	
	if(isset($_SERVER['HTTP_REFERER'])){
	$url = $_SERVER['HTTP_REFERER'];
$parse = parse_url($url);

$insertSQL = sprintf("UPDATE refer SET count=count+1 WHERE referrer= %s",
                         $this->GetSQLValueString($parse['host'], "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
	}
	}
	}
} ?>