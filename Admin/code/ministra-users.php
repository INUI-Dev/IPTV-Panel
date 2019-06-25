<?php
if(isset($_GET['delete']))
{
file_get_contents(ministra.'/delete.php?id='.$_GET['delete'].'&mac='.$_GET['mac'].'&user='.ministra_user.'&pass='.ministra_pass);	


$smarty->assign('deleted',true); 
}

$file = file_get_contents(ministra.'/list_users.php?user='.ministra_user.'&pass='.ministra_pass);	
			
		
$smarty->assign('users_db',json_decode($file,true)); 

?>