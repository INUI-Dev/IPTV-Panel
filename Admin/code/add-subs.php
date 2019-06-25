<?php
if(isset($_POST['length'])){

  $insertSQL = sprintf("INSERT INTO `user_lines` (name, cost, length, type) VALUES (%s,%s,%s,%s)",
  
   GetSQLValueString($_POST['name'], "text",$GLOBALS['__Connect']),
				      GetSQLValueString($_POST['credits'], "text",$GLOBALS['__Connect']),
  GetSQLValueString($_POST['length'], "text",$GLOBALS['__Connect']),

                       GetSQLValueString($_POST['type'], "text",$GLOBALS['__Connect']));



$smarty->assign('added',true);					    $Result1 = mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
}
$int1 = 1;
do{
$time[$int1] = $int1;
$int1 ++;
} while($int1 < 101);


$smarty->assign('time',$time);
?>
