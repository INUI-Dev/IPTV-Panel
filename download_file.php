<?php 
error_reporting(0);
@ini_set('display_errors', 0);
set_time_limit(10000000000000);
// Author : Paul Moore
include('config/config.php');
if(defined('disable') && disable){
include('noservice.html');
exit;

}
include('functions/db.php');
include('functions/main.php');
include('functions/settings.php');
include('functions/loginaction.php');

if(!isset($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)]))
{
if(isset($_GET['uname']))
{
header('Location:login.php?accesscheck='.urlencode('account.php?uname='.$_GET['uname']));
exit();
} else { header('Location:login.php?accesscheck='.urlencode('account.php'));

}
}
   $get_query = new setup;
$db1 = new db;
$db1->connect();
$db1->user__online();


$content['products'] = $db1->db_query("SELECT * FROM subscriptions where user=".$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text")." and id=".$db1->GetSQLValueString($_GET['id'], "text"),array (
    "name",'id','prod_id'
	),10000,0);
if ($content['products'][0]['is_empty'] == 'false') {

$content['download'] = $db1->db_query("SELECT * FROM files where id=".$db1->GetSQLValueString($content['products'][0]['prod_id'], "int"),array (
    "fname"
	),1,0);
	


function output_file($file, $name, $mime_type='')

{

 /*

 This function takes a path to a file to output ($file), 

 the filename that the browser will see ($name) and 

 the MIME type of the file ($mime_type, optional).

 

 If you want to do something on download abort/finish,

 register_shutdown_function('function_name');

 */

 if(!is_readable($file)) die('File not found or inaccessible!');

 

 $size = filesize($file);

 $name = rawurldecode($name);

 

 /* Figure out the MIME type (if not specified) */

 $known_mime_types=array(

 	"pdf" => "application/pdf",

 	"txt" => "text/plain",

 	"html" => "text/html",

 	"htm" => "text/html",

	"exe" => "application/octet-stream",

	"zip" => "application/zip",

	"doc" => "application/msword",

	"xls" => "application/vnd.ms-excel",

	"ppt" => "application/vnd.ms-powerpoint",

	"gif" => "image/gif",

	"png" => "image/png",

	"jpeg"=> "image/jpg",

	"jpg" =>  "image/jpg",

	"php" => "text/plain"

 );

 

 if($mime_type==''){

	 $file_extension = strtolower(substr(strrchr($file,"."),1));

	 if(array_key_exists($file_extension, $known_mime_types)){

		$mime_type=$known_mime_types[$file_extension];

	 } else {

		$mime_type="application/force-download";

	 };

 };

 

 @ob_end_clean(); //turn off output buffering to decrease cpu usage

 

 // required for IE, otherwise Content-Disposition may be ignored

 if(ini_get('zlib.output_compression'))

  ini_set('zlib.output_compression', 'Off');

 

 header('Content-Type: ' . "application/zip");

 header("Content-Transfer-Encoding: binary");

 header('Accept-Ranges: bytes');

 

 /* The three lines below basically make the 

    download non-cacheable */

 header("Cache-control: private");

 header('Pragma: private');

 header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");

 

 // multipart-download and download resuming support

 if(isset($_SERVER['HTTP_RANGE']))

 {

	list($a, $range) = explode("=",$_SERVER['HTTP_RANGE'],2);

	list($range) = explode(",",$range,2);

	list($range, $range_end) = explode("-", $range);

	$range=intval($range);

	if(!$range_end) {

		$range_end=$size-1;

	} else {

		$range_end=intval($range_end);

	}

 

	$new_length = $range_end-$range+1;

	header("HTTP/1.1 206 Partial Content");

	header("Content-Length: $new_length");

	header("Content-Range: bytes $range-$range_end/$size");

 } else {

	$new_length=$size;

	header("Content-Length: ".$size);

 }

 

 /* output the file itself */

 $chunksize = 1000; //you may want to change this

 $bytes_send = 0;

 $downloadspeed = 15;



 if ($file = fopen($file, 'r'))

 {

	if(isset($_SERVER['HTTP_RANGE']))

	fseek($file, $range);

 

	while(!feof($file) && 

		(!connection_aborted()) && 

		($bytes_send<$new_length)

	      )

	{ 

		$buffer = fread($file, $downloadspeed * 1024 * 10);

		print($buffer); //echo($buffer); // is also possible

		

		flush();

		$bytes_send += strlen($buffer);

	}

	}

 fclose($file);

 



 

}
	}
	
    

 if(1 == 1){

			output_file('uploads2017/'.$content['download'][0]['fname'], 'fhdfhgf.zip');
			}
?>