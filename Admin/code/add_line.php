<?php

$tariff = json_decode(file_get_contents(ministra.'/'.ministra_dir.'/api/tariffs'),true);

$smarty->assign('tariff',$tariff['results']);
  if(isset($_POST['form1']) and $_SESSION['MM_UserGroup'] !='Demo')
  {
  @$content['plans'] = db_query("SELECT * FROM iptv WHERE id=".intval($_POST['lines']),array (
    'name','m3u_name','display','id'
),3000,0);
if($content['plans'][0]['is_empty'] != 'true')
{

$expires = date('YmdHis', strtotime('+ '.$_POST['length'].' '.$_POST['type']));
  $insertSQL = sprintf("INSERT INTO `lines` (name, user, active, sub_plan,pass,expires,display,mac) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)",
  
   GetSQLValueString($content['plans'][0]['name'], "text",$GLOBALS['__Connect']),
				      GetSQLValueString($_POST['user'], "text",$GLOBALS['__Connect']),
  GetSQLValueString($_POST['active'], "text",$GLOBALS['__Connect']),

                       GetSQLValueString($content['plans'][0]['id'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['pass'], "text",$GLOBALS['__Connect']),
                       GetSQLValueString($expires, "text",$GLOBALS['__Connect']),
                       GetSQLValueString($content['plans'][0]['m3u_name'], "text",$GLOBALS['__Connect']),
                       GetSQLValueString($_POST['mac'], "text",$GLOBALS['__Connect']));
					    $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
						
						
						if($_POST['mac'] != 'none'){
					$file = file_get_contents(ministra.'/createuser.php?login='.$_POST['user'].'&loginpass='.$_POST['pass'].'&mac='.$_POST['mac'].'&user='.ministra_user.'&pass='.ministra_pass.'&tariff='.$_POST['tariff']);	
					
				echo ministra.'/createuser.php?login='.$_POST['user'].'&loginpass='.$_POST['pass'].'&mac='.$_POST['mac'].'&user='.ministra_user.'&pass='.ministra_pass.'&tariff='.$_POST['tariff'];
					if($file != 'added')
						{
							
$smarty->assign('error',true);
						}
						}
						
						$insertSQL = sprintf("INSERT INTO subscriptions(name,prod_id,user,url,type,display,expires,uname) VALUES(%s,%s,%s,%s,'file',%s,%s,%s)",
                       GetSQLValueString($content['plans'][0]['name'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($content['plans'][0]['id'], "text",$GLOBALS['__Connect']),
                       GetSQLValueString($_POST['user'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($content['plans'][0]['m3u_name'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString($content['plans'][0]['m3u_name'], "text",$GLOBALS['__Connect']),
					   GetSQLValueString(date('YmdHis', strtotime('+ '.$_POST['length'].' '.$_POST['type'].'')), "text",$GLOBALS['__Connect']),
					   GetSQLValueString($_POST['user'], "text",$GLOBALS['__Connect']));
					   
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

$smarty->assign('added',true);

}}
@$content['users_db'] = db_query("SELECT * FROM users_db order by uname asc",array (
    'uname'
),3000,0);

$smarty->assign('users_db',$content['users_db']);
@$content['iptv'] = db_query("SELECT * FROM iptv order by name asc",array (
    'name','id'
),3000,0);

$int1 = 1;
do{
$time[$int1] = $int1;
$int1 ++;
} while($int1 < 101);


$smarty->assign('time',$time);
$smarty->assign('iptv',$content['iptv']);
?>
