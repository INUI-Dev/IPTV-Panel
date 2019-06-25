<?php
class insert extends db{
function setcomment(){
if(isset($_POST['name']))
{
$insertSQL = sprintf("INSERT into comments (name,coment,pageid,item_id,image) VALUES(%s,%s,%s,%s,%s)",
                       db::GetSQLValueString(htmlspecialchars($_POST['name']), "text"),
					   db::GetSQLValueString(htmlspecialchars($_POST['comment']), "text"),
					   db::GetSQLValueString('flash', "text"),
					   db::GetSQLValueString($_GET['id'], "text"),
					   db::GetSQLValueString(htmlspecialchars($_POST['thumb']), "text"));
					  
  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));

}


}

function set_like(){
if(isset($_GET['id']))
{
$query_title = sprintf("SELECT * FROM videos WHERE `liked_by` LIKE %s AND id=%s",db::GetSQLValueString("%".$_SERVER['REMOTE_ADDR']."%",'text'),db::GetSQLValueString($_GET['id'],'int'));
$title = mysqli_query( $GLOBALS['__Connect'], $query_title) or die(mysqli_error($GLOBALS['__Connect']));
$row_title = mysqli_fetch_assoc($title);

  $totalRows_title = mysqli_num_rows($title);
if($totalRows_title == 0){
  mysqli_free_result($title);
  
$query_title = sprintf("SELECT * FROM videos WHERE id=%s",db::GetSQLValueString($_GET['id'],'int'));
$title = mysqli_query( $GLOBALS['__Connect'], $query_title) or die(mysqli_error($GLOBALS['__Connect']));
$row_title = mysqli_fetch_assoc($title);

  $totalRows_title = mysqli_num_rows($title);

$insertSQL = sprintf("UPDATE videos SET liked_by=%s WHERE id=%s",
                      db:: GetSQLValueString($row_title['liked_by'].' '.$_SERVER['REMOTE_ADDR'], "text"),
					  db::GetSQLValueString($_GET['id'], "int"));
 

  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  mysqli_free_result($title);
  $insertSQL = sprintf("UPDATE videos SET likes=likes+1 WHERE id=%s",
                     db::GetSQLValueString($_GET['id'], "int"));
 


  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));


echo '[{
    "success": "true",
    "error": "None"
}]';
}
else
{
echo '{
    "success": "false",
    "error": "None"
}';

}

}


}
function add_playlist(){

$query_title = sprintf("SELECT * FROM playlist WHERE `uname` = %s AND video_id=%s",db::GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)],'text'),db::GetSQLValueString($_GET['id'],'int'));
$title = mysqli_query( $GLOBALS['__Connect'], $query_title) or die(mysqli_error($GLOBALS['__Connect']));
$row_title = mysqli_fetch_assoc($title);

  $totalRows_title = mysqli_num_rows($title);
  if($totalRows_title > 0)
  {
  echo 'already in Playlist';
  }
  else
  {
  
$query_video = sprintf("SELECT * FROM videos WHERE `id` = %s",db::GetSQLValueString($_GET['id'],'int'));
$video = mysqli_query( $GLOBALS['__Connect'], $query_video) or die(mysqli_error($GLOBALS['__Connect']));
$contentv = mysqli_fetch_assoc($video);

  $totalRows_video = mysqli_num_rows($video);
if($totalRows_video > 0)
{
 $insertSQL = sprintf("INSERT INTO playlist (title,fname,type,uname,image,video_id,duration) VALUES ( %s, %s, %s,%s,%s,%s,%s)",
                      db::GetSQLValueString($contentv['name'], "text"),
                       db::GetSQLValueString($contentv['fname'], "text"),
                       db::GetSQLValueString($contentv['type'], "text"),
                       db::GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text"),
                       db::GetSQLValueString($contentv['image'], "text"),
                       db::GetSQLValueString($contentv['id'], "text"),
                       db::GetSQLValueString($contentv['length'], "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  echo 'Sucesss: Added to playlist';
 
  }
  mysqli_free_result($video);
  }
  
  mysqli_free_result($title);


}

function add_playing(){

$query_title = sprintf("SELECT * FROM playing WHERE `token` = %s AND video_id=%s",db::GetSQLValueString($_COOKIE['__Player'],'text'),db::GetSQLValueString($_GET['id'],'int'));
$title = mysqli_query( $GLOBALS['__Connect'], $query_title) or die(mysqli_error($GLOBALS['__Connect']));
$row_title = mysqli_fetch_assoc($title);

  $totalRows_title = mysqli_num_rows($title);
  if($totalRows_title > 0)
  {
  echo 'already in Playlist';
  }
  else
  {
  
$query_video = sprintf("SELECT * FROM videos WHERE `id` = %s",db::GetSQLValueString($_GET['id'],'int'));
$video = mysqli_query( $GLOBALS['__Connect'], $query_video) or die(mysqli_error($GLOBALS['__Connect']));
$contentv = mysqli_fetch_assoc($video);

  $totalRows_video = mysqli_num_rows($video);
if($totalRows_video > 0)
{
 $insertSQL = sprintf("INSERT INTO playing (title,fname,type,uname,image,video_id,duration) VALUES ( %s, %s, %s,%s,%s,%s,%s)",
                      db::GetSQLValueString($contentv['name'], "text"),
                       db::GetSQLValueString($contentv['fname'], "text"),
                       db::GetSQLValueString($contentv['type'], "text"),
                       db::GetSQLValueString($_SESSION[sha1($_SERVER['DOCUMENT_ROOT'].site_root)], "text"),
                       db::GetSQLValueString($contentv['image'], "text"),
                       db::GetSQLValueString($contentv['id'], "text"),
                       db::GetSQLValueString($contentv['length'], "text"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
  echo 'Sucesss: Added to playlist';
 
  }
  mysqli_free_result($video);
  }
  
  mysqli_free_result($title);


}

function add_views()
{
 $insertSQL = sprintf("UPDATE videos SET views=views+1 WHERE id=%s",
                       db::GetSQLValueString($_GET['id'], "int"));

  

  
  mysqli_query($GLOBALS['__Connect'],$insertSQL) or die(mysqli_error($GLOBALS['__Connect']));
}
}