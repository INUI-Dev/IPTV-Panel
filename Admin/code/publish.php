<?php



@$content['themes'] = db_query("SELECT * FROM `lines` WHERE id = ".intval($_GET['url']),array (
    "user",'pass','sub_plan'
),30,0); @$content['themes2'] = db_query("SELECT * FROM iptv WHERE id = ".intval($content['themes'][0]['sub_plan']),array (
    "user",'pass','m3u_name'
),30,0); 

if($content['themes2'][0]['is_empty'] == 'false')
{
	$ttt = 'http://'.$_SERVER['HTTP_HOST'].'/iptv.php?user='.$content['themes'][0]['user'].'&pass='.$content['themes'][0]['pass'].'&list='.$content['themes2'][0]['m3u_name'];
	echo ministra.'/add_links.php?url='.urlencode($ttt);
	file_get_contents(ministra.'/add_links.php?url='.urlencode($ttt));
}
?>