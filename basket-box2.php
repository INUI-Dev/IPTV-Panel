<?php 
// Author : Paul Moore
// Project : In2streams.co Video CMS
include('config/config.php');
if(defined('disable') && disable){
include('noservice.html');
exit;

}
include('functions/db.php');
include('functions/settings.php');
include "phpqrcode/qrlib.php"; 
$get_query = new setup;
$db1 = new db;
$db1->connect();
$content['basket']= $db1->db_query("SELECT * FROM basket WHERE ip=".$db1->GetSQLValueString($_SERVER['REMOTE_ADDR'], "text")." and paid = 'false' ORDER BY id Desc",array (
    "name",'price','image','id'
),1000000,0); ?>
              <?php if($content['basket'][0]['is_empty'] != 'true'){ ?><?php 
			  
			  $prce = 0.0; 
			  $int123=0; foreach($content['basket'] as $items) { 
			  $prce += $items['price'];
			  $int123 ++;
            } ?><i class="cart-icon"><?php echo $int123 ?></i>
								cart - <?php echo curency ?><?php echo $prce ?><br>
 <a href="<?php echo site_root?>/basket.html">Go to checkout</a><?php } else{ ?>No items in basket<?php } ?>