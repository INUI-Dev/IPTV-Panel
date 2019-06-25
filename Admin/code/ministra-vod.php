<?php 
$smarty->assign('role',$_SESSION['MM_UserGroup']); if(isset($_POST['sub'])) {

if((!empty($_FILES["image"])) && ($_FILES['image']['error'] == 0)) {

      $img = md5(date("Hisms")).'.'.$_FILES['image']['name'];
	  $newname2 = '../vidimgs/'.$img;

        move_uploaded_file($_FILES['image']['tmp_name'],$newname2);    
}
else { 
$img = 'noimg.jpg';
}
$set = set_m3u_demand(str_replace(':-1',':0',file_get_contents(ministra.'/add-vod.php?user='.ministra_user.'&pass='.ministra_pass)),$img);

$smarty->assign('added',$set);
}

?>