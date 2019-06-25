<?php 


@$content['themes'] = db_query("SELECT * FROM themes order by name asc",array (
    "name",'directory','active'
),30,0);


$smarty->assign('themes',$content['themes']);
?>