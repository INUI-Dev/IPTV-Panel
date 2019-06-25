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
					<h4>Register</h4>
						
				</div>
				<div class="shadow bg-white mTop-30 frameLR" id="container1" style="margin-left:20px;">
							 	
						
						 <div class="shadow bg-white mTop-30 frameLR" id="container1" style="margin-left:10px;">
                {if isset($user_added)}<div class="alert alert-success alert-dismissible" role="alert">Welcome <strong>{$smarty.post.uname|escape}</strong></div>
                {else}{if isset($email_valid)}
                <div class="alert alert-danger  alert-dismissible" role="alert">Please enter a valid email address</div>{/if}{if isset($uname_taken)}<div class="alert alert-danger  alert-dismissible" role="alert">Username taken please choose another</div>{/if}{if isset($email_taken)}<div class="alert alert-danger  alert-dismissible" role="alert">Email taken please choose another</div>{/if}<form class="contact-form clearfix" action="#" method="post" novalidate="novalidate">
                  <div class="row">
                    <div>
                      
                        <label class="required"> Username <span> (*) </span> </label>
                        <br>
<input name="uname" type="text" class="form-control" id="uname" value="{if isset($smarty.post.uname)}{$smarty.post.uname|escape}{/if}" placeholder="Username" requirewd-"required" style="width:80%;">
                      
                    </div>
                  </div><div class="row">
                    <div>
                      <p >
                        <label class="required"> Email <span> (*) </span> </label>
                        <br>
<input name="email" type="text" class="form-control" id="email" value="{if isset($smarty.post.email)}{$smarty.post.email|escape}{/if}" placeholder="Email" requirewd-"required"  style="width:80%;">
                      </p>
                    </div>
                  </div>
                  <div class="row">
                    <div>
                      <p >
                        <label class="required"> Password <span> (*) </span> </label>
                        <br>
<input name="pword" type="password" class="form-control" id="pword"  style="width:80%;">
                      </p>
                    </div>
                  </div>
                  
                  <p>&nbsp;</p>
                  <p>
                    <input type="submit" class="button_type_4 bg_scheme_color d_inline_middle r_corners tr_all_hover color_light" id="submit-contact" value="Register">
                    
                    </p>
                </form>{/if}
              </div>
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
