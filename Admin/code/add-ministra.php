<?php
$tariff = json_decode(file_get_contents(ministra.'/'.ministra_dir.'/api/tariffs'),true);

$smarty->assign('tariff',$tariff['results']);

if($_SESSION['MM_UserGroup'] != 'Demo'){

if(isset($_POST['mac']) and isset($_POST['user']) and isset($_POST['pass']) and isset($_POST['tariff'])){
					$file = file_get_contents(ministra.'/createuser.php?login='.$_POST['user'].'&loginpass='.$_POST['pass'].'&mac='.$_POST['mac'].'&user='.ministra_user.'&pass='.ministra_pass.'&tariff='.$_POST['tariff']);	
					
					echo ministra.'/createuser.php?login='.$_POST['user'].'&loginpass='.$_POST['pass'].'&mac='.$_POST['mac'].'&user='.ministra_user.'&pass='.ministra_pass.'&tariff='.$_POST['tariff'];
$smarty->assign('error',$file);
						
						}


}





$smarty->assign('ministra',ministra);

?>