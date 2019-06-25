<?php

function url_exists($url) {
    if (!$fp = curl_init($url)) return false;
    return true;
}
if(url_exists('https://in2iptv.com/checkpaid.php?site='.$_SERVER['HTTP_HOST'])){

$json =  file_get_contents('https://in2iptv.com/checkpaid.php?site='.$_SERVER['HTTP_HOST']); 

$array = json_decode($json, true);

if($array['valid'] != 'true')
{

echo 'Subscription expired<br>

Please renew ';
exit;

}}

?>