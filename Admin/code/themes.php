<?php 



if(isset($_GET['id']))
{
mysqli_select_db($GLOBALS['__Connect'], database_portfolio);
 $query_templates = sprintf("SELECT * FROM themes WHERE id=%s",intval($_GET['id']));
$templates = mysqli_query($GLOBALS['__Connect'],$query_templates) or die(mysqli_error($GLOBALS['__Connect']));
$row_templates = mysqli_fetch_assoc($templates);
$totalRows_templates = mysqli_num_rows($templates);
if($totalRows_templates > 0)
{
$insertSQL = "UPDATE themes SET active='false'";    
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));


$insertSQL = sprintf("UPDATE themes SET active='true' where id=%s",intval($_GET['id']));    
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  $smarty->assign('updated',true);
}
}
@$content['themes'] = db_query("SELECT * FROM themes order by name asc",array (
    "name",'directory','active','id'
),30,0);

$smarty->assign('themes',$content['themes']);
?>