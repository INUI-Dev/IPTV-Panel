{include file='header.tpl'}
					
	
		<script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=xa-5306f8f674bfda4c"></script>			</div>
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
				<div class="col-md-9 single-product-detail">
					<!-- Single Product Slider -->
					<div class="col-md-6 single-product-slider ow-padding-left">
						<div id="product-slider" class="flexslider">
							<ul class="slides">
								<li><img src="{$site_root}/prod/{$files.0.image}" alt="single-product" /></li>
							</ul>
						</div>
						</div>
					<!-- Single Product Slider /- -->
					
					<div class="col-md-6">
						<div class="summary entry-summary">
							<h1 class="product_title entry-title">{$files.0.name}</h1>
							<p class="price"><span style="color:#990000; text-decoration:line-through; margin-right:20px;">{$curency}{$files.0.discount}</span>{$curency}{$files.0.price}</p>
								<div class="d_inline_middle m_left_5 addthis_widget_container">
								<!-- AddThis Button BEGIN -->
								<div class="addthis_toolbox addthis_default_style addthis_32x32_style">
								<a class="addthis_button_preferred_1"></a>
								<a class="addthis_button_preferred_2"></a>
								<a class="addthis_button_preferred_3"></a>
								<a class="addthis_button_preferred_4"></a>
								<a class="addthis_button_compact"></a>
								<a class="addthis_counter addthis_bubble_style"></a>
								</div>
								<!-- AddThis Button END -->
							</div>
	          <div class="add-to-cart">
								<a title="Add To Cart" href="#" class="btn" onClick="add_basket({$files.0.id})">Add To Cart</a>
						  </div>
						</div>
					</div>
					
					<div class="woocommerce-tabs">
						<div role="tabpanel">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a title="Description" href="#description" aria-controls="description" role="tab" data-toggle="tab">Description</a></li>
								{if $tabs.0.is_empty == 'false'}{foreach $tabs as $items}
                    <li class="f_xs_none">
                      <a href="#file{$items.id}"  class="bg_light_color_1 color_dark tr_delay_hover r_corners d_block">
                        {$items.name}                      </a>                    </li>{/foreach}{/if}
                  
							</ul>
				      <!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="description">
								  <p>{$files.0.description}</p>
							  </div>
								
                                
                        {if $tabs.0.is_empty == 'false'}{foreach $tabs as $items} 
                        <div role="tabpanel" class="tab-pane" id="file{$items.id}">
                          <!-- Google map, just iframe for now -->
                     <div class="google-maps">
                          {$items.content}                     </div>
                          <!-- /google map -->
                        </div>{/foreach}{/if}
						  </div>
						</div>
					</div>
					
					<div class="section-header">
						<h3>RELATED PRODUCTS</h3>
					</div>
					
				{if 	$related.0.is_empty == 'true'}No related products{else}
				<ul class="product-main">{foreach $related as $items}<li class="col-md-4 col-sm-6 col-xs-6">
					<div class="product-box">
						<a title="Product" href="{$site_root}/product/{$items.display}">
						<img src="{$site_root}/prod/{$items.image}" alt="{$items.name}"  class="tr_all_hover"></a>
						<div class="product-detail">
							<a title="Product Name" href="{$site_root}/product/{$items.display}" class="product-title">{$items.name}</a>
							<span>
								<span class="price">{$curency} {$items.price}</span>
								<a title="Add To Cart" href="javascript: voiud(0);" class="btn pull-right" onClick="add_basket({$items.id})">Add to Cart</a>								</span>							</div>
					</div>
					</li>
				{/foreach}{/if}
					</ul>				
			  </div><!-- col-md-9 /- -->
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
	<!-- jQuery Include -->	<script src="{$site_root}/themes/{$theme_dir}/libraries/jquery.min.js"></script>	
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
	
	<!-- Customized Scripts -->
<script src="{$site_root}/themes/{$theme_dir}/js/functions.js"></script>
	
</body>
</html>
