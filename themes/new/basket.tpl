{include file='header.tpl'}
			<!--slider with banners--><!--content-->
			<div class="page_content_offset">
				<div class="container">
					<!--banners-->
					<div class="row clearfix">
						<aside class="col-lg-3 col-md-3 col-sm-3 m_xs_bottom_30">
							<!--widgets-->
							<figure class="widget animate_ftr shadow r_corners wrapper m_bottom_30">
								<figcaption>
									<h3 class="color_light">Categories</h3>
								</figcaption>
								<div class="widget_content">
								  <ul class="categories_list">
							  {foreach $categories as $items}<li><a href="{$site_root}/categories/{$items.url}"><i class="ti-direction-alt">
                      </i> 
                 <b> {$items.name}</b> </a> </li>{/foreach}
									</ul>
							  </div>
						  </figure>
							<!--Sponsors-->
							<figure class="widget animate_ftr shadow r_corners wrapper m_bottom_30">
								<figcaption>
									<h3 class="color_light">Sponsors</h3>
								</figcaption>
								<div class="widget_content">
									{$ads.top.0.code}					</div>
				      </figure>
							<!--Bestsellers--><!--tags-->
						</aside>
						{$ads.top.0.code}	<section class="col-lg-9 col-md-9 col-sm-9">
							<h2 class="tt_uppercase color_dark m_bottom_10 heading5 animate_ftr">Your Basket</h2>
							<!--products-->
							<section class="color_dark m_bottom_10 heading5 animate_ftr">	
						
						 <div class="shadow bg-white mTop-30 frameLR" id="container1">
                
               {if isset($deleted)}
          <div class="alert alert-success"><strong>Success </strong>Item deleted from basket.</div>{/if} {if $basket.0.is_empty == 'true'}<h3>Your basket is empty</h3>
               {else}{if isset($smarty.post.basket) and isset($smarty.post.payment)}<form id="form3" name="form3" method="post" action="https://www.{if $sandbox == 'true'}sandbox.{/if}paypal.com/cgi-bin/webscr">
                 <div align="center">
                  {foreach $basket as $items}  <table width="100%" class="table table-bordered table-striped table-hover table-responsive">
  <tbody>
                              
                              <tr>
                                <td rowspan="5" width="120px;"><img src="{$site_root}/prod/{$items.image}" width="100px"/></td>
                                <td colspan="2">{$items.name}                                </td>
                              </tr>
                              <tr>
                                <td><strong>Price</strong></td>
                                <td><strong>{$curency}{$items.price}</strong></td>
                              </tr>
                              <tr>
                                
                                <td  rowspan="2" colspan="2"><div align="center"></div></td>
                              </tr>
                              
                            </tbody>
                          </table>
                  {/foreach}
                   <p>Total payment now : <strong>{$curency}{$totalprice}</strong><br>
                     <input name="cmd" value="_xclick" type="hidden" />
                     <input name="business" value="{$paypal_email}" type="hidden" />
                     <input name="lc" value="US" type="hidden" />
                     <input name="item_name" value="{$smarty.server.HTTP_HOST} - Remapping Files" type="hidden" />
                     <input name="item_number" value="{$smarty.server.REMOTE_ADDR}" type="hidden" />
                     <input name="amount" value="{$totalprice}" type="hidden" />
                     <input name="currency_code" value="{$moneycode}" type="hidden" />
                     <input name="button_subtype" value="services" type="hidden" />
                     <input name="no_note" value="0" type="hidden" />
                     <input name="cn" value="Add special instructions to the seller" type="hidden" />
                     <input name="no_shipping" value="0" type="hidden" />
                     <input name="rm" value="1" type="hidden" />
                     <input type="hidden" name="notify_url" value="https://{$smarty.server.HTTP_HOST}{$site_root}/paypalipn.php" />
                     <input name="return" value="https://{$smarty.server.HTTP_HOST}{$site_root}/account.php?uname={$smarty.server.REMOTE_ADDR|urlencode}" type="hidden" />
                     <input name="cancel_return" value="http://{$smarty.server.HTTP_HOST}{$site_root}/" type="hidden" />
                     <input name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted" type="hidden" />
                     <input alt="PayPal - The safer, easier way to pay online." name="submit" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_buynowCC_LG.gif" type="image" border="0" style="200px; height:auto" />
                   </p>
                 </div>
               </form>{else}{foreach $basket as $items}
                <table width="100%" class="table table-bordered table-striped table-hover table-responsive">
