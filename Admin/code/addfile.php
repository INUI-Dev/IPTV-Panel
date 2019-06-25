<?php

$smarty->assign('upload_max_filesize',ini_get('upload_max_filesize'));
$smarty->assign('post_max_size',ini_get('post_max_size'));
$smarty->assign('memory_limit',ini_get('memory_limit'));
$smarty->assign('max_input_time',ini_get('max_input_time'));
$smarty->assign('max_execution_time',ini_get('max_execution_time'));

mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_users_db = "SELECT * FROM categories order by name asc";
$users_db = mysqli_query($GLOBALS['__Connect'],$query_users_db) or die(mysqli_error($GLOBALS['__Connect']));
$row_users_db = mysqli_fetch_assoc($users_db);
$totalRows_users_db = mysqli_num_rows($users_db);
$i = 0;
do {
$users_db2[$i]['name'] = $row_users_db['name'];
$users_db2[$i]['url'] = $row_users_db['url'];
$users_db2[$i]['products'] = $row_users_db['products'];
;
$i ++;
} while ($row_users_db = mysqli_fetch_assoc($users_db));

$smarty->assign('categories',$users_db2);




mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_lines = "SELECT * FROM iptv order by name asc";
$lines = mysqli_query($GLOBALS['__Connect'],$query_lines) or die(mysqli_error($GLOBALS['__Connect']));
$row_lines = mysqli_fetch_assoc($lines);
$totalRows_lines = mysqli_num_rows($lines);
$i = 0;
do {
$lines2[$i]['name'] = $row_lines['name'];
$lines2[$i]['sub'] = $row_lines['sub'];
$lines2[$i]['id'] = $row_lines['id'];
$lines2[$i]['display'] = $row_lines['m3u_name'];
;
$i ++;
} while ($row_lines = mysqli_fetch_assoc($lines));
$smarty->assign('lines',$lines2);
$i=1;

do {
$list[$i]['list'] = $i;


$i ++;
} while ($i <= 100);
$smarty->assign('list',$list);
?>