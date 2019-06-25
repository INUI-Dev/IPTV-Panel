<?php 
$query_iptv = "SELECT * FROM user_lines ORDER BY id ASC";
$iptv = mysqli_query($GLOBALS['__Connect'],$query_iptv) or die(mysqli_error($GLOBALS['__Connect']));
$row_iptv = mysqli_fetch_assoc($iptv);
$totalRows_iptv = mysqli_num_rows($iptv);
$i = 0;
do {
$tv[$i]['id'] = $row_iptv['id'];
$tv[$i]['name'] = $row_iptv['name'];
$tv[$i]['length'] = $row_iptv['length'];
$tv[$i]['type'] = $row_iptv['type'];

$i ++;
} while ($row_iptv = mysqli_fetch_assoc($iptv));

$smarty->assign('lines',$tv);
?>