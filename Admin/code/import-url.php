<?php 

$smarty->assign('role',$_SESSION['MM_UserGroup']);

if(isset($_POST['url'])) { $file = $_POST['url'];
$file_headers = @get_headers($file);
if(!$file_headers || $file_headers[0] == 'HTTP/1.1 404 Not Found') {
    $exists = false;
	
$smarty->assign('exists',false);
}
else {
    $exists = true;
}
 if($exists) {

if((!empty($_FILES["image"])) && ($_FILES['image']['error'] == 0)) {

      $img = md5(date("Hisms")).'.'.$_FILES['image']['name'];
	  $newname2 = '../vidimgs/'.$img;

        move_uploaded_file($_FILES['image']['tmp_name'],$newname2);    
}
else { 
$img = 'noimg.jpg';
}
set_m3u(str_replace(":-1",":0",file_get_contents($_POST['url'])));

$smarty->assign('added',true);
}}

?>