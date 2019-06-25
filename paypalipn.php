<?php
function cleanstring($string) {
   $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

   $string =  preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
  return preg_replace('/-+/', '-', $string);
}
include('config/config.php');
if(defined('disable') && disable){
include('noservice.html');
exit;

}
include('functions/db.php');
$header = '';
$db1 = new db;
$db1->connect();
$db1->user__online();

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



$set = 'false';
$req = 'cmd=_notify-validate';

// go through each of the POSTed vars and add them to the variable
foreach ($_POST as $key => $value) {
$value = urlencode(stripslashes($value));
$req .= "&$key=$value";
}

// post back to PayPal system to validate
$header .= "POST /cgi-bin/webscr HTTP/1.0\r\n";
$header .= "Content-Type: application/x-www-form-urlencoded\r\n";
$header .= "Content-Length: " . strlen($req) . "\r\n\r\n";

// In a live application send it back to www.paypal.com
// but during development you will want to uswe the paypal sandbox

// comment out one of the following lines
if(sandbox == 'true')
{
$fp = fsockopen ('www.sandbox.paypal.com', 80, $errno, $errstr, 30);
}
else
{
$fp = fsockopen ('www.paypal.com', 80, $errno, $errstr, 30);
}
//$fp = fsockopen ('www.paypal.com', 80, $errno, $errstr, 30);

// or use port 443 for an SSL connection
//$fp = fsockopen ('ssl://www.paypal.com', 443, $errno, $errstr, 30);


