<?php
$smarty->assign('role',$_SESSION['MM_UserGroup']);

 if((!empty($_FILES["image"])) && ($_FILES['image']['error'] == 0)) {


      $fname2 = md5(date("Hisms")).'.'.$_FILES['image']['name'];
	  $newname2 = $_SERVER['DOCUMENT_ROOT'].site_root.'/prod/'.$fname2;
	  
        move_uploaded_file($_FILES['image']['tmp_name'],$newname2);
		
		$fname4=  '/prod/'.$fname2; 
 }
 else{
 $fname4= logo;
 }
if(isset($_POST['update']) and  $_SESSION['MM_UserGroup'] != 'Demo')
{
$fp = fopen('../config/config.php', 'w');
if($_POST['email_pass'] == 'nochange')
{
$passw = email_pass;
}
else
{
$passw = $_POST['email_pass'];
}
if($_POST['email_pass'] == 'nochange')
{
$mail1 = email_pass;
}
else
{
$mail1 = $_POST['email_pass'];
}
fwrite($fp, '<?php ');
fwrite($fp, "
if(session_id() == '') {
    session_start();
}
date_default_timezone_set('Europe/London');
define('hostname_portfolio','".hostname_portfolio."');
define('database_portfolio' ,'".database_portfolio."');
define('username_portfolio','".username_portfolio."');
define('password_portfolio' ,'".password_portfolio."'); 
define('product_items_limit',10);
define('site_name' ,'".$_POST['display']."');
define('site_root','".$_POST['site_root']."'); // root directory of the script

define('support_email','".$_POST['support_email']."');
define('mail_from','".$_POST['mail_from']."');
define('paypal_email','".$_POST['paypal']."');
define('sandbox',".$_POST['sandbox'].");
define('email_host','".$_POST['mail_host']."');
define('emailsigb','".$_POST['email_name']."');
define('email_pass','".$mail1."');
define('email_address','".$_POST['display_email']."');
define('skype','".$_POST['skype']."');
define('https',".$_POST['https'].");
define('errors',".$_POST['errors'].");
define('curency','".$_POST['curency']."');
define('moneycode','".$_POST['code']."');
define('user_agent','".$_POST['user_agent']."');
if(errors)
{
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
}
else { 
ini_set('display_errors', 0);
ini_set('display_startup_errors', 0);
}

 define('logo','".$_POST['logo']."');
 define('slogan','".$_POST['slogan']."');
 define('disable',".$_POST['store'].");
 
 define('ministra','".$_POST['ministra']."');
 define('ministra_user','".$_POST['ministra_user']."');
 define('ministra_pass','".$_POST['ministra_pass']."');
 define('ministra_dir','".$_POST['ministra_dir']."');
 define('default_tariff','".$_POST['tariff']."');
 
 
?>");
fclose($fp);

 $smarty->assign('updated','true');
}
$smarty->assign('site_root',site_root); // root directory of the script

$smarty->assign('email_address',email_address);
$smarty->assign('store',disable);
$smarty->assign('paypal_email',paypal_email);
$smarty->assign('ministra_user',ministra_user);
$smarty->assign('user_agent',user_agent);
$smarty->assign('ministra_pass',ministra_pass);

$smarty->assign('ministra',ministra);
 $smarty->assign('sandbox',sandbox);
 $smarty->assign('support_email',support_email);
 $smarty->assign('mail_host',email_host);
 $smarty->assign('emailsigb',emailsigb);
 $smarty->assign('skype',skype);
 $smarty->assign('site_name',site_name);
 $smarty->assign('mail_from',mail_from);
 $smarty->assign('errors',errors);
 $smarty->assign('https',https);
 $smarty->assign('mail_from',mail_from);
 $smarty->assign('curency',curency);
 $smarty->assign('logo',logo);
 $smarty->assign('curency_code',moneycode);
 $smarty->assign('slogan',slogan);
 $smarty->assign('default_tariff',default_tariff);
 
 ?>