{include file='header.tpl'}
					
				</div>
			</div><!-- /.container -->
		</div><!-- Menu Block /- -->
	</header><!-- Header Section /- -->
	
	<!-- Page Banner -->
	<!-- Page Banner /- -->
    <!-- Product Section -->
<div id="product-section" class="product-section shop">
		<!-- container -->
		<div class="container">
			<div class="row">
				<!-- col-md-3 -->
			<div class="col-md-3 col-sm-4 product-sidebar">
				<aside class="widget service-category-widget">
					<h3>category menu</h3>
					<ul>
						{foreach $categories as $items}<li><i class="fa fa-long-arrow-right"></i><a title="Bathroom Cleaners" href="{$site_root}/categories.php?id={$items.url}">{$items.name}</a></li>{/foreach}
					</ul>
				</aside>
				
				<aside class="widget widget_search">
					<h3>SEARCH PRODUCT</h3>
					<form method="get" action="#" role="search" class="search">
						<input type="text" required="" class="form-control" placeholder="FIND HERE..." id="s" name="s">
						<span class="search-icon input-group-btn"><button type="submit" class="btn btn-xlg"></button></span>
					</form>
				</aside>
				<aside class="widget add-widget">
					
									<h3>Sponsors</h3>
									{$ads.top.0.code}					
				</aside>
			</div><!-- col-md-3 /- -->
			<!-- col-md-9 -->
			<div class="col-md-9 col-sm-8">
				<div align="center" style="margin-bottom:10px;">{$ads.top.0.code}</div>
				<div class="product-category">
					<h4>Basket</h4>
						
				</div>
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
                     <input type="hidden" name="notify_url" value="http://{$smarty.server.HTTP_HOST}{$site_root}/paypalipn.php" />
                     <input name="return" value="http://{$smarty.server.HTTP_HOST}{$site_root}/account.php?uname={$smarty.server.REMOTE_ADDR|urlencode}" type="hidden" />
                     <input name="cancel_return" value="http://{$smarty.server.HTTP_HOST}{$site_root}/" type="hidden" />
                     <input name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted" type="hidden" />
                     <input alt="PayPal - The safer, easier way to pay online." name="submit" src="http://www.paypalobjects.com/en_US/GB/i/btn/btn_buynowCC_LG.gif" type="image" border="0" style="200px; height:auto" />
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
                      <label for="mac"></label>
                      Mac Address : 
                      <input name="mac" type="text" id="mac" value="none" />
                      <input name="basket" type="hidden" id="basket" value="true">
                                        <input class="btn btn-primary" type="submit" name="payment" id="payment" value="Go to payment">
                                       
                    </form>                    </td>
                  </tr>
                </table>
          {/if}{/if}
              </div>
							</section>
				</div>
			<!-- col-md-9 /- -->
			</div>
		</div><!-- container /- -->
</div><!-- Product Section /- -->
	
	<!-- Footer Section -->
	<footer id="footer" class="type_2">
				
				<!--copyright part-->
				<div class="footer_bottom_part">
					<div class="container clearfix t_mxs_align_c">
						<p class="f_left f_mxs_none m_mxs_bottom_10">&copy; 2019 <span class="color_light">IN2IPTV.com</span>. All Rights Reserved.</p>
						
					</div>
				</div>
			</footer><!-- Footer Section /- -->

	<!-- jQuery Include -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/jquery.min.js"></script>	
<script src="{$site_root}/themes/{$theme_dir}/libraries/jquery.easing.min.js"></script><!-- Easing Animation Effect -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/bootstrap/bootstrap.min.js"></script> <!-- Core Bootstrap v3.3.4 -->
<script type="text/javascript" src='http://maps.google.com/maps/api/js?sensor=false'></script>
<script src="{$site_root}/themes/{$theme_dir}/libraries/gmap/jquery.gmap.min.js"></script> <!-- Light Box -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/fuelux/jquery-ui.min.js"></script> <!-- Price Filter -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/jquery.animateNumber.min.js"></script> <!-- Used for Animated Numbers -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/jquery.appear.js"></script> <!-- It Loads jQuery when element is appears -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/jquery.knob.js"></script> <!-- Used for Loading Circle -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/wow.min.js"></script> <!-- Use For Animation -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/owl-carousel/owl.carousel.min.js"></script> <!-- Core Owl Carousel CSS File  *	v1.3.3 -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/portfolio-filter/jquery.quicksand.js"></script> <!-- Portfolio Filter -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/expanding-search/modernizr.custom.js"></script> <!-- Core Owl Carousel CSS File  *	v1.3.3 -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/flexslider/jquery.flexslider-min.js"></script> <!-- flexslider -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/jquery.magnific-popup.min.js"></script> <!-- Light Box -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/expanding-search/modernizr.custom.js"></script> <!-- Core Owl Carousel CSS File  *	v1.3.3 -->
<script src="{$site_root}/themes/{$theme_dir}/libraries/expanding-search/classie.js"></script> 
<script src="{$site_root}/themes/{$theme_dir}/libraries/expanding-search/uisearch.js"></script>
<script>
		new UISearch( document.getElementById( 'sb-search' ) );
	</script>
	<!-- Customized Scripts -->
<script src="{$site_root}/themes/{$theme_dir}/js/functions.js"></script>
	
</body>
</html>
