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
					
									<h3>Sponsors</h3>{$ads.side.0.code}					
				</aside>
			</div><!-- col-md-3 /- -->
			<!-- col-md-9 -->
			<div class="col-md-9 col-sm-8">
				<div align="center" style="margin-bottom:10px;">{$ads.side.0.code}</div><div class="product-category">
					<h4>Free live</h4>
						
				</div><form method="get">
						<input type="text" required="" class="form-control" placeholder="FIND HERE..." id="psearch" name="psearch">
						<span class="search-icon input-group-btn"><button type="submit" class="btn btn-xlg"></button></span>
					</form><div class="clear"></div>
				{if $videos.0.is_empty == 'true'}<h3>No free streams found</h3>
				{else}<ul class="product-main row">
				  {foreach $videos as $items}
				  <li class="col-md-4 col-sm-6 col-xs-6" style="min-height:180px;">
					<div class="product-box">
						<a title="Product" href="{$site_root}/watch.php?id={$items.id}">
						<img src="{$site_root}/vidimgs/{$items.image}" alt="{$items.name}"  class="tr_all_hover"></a>
						<div class="product-detail">
							<a title="Product Name" href="{$site_root}/watch.php?id={$items.id}" class="product-title">{$items.name|truncate:40}</a></div>
					</div>
					</li>{/foreach}
				</ul>{include file='paginations-video.tpl'}{/if}
				
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
			</footer>
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