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
					<h4>Contact us</h4>
						
				</div>
				<div class="shadow bg-white mTop-30 frameLR" id="container1" style="margin-left:20px;">
							  <form class="contact-form clearfix" action="" method="post" novalidate="novalidate">
                  {if isset($mail_sent)}
                  <div class="red">Thanks for contacting us.<br>
please allow 24 hours for a reply.{else}{/if}
                  <div class="row">
                    <div>
                      <p class="input-block">
                        <label class="required"> Email <span> (*) </span> </label>
                        <br />
                        <input name="email" type="text" class="form-control" id="email" placeholder="Email" requirewd-"required" style="width:80%">
                      </p>
                    </div>
                  </div>
                  <div class="row">
                    <div>
                      <p class="input-block">
                        <label class="required"> name <span> (*) </span> </label>
                        <br />
                        <input name="name" type="text" class="form-control" id="name" style="width:80%">
                      </p>
                    </div>
                  </div>
                  <div class="row">
                    <div>
                      <p class="input-block">
                        <label class="required"> Subject <span> (*) </span> </label>
                        <br />
                        <input name="subj" type="text" class="form-control" id="subj" style="width:80%">
                      </p>
                    </div>
                  </div>
                  <div class="row">
                    <div>
                      <p class="input-block">
                        <label class="required"> Message <span> (*) </span> </label>
                        <br />
                        <textarea name="msg" class="form-control" id="msg" style="width:80%; height:100px;"></textarea>
                      </p>
                    </div>
                  </div>
                  <!-- row -->
                  
                  <p class="textarea-block">
                    
                    <label class="required" for="contact_message"></label>
                  </p>
                  <p class="contact-button clearfix">
                    
                    <input type="submit" class="button_type_4 bg_scheme_color d_inline_middle r_corners tr_all_hover color_light" id="submit-contact" value="Send">
                  </p>
                </form>
              </div>
			  </div>
			<!-- col-md-9 /- -->
			</div>
		</div><!-- container /- -->
</div><!-- Product Section /- -->
	
	<!-- Footer Section -->
	<footer id="footer-section" class="footer-section ow-background"><!-- container /- -->
</footer>
	<!-- Footer Section /- -->

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
