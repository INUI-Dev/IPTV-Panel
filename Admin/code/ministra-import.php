<?php 

$smarty->assign('date',date('Y-m-d H:i:s'));
$smarty->assign('role',$_SESSION['MM_UserGroup']); if(isset($_POST['date'])) {

if((!empty($_FILES["image"])) && ($_FILES['image']['error'] == 0)) {

      $img = md5(date("Hisms")).'.'.$_FILES['image']['name'];
	  $newname2 = '../vidimgs/'.$img;

        move_uploaded_file($_FILES['image']['tmp_name'],$newname2);    
}
else { 
$img = 'noimg.jpg';
}
set_m3u(str_replace(':-1',':0',file_get_contents(ministra.'/import.php?user='.ministra_user.'&pass='.ministra_pass)),$img);

$smarty->assign('added',true);
}

?>