if (!$fp) {
// HTTP ERROR Failed to connect
// You can optionally send an email to let you know of the problem
// or add other error handling. 
//
// If you want to log to a file as well then uncomment the following lines
// You can use these later on in the script as well
// 
// $fh = fopen("logipn.txt", 'a');//open file and create if does not exist
// fwrite($fh, "\r\n/////////////////////////////////////////\r\n HTTP ERROR \r\n");//Just for spacing in log file
//
// fwrite($fh, $errstr);//write data
// fclose($fh);//close file

}
else
{
  fputs ($fp, $header . $req);
  while (!feof($fp)) {
    $res = fgets ($fp, 1024);
  
   if (1==1) {

// assign posted variables to local variables
// the actual variables POSTed will vary depending on your application.
// there are a huge number of possible variables that can be used. See the paypal documentation.

// the ones shown here are what is needed for a simple purchase
// a "custom" variable is available for you to pass whatever you want in it. 
// if you have many complex variables to pass it is possible to use session variables to pass them.

      @$item_name = $_POST['item_name'];
      @$item_number = $_POST['item_number'];
      @$item_colour = $_POST['custom'];  
      @$payment_status = $_POST['payment_status'];
      @$payment_amount = $_POST['mc_gross'];         //full amount of payment. payment_gross in US
      @$payment_currency = $_POST['mc_currency'];
      @$txn_id = $_POST['txn_id'];                   //unique transaction id
      @$receiver_email = $_POST['receiver_email'];
      @$payer_email = $_POST['payer_email'];
	  @$first_name = $_POST['first_name'];
	  @$last_name = $_POST['last_name'];
	  @$address_street = $_POST['address_street'];
	  @$address_city = $_POST['address_city'];
	  @$address_state = $_POST['address_state'];
	  @$address_zip = $_POST['address_zip'];
	  @$contact_phone = $_POST['contact_phone'];
	  @$total_address = $first_name .' ' . $last_name .'<br />'. $address_street .'<br />'.$address_city .'<br />'.$address_state.'<br />'.$address_zip.'<br />'.$contact_phone;
 	$query_product = sprintf("SELECT * FROM basket where paid='false' and ip= %s", GetSQLValueString($item_number, "text"));
$product = mysqli_query( $GLOBALS['__Connect'],$query_product) or die(mysqli_error($GLOBALS['__Connect']));
$row_product = mysqli_fetch_assoc($product);
$totalRows_product = mysqli_num_rows($product);

$price= 0.00;
$int5 = 1;
do
{
$name[$int5]['uname'] = $row_product['uname'];
$name[$int5]['name'] = $row_product['name'];
$name[$int5]['image'] = $row_product['image'];
$name[$int5]['id'] = $row_product['prod_id'];
$name[$int5]['image'] = $row_product['image'];
$name[$int5]['ext'] = $row_product['ext'];
$name[$int5]['length'] = $row_product['length'];
$name[$int5]['type2'] = $row_product['type2'];
$name[$int5]['pass'] = $row_product['pass'];
$name[$int5]['display'] = $row_product['display'];
$name[$int5]['prod_type'] = $row_product['prod_type'];
$name[$int5]['mac'] = $row_product['mac'];
$price +=  $row_product['price'];
$int5 ++;
} while ($row_product = mysqli_fetch_assoc($product));


if($totalRows_product ==0){ exit;}

      if (($payment_status == 'Completed') &&   //payment_status = Completed
         ($receiver_email == paypal_email) 
		 && ($price == $payment_amount)) {  //txn_id isn't same as previous to stop duplicate payments. You will need to write a function to do this check.
		
if($set == 'false')
{
echo '<br />
'.$payment_amount;

   
foreach($name as $items)
{
if($items['prod_type'] == 'credit')
{
$insertSQL = sprintf("UPDATE users_db SET credits=credits+%s,purchased=purchased+%s, role='Reseller' WHERE uname=%s",
                       GetSQLValueString($items['length'], "int"),
					   GetSQLValueString($items['length'], "int"),
					   GetSQLValueString($items['uname'], "text"));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
}
else{
$insertSQL = sprintf("INSERT INTO subscriptions(name,prod_id,user,url,type,display,image,expires,uname) VALUES(%s,%s,%s,%s,'file',%s,%s,%s,%s)",
                       GetSQLValueString($items['name'], "text"),
					   GetSQLValueString($items['id'], "text"),
                       GetSQLValueString($items['uname'], "text"),
					   GetSQLValueString(cleanstring($items['name']).$items['ext'], "text"),
					   GetSQLValueString($items['display'], "text"),
					   GetSQLValueString($items['image'], "text"),
					   GetSQLValueString(date('YmdHis', strtotime('+ '.$items['length'].' '.$items['type2'].'')), "text"),
					   GetSQLValueString($items['uname'], "text"));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
  $insertSQL = sprintf("INSERT INTO `lines` (active,`name`,user,pass,expires,display,mac) Values(%s,%s,%s,%s,%s,%s,%s)",
                       GetSQLValueString('true', "text"),
                       GetSQLValueString($items['name'], "text"),
					   GetSQLValueString($items['uname'], "text"),				
                       GetSQLValueString($items['pass'], "text")
					   ,GetSQLValueString(date('YmdHis', strtotime('+ '.$items['length'].' '.$items['type2'].'')),'text'),
					   GetSQLValueString($items['display'], "text"),
					   GetSQLValueString($items['mac'], "text"));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect'])); 
  

						$file = file_get_contents(ministra.'/createuser.php?login='.$items['uname'].'&loginpass='.$items['pass'].'&mac='.$items['mac'].'&user='.ministra_user.'&pass='.ministra_pass.'&tariff='.default_tariff);
 
  }
   $insertSQL = sprintf("UPDATE files SET sales= sales+1 WHERE id=%s",
                       GetSQLValueString($items['id'], "int"));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  $insertSQL = sprintf("UPDATE basket SET paid= 'true', token=%s , hash=%s WHERE uname=%s",
                       GetSQLValueString(md5($item_number.site_root), "text"),
                       GetSQLValueString(md5($item_number.site_root), "text"),
					   GetSQLValueString($items['uname'], "text"));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  
 
  
}
$mail_from=mail_from;

$mail_sub= 'In2Download : Your Download';

$mail_mesg= '
Your Tracking number : '.md5($item_number.site_root).'<br />Your Download<br/> '.'http://'.$_SERVER['HTTP_HOST'].site_root.'/account.php?uname=111&id='.md5($item_number.site_root).'&email='.$payer_email;
require_once('PHPMailer/class.phpmailer.php');
require_once('PHPMailer/PHPMailerAutoload.php');
//Create a new PHPMailer instance
$mail = new PHPMailer;
//Tell PHPMailer to use SMTP
$mail->isSMTP();
$mail_to= $row_product['email'];
$mail->AddCC(support_email, 'Download');
$mail->AddCC($payer_email, 'Download');

//Enable SMTP debugging
// 0 = off (for production use)
// 1 = client messages
//Ask for HTML-friendly debug output
//Set the hostname of the mail server
$mail->Host = email_host;
// use
// $mail->Host = gethostbyname('smtp.gmail.com');
// if your network does not support SMTP over IPv6
//Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
$mail->Port = 587;
//Whether to use SMTP authentication
$mail->SMTPAuth = true;
//Username to use for SMTP authentication - use full email address for gmail
$mail->Username = emailsigb;
//Password to use for SMTP authentication
$mail->Password = email_pass;
//Set who the message is to be sent from
$mail->setFrom($mail_from, 'Support User');
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
$set = 'true';

if (!$mail->send()) {
    }
}
 
	  }
      else
      {
      }
    }
    else {
//
// Paypal didnt like what we sent. If you start getting these after system was working ok in the past, check if Paypal has altered its IPN format
//
     
    }
  } //end of while
fclose ($fp);
}



@mysqli_free_result($Recordset1);
?>