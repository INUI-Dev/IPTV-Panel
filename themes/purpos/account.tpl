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
					<h4>Account info</h4>
						
				</div>
				<section class="col-lg-9 col-md-9 col-sm-9">
					       <div>{if isset($cleared) && $cleared}<h4 align="center" class="cleared">Your iptv list has been cleared</h4>{/if}<h4 align="center"><a onclick="javascript: return confirm('Are you Sure?');" href="?clear_list=true">Clear My iptv List</a></h4>
					       </div> <p>Your iptv plan:<br />
					          <a href="http://{$smarty.server.HTTP_HOST}{$site_root}/user.php?user={$user.0.email}&amp;pass={$pword1}" target="_blank">http://{$smarty.server.HTTP_HOST}{$site_root}/user.php?user={$user.0.email}&amp;pass=***</a></p>
					        <hr />
					        <!--products-->
<section class="color_dark m_bottom_10 heading5 animate_ftr">	<h2 class="tt_uppercase color_dark m_bottom_10 heading5 animate_ftr">Orders</h2>
					</section>
							<section class="color_dark m_bottom_10 heading5 animate_ftr">	
        {if $orders.0.is_empty == 'true'}<h2> No orders found</h2></li>{else} 
          <div class="col-sm-12 clearfix">  
              <hr class="hr-grid-space" data-symbol="Orders">
              {if $orders.0.is_empty == 'false'}{foreach $orders as $items}
              <div class="col-sm-6" style="width:99%;">
                <div class="deal-entry green">
                      <div class="image" align="center">
                        <img src="{$site_root}/prod/{$items.image}" alt="{$items.name}" class="img-responsive">                  </div>
                  <!-- /.image -->
                      <div class="title">
                         
                        {$items.name}
                        <br />
                        Your Line<br />
                        <p style="color:#990000;">http://{$smarty.server.HTTP_HOST}{$site_root}/iptv/{$items.user}/<strong>yourpassword</strong>/{$items.display}</p>
                  </div>
                </div>
              </div>
              {/foreach}{else}
              <h4>You dont have any orders yet</h4>
              {/if}              </div>
          {/if}
          <!--======= SIDE BAR =========-->
							</section>
							<!--banners--><!--bestsellers carousel-->
                          <!--product brands-->
                          <!--product brands carousel-->
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
