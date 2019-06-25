<?php



@$content['lines'] = db_query("SELECT * FROM `iptv`",array (
    "id",'name'
),30,0);


$smarty->assign('iptv',$content['lines']);

 @$content['streams'] = db_query("SELECT * FROM `streams`",array (
    "user",'pass','sub_plan'
),30,0); 
if($content['streams'][0]['is_empty'] == 'false')
{
	if(isset($_POST['user'])){
		$ttt = 'http://'.$_SERVER['HTTP_HOST'].site_root.'/Admin/admin.php?user='.$_POST['user'].'&pass='.$_POST['pass'].'&line='.$_POST['line'].'&type=live&tariff='.$_POST['tariff'];
	$file1 = file_get_contents(ministra.'/add_links.php?tariff='.$_POST['tariff'].'&user='.ministra_user.'&pass='.ministra_pass.'&url='.urlencode($ttt));
	
	
$smarty->assign('added',$file1);			
	}
	
	
}

$tariff = json_decode(file_get_contents(ministra.'/'.ministra_dir.'/api/tariffs'),true);

$smarty->assign('tariff',$tariff['results']);
?>