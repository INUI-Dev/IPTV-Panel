<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  return "'".$theValue."'";
}
}
function execute_file($file,$hostname_portfolio,$username_portfolio,$password_portfolio,$database_portfolio) {
 
      // executes the SQL commands from an external file.
	  $portfolio = mysqli_connect($hostname_portfolio, $username_portfolio, $password_portfolio) or trigger_error(mysqli_error($portfolio),E_USER_ERROR); 
      mysqli_connect($hostname_portfolio, $username_portfolio, $password_portfolio);
	  mysqli_select_db($portfolio, $database_portfolio);
      if (!file_exists($file)) {
         return false;
      }
      $str = file_get_contents($file);
      if (!$str) {
         return false; 
      }
      
      // split all the queries into an array
      $quote = '';
      $line = '';
      $sql = array();
      $ignoreNextChar = '';
	  for ($i = 0; $i < strlen($str); $i++) {
          if ( !$ignoreNextChar ) {
              $char = substr($str, $i, 1);
              $line .= $char;
              if ($char == ';' && $quote == '') {
                  $sql[] = $line;
                  $line = '';
              } else if ( $char == '\\' ) {
                  // Escape char; ignore the next char in the string
                  $ignoreNextChar = TRUE;
              } else if ($char == '"' || $char == "'" || $char == '`') {
                  if ( $quote == '' )         // Start of a new quoted string; ends with same quote char
                      $quote = $char;
                  else if ( $char == $quote ) // Current char matches quote char; quoted string ends
                      $quote = '';
              }
          }
          else
		  
		  
              $ignoreNextChar = FALSE;
      }
      
      if ($quote != '') return false;

      foreach ($sql as $query) {
         if (!empty($query)) {
            $r = mysqli_query($portfolio,$query);
 
            
         }
      }
      return true;
    
   }  

if (isset($_POST['test']))
{
$hostname_portfolio = $_POST['host'];
$database_portfolio = $_POST['db'];
$username_portfolio = $_POST['uname'];
$password_portfolio = $_POST['pword'];
if (mysqli_connect($hostname_portfolio, $username_portfolio, $password_portfolio))
{
$portfolio = mysqli_connect($hostname_portfolio, $username_portfolio, $password_portfolio) or trigger_error(mysqli_error($portfolio),E_USER_ERROR); 
if(mysqli_select_db($portfolio,$database_portfolio))
{

echo "Successfully connected to \"".$_POST['host']."\"<br />";
define("ok","true");
define('done','');
define("db","");
}
else 
{
define("db","failed");
define('done','');
define('ok','');
}
}
else

{ echo "Error : Could not connect to db";
define('done','');
define('db','');
define('ok','');
}
}

