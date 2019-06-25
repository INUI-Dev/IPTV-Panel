{include file='header.tpl'}
			<!--slider with banners--><!--content-->
			<div class="page_content_offset">
				<div class="page_content_offset">
				<div class="container">
					<div class="row clearfix">
						<!--left content column-->
						<section class="col-lg-9 col-md-9 col-sm-9 m_xs_bottom_30">
							<div class="clearfix m_bottom_30 t_xs_align_c">
						<div class="photoframe type_2 shadow r_corners f_left f_sm_none d_xs_inline_b product_single_preview relative m_right_30 m_bottom_5 m_sm_bottom_20 m_xs_right_0 w_mxs_full">
						  <div class="relative d_inline_b m_bottom_10 qv_preview d_xs_block">
								<img class="img-responsive" src="{$site_root}/prod/{$files.0.image}" data-zoom-image="{$site_root}/prod/{$files.0.image}" width="100%" alt="" >
								<a href="images/preview_zoom_1.jpg" class="d_block button_type_5 r_corners tr_all_hover box_s_none color_light p_hr_0">
									<i class="fa fa-expand"></i>
								</a>
							</div>
							<!--carousel-->
						</div>
						<div class="p_top_10 t_xs_align_l">
							<!--description-->
							<h2 class="color_dark fw_medium m_bottom_10">{$files.0.name}</h2>
					    <hr class="divider_type_3 m_bottom_15">
							<div class="m_bottom_15">
								<s class="v_align_b f_size_ex_large">{$curency}{$files.0.discount}</s><span class="v_align_b f_size_big m_left_5 scheme_color fw_medium">{$curency}{$files.0.price}</span>
							</div>
							<div class="d_ib_offset_0 m_bottom_20">
								<button class="button_type_12 r_corners bg_scheme_color color_light tr_delay_hover d_inline_b f_size_large" onClick="add_basket({$files.0.id})">Add to Cart</button>
							</div>
							<p class="d_inline_middle">Share this:</p>
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
						</div>
					</div>
					<!--tabs-->
					<div class="tabs m_bottom_45">
						<!--tabs navigation-->
						<nav>
							<ul class="tabs_nav horizontal_list clearfix" role="tablist">
                    <li role="presentation" class="f_xs_none">
                      <a href="#tab-1"  class="bg_light_color_1 color_dark tr_delay_hover r_corners d_block">
                        Overview                      </a>                    </li>
                    {if $tabs.0.is_empty == 'false'}{foreach $tabs as $items}
                    <li class="f_xs_none">
                      <a href="#file{$items.id}"  class="bg_light_color_1 color_dark tr_delay_hover r_corners d_block">
                        {$items.name}                      </a>                    </li>{/foreach}{/if}
                  </ul>
						</nav>
						<div class="tab-content">
                        <div id="tab-1" role="tabpanel" class="tab-pane active" style="margin-top:15px;" >
                        
                            {$files.0.description}                        </div>
                        {if $tabs.0.is_empty == 'false'}{foreach $tabs as $items} 
                        <div role="tabpanel" class="tab-pane" id="file{$items.id}">
                          <!-- Google map, just iframe for now -->
                     <div class="google-maps">
                          {$items.content}                     </div>
                          <!-- /google map -->
                        </div>{/foreach}{/if}
                        <!-- /tab -->
                      </div><div  style="display:table; width:100%;"></div>
					</div>
							<div class="clearfix">
						<h2 class="color_dark tt_uppercase f_left m_bottom_15 f_mxs_none">Related Products</h2>
					<div class="f_right clearfix nav_buttons_wrap f_mxs_none m_mxs_bottom_5">
							<button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large t_align_c bg_light_color_1 f_left tr_delay_hover r_corners rp_prev"><i class="fa fa-angle-left"></i></button>
							<button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large t_align_c bg_light_color_1 f_left m_left_5 tr_delay_hover r_corners rp_next"><i class="fa fa-angle-right"></i></button>
						</div></div><div class="related_projects m_bottom_15 m_sm_bottom_0 m_xs_bottom_15">
						
					{foreach $related as $items}<figure class="r_corners photoframe shadow relative d_xs_inline_b tr_all_hover">
							<!--product preview-->
							<a href="#" class="d_block relative pp_wrap">
								<!--hot product--><img src="{$site_root}/prod/{$items.image}" class="tr_all_hover" alt="">
														</a>
							<!--description and price of product-->
							<figcaption class="t_xs_align_l">
								<h5 class="m_bottom_10"><a href="#" class="color_dark ellipsis">{$items.name}</a></h5>
								<div class="clearfix">
									<p class="scheme_color f_left f_size_large m_bottom_15">{$curency}{$items.price}</p>
									<!--rating-->
								</div>
								<button class="button_type_4 bg_scheme_color r_corners tr_all_hover color_light mw_0" onClick="add_basket({$items.id})">Add to Cart</button>
							</figcaption>
						</figure>{/foreach}
					</div>
							
						</section>
						<!--right column-->
						<aside class="col-lg-3 col-md-3 col-sm-3">
							<figure class="widget shadow r_corners wrapper m_bottom_30">
								<figcaption>
									<h3 class="color_light">Categories</h3>
								</figcaption>
								<div class="widget_content">
								  <ul class="categories_list">
							  {foreach $categories as $items}<li><a href="{$site_root}/categories/{$items.url}">
                 <b> {$items.name}</b> </a> </li>{/foreach}
								  </ul>
							  </div>
							</figure><figure class="widget animate_ftr shadow r_corners wrapper m_bottom_30">
								<figcaption>
									<h3 class="color_light">Sponsors</h3>
								</figcaption>
								<div class="widget_content">
									{$ads.top.0.code}					</div>
				      </figure>
							<!--Sponsors--><!--banner--><!--Bestsellers--><!--tags-->
						</aside>
					</div>
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
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery-ui.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/retina.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/elevatezoom.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/waypoints.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery.tweet.min.js"></script>
		<script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=xa-5306f8f674bfda4c"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/owl.carousel.min.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery.custom-scrollbar.js"></script>
		<script src="{$site_root}/themes/{$theme_dir}/js/jquery.fancybox-1.3.4.js"></script>
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