<tbody>
                              
                              <tr>
                                <td rowspan="5" width="120px;"><img src="{$site_root}/prod/{$items.image}" width="100px"/></td>
                                <td colspan="2">{$items.name}                                </td>
                              </tr>
                              <tr>
                                <td><strong>Price</strong></td>
                                <td><strong>{$curency}{$items.price}</strong></td>
                              </tr>
                              <tr>
                                
                                <td  colspan="2"><div align="center"><a href="?delete=true&id={$items.id}"><strong>Remove from basket</strong></a></div></td>
                              </tr>
                              <tr>
                                <td colspan="2">&nbsp;</td>
                                
                              </tr>
                            </tbody>
                          </table>
          {/foreach}
               
                <table width="100%" class="table table-bordered table-striped table-hover table-responsive">
                  <tr>
                    <td width="200px">Total Products in basket</td>
                    <td><strong>{$basket.0.total_rows}</strong></td>
                  </tr>
                  <tr>
                    <td>Total Price </td>
                    <td><strong>{$curency}{$totalprice}</strong></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><form name="form1" method="post" action="">
                      <input name="basket" type="hidden" id="basket" value="true">
                                        <input class="btn btn-primary" type="submit" name="payment" id="payment" value="Go to payment">
                                       
                    </form>                    </td>
                  </tr>
                </table>
          {/if}{/if}
              </div>
							</section>
							<!--banners--><!--bestsellers carousel-->
                          <!--product brands-->
                          <!--product brands carousel-->
						</section>
					</div>
			  </div>
			</div>
			<!--markup footer-->
			<footer id="footer" class="type_2">
				
				<!--copyright part-->
				<div class="footer_bottom_part">
					<div class="container clearfix t_mxs_align_c">
						<p class="f_left f_mxs_none m_mxs_bottom_10">&copy; 2019 <span class="color_light">IN2IPTV.com</span>. All Rights Reserved.</p>
						
					</div>
				</div>
			</footer>
		</div>
		<!--social widgets-->
		
		<!--custom popup-->
		<div class="popup_wrap d_none" id="quick_view_product">
			<section class="popup r_corners shadow">
				<button class="bg_tr color_dark tr_all_hover text_cs_hover close f_size_large"><i class="fa fa-times"></i></button>
				<div class="clearfix">
					
				</div>
			</section>
		</div>
		<!--login popup-->
		
		<button class="t_align_c r_corners type_2 tr_all_hover animate_ftl" id="go_to_top"><i class="fa fa-angle-up"></i></button>
		<!--scripts include-->
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery-2.1.0.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/retina.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery.flexslider-min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/waypoints.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery.isotope.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/owl.carousel.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery.tweet.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery.custom-scrollbar.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/scripts.js"></script>
<script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=xa-5306f8f674bfda4c"></script>
<script type="text/javascript">
 
 {literal}function add_video(id)
{

$.getJSON("{/literal}{$site_root}{literal}/add_iptv.php?uname={/literal}{$smarty.server.REMOTE_ADDR}{if isset($smarty.get.type) && $smarty.get.type == 'live'}&type=live{/if}{literal}&id=" + id, function( json ) {
  
if(1 == 1)
  { $('#' + id).html('Added <a href="javascript:void(0)" onclick="remove(' + id + ')">Remove fron list </a>');
 $('#vidadded').html('<a href="#">Video Added To iptv plan</a>');
     $( "#vidadded" ).fadeIn( "slow", function() {
	 setTimeout(function() {
         $( "#vidadded" ).fadeOut( "slow", function() {

  });
    }, 5000);
  });
  }
  });
}
{/literal}
 {literal}function remove(id)
{

$.getJSON("{/literal}{$site_root}{literal}/remove_iptv.php?uname={/literal}{$user.0.uname}{$smarty.server.REMOTE_ADDR}{literal}&id=" + id, function( json ) {
  
if(json.added == 'true')
  { 
   $('#' + id).html('<a href="javascript:void(0)" onclick="add_video(' + id + ')">Add to list </a>');
	 $('#vidadded').html('<a href="#">Video Removed from list</a>');
     $( "#vidadded" ).fadeIn( "slow", function() {
	  setTimeout(function() {
         $( "#vidadded" ).fadeOut( "slow", function() {

  });
    }, 5000);
  });
  }
  });
}

{/literal}
 
 </script>
	</body>
</html>