elseif (isset($_POST['Submit']))
{
$hostname_portfolio = $_POST['host'];
$database_portfolio = $_POST['db'];
$username_portfolio = $_POST['uname'];
$password_portfolio = $_POST['pword'];
execute_file("sql.sql",$hostname_portfolio,$username_portfolio,$password_portfolio,$database_portfolio);
sleep(3);$portfolio = mysqli_connect($hostname_portfolio, $username_portfolio, $password_portfolio) or trigger_error(mysqli_error($portfolio),E_USER_ERROR); 
      mysqli_connect($hostname_portfolio, $username_portfolio, $password_portfolio);
	  mysqli_select_db($portfolio, $database_portfolio);
  $insertSQL = sprintf("INSERT INTO users_db (uname, pword, role,active,email,time,credits,purchased,stream) VALUES (%s, %s, 'Admin','true','kjhkjh',987987,0,0,986)",
                       GetSQLValueString($_POST['auname'], "text"),
                       GetSQLValueString($_POST['apword'], "text"));

  $Result1 = mysqli_query($portfolio,$insertSQL) or die(mysqli_error($portfolio));
  mysqli_select_db($portfolio, $database_portfolio);
 
  			define("done","true");		  


$fp = fopen('config/config.php', 'w');

fwrite($fp, '<?php ');
fwrite($fp, "if(session_id() == '') {
    session_start();
}
if(session_id() == '') {
    session_start();
}

 date_default_timezone_set('Europe/London');

define('hostname_portfolio','".$_POST['host']."');
define('database_portfolio' ,'".$_POST['db']."');
define('username_portfolio','".$_POST['uname']."');

define('password_portfolio' ,'".$_POST['pword']."');
define('site_root','".$_POST['root']."'); // root directory of the script
define('product_items_limit',10);
define('site_name' ,'In2Download.com');
define('logo','http://demo.in2download.com/images/logo.png');
define('slogan','In2Download');
define('support_email','');
define('mail_from','');
define('paypal_email','');
define('sandbox',false);
define('email_host','');
define('emailsigb','');
define('email_pass','');
define('email_address','Support@domain');
define('skype','MYSKYPE');
define('https',false);
define('errors',false);
define('curency','US $');
define('moneycode','USD');
if(errors)
{
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
}else {

ini_set('display_errors', 0);
ini_set('display_startup_errors', 0);
}
".'
?>');
 fclose($fp);
}
else
{
define('done','');
define("ok","");
define("db","");
} ?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>In2streams.Co install</title>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--
.style1 {color: #FF0000}
.style4 {
	font-size: 18px;
	color: #FF0000;
}
-->
</style>
</head>

<body><?php if(done != "true") { ?>
<form id="form1" name="form1" method="POST" action="">
  <label>  </label>
  <div align="center"><?php if(db == "failed") { ?> database not found<?php } ?><span class="style4"> in2download.com </span>
    <table width="65%" border="2" align="center" cellpadding="0" cellspacing="5" bgcolor="#CCCCCC">
      <tr>

        <td width="19%">Admin Username</td>
        <td width="81%"><span id="sprytextfield5">
        <input name="auname" type="text" id="auname" value="<?php if(isset($_POST['auname'])) { echo $_POST['auname']; } ?>" />
        <span class="textfieldRequiredMsg">A value is required.</span></span></td>
      </tr>
      <tr>
        <td>Admin Password</td>

        <td><span id="sprytextfield6">
        <input name="apword" type="password" id="apword" value="<?php if(isset($_POST['apword'])) {  echo $_POST['apword']; }  ?>" />
        <span class="textfieldRequiredMsg">A value is required.</span></span></td>
      </tr>
      
      <tr>

        <td>Support email</td>
        <td><span id="sprytextfield10">
        <label>
        <input name="notify" type="text" id="notify" value="<?php if(isset($_POST['notify'])) {  echo $_POST["notify"];  } ?>" />
        </label>
        <span class="textfieldRequiredMsg">A value is required.</span></span>This is used to notify you of a new subscriber</td>
      </tr>
      <tr>


        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Mysql host :</td>
        <td><span id="sprytextfield1">
        <label>
        <input type="text" value="<?php if(isset($_POST['host'])) {   echo $_POST['host']; }  ?>" name="host" id="host" />
        </label>
        <span class="textfieldRequiredMsg">A value is required.</span></span></td>
      </tr>
      <tr>
        <td>Database name : <span id="sprytextfield8">
        <label> </label>
        </span></td>

        <td><span id="sprytextfield4">
          <label>
          <input type="text" value="<?php if(isset($_POST['db'])) {  echo $_POST['db']; }  ?>" name="db" id="db" />
          </label>
          <span class="textfieldRequiredMsg">A value is required.</span></span></td>
      </tr>
      <tr>
        <td>Mysql username :</td>

        <td><span id="sprytextfield3">
        <label>
        <input type="text" name="uname" value="<?php if(isset($_POST['uname'])) {  echo $_POST['uname']; }  ?>" id="uname" />
        </label>
        <span class="textfieldRequiredMsg">A value is required.</span></span></td>
      </tr>
      <tr>
        <td>Mysql Password :</td>

        <td>
        <input type="password" name="pword"  value="<?php if(isset($_POST['pword'])) {  echo $_POST['pword']; } ?>" id="pword" />        </td>
      </tr>
      <tr>
        <td>&nbsp;</td>


        <td><input name="style" type="hidden" id="style" value=".Example_D {
-moz-border-radius: 1em 2em 1em 1em;
border-radius: 1em 2em 1em 1em;
background-color:#E0E0E0;
padding:5px;
margin-bottom:3px;
margin-top:3px;
	border: 2px solid #5E93A4;

}
a {
	color: #000000;
}
a:hover {
	color: #FF0000;
}
.imgmain {
width:110px;
vertical-align:middle;
}
.tblmain{
width:135px;
vertical-align:middle;
height:220px;
}.header {
background-color:#FF0000;
color:#FFFFFF;
font-family:Verdana, Arial, Helvetica, sans-serif;

}
.divmain {
background-image:url(/images0/col1.png);
color: #FFFFFF;
padding-left:21px;
	font-size: 18px;

}
.item2 {
background-color:#CCCCCC;
color:#000000;
font-family:Verdana, Arial, Helvetica, sans-serif;

}
.itembg {
background-color:#B6B6B6;
color:#000000;
font-family:Verdana, Arial, Helvetica, sans-serif;
padding:14px;


}
.altitem2 {
background-color:#FFFFFF;
color:#000000;
font-family:Verdana, Arial, Helvetica, sans-serif;

}
#picturelist {

margin-top:0px;
margin-bottom:30px;
text-align:left;
margin-right:auto;

}

