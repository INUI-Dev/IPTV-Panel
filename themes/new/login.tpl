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
								<figcaption></figcaption>
						  </figure>
							<!--Bestsellers--><!--tags-->
						</aside>	<section class="col-lg-9 col-md-9 col-sm-9">
							<h2 class="tt_uppercase color_dark m_bottom_10 heading5 animate_ftr">Please Login</h2>
							<!--products-->
							<div class="shadow bg-white mTop-30 frameLR" id="container1" style="margin-left:20px;">
							  <form class="contact-form clearfix" action="" method="post" novalidate="novalidate">
                  {if isset($loginaction)}<div class="red">Login failed, Please try again</div>{else}{/if}
                  <div class="row">
                    <div>
                      <p class="input-block">
                        <label class="required"> Email <span> (*) </span> </label>
                        <br>
                        <input name="uname" type="text" class="form-control" id="uname" placeholder="Email" requirewd-"required" style="width:80%;">
                      </p>
                    </div>
                  </div>
                  <div class="row">
                    <div>
                      <p class="input-block">
                        <label class="required"> Password <span> (*) </span> </label>
                        <br>
                        <input name="pword" type="password" class="form-control" id="pword" style="width:80%;">
                      </p>
                    </div>
                  </div>
                  <!-- row -->
                  
                 
                  <p class="contact-button clearfix">&nbsp;                    </p>
                  <p class="contact-button clearfix">
                    <input type="submit" class="button_type_4 bg_scheme_color d_inline_middle r_corners tr_all_hover color_light" id="submit-contact" value="Login"> 
                    - 
                    <a href="{$site_root}/register.php" class="button_type_4 bg_scheme_color d_inline_middle r_corners tr_all_hover color_light">Join us now</a>                  </p>
							  </form>
              </div><!--banners--><!--bestsellers carousel-->
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
{literal}<script type="text/javascript">function add_basket(id)
{

$.getJSON("{/literal}{$site_root}{literal}/basket.php?uname={/literal}{$smarty.server.REMOTE_ADDR}{literal}&id=" + id, function( json ) {
  if(json.added == 'true')
  { 
  $( "#basket-popup" ).slideDown( "slow", function() {
  $.get( "{/literal}{$site_root}{literal}/basket_box.php", function( data ) {
  $( "#basket_box" ).html( data );
});
  });
  }
  if(json.added == 'false')
  {$( "#basket-popup" ).slideDown( "slow", function() {
$.get( "{/literal}{$site_root}{literal}/basket_box.php", function( data ) {
  $( "#basket_box" ).html( data );
});  });
  }
 });
 
 $.get( "{/literal}{$site_root}{literal}/basket-box.php", function( data ) {
  $( "#basket_box" ).html( data );
});
 
 }{/literal}
 
 
 </script>
	</body>
</html>