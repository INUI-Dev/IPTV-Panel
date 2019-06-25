<?php 
$smarty->assign('role',$_SESSION['MM_UserGroup']); if((!empty($_FILES["upload"])) && ($_FILES['upload']['error'] == 0)) {

if((!empty($_FILES["image"])) && ($_FILES['image']['error'] == 0)) {

      $img = md5(date("Hisms")).'.'.$_FILES['image']['name'];
	  $newname2 = '../vidimgs/'.$img;

        move_uploaded_file($_FILES['image']['tmp_name'],$newname2);    
}
else { 
$img = 'noimg.jpg';
}
set_m3u_demand(str_replace(':-1',':0',file_get_contents($_FILES['upload']['tmp_name'])),$img);

$smarty->assign('added',true);
}

?>