#picturelist li {
list-style:none;
float:left;
margin-right:20px;
margin-bottom:10px;
font-weight:bold;
}

#picturelist img{
display:block;
}

#picturelist img:hover{
}

#picturelist a{
color:#777777;
text-decoration:none;
}

#picturelist a:hover{
}


" />
        <input name="layout" type="hidden" id="layout" value=".Example_D {
-moz-border-radius: 1em 2em 1em 1em;
border-radius: 1em 2em 1em 1em;
background-color:#{exbg};
padding:5px;
margin-bottom:3px;
margin-top:3px;
	border: {exborder}px solid #{exbordercolor};

}
.imgmain {
width:{imgmain};
}
a {
	color: #{lnk};
}
a:hover {
	color: #{lnkhvr};
}
.tblmain{
width:{tblwidth};
height:{tblheight};
}.header {
background-color:{tblbg};
color:{font};
font-family:Verdana, Arial, Helvetica, sans-serif;

}
.divmain {
background-color:{imgbg};
color: {divcolor};
	font-weight: bold;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: {fontsize};
	font-style: italic;
}
.item2 {
background-color:{titembg};
color:{titemfont};
font-family:Verdana, Arial, Helvetica, sans-serif;

}
.itembg {
background-color:{itembg};
color:{itemcolor};
font-family:Verdana, Arial, Helvetica, sans-serif;
padding:5px;

}
.altitem2 {
background-color:{altbgcolor};
color:{altfontcl};
font-family:Verdana, Arial, Helvetica, sans-serif;

}
#picturelist {

margin-top:0px;
margin-bottom:30px;
text-align:left;
margin-right:auto;

}

#picturelist li {
list-style:none;
float:left;
margin-right:20px;
margin-bottom:10px;

font-weight:bold;
}

#picturelist img{
display:block;
}

" /></td>
      </tr>
     <?php if(defined('ok') && ok == 'true') { ?> 
          <tr>
            <td><p>Site Root </p>            </td>
            <td><label>
              <input name="root" type="text" id="root" value="<?php echo str_replace('/install.ph','',substr($_SERVER['REQUEST_URI'],0,strlen($_SERVER['REQUEST_URI']) - 1)) ?>" />
            </label></td>
          </tr>
          

          
          
          
          
          
      <?php } ?>
    </table>
  </div>

  <p align="center">
    
    <?php if (ok != "true")
	{ ?>
    <label>
    <input type="submit" name="test" id="test" value="Test" />
    </label>
    <?php }
	
    
	else
	{
	 ?>
    <label>
    <input type="hidden" name="Submit" id="Submit" />
    <input type="hidden" name="MM_insert" value="form1" />

    <input type="submit" name="Submit" id="Submit" value="Complete Setup" />
    </label>
    <?php } ?>
  </p>
</form>

  <?php } else { ?>
<p> Installation Complete<br />
Start Adding your Produucts  : <a href="Admin/">http://<?php echo $_SERVER['HTTP_HOST'] ?><?php echo $_POST['root'] ?>/Admin/</a><br />
Please change some<a href="Admin/?pname=settings"> essential settings here</a>
  For security reasons please delete this file
  <?php } ?>
</p>
</body>
</html>