<?php
// Author : Paul Moore
// Project : In2streams.co Video CMS
include('config/config.php');
include('functions/db.php');
include('functions/settings.php');
require_once('libs/Smarty.class.php');
include "phpqrcode/qrlib.php"; 
include('functions/loginaction.php');$get_query = new setup;
$db1 = new db;
$db1->connect();
$db1->user__online();
$login = new auth;
$template = $get_query->SetTheme();

if(isset($_POST['email']) and isset($_POST['sub']) and isset($_POST['msg']) and isset($_POST['name']))
 {
 
 $mail_to= support_email;

$mail_from=mail_from;

$mail_sub='Support Request: '.$_POST['sub'];

$mail_mesg= 'Support request from : '.$_POST['name'].' '.$_POST['email']."<br/>".str_replace("\n","<br/>",$_POST['msg']);
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
$mail->Host = email_host;
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
if (!$mail->send()) {
    echo "Mailer Error: " . $mail->ErrorInfo;
} else {
  $content['email'] = 'true';
}
}

//get user info
@$content['user'] = $db1->db_query("SELECT * FROM users_db where email=".$db1->GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text")."",array (
    "uname"
),1,0);
// end user info
//account purchases
$content['ads']['side_bar']= $db1->db_query("SELECT * FROM ads WHERE position='sidebar' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);



$content['ads']['top']= $db1->db_query("SELECT * FROM ads WHERE position='top' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);


$content['categories']= $db1->db_query("SELECT * FROM categories ORDER BY name ASC",array (
    "name",'url'
),1000000,0);
//end account


//end account
$smarty= new smarty();

$content['basket']= $db1->db_query("SELECT * FROM basket WHERE ip=".$db1->GetSQLValueString($_SERVER['REMOTE_ADDR'], "text")." and paid = 'false' ORDER BY id Desc",array (
    "name",'price','image','id'
),1000000,0);
$content['ads']['side']= $db1->db_query("SELECT * FROM ads WHERE position='side' ORDER BY id Desc",array (
    "name",'code'
),1000000,0);
$smarty->assign('basket',$content['basket']);
$smarty->assign('logo',logo);
include('page-titles.php');
$smarty->assign('curency',curency);

@$smarty->assign('email',$content['email']);
$smarty->assign('page_title',$title['contact']);
$smarty->assign('slogan',slogan);$smarty->template_dir = 'themes/'.$template;
$smarty->assign('theme_dir',$template);
$smarty->assign('ads',$content['ads']);
$smarty->assign('categories',$content['categories']);
$smarty->assign('site_root',site_root);
$smarty->compile_dir = 'tmp';
mysqli_close($GLOBALS['__Connect']);
$smarty->display('contact.tpl'); ?>

