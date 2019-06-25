<?php

include('config/config.php');

include('functions/db.php');


ini_set('user_agent', user_agent);



$header = '';
$db1 = new db;
$db1->connect();
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;

  $theValue = function_exists("mysqli_real_escape_string") ? mysqli_real_escape_string($GLOBALS['__Connect'],$theValue) : mysqli_escape_string($GLOBALS['__Connect'],$theValue);

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
$query_product = sprintf("SELECT * FROM live WHERE id = %s", intval($_GET['url']));
$product = mysqli_query( $GLOBALS['__Connect'],$query_product) or die(mysqli_error($GLOBALS['__Connect']));
$row_product = mysqli_fetch_assoc($product);
$totalRows_product = mysqli_num_rows($product);
if($totalRows_product == 0)
{ 
	echo 'File not found';exit;
}
if($row_product['type'] == 'yt'){

/*

Made by [egy.js](https://www.instagram.com/egy.js/);
*/
header('Access-Control-Allow-Origin: *');  
header('Content-Type: application/json');
if(isset($_GET['url']) && $_GET['url'] != ""){
    
	$udate = explode('-',$_GET['url']);
    
	parse_str( parse_url($udate[0], PHP_URL_QUERY ), $vars );
 
    
    $id=$vars['v'];
    $dt=file_get_contents("http://www.youtube.com/get_video_info?video_id=$id&el=embedded&ps=default&eurl=&gl=US&hl=en");
    //var_dump(explode("&",$dt));
    if (strpos($dt, 'status=fail') !== false) {
        
        $x=explode("&",$dt);
        $t=array(); $g=array(); $h=array();
        foreach($x as $r){
            $c=explode("=",$r);
            $n=$c[0]; $v=$c[1];
            $y=urldecode($v);
            $t[$n]=$v;
        }
            $x=explode("&",$dt);
            foreach($x as $r){
                $c=explode("=",$r);
                $n=$c[0]; $v=$c[1];
                $h[$n]=urldecode($v);
            }
            $g[]=$h;
            $g[0]['error'] = true;
            $g[0]['instagram'] = "egy.js";
            $g[0]['apiMadeBy'] = 'El-zahaby';
        echo json_encode($g,JSON_PRETTY_PRINT);
        
    }else{
        
        $x=explode("&",$dt);
        $t=array(); $g=array(); $h=array();
        foreach($x as $r){
            $c=explode("=",$r);
            $n=$c[0]; $v=$c[1];
            $y=urldecode($v);
            $t[$n]=$v;
        }
        $streams = explode(',',urldecode($t['url_encoded_fmt_stream_map']));
        foreach($streams as $dt){ 
            $x=explode("&",$dt);
            foreach($x as $r){
                $c=explode("=",$r);
                $n=$c[0]; $v=$c[1];
                $h[$n]=urldecode($v);
				if (strpos(strtolower($h[$n]), 'mp4') !== false) {
    
	
}
            }
            $g[]=$h;
		
        }}
       // var_dump( $g[1]["quality"],true);
	    
$insertSQL = sprintf("UPDATE `lines` SET last_viewed =%s, total_views=total_views+1,location=%s WHERE user=%s",
                       GetSQLValueString($row_product['name'], "text"),
                       GetSQLValueString($str1['name'].'<br />'.$str1['city'], "text"),
                       GetSQLValueString(@$_GET['user'], "text"));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  

mysqli_free_result($product);

	 header('Location: '.$g[2]['url']);
	 exit;
    }
}else{



$insertSQL = sprintf("UPDATE `lines` SET last_viewed =%s, total_views=total_views+1,location=%s WHERE user=%s",
                       GetSQLValueString($row_product['name'], "text"),
                       GetSQLValueString($str1['name'].'<br />'.$str1['city'], "text"),
                       GetSQLValueString(@$_GET['user'], "text"));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
$insertSQL = sprintf("UPDATE `videos` SET views=views+1 WHERE id=%s",
                       GetSQLValueString($_GET['url'], "text"));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  

mysqli_free_result($product);
$query_check = sprintf("SELECT * FROM `iptv` WHERE m3u_name ='%s'", htmlspecialchars($_GET['line']));
$check = mysqli_query( $GLOBALS['__Connect'],$query_check) or die(mysqli_error($GLOBALS['__Connect']));
$row_check = mysqli_fetch_assoc($check);
$totalRows_check = mysqli_num_rows($check);

$query_iptv1 = sprintf("SELECT * FROM `lines` WHERE user = '%s' and pass='%s' and display='%s'", htmlspecialchars($_GET['user']), htmlspecialchars($_GET['pass']), htmlspecialchars($_GET['line']));
$iptv1 = mysqli_query( $GLOBALS['__Connect'],$query_iptv1) or die(mysqli_error($GLOBALS['__Connect']));
$row_iptv1 = mysqli_fetch_assoc($iptv1);
$totalRows_iptv1 = mysqli_num_rows($iptv1);
if($totalRows_iptv1 ==0 and !isset($_GET['ministra'])){ echo 'file not found';exit;}
if($totalRows_iptv1 >= 0 or $row_check['sub'] == 'all' or isset($_GET['ministra']))
{
	
mysqli_free_result($check);

mysqli_free_result($iptv1);
if($totalRows_check == 0 and $totalRows_product == 0)
{
echo ' Not Found';
exit;}

if(date('YmdHis') <= $row_iptv1['expires'] or $row_check['sub'] == 'all' or isset($_GET['ministra']))
{ 
if($row_check['limit'] =='true'){

$query_limit = sprintf("SELECT * FROM `limit` WHERE user =%s and m3u_id=%s and `type`='live' ",
                       GetSQLValueString($_GET['user'], "text"),
                       GetSQLValueString($row_iptv1['id'], "text"));
$limit = mysqli_query( $GLOBALS['__Connect'],$query_limit) or die(mysqli_error($GLOBALS['__Connect']));
$row_limit = mysqli_fetch_assoc($limit);
$totalRows_limit = mysqli_num_rows($limit);
$query_checkempty = sprintf("SELECT * FROM `limit` WHERE user =%s and m3u_id=%s and user_agent=%s and `type`='live'",
                       GetSQLValueString($_GET['user'], "text"),
                       GetSQLValueString($row_iptv1['id'], "text"),
                       GetSQLValueString(md5($_SERVER['HTTP_USER_AGENT'].$json1['country'].$json1['city']), "text"));
$checkempty = mysqli_query( $GLOBALS['__Connect'],$query_checkempty) or die(mysqli_error($GLOBALS['__Connect']));
$row_checkempty = mysqli_fetch_assoc($checkempty);
$totalRows_checkempty = mysqli_num_rows($checkempty);

if(($totalRows_limit +1) <= $row_check['limit_to'] and $totalRows_checkempty == 0)
{
$insertSQL = sprintf("INSERT INTO `limit` (name,device,m3u,m3u_id,user,user_agent,`type`,country, city, ip_address,agent) VALUES(%s,%s,%s,%s,%s,%s,'live',%s,%s,%s,%s)",
                       GetSQLValueString($row_check['name'], "text"),
                       GetSQLValueString($row_check['name'], "text"),
                       GetSQLValueString($row_check['m3u_name'], "text"),
                       GetSQLValueString($row_iptv1['id'], "int"),
                       GetSQLValueString($_GET['user'], "text"),
                       GetSQLValueString(md5($_SERVER['HTTP_USER_AGENT'].$json1['country'].$json1['city']), "text"),
                       GetSQLValueString($json1['country'].' ', "text"),
                       GetSQLValueString($json1['city'].' ', "text"),
                       GetSQLValueString($_SERVER['REMOTE_ADDR'], "text"),
                       GetSQLValueString($_SERVER['HTTP_USER_AGENT'], "text"));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
	 header('Location: '.$row_product['fname']);
 
}
else{
	if(($totalRows_limit +1) <= $row_check['limit_to'] or $row_check['sub'] == 'all' or $totalRows_checkempty  > 0 or isset($_GET['ministra']))
	{
		 header('Location: '.$row_product['fname']);
	}
	else{ echo 'Limit reached';}
exit;
}

}else{ 


	 header('Location: '.$row_product['fname']);
}


	  exit;
}
else{

echo 'Not Authorized';
	
	 }
	 }
	 else{
	 echo 'Unauthorized';
	 

}